# Library SQL Database

A library database made in MySQL with books stock, authors, customers and loans. 

SQL project for [Coderhouse](https://www.coderhouse.com/online/sql).

## Content

1. [Entity-relationship diagram](entity-relationship-diagram.png)
2. [Tables creation](library_tables_creation.sql)
3. [Data entry](data_entry_script.sql)
4. [Views](views.sql)
5. [Functions](functions.sql)
6. [Stored procedures](stored_procedures.sql)
7. [Triggers](triggers.sql)
8. [Users creation](users_creation.sql)
9. [TCL statements](tcl_statements.sql)

## Entity–relationship diagram

<div style="text-align:center"><img src="entity-relationship-diagram.png" /></div>

🔑: Primary Key

🗝: Foreign Key

### MySQL workbench entity-relationship diagram

<div style="text-align:center"><img src="workbench-er-diagram.png" /></div>

## Data Structure

Just run the [tables creation script](library_tables_creation.sql).

### Country table

Match id_country with country name.

| Column            | Type                                      | Description                         |
| ----------------- | :---------------------------------------- | :---------------------------------- |
| id_country        | tinyint unsigned NOT NULL AUTO_INCREMENT  | Primary Key for a Country           |
| country           | varchar(30) NOT NULL                      | Country name                        |

### Category table

Match id_category with category name.

| Column            | Type                                      | Description                         |
| ----------------- | :--------------------------               | :---------------------------------- |
| id_category       | tinyint unsigned NOT NULL AUTO_INCREMENT  | Primary Key for a category          |
| category          | varchar(30) NOT NULL                      | Category name                       |

### Publisher table

Match id_publisher with publisher name.

| Column            | Type                                      | Description                         |
| ----------------- | :--------------------------               | :---------------------------------- |
| id_publisher      | smallint unsigned NOT NULL AUTO_INCREMENT | Primary Key for a publisher         |
| publisher         | varchar(30) NOT NULL                      | Publisher name                      |

### Book language table

Match id_book_language with language name.

| Column            | Type                                      | Description                         |
| ----------------- | :--------------------------               | :---------------------------------- |
| id_book_language  | smallint unsigned NOT NULL AUTO_INCREMENT | Primary Key for a language          |
| book_language     | varchar(30) NOT NULL                      | Book language name                  |

### Book status table

Match id_book_status with book status. Book status can be borrowed, lost, destroyed, etc.

| Column            | Type                                      | Description                         |
| ----------------- | :--------------------------               | :---------------------------------- |
| id_book_status    | tinyint unsigned NOT NULL AUTO_INCREMENT  | Primary Key for a book status       |
| book_status       | varchar(30) NOT NULL                      | Book status name                    |

### Customer table

Library customers info.

| Column            | Type                                      | Description                         |
| ----------------- | :---------------------------------------- | :---------------------------------- |
| id_customer       | smallint unsigned NOT NULL AUTO_INCREMENT | Primary Key for a customer          |
| first_name        | varchar(30) NOT NULL                      | Customer first name                 |
| last_name         | varchar(30) NOT NULL                      | Customer last name                  |
| dni               | int unsigned NOT NULL                     | Customer DNI                        |
| phone             | varchar(20) NOT NULL                      | Customer phone number               |
| email             | varchar(50) NOT NULL                      | Customer email                      |
| birth_date        | date NOT NULL                             | Customer birth date                 |

### Book table

Book info.

| Column            | Type                                      | Description                         |
| ----------------- | :---------------------------------------- | :---------------------------------- |
| id_book           | smallint unsigned NOT NULL AUTO_INCREMENT | Primary Key for a book              |
| id_publisher      | smallint unsigned NOT NULL                | Foreign Key to publisher table      |
| title             | varchar(128) NOT NULL                     | Book title                          |
| book_description  | text NULL                                 | Book description                    |
| publication_date  | date NULL                                 | Book publication date               |
| id_book_language       | smallint unsigned NOT NULL                | Foreign Key to book_language table  |

### Book inventory table

Match book copies with id_book from book table and its status from book_status table.

| Column            | Type                                      | Description                         |
| ----------------- | :---------------------------------------- | :---------------------------------- |
| id_book_inventory | smallint unsigned NOT NULL AUTO_INCREMENT | Primary Key for a book copy         |
| id_book           | smallint unsigned NOT NULL                | Foreign Key to book table           |
| id_book_status    | tinyint unsigned NOT NULL                 | Foreign Key to book status table    |

### Storage location table

Book copies storage location. With id_book_inventory (from book_inventory table), shows its shelf number and shelf_section number.

| Column            | Type                                      | Description                         |
| ----------------- | :---------------------------------------- | :---------------------------------- |
| id_book_inventory | smallint unsigned NOT NULL                | Foreign Key to book inventory table |
| shelf             | tinyint unsigned NOT NULL                 | Shelf number                        |
| shelf_section     | tinyint unsigned NOT NULL                 | Shelf section number                |

### Loan table

Describes library loans.

| Column            | Type                                      | Description                         |
| ----------------- | :---------------------------------------- | :---------------------------------- |
| id_loan           | int unsigned NOT NULL AUTO_INCREMENT      | Primary Key for a loan              |
| id_customer       | smallint unsigned NOT NULL                | Foreign Key to customer table       |
| id_book_inventory | smallint unsigned NOT NULL                | Foreign Key to book inventory table |
| loan_date         | datetime NOT NULL                         | Loan date time                      |
| due_date          | datetime NOT NULL                         | Loan due date time                  |

### Author table

Book authors info.

| Column            | Type                                      | Description                         |
| ----------------- | :---------------------------------------- | :---------------------------------- |
| id_author         | smallint unsigned NOT NULL AUTO_INCREMENT | Primary Key for an author           |
| first_name        | varchar(30) NOT NULL                      | Author's first name                 |
| last_name         | varchar(30) NOT NULL                      | Author's last name                  |
| id_country        | tinyint unsigned NOT NULL                 | Foreign Key to country table        |

### Book author table

Books by author. Match id_author from author table with id_book from book table.

| Column            | Type                                      | Description                         |
| ----------------- | :---------------------------------------- | :---------------------------------- |
| id_author         | smallint unsigned NOT NULL                | Foreign Key to author table         |
| id_book           | smallint unsigned NOT NULL                | Foreign Key to book table           |

### Book category table

Books by category. Match id_category from category table with id_book from book table.

| Column            | Type                                      | Description                         |
| ----------------- | :---------------------------------------- | :---------------------------------- |
| id_category       | tinyint unsigned NOT NULL                 | Foreign Key to category table       |
| id_book           | smallint unsigned NOT NULL                | Foreign Key to book table           |

### Book return table

Books returns. Describes loans (from loan table) returned.

| Column            | Type                                      | Description                         |
| ----------------- | :---------------------------------------- | :---------------------------------- |
| id_book_return    | int unsigned NOT NULL AUTO_INCREMENT      | Primary Key for a book return       |
| id_loan           | int unsigned NOT NULL                     | Foreign Key to loan table           |
| return_date       | datetime NOT NULL                         | Loan return date time               |

### Log tables

*Tables explained in Triggers section.*

- Log statement table
- Log loan table
- Log deleted book return table

## Data entry script

Just run [data_entry_script.sql](data_entry_script.sql) for an example of data entry.

Fake data from [Mockaroo](https://mockaroo.com/):

- Book titles are actually movie titles.
- Books description are sentences chosen randomly from lorem ipsum.

## Views Structure

Just run [views.sql](views.sql) for an example of views.

### Book info view

Show books info order by id_book.

| Column            | Description                         |
| ----------------- | :---------------------------------- |
| id_book           | Book id                             |
| title             | Book title                          |
| book_description  | Book description                    |
| publication_date  | Publication date                    |
| publisher         | Publisher                           |
| book_language     | Book language                       |


### Author info view

Show authors info order by id_author.

| Column            | Description                         |
| ----------------- | :---------------------------------- |
| id_author         | Author id                           |
| complete_name     | Author complete name                |
| nationality       | Author nationality                  |

### Lost books view

Show lost books order by id_book.

| Column            | Description                         |
| ----------------- | :---------------------------------- |
| id_book_inventory | Book inventory id                   |
| id_book           | Book id                             |
| title             | Book title                          |

### Loans by book view

Show loans by book order by times_borrowed.

| Column            | Description                         |
| ----------------- | :---------------------------------- |
| id_book           | Book id                             |
| title             | Book title                          |
| times_borrowed    | Times borrowed                      |

### Overdue loans view

Show overdue loans order by due date.

| Column            | Description                         |
| ----------------- | :---------------------------------- |
| id_loan           | Loan id                             |
| id_book_inventory | Book inventory id                   |
| title             | Book title                          |
| id_customer       | Customer id                         |
| customer          | Customer complete name              |
| phone             | Customer phone                      |
| email             | Customer email                      |
| due_date          | Due date                            |

### Borrowed books view

Show borrowed books order by expected return.

| Column            | Description                         |
| ----------------- | :---------------------------------- |
| id_book_inventory | Book inventory id                   |
| id_book           | Book id                             |
| title             | Book title                          |
| loan_date         | Loan date                           |
| expected_return   | Due date                            |

### Available books view

Show available books and its quantity in stock order by id_book.

| Column            | Description                         |
| ----------------- | :---------------------------------- |
| id_book           | Book id                             |
| title             | Book title                          |
| quantity_in_stock | Quantity in stock                   |

## Functions

In [functions.sql](functions.sql):

- **get_available_stock_book**: Returns available stock book.
- **get_book_times_borrowed**: Returns book times borrowed.
- **get_id_book_status**: Returns `id_book_status` from `book_status` table, depending `book_status` parameter.

## Stored procedures

In [stored_procedures.sql](stored_procedures.sql):

- **order_books_by**: Orders `book` table by `column_to_order_by` parameter (in `order_way` ASC/DESC). This stored procedure will return an error if the column_to_order_by doesn't exist in book table or if the order_way is not "ASC"/"DESC"/""
- **insert_or_delete_book_category**: inserts or deletes an `id_book-id_category` match from `book_category` table depending on `statement_in` (`"INSERT"`/`"DELETE"`).
- **insert_book_category**: Inserts an `id_book-id_category` match from `book_category` table (using `insert_or_delete_book_category` sp).
- **delete_book_category**: Deletes an `id_book-id_category` match from `book_category` table (using `insert_or_delete_book_category` sp).
- **update_book_status**: Updates `book_status` in `book_inventory` table.
- **update_book_status_from_id_book_return**: Updates `book_status` in `book_inventory` table, depending `id_book_return` from `book_return` table.
- **log_into_log_loan_table**: Logs into `log_loan_table`, depending arguments.

*See [examples](sp_examples.sql).*

## Triggers

In [triggers.sql](triggers.sql):

### Loan table triggers

Log statements table (for 'INSERT', 'DELETE'):

| Column             | Type                            | Description                         |
| ------------------ | :------------------------------ | :---------------------------------- |
| id_statement       | tinyint unsigned AUTO_INCREMENT | Primary Key for a statement         |
| statement          | varchar(6) NOT NULL             | Statement                           |

Note: we need to run the [data entry script](data_entry_script.sql) first, because we need the registers `INSERT` and `DELETE`.

Log loan table for loan table triggers:

| Column             | Type                            | Description                           |
| ------------------ | :------------------------------ | :------------------------------------ |
| id_log             | int unsigned AUTO_INCREMENT     | Primary Key for a log                 |
| id_statement       | tinyint unsigned                | Foreign Key to statement table        |
| id_loan            | int unsigned                    | id_loan from loan table               |
| id_customer        | smallint unsigned               | id_customer from loan table           |
| id_book_inventory  | smallint unsigned               | id_book_inventory from loan table     |
| user_running_query | varchar(80)                     | User running the query                |
| log_date           | date                            | Log date                              |
| log_time           | time                            | Log time                              |

- **loan_AFTER_INSERT**: Updates log loan table.
- **loan_AFTER_DELETE**: Updates log loan table.
- **loan_BEFORE_INSERT**: Updates book status to borrowed in book_inventory table.

### Book return table triggers

Log deleted book return table for book return table triggers:

| Column             | Type                            | Description                           |
| ------------------ | :------------------------------ | :------------------------------------ |
| id_log             | int unsigned AUTO_INCREMENT     | Primary Key for a log                 |
| id_loan            | int unsigned                    | id_loan from book_return table        |
| id_book_return     | int unsigned                    | id_book_return from book_return table |
| return_date        | datetime                        | return_date from book_return table    |
| user_running_query | varchar(80)                     | User running the query                |
| log_date           | date                            | Log date                              |
| log_time           | time                            | Log time                              |

- **book_return_AFTER_DELETE**: Updates log deleted book return table.
- **book_return_BEFORE_DELETE**: Updates book status to borrowed in book_inventory table.
- **book_return_AFTER_INSERT**: Updates book status to stock in book_inventory table.

## Users creation

Simple [users creation](users_creation.sql) examples:

- **'user_with_reading_grants'@'localhost'**: An user with only reading grants.
- **'user_with_more_grants'@'localhost'**: An user with reading, insertion and modification grants.

## TCL statements examples

Simple [tcl statements](tcl_statements.sql) examples:

- **`DELETE` statements on book return_table**: Deleting random registers from book_return table with `ROLLBACK` and `COMMIT` example.
- **`INSERT` statements on publisher table**: Inserting registers on publisher table with `SAVEPOINT`s examples.

## Database backup

Data backup realized in [backup_20220529.sql](backup_20220529.sql). (Date: 2022-05-29)

The backup is only data from all tables excepting log tables (*log_statement*, *log_loan*, *log_deleted_book_return* tables).

Usage:

```
$ mysql -u 'user' -p library < backup_20220529.sql
```
