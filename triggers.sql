-- Triggers --

USE library;


-- Log statements for log tables.
CREATE TABLE IF NOT EXISTS log_statement (
	id_statement tinyint unsigned AUTO_INCREMENT,
	statement VARCHAR(6) NOT NULL,
	PRIMARY KEY (id_statement)
);

-- Statements data entry
INSERT INTO log_statement VALUES (NULL, 'INSERT');
INSERT INTO log_statement VALUES (NULL, 'DELETE');


-- loan TABLE TRIGGERS --


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


-- Trigger after insert in loan table
-- This trigger updates log loan table
DROP TRIGGER IF EXISTS `library`.`loan_AFTER_INSERT`;

DELIMITER $$
USE `library`$$
CREATE TRIGGER `library`.`loan_AFTER_INSERT` AFTER INSERT ON `loan`
FOR EACH ROW
BEGIN
	DECLARE id_statement_query VARCHAR(6);
    SET id_statement_query := (
		SELECT id_statement
        FROM log_statement
        WHERE statement LIKE 'INSERT'
    );

	CALL log_into_log_loan_table(
		id_statement_query, -- 'INSERT' in log_statement table
        NEW.id_loan, -- id_loan from loan table
        NEW.id_customer, -- id_customer from loan table
        NEW.id_book_inventory -- id_book_inventory from loan table
    );
END$$
DELIMITER ;


-- Trigger after delete in loan table
-- This trigger updates log loan table
DROP TRIGGER IF EXISTS `library`.`loan_AFTER_DELETE`;

DELIMITER $$
USE `library`$$
CREATE TRIGGER `library`.`loan_AFTER_DELETE` AFTER DELETE ON `loan`
FOR EACH ROW
BEGIN
	DECLARE id_statement_query VARCHAR(6);
    SET id_statement_query := (
		SELECT id_statement
        FROM log_statement
        WHERE statement LIKE 'DELETE'
    );

	CALL log_into_log_loan_table(
		id_statement_query, -- 'DELETE' in log_statement table
        OLD.id_loan, -- id_loan from loan table
        OLD.id_customer, -- id_customer from loan table
        OLD.id_book_inventory -- id_book_inventory from loan table
    );
END$$
DELIMITER ;

/*
-- Examples
INSERT INTO loan VALUES (NULL, 15, 10, '2022-01-10', '2022-01-17');
DELETE FROM loan WHERE (id_loan = 84); -- id_loan 84 not returned

-- Results:
SELECT
	ll.id_log,
	ls.statement,
	ll.id_loan,
	ll.id_customer,
	ll.id_book_inventory,
	ll.user_running_query,
	ll.log_date,
	ll.log_time
FROM log_loan AS ll
INNER JOIN log_statement AS ls
	ON ll.id_statement = ls.id_statement;
*/


-- Trigger before insert in loan table
-- Updates book status to borrowed in book_inventory table
DROP TRIGGER IF EXISTS `library`.`loan_BEFORE_INSERT`;

DELIMITER $$
USE `library`$$
CREATE TRIGGER `library`.`loan_BEFORE_INSERT` BEFORE INSERT ON `loan`
FOR EACH ROW
BEGIN
	CALL update_book_status(
		NEW.id_book_inventory,
		get_id_book_status("Borrowed")
    );
END$$
DELIMITER ;

/*
-- Example
INSERT INTO loan VALUES (NULL, 17, 17, '2022-01-10', '2022-01-17');

-- Results:
SELECT * FROM book_inventory
WHERE id_book_inventory = 17;
*/


-- book_return TABLE TRIGGERS --


-- Log deleted book return table for return table triggers.
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


-- Trigger after delete in book_return table
-- This trigger updates log deleted book return table
DROP TRIGGER IF EXISTS `library`.`book_return_AFTER_DELETE`;

DELIMITER $$
USE `library`$$
CREATE TRIGGER `library`.`book_return_AFTER_DELETE` AFTER DELETE ON `book_return`
FOR EACH ROW
BEGIN
	INSERT INTO `log_deleted_book_return` (
		id_book_return,
		id_loan,
		return_date,
		user_running_query,
		log_date,
		log_time
	)
	VALUES (
		OLD.id_book_return, -- id_loan deleted from book_return table
		OLD.id_loan, -- id_book_return deleted from book_return table
		OLD.return_date, -- id_book_inventory deleted from book_return table
		CURRENT_USER(), -- user running query
		CURRENT_DATE(), -- log date
		CURRENT_TIME() -- log time
	);
END$$
DELIMITER ;

/*
-- Example
DELETE FROM book_return WHERE (id_book_return = 50);

-- Results:
SELECT * FROM log_deleted_book_return;
*/


-- Trigger before delete in book_return table
-- Updates book status to "borrowed" in book_inventory table
DROP TRIGGER IF EXISTS `library`.`book_return_BEFORE_DELETE`;

DELIMITER $$
USE `library`$$
CREATE TRIGGER `library`.`book_return_BEFORE_DELETE` BEFORE DELETE ON `book_return`
FOR EACH ROW
BEGIN
	CALL update_book_status_from_id_book_return(
		OLD.id_book_return,
        get_id_book_status("Borrowed")
    );
END$$
DELIMITER ;

/*
-- Example
DELETE FROM book_return WHERE id_loan = 15; -- id_loan 15 from book_return references id_book_inventory = 80, which is in stock.

-- Results:
SELECT * FROM book_inventory
WHERE id_book_inventory = 80;
*/


-- Trigger after insert in book_return table
-- Updates book status to "in stock" in book_inventory table
DROP TRIGGER IF EXISTS `library`.`book_return_AFTER_INSERT`;

DELIMITER $$
USE `library`$$
CREATE TRIGGER `library`.`book_return_AFTER_INSERT` AFTER INSERT ON `book_return`
FOR EACH ROW
BEGIN
	CALL update_book_status_from_id_book_return(
		NEW.id_book_return,
        get_id_book_status("Stock")
    );
END$$
DELIMITER ;

/*
-- Example
INSERT INTO book_return VALUES (NULL, 93, '2022-03-27'); -- 10 id_book_inventory from id_loan 93 is not returned

-- Results:
SELECT * FROM book_inventory
WHERE id_book_inventory = 10;
*/