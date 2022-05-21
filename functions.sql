USE library;


-- Get available stock book
-- This function returns available stock book. (n book_inventory stock)

DROP function IF EXISTS `get_available_stock_book`;

DELIMITER $$
USE `library`$$
CREATE FUNCTION `get_available_stock_book` (id_book SMALLINT)
RETURNS INT
READS SQL DATA
BEGIN
	DECLARE available_stock INT;

    SET available_stock = (
		SELECT
			COUNT(bi.id_book_inventory) AS available_stock
        FROM book_inventory AS bi
        INNER JOIN book_status AS bs
			ON bi.id_book_status = bs.id_book_status
        WHERE bi.id_book = id_book AND bs.book_status LIKE 'Stock'
        );

	RETURN available_stock;
END;$$

DELIMITER ;


-- Get book times borrowed
-- This function returns book times borrowed

DROP function IF EXISTS `get_book_times_borrowed`;

DELIMITER $$

CREATE FUNCTION `get_book_times_borrowed` (id_book SMALLINT)
RETURNS INT
READS SQL DATA
BEGIN
	DECLARE times_borrowed INT;

    SET times_borrowed = (
		SELECT
			COUNT(l.id_loan) AS times_borrowed
        FROM loan AS l
        INNER JOIN book_inventory AS bi
			ON l.id_book_inventory = bi.id_book_inventory
		INNER JOIN book AS b
			ON bi.id_book = b.id_book
        WHERE b.id_book = id_book
        );

	RETURN times_borrowed;
END;$$

DELIMITER ;


-- Get id book status from book status table
-- This function returns id book status (from book_status table)

DROP function IF EXISTS `get_id_book_status`;

DELIMITER $$

CREATE FUNCTION `get_id_book_status` (book_status_argument VARCHAR(30))
RETURNS TINYINT UNSIGNED
READS SQL DATA
BEGIN
	DECLARE id_status_result tinyint unsigned;

	SET id_status_result := (
        SELECT id_book_status
        FROM book_status
        WHERE UPPER(book_status) LIKE UPPER(book_status_argument)
    );

	RETURN id_status_result;
END;$$

DELIMITER ;