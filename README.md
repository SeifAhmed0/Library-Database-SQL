# Library-Database-SQL

A collection of SQL queries for retrieving, filtering, joining, grouping, and analyzing data from a relational library database using MySQL.

## Project Overview

This project demonstrates practical SQL skills by working with a relational library database containing books, authors, publishers, borrowers, book loans, book copies, and library branches.

The project includes a database schema with sample data and a collection of SQL queries covering different SQL concepts, from basic data retrieval to more complex queries using joins, aggregation, subqueries, and the `HAVING` clause.

## Database Schema

The database contains the following tables:

- `books`
- `book_authors`
- `book_copies`
- `book_loans`
- `borrower`
- `library_branch`
- `publisher`

## SQL Concepts Demonstrated

- Basic data retrieval
- Filtering with `WHERE`
- Sorting with `ORDER BY`
- `INNER JOIN` and `LEFT JOIN`
- Aggregate functions such as `SUM`, `COUNT`, and `MAX`
- `GROUP BY`
- `HAVING`
- Date functions such as `CURRENT_DATE()`
- Subqueries
- `NOT EXISTS`
- `DISTINCT`
- Complex multi-table queries

## Query Examples

The project contains 10 SQL exercises covering different scenarios:

1. **Basic Retrieval**  
   Retrieve books along with their publisher names and sort them alphabetically.

2. **Counting Records**  
   Calculate the total number of copies of a specific book.

3. **Joining Tables**  
   Find borrowers who currently have books checked out.

4. **Filtering with Conditions**  
   Find books from a specific publisher that have more than five copies in a branch.

5. **Multiple Joins**  
   Find books written by a specific author that are available in a specific branch.

6. **Aggregate Functions**  
   Find the branch with the highest total number of book copies.

7. **Date Operations**  
   Find overdue books along with the borrower's name and phone number.

8. **Subqueries**  
   Find borrowers who have never checked out a book.

9. **Grouping Data**  
   Count the number of books written by each author.

10. **Complex Query**  
    Find branches that have at least one copy of every book from a specific publisher.

## Placeholders

Some queries use placeholders such as `'X'` and `'Y'` for values such as publisher names, author names, and branch names.

Replace these placeholders with valid values from the database before executing the queries.

Examples:

```text
PublisherName: 'Inks Pubs'
AuthorName: 'Stephen King'
BranchName: 'Central'
