-- Stored procedures usage

-- `order_books_by` examples

CALL order_books_by("id_publisher", "ASC");
CALL order_books_by("id_book", "DESC");

-- `insert_or_delete_book_category` examples

CALL insert_or_delete_book_category("INSERT", 1, 1);
CALL insert_or_delete_book_category("DELETE", 1, 1);

-- insert_book_category examples

CALL insert_book_category(1, 1);
CALL insert_book_category(2, 2);

-- delete_book_category examples

CALL delete_book_category(1, 1);
CALL delete_book_category(2, 2);

SELECT * FROM book_category; -- to see changes