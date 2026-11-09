"""
Course helper: loads the CSV files into the tables YOU created with CREATE TABLE.
You don't need to edit this file. In a notebook you call:

    from course_loader import load_retail
    load_retail()

What it does:
1. Finds which of the expected tables you've already created (missing ones are skipped,
   so you can build the schema step by step).
2. Empties those tables, then fills them from the CSV files in data/<part>_csv/.
3. Turns on foreign-key checks, so every REFERENCES you wrote is actually enforced.
4. Prints a short report, or explains what went wrong and where.
"""
import csv
import sqlite3
from pathlib import Path

DATA = Path(__file__).resolve().parent.parent / "data"

PARTS = {
    "retail": {
        "db": DATA / "retail.db",
        "csv": DATA / "retail_csv",
        # load order matters: a table can only point to rows that already exist
        "tables": ["address", "store", "employee", "orders", "article",
                   "production_cost", "price", "depot", "in_stock"],
    },
    "trading": {
        "db": DATA / "trading.db",
        "csv": DATA / "trading_csv",
        "tables": ["users", "assets", "trades"],
    },
}


class CourseError(Exception):
    pass


def _load(part):
    cfg = PARTS[part]
    con = sqlite3.connect(cfg["db"])
    try:
        existing = {r[0] for r in con.execute("SELECT name FROM sqlite_master WHERE type='table'")}
        todo = [t for t in cfg["tables"] if t in existing]

        # empty the tables first (children before parents), foreign keys off while clearing
        con.execute("PRAGMA foreign_keys = OFF")
        for t in reversed(todo):
            con.execute(f"DELETE FROM {t}")
        con.commit()
        con.execute("PRAGMA foreign_keys = ON")

        print(f"Loading {cfg['db'].name}\n")
        for table in cfg["tables"]:
            if table not in existing:
                print(f"  {table:<16} skipped (not created yet)")
                continue
            with open(cfg["csv"] / f"{table}.csv", encoding="utf-8") as f:
                reader = csv.reader(f)
                header = next(reader)
                rows = [[None if v == "" else v for v in r] for r in reader]

            your_cols = [r[1] for r in con.execute(f"PRAGMA table_info({table})")]
            missing = [c for c in header if c not in your_cols]
            if missing:
                raise CourseError(
                    f"Table '{table}' has no column(s) {missing}.\n"
                    f"  The CSV has:     {header}\n"
                    f"  Your table has:  {your_cols}\n"
                    "  Check the spelling of the column names in your CREATE TABLE.")

            sql = f"INSERT INTO {table} ({', '.join(header)}) VALUES ({', '.join('?' * len(header))})"
            try:
                con.executemany(sql, rows)
            except sqlite3.OperationalError as e:
                raise CourseError(
                    f"Loading '{table}' failed. SQLite says: {e}\n"
                    "  'no such table' means one of your REFERENCES points to a table that doesn't exist"
                    " (not created yet, or a typo in the table name).") from None
            except sqlite3.IntegrityError as e:
                raise CourseError(
                    f"Loading '{table}' broke one of your rules. SQLite says: {e}\n"
                    "  'FOREIGN KEY constraint failed': the REFERENCES points to the wrong table or column,"
                    " or that table hasn't been filled (created after this one?).\n"
                    "  'NOT NULL constraint failed': a NOT NULL column has empty values in the CSV.\n"
                    "  'UNIQUE constraint failed': a PRIMARY KEY or UNIQUE column has repeated values.") from None
            print(f"  {table:<16} {len(rows):>5} rows loaded")

        con.commit()
        broken = con.execute("PRAGMA foreign_key_check").fetchall()
        if broken:
            raise CourseError(f"{len(broken)} rows point to something that doesn't exist. First one: {broken[0]}")
        print("\nDone.")
    except CourseError as e:
        con.rollback()
        print("\nPROBLEM: " + str(e))
    finally:
        con.close()


def load_retail():
    _load("retail")


def load_trading():
    _load("trading")
