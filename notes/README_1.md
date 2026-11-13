# Trading platform SQL practice

Interview-style SQL exercises on a simulated retail trading platform: users, trades and assets (crypto, stocks, ETFs, precious metals).

The setup cell builds a small SQLite database (about 3,000 users, 16,500 trades, 20 assets) with fixed random data, so every run gives the same results. No real customer data is used.

## How to use

1. Open `trading_sql_practice.ipynb` in VS Code or Jupyter and run the setup cell once.
2. Read a task and answer the 7 planning questions yourself.
3. Open the collapsed **💡 Hint** under the task to compare your plan.
4. Write the query inside `q(""" ... """)`.

## The 7 questions before every query

1. What does one row of the result look like?
2. Which tables hold the columns I need?
3. Must one table stay complete (LEFT) or only matches (INNER)?
4. Which rows do I throw away first? (WHERE)
5. Do I collapse rows into totals? (GROUP BY)
6. Do I filter on those totals? (HAVING)
7. Order? (ORDER BY)

Fewer rows than the source → `GROUP BY`. Same rows plus a new column → `OVER`.

## Tasks

| # | Question | Key concepts |
|---|----------|--------------|
| Warm-up | Row count of each table | scalar subqueries |
| 1 | Volume and trades per country, October 2026 | `JOIN`, date range, `GROUP BY` |
| 2 | 2026 signups who never traded | `LEFT JOIN … IS NULL` |
| 3 | Each user's first trade and its asset class | `ROW_NUMBER() OVER`, CTE |
| 4 | Assets traded by more than 500 users | `COUNT(DISTINCT)`, `HAVING` |
| 5 | Asset classes with more than 1,000 users in 2026 | `WHERE` + `HAVING` together |
| 6 | Monthly volume in 2026 | `substr()` for grouping by month |
| 7 | Crypto-first users who later bought a stock | multiple CTEs, `LEFT JOIN`, conversion rate |
| 8 | Trades by size bucket | `CASE WHEN` |

## New keywords (beyond Intro to SQL)

| Keyword | What it does |
|---------|--------------|
| `JOIN … ON` (INNER) | Combine rows from two tables; keep only rows that match |
| `LEFT JOIN` | Keep every row of the left table; unmatched columns become `NULL` |
| `… IS NULL` after a LEFT JOIN | Find rows with **no** match (e.g. users who never traded) |
| `COUNT(DISTINCT col)` | Count unique values (e.g. users, not trades) |
| `HAVING` | Filter **after** grouping, on totals. Repeat the aggregate, as aliases in `HAVING` only work in SQLite/MySQL |
| `WITH name AS (…)` | CTE: a named temporary result you can query like a table |
| `ROW_NUMBER() OVER (PARTITION BY … ORDER BY …)` | Window function: number rows within each group without collapsing them |
| `(SELECT COUNT(*) FROM t)` | Scalar subquery: a query returning one value, used like a column |
| `substr(text, start, length)` | Cut part of a string, e.g. `'2026-10'` from a timestamp |
| `CASE WHEN … THEN … ELSE … END` | If/else inside a query, e.g. to build buckets |
| `100.0 * a / b` | Force decimal division (integer ÷ integer truncates) |

## Pitfalls noted

- **Date ranges on text timestamps:** use `>= start AND < next_period_start`. `<= '2026-10-31'` silently drops every trade on 31 October, because `'2026-10-31 13:45:00' > '2026-10-31'` when compared as text.
- **Aliases in `HAVING`:** fine in SQLite, an error in PostgreSQL and SQL Server. Repeat the aggregate instead.
