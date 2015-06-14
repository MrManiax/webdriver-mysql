USE webdriver_test;

CREATE TABLE queries ( id int NOT NULL AUTO_INCREMENT, query_string varchar(255) NOT NULL, PRIMARY KEY(id));
INSERT INTO queries (query_string) VALUE ("test");
INSERT INTO queries (query_string) VALUE ("bild");
