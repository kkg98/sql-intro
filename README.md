# SQL Intro

My notes from Codecademy's **Intro to SQL** course, written as Jupyter notebooks
(SQLite via JupySQL) so every query runs with its result shown below it.

Instead of the course's example tables, the lessons use my own **European stocks dataset**
to practise SQL on finance data.

Since November 2026 it also holds my **portfolio course**: rebuilding my SQL portfolio step by step,
from the raw CSV data up to window functions, on two datasets (my BSc retail database and a trading app).

## Contents

| Notebook | Covers |
|---|---|
| [01 Manipulation](notes/01_manipulation.ipynb) | `CREATE TABLE`, constraints, `INSERT`, `SELECT`, `ALTER`, `UPDATE`, `DELETE` |
| [01 Project: Conference Schedule](notes/01_project_conference.ipynb) | building and maintaining a sessions table |
| [02 Queries](notes/02_queries.ipynb) | `AS`, `DISTINCT`, `WHERE`, `LIKE`, `BETWEEN`, `AND` / `OR`, `ORDER BY`, `LIMIT`, `CASE` |
| [02 Project: New York Restaurants](notes/02_project_ny_restaurants.ipynb) | answering questions with filters, rankings and `CASE` |

### Portfolio course

| Notebook | Covers |
|---|---|
| [03 Tables and Keys](notes/03_tables_and_keys.ipynb) | foreign keys (`REFERENCES`), 9 linked tables, loading CSV data |
| [03 Project: Trading Practice](notes/03_project_trading_practice.ipynb) | interview-style questions on a trading app: `JOIN`, `LEFT JOIN … IS NULL`, `GROUP BY` / `HAVING`, CTEs, `ROW_NUMBER`, conversion rate |
| 04 Select | `SELECT`, `WHERE`, `ORDER BY`, `LIMIT` on the retail data |
| 05 Aggregates | `COUNT`, `SUM`, `AVG`, `GROUP BY`, `HAVING` |
| 06 Joins | table aliases, `INNER` vs `LEFT JOIN`, joining 3 tables |
| 07 Subqueries and Case | subqueries, `CASE`, data quality checks, project: retail business questions |
| 08 Star Schema | fact vs dimension tables, grain, the trading schema |
| 09 Business Questions | volume, activation, never-traded users |
| 10 CTEs | `WITH`, step-by-step queries |
| 11 Window Functions | `ROW_NUMBER`, `RANK`, running `SUM`, `LAG`, project: cross-asset adoption |

`course_loader.py` fills the tables I create with the CSV data in `data/retail_csv/` and `data/trading_csv/`.

Quick reference: [Key words cheat sheet](notes/00_key_words.md)

## Data

| File | Contents |
|---|---|
| `stocks.db` | 31 European stocks: sector, country, price, P/E, dividend yield (illustrative numbers) |
| `portfolio.db` | small Vienna stock portfolio, built in lesson 01 |
| `conference.db` | conference sessions, built in project 01 |
| `restaurants.db` | 53 NYC restaurants (Codecademy data) |
| `retail_csv/` | retail database from my BSc Business Analytics I assignment (9 tables) |
| `trading_csv/` | synthetic trading app data: 500 users, 12 assets, about 2,400 trades |
| `trading_practice.db` | not in the repo: built by the setup cell of 03 Project: Trading Practice (3,000 users, 20 assets, about 16,500 trades) |

`create_stocks.sql` and `create_restaurants.sql` rebuild their tables.

## Run it

    py -m pip install jupysql

Open a notebook in VS Code, select the Python kernel, then Run All.
