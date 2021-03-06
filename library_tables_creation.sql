-- Tables creation --

DROP SCHEMA IF EXISTS library;
CREATE SCHEMA library;


USE library;

-- Match id_country with country name.
CREATE TABLE country (
	id_country tinyint unsigned NOT NULL AUTO_INCREMENT, -- Primary key
	country varchar(30) NOT NULL, -- Country name
	PRIMARY KEY (id_country)
);

-- Match id_category with category name.
CREATE TABLE category (
	id_category tinyint unsigned NOT NULL AUTO_INCREMENT, -- Primary key
	category varchar(30) NOT NULL, -- Book category or genre
	PRIMARY KEY (id_category)
);

-- Match id_publisher with publisher name.
CREATE TABLE publisher (
	id_publisher smallint unsigned NOT NULL AUTO_INCREMENT, -- Primary key
	publisher varchar(30) NOT NULL, -- Book publishers
	PRIMARY KEY (id_publisher)
);

-- Match id_book_language with language name.
CREATE TABLE book_language (
	id_book_language smallint unsigned NOT NULL AUTO_INCREMENT, -- Primary key
	book_language varchar(30) NOT NULL, -- Book language
	PRIMARY KEY (id_book_language)
);

-- Match id_book_status with book status. Book status can be borrowed, lost, destroyed, etc.
CREATE TABLE book_status (
	id_book_status tinyint unsigned NOT NULL AUTO_INCREMENT, -- Primary key
	book_status varchar(30) NOT NULL, -- Book status
	PRIMARY KEY (id_book_status)
);

-- Library customers info.
CREATE TABLE customer (
	id_customer smallint unsigned NOT NULL AUTO_INCREMENT, -- Primary key
	first_name varchar(30) NOT NULL, -- Customer name
	last_name varchar(30) NOT NULL, -- Customer last name
	dni int unsigned NOT NULL, -- Customer DNI 
	phone varchar(20) NULL, -- Customer phone number
	email varchar(50) NOT NULL, -- Customer email
	birth_date date NOT NULL, -- Customer birth date
	PRIMARY KEY (id_customer)
);

-- Book info.
CREATE TABLE book (
	id_book smallint unsigned NOT NULL AUTO_INCREMENT, -- Primary key
	id_publisher smallint unsigned NOT NULL, -- Foreign key (to references table publisher)
	title varchar(128) NOT NULL, -- Book title
	book_description text NULL, -- Book description
	publication_date date NULL, -- Book publication date
	id_book_language smallint unsigned NOT NULL, -- Foreign key (to references table book_language)
	PRIMARY KEY (id_book),
	FOREIGN KEY (id_publisher) REFERENCES publisher(id_publisher),
	FOREIGN KEY (id_book_language) REFERENCES book_language(id_book_language)
);

-- Match book copies with id_book from book table and its status from book_status table.
CREATE TABLE book_inventory (
	id_book_inventory smallint unsigned NOT NULL AUTO_INCREMENT, -- Primary key
	id_book smallint unsigned NOT NULL, -- Foreign key (to references table book)
	id_book_status tinyint unsigned NOT NULL, -- Foreign key (to references book_status)
	PRIMARY KEY (id_book_inventory),
	FOREIGN KEY (id_book) REFERENCES book(id_book),
	FOREIGN KEY (id_book_status) REFERENCES book_status(id_book_status)
);

-- Book copies storage location. With id_book_inventory (from book_inventory table), shows its shelf number and shelf_section number.
CREATE TABLE storage_location (
	id_book_inventory smallint unsigned NOT NULL, -- Foreign key (to references book_inventory)
	shelf tinyint unsigned NOT NULL, -- Shelf number
	shelf_section tinyint unsigned NOT NULL, -- Shelf section number in shelf.
	FOREIGN KEY (id_book_inventory) REFERENCES book_inventory(id_book_inventory)
);

-- Describes library loans. 
CREATE TABLE loan (
	id_loan int unsigned NOT NULL AUTO_INCREMENT, -- Primary key
	id_customer smallint unsigned NOT NULL, -- Foreign key (to references table customer)
	id_book_inventory smallint unsigned NOT NULL, -- Foreign key (to references table book_inventory)
	loan_date datetime NOT NULL, -- Loan datetime
	due_date datetime NOT NULL, -- Loan due datetime
	PRIMARY KEY (id_loan),
	FOREIGN KEY (id_customer) REFERENCES customer(id_customer),
	FOREIGN KEY (id_book_inventory) REFERENCES book_inventory(id_book_inventory)
);

-- Book authors info.
CREATE TABLE author (
	id_author smallint unsigned NOT NULL AUTO_INCREMENT, -- Primary key
	first_name varchar(30) NULL, -- Author's first name
	last_name varchar(30) NOT NULL, -- Author's last name
	id_country tinyint unsigned NOT NULL, -- Foreign key (to references table country)
	PRIMARY KEY (id_author),
	FOREIGN KEY (id_country) REFERENCES country(id_country)
);

-- Books by author. Match id_author from author table with id_book from book table
CREATE TABLE book_author (
	id_author smallint unsigned NOT NULL, -- Foreign key (to references table author)
	id_book smallint unsigned NOT NULL, -- Foreign key (to references table book)
	FOREIGN KEY (id_author) REFERENCES author(id_author),
	FOREIGN KEY (id_book) REFERENCES book(id_book)
);

-- Books by category. Match id_category from category table with id_book from book table
CREATE TABLE book_category (
	id_category tinyint unsigned NOT NULL, -- Foreign key (to references table category)
	id_book smallint unsigned NOT NULL, -- Foreign key (to references table book)
	FOREIGN KEY (id_category) REFERENCES category(id_category),
	FOREIGN KEY (id_book) REFERENCES book(id_book)
);

-- Books returns. Describes loans (from loan table) returned.
CREATE TABLE book_return (
	id_book_return int unsigned NOT NULL AUTO_INCREMENT, -- Primary key
	id_loan int unsigned NOT NULL, -- Foreign key (to references table loan)
	return_date datetime NOT NULL, -- Loan return datetime
	PRIMARY KEY (id_book_return),
	FOREIGN KEY (id_loan) REFERENCES loan(id_loan)
);


-- Log tables for triggers

-- Log statements for log tables.
CREATE TABLE IF NOT EXISTS log_statement (
	id_statement tinyint unsigned AUTO_INCREMENT,
	statement VARCHAR(6) NOT NULL,
	PRIMARY KEY (id_statement)
);

-- Log loan table for loan table triggers.
CREATE TABLE IF NOT EXISTS log_loan (
    id_log int unsigned AUTO_INCREMENT, -- log id
    id_statement tinyint unsigned, -- statement id from log_statement table
    id_loan int unsigned, -- loan id from loan table
	id_customer smallint unsigned, -- customer id from loan table
    id_book_inventory smallint unsigned, -- book inventory id from loan table
    user_running_query varchar(80), -- user running the query
    log_date date, -- query date
    log_time time, -- query time
    PRIMARY KEY (id_log),
    FOREIGN KEY (id_statement) REFERENCES log_statement(id_statement)
);

-- Log deleted book return table for book return table triggers.
CREATE TABLE IF NOT EXISTS log_deleted_book_return (
    id_log int unsigned AUTO_INCREMENT, -- log id
    id_loan int unsigned, -- loan id from book_return table
    id_book_return int unsigned, -- book return id from book_return table
    return_date datetime, -- return date from book_return table
    user_running_query varchar(80), -- user running the query
    log_date date, -- query date
    log_time time, -- query time
    PRIMARY KEY (id_log)
);