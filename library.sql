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
	id_category smallint unsigned NOT NULL AUTO_INCREMENT, -- Primary key
    category varchar(30) NOT NULL, -- Book category or genre
    PRIMARY KEY (id_category)
);

-- Match id_publisher with publisher name.
CREATE TABLE publisher (
	id_publisher smallint unsigned NOT NULL AUTO_INCREMENT, -- Primary key
    publisher varchar(30) NOT NULL, -- Book publishers
    PRIMARY KEY (id_publisher)
);

-- Match id_language with language name.
CREATE TABLE book_language (
	id_language tinyint unsigned NOT NULL AUTO_INCREMENT, -- Primary key
    book_language varchar(30) NOT NULL, -- Book language
    PRIMARY KEY (id_language)
);

-- Match id_status with book status. Book status can be borrowed, lost, destroyed, etc.
CREATE TABLE book_status (
	id_status tinyint unsigned NOT NULL AUTO_INCREMENT, -- Primary key
    book_status varchar(30) NOT NULL, -- Book status
    PRIMARY KEY (id_status)
);

-- Library's customers info.
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
    title varchar(30) NOT NULL, -- Book title
    book_description text NULL, -- Book description
    publication_date date NULL, -- Book publication date
    id_language tinyint unsigned NOT NULL, -- Foreign key (to references table book_language)
    PRIMARY KEY (id_book),
    FOREIGN KEY (id_publisher) REFERENCES publisher(id_publisher),
    FOREIGN KEY (id_language) REFERENCES book_language(id_language)
);

-- Match book copies with id_book from table book and its status from table book_status.
CREATE TABLE book_inventory (
	id_book_inventory smallint unsigned NOT NULL AUTO_INCREMENT, -- Primary key
    id_book smallint unsigned NOT NULL, -- Foreign key (to references table book)
    id_status tinyint unsigned NOT NULL, -- Foreign key (to references book_status)
    PRIMARY KEY (id_book_inventory),
    FOREIGN KEY (id_book) REFERENCES book(id_book),
    FOREIGN KEY (id_status) REFERENCES book_status(id_status)
);

-- Shows book copies storage location. With id_book_inventory (from table book_inventory), shows its shelf number and shelf_section number.
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

-- Books for author. Match id_author from table author with id_book from table book
CREATE TABLE book_author (
    id_author smallint unsigned NOT NULL, -- Foreign key (to references table author)
    id_book smallint unsigned NOT NULL, -- Foreign key (to references table book)
    FOREIGN KEY (id_author) REFERENCES author(id_author),
    FOREIGN KEY (id_book) REFERENCES book(id_book)
);

-- Books for category. Match id_category from table category with id_book from table book
CREATE TABLE book_category (
    id_category smallint unsigned NOT NULL, -- Foreign key (to references table category)
    id_book smallint unsigned NOT NULL, -- Foreign key (to references table book)
    FOREIGN KEY (id_category) REFERENCES category(id_category),
    FOREIGN KEY (id_book) REFERENCES book(id_book)
);

-- Book return. Describes loans returned.
CREATE TABLE book_return (
    id_book_return int NOT NULL AUTO_INCREMENT, -- Primary key
    id_loan int unsigned NOT NULL, -- Foreign key (to references table loan)
    return_date datetime NOT NULL, -- Loan return datetime
    PRIMARY KEY (id_book_return),
    FOREIGN KEY (id_loan) REFERENCES loan(id_loan)
);