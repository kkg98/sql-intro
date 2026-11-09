# Key Words

## 01 Manipulation

| Key word | Does | Section |
|---|---|---|
| `CREATE TABLE` | creates a new table | [2. Create](01_manipulation.ipynb#2-create) |
| `PRIMARY KEY` | unique row ID, 1 per table | [2. Create](01_manipulation.ipynb#2-create) |
| `UNIQUE` | no duplicate values | [2. Create](01_manipulation.ipynb#2-create) |
| `NOT NULL` | value required | [2. Create](01_manipulation.ipynb#2-create) |
| `DEFAULT` | fallback value | [2. Create](01_manipulation.ipynb#2-create) |
| `DROP TABLE IF EXISTS` | deletes a table if it exists (extra, not in the course) | [2. Create](01_manipulation.ipynb#2-create) |
| `INSERT INTO ... VALUES` | adds rows | [3. Insert](01_manipulation.ipynb#3-insert) |
| `SELECT ... FROM` | fetches columns, returns a result set | [4. Select](01_manipulation.ipynb#4-select) |
| `*` | all columns | [4. Select](01_manipulation.ipynb#4-select) |
| `ALTER TABLE ... ADD COLUMN` | adds a column | [5. Alter](01_manipulation.ipynb#5-alter) |
| `UPDATE ... SET ... WHERE` | edits rows | [6. Update](01_manipulation.ipynb#6-update) |
| `DELETE FROM ... WHERE` | deletes rows | [7. Delete](01_manipulation.ipynb#7-delete) |
| `IS NULL` / `IS NOT NULL` | tests for missing values | [7. Delete](01_manipulation.ipynb#7-delete) |
| `SELECT ... WHERE` | returns only rows that match a condition | [Project, Tasks 5-6](01_project_conference.ipynb#tasks-5-6-update-a-title--view-it) |
| `'text'` vs `"name"` | single quotes = text value, double quotes = column/table name | [Project, Tasks 2-3](01_project_conference.ipynb#tasks-2-3-first-session--check) |

## 02 Queries

| Key word | Does | Section |
|---|---|---|
| `SELECT col1, col2` | several columns | [2. Select](02_queries.ipynb#2-select) |
| `AS` | alias: renames a column in the result only | [3. As](02_queries.ipynb#3-as) |
| `DISTINCT` | unique values / combinations | [4. Distinct](02_queries.ipynb#4-distinct) |
| `WHERE` + `= != > < >= <=` | keeps rows where the condition is true | [5. Where](02_queries.ipynb#5-where) |
| `LIKE` | pattern search in text, case-insensitive in SQLite | [6. Like](02_queries.ipynb#6-like) |
| `_` | wildcard: exactly 1 character | [6. Like](02_queries.ipynb#6-like) |
| `%` | wildcard: 0 or more characters | [6. Like](02_queries.ipynb#6-like) |
| `IS NULL` / `IS NOT NULL` | missing / not missing | [7. Is Null](02_queries.ipynb#7-is-null) |
| `BETWEEN x AND y` | range, both limits included; text is case-sensitive | [8. Between](02_queries.ipynb#8-between) |
| `AND` | all conditions must be true | [9. And](02_queries.ipynb#9-and) |
| `OR` | at least one condition true; `AND` goes before `OR`, use `( )` | [10. Or](02_queries.ipynb#10-or) |
| `ORDER BY ... ASC / DESC` | sorts the result (ASC default, NULL first) | [11. Order By](02_queries.ipynb#11-order-by) |
| `LIMIT n` | max n rows, last clause | [12. Limit](02_queries.ipynb#12-limit) |
| `CASE WHEN ... THEN ... ELSE ... END` | if-then-else, creates a new column; first true `WHEN` wins | [13. Case](02_queries.ipynb#13-case) |
| `IN (...)` | equals any value in a list, shorter than chained `OR`s (extra, not in the course) | [Project, Task 8](02_project_ny_restaurants.ipynb#task-8-several-neighborhoods) |

## 03 Tables and Keys

| Key word | Does | Section |
|---|---|---|
| `REFERENCES table(column)` | foreign key: a filled-in value must exist in that column of the other table | [3. Syntax](03_tables_and_keys.ipynb#3-syntax-references) |
| foreign key | column that points to the primary key of another table (like the lookup value in `XLOOKUP`) | [2. How](03_tables_and_keys.ipynb#2-how-primary-keys-and-foreign-keys) |
| `INTEGER` / `REAL` / `TEXT` / `DATE` | whole number / decimal / text / date (SQLite stores dates as text like `'2020-03-15'`) | [3. Syntax](03_tables_and_keys.ipynb#3-syntax-references) |
| `PRAGMA foreign_keys = ON` | turns foreign key checks on for this connection, off by default in SQLite | [Checkpoint 6](03_tables_and_keys.ipynb#checkpoint-6-see-the-foreign-key-work) |
| `NOT NULL` vs `REFERENCES` | `NOT NULL`: may the cell be empty? `REFERENCES`: which values are allowed when filled | [6. My mistakes](03_tables_and_keys.ipynb#6-my-mistakes) |
