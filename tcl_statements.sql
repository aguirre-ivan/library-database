-- TCL Statements --

USE library;

SELECT @@AUTOCOMMIT; -- Checking autocommit status
SET AUTOCOMMIT = 0; -- Setting manual autocommit


-- DELETE statements on book_return table

-- Deleting 3 random registers from book_return table
START TRANSACTION;
DELETE FROM book_return WHERE id_loan = 83;
DELETE FROM book_return WHERE id_book_return = 3;
DELETE FROM book_return WHERE id_loan IN (
    SELECT id_loan
    FROM loan
    WHERE id_customer = 4
);
-- ROLLBACK; -- To rollback delete statements
-- COMMIT; -- To confirm delete statemes


-- INSERT statements on publisher table with savepoints

-- Inserting 8 registers on publisher table
START TRANSACTION;
INSERT INTO publisher VALUES (NULL, 'Ovin Press');
INSERT INTO publisher VALUES (NULL, 'Utopia');
INSERT INTO publisher VALUES (NULL, 'Zorzal');
INSERT INTO publisher VALUES (NULL, 'Mansalva');
SAVEPOINT publisher_lot_4;
INSERT INTO publisher VALUES (NULL, 'Alianza');
INSERT INTO publisher VALUES (NULL, 'Marcial Pons');
INSERT INTO publisher VALUES (NULL, 'Aranzadi');
INSERT INTO publisher VALUES (NULL, 'Tecnos');
SAVEPOINT publisher_lot_8;
-- ROLLBACK TO publisher_lot_4;


-- SET AUTOCOMMIT = 1; -- Setting autocommit back to 1