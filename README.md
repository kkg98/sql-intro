# SQL Intro

My notes from Codecademy's **Intro to SQL** course, written as Jupyter notebooks
(SQLite via JupySQL) so every query runs with its result shown below it.

Instead of the course's example tables, the lessons use my own **European stocks dataset**
to practise SQL on finance data.

More SQL notes from future courses and projects may be added here over time.

## Contents

| Notebook | Covers |
|---|---|
| [01 Manipulation](notes/01_manipulation.ipynb) | `CREATE TABLE`, constraints, `INSERT`, `SELECT`, `ALTER`, `UPDATE`, `DELETE` |
| [01 Project: Conference Schedule](notes/01_project_conference.ipynb) | building and maintaining a sessions table |
| [02 Queries](notes/02_queries.ipynb) | `AS`, `DISTINCT`, `WHERE`, `LIKE`, `BETWEEN`, `AND` / `OR`, `ORDER BY`, `LIMIT`, `CASE` |
| [02 Project: New York Restaurants](notes/02_project_ny_restaurants.ipynb) | answering questions with filters, rankings and `CASE` |

Quick reference: [Key words cheat sheet](notes/00_key_words.md)

## Data

| File | Contents |
|---|---|
| `stocks.db` | 31 European stocks: sector, country, price, P/E, dividend yield (illustrative numbers) |
| `portfolio.db` | small Vienna stock portfolio, built in lesson 01 |
| `conference.db` | conference sessions, built in project 01 |
| `restaurants.db` | 53 NYC restaurants (Codecademy data) |

`create_stocks.sql` and `create_restaurants.sql` rebuild their tables.

## Run it

    py -m pip install jupysql

Open a notebook in VS Code, select the Python kernel, then Run All.
