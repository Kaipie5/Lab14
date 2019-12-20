--Create a new table called bookshelves with a name and primary key
CREATE TABLE BOOKSHELVES (id SERIAL PRIMARY KEY, name VARCHAR(255));

--Insert the unique set of bookshelf values from the books table into the bookshelf table's name values
INSERT INTO bookshelves(name) SELECT DISTINCT bookshelf FROM books;

--Adds a column to the books table with the name bookshelf_id
ALTER TABLE books ADD COLUMN bookshelf_id INT;

-- Prepares a connection between the bookshelves table and the books table by finding all the names that 
-- match between the bookshelf name columns and the books bookshelf column values.
UPDATE books SET bookshelf_id=shelf.id FROM (SELECT * FROM bookshelves) AS shelf WHERE books.bookshelf = shelf.name;

--Removes the bookshelf column from the books table
ALTER TABLE books DROP COLUMN bookshelf;

--Modifies the column bookshelf_id in the books table to be a foreign key which references the 
--bookshelves primary key
ALTER TABLE books ADD CONSTRAINT fk_bookshelves FOREIGN KEY (bookshelf_id) REFERENCES bookshelves(id);