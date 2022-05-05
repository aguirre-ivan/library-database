-- Views creation

USE library;

-- View book_info
CREATE OR REPLACE VIEW book_info AS (
    SELECT
        b.id_book,
        b.title,
        b.book_description,
        b.publication_date,
        p.publisher,
        bl.book_language
    FROM book AS b
    INNER JOIN publisher AS p
        ON b.id_publisher = p.id_publisher
    INNER JOIN book_language AS bl
        ON b.id_book_language = bl.id_book_language
    ORDER BY 1
);

-- View author_info
CREATE OR REPLACE VIEW author_info AS (
    SELECT
        a.id_author,
        CONCAT(a.first_name, " ", a.last_name) AS complete_name,
        c.country
    FROM author AS a
    INNER JOIN country as c
        ON a.id_country = c.id_country
    ORDER BY 1
);

-- View lost_books
CREATE OR REPLACE VIEW lost_books AS (
    SELECT
        bi.id_book_inventory,
        b.id_book,
        b.title
    FROM book_inventory AS bi
    INNER JOIN book AS b
        ON bi.id_book = b.id_book
    INNER JOIN book_status AS bs
        ON bi.id_book_status = bs.id_book_status
    WHERE bs.book_status LIKE 'Lost'
    ORDER BY 2
);

-- View loans_by_book
CREATE OR REPLACE VIEW loans_by_book AS (
    SELECT
		b.id_book,
        b.title,
        COUNT(l.id_loan) AS times_borrowed
	FROM book AS b
	INNER JOIN book_inventory AS bi
		ON b.id_book = bi.id_book
	INNER JOIN loan AS l
		ON bi.id_book_inventory = l.id_book_inventory
	GROUP BY 1
    ORDER BY 3 DESC
);

-- View overdue_loans
CREATE OR REPLACE VIEW overdue_loans AS (
    SELECT
        l.id_loan,
        l.id_book_inventory,
        b.title,
        l.id_customer,
        CONCAT(c.first_name, " ", c.last_name) AS customer,
        c.phone,
        c.email,
        l.due_date
    FROM loan AS l
    INNER JOIN customer AS c
		ON l.id_customer = c.id_customer
    INNER JOIN book_inventory AS bi
		ON l.id_book_inventory = bi.id_book_inventory
    INNER JOIN book AS b
        ON bi.id_book = b.id_book
    INNER JOIN book_status AS bs
		ON bi.id_book_status = bs.id_book_status
    WHERE bs.book_status LIKE 'Borrowed' AND l.id_loan NOT IN (
		SELECT br.id_loan
        FROM book_return AS br
    )
    ORDER BY l.due_date ASC
);

-- View borrowed_books
CREATE OR REPLACE VIEW borrowed_books AS (
    SELECT
		bi.id_book_inventory,
        b.id_book,
        b.title,
        l.loan_date,
        l.due_date AS expected_return
	FROM book_inventory AS bi
    INNER JOIN book AS b
		ON bi.id_book = b.id_book
	INNER JOIN loan AS l
		ON bi.id_book_inventory = l.id_book_inventory
	INNER JOIN book_status AS bs
		ON bi.id_book_status = bs.id_book_status
	WHERE bs.book_status LIKE "Borrowed" AND l.id_loan NOT IN (
		SELECT br.id_loan
		FROM book_return AS br
	)
    ORDER BY 5 DESC
);

-- View available_books
CREATE OR REPLACE VIEW available_books AS (
    SELECT
		bi.id_book,
        b.title,
        COUNT(bi.id_book_inventory) as quantity_in_stock
	FROM book_inventory AS bi
	INNER JOIN book_status AS bs
		ON bi.id_book_status = bs.id_book_status
    INNER JOIN book AS b
        ON bi.id_book = b.id_book
	WHERE bs.book_status LIKE "Stock"
    GROUP BY 1
    ORDER BY 1 ASC
);
