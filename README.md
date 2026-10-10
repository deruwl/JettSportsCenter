# JettSportsCenter

A SQL Server (T-SQL) database for a sports center that rents out sport fields and sells sports products.

## Files

Run the scripts in this order:

| File | What it does |
| --- | --- |
| `b. Create Table.sql` | Creates the `JettSportsCenter` database and its tables |
| `c. INSERT.sql` | Fills the tables with sample data |
| `d. SimulateTransaction.sql` | Adds two example transactions, one of them for a new customer |
| `e. SELECT.sql` | Eight report queries and two views |

## Tables

| Table | Contents |
| --- | --- |
| `MsStaff` | Staff name, gender and salary |
| `MsCustomer` | Customer name, age and phone number |
| `MsSportField` | Sport fields, their addresses and renting fees |
| `MsProduct` | Products and their prices |
| `RentalTransactionDetail` | Which field was rented and for how long |
| `ProductTransactionDetail` | Which product was bought and how many |
| `TransactionHeader` | Links a rental and a product purchase to the staff member, customer and date |

## Views

`e. SELECT.sql` creates two views:

- `annualMonthlyRentalReport`: total and average rental revenue
- `annualMonthlyProductReport`: product revenue and its average

## Note on dates

`TransactionHeader` only accepts a `TransactionDate` in the current year. The sample data uses dates from 2022, so in any other year the inserts into `TransactionHeader` fail until you change those dates or the `CHECK` constraint in `b. Create Table.sql`.
