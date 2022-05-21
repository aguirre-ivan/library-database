DROP user 'user_with_reading_grants'@'localhost';

-- User with reading grants creation
CREATE USER IF NOT EXISTS 'user_with_reading_grants'@'localhost' IDENTIFIED BY 'password_read';
-- Assign only reading grants
GRANT SELECT ON library.* TO 'user_with_reading_grants'@'localhost';
REVOKE DELETE ON *.* FROM 'user_with_reading_grants'@'localhost';

-- User with reading, insertion and modification grants creation-
CREATE USER IF NOT EXISTS 'user_with_more_grants'@'localhost' IDENTIFIED BY 'password_more_grants';
-- Assign only reading, insertion and modification grants
GRANT SELECT, UPDATE, INSERT ON library.* TO 'user_with_more_grants'@'localhost';
REVOKE DELETE ON *.* FROM 'user_with_more_grants'@'localhost';

-- To see grants:
/*
SHOW GRANTS FOR 'user_with_reading_grants'@'localhost';
SHOW GRANTS FOR 'user_with_more_grants'@'localhost';
*/