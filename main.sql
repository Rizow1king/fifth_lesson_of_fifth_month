CREATE TABLE IF NOT EXISTS authors (
	id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50),
	bio TEXT,
	create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS books (
	id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
	name VARCHAR(100) NOT NULL,
	summary TEXT,
	published_date DATE,
	metadata JSON,
	update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS publishers (
	id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
	name VARCHAR(100) NOT NULL,
	country CHAR(2) NOT NULL,
	founded_year INTEGER,
	details JSON,
	create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS libraries (
	id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
	name VARCHAR(100) NOT NULL,
	location TEXT NOT NULL,
	open_time TIME,
	close_time TIME,
	facilities JSON,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS author_book (
	author_id UUID REFERENCES authors(id) ON DELETE CASCADE,
	book_id UUID REFERENCES books(id) ON DELETE CASCADE,
	PRIMARY KEY (author_id, book_id)
);

CREATE TABLE IF NOT EXISTS book_publisher (
	book_id UUID REFERENCES books(id) ON DELETE CASCADE,
	publisher_id UUID REFERENCES publishers(id) ON DELETE CASCADE,
	PRIMARY KEY (book_id, publisher_id)
);

CREATE TABLE IF NOT EXISTS library_book (
	library_id UUID REFERENCES libraries(id) ON DELETE CASCADE,
	book_id UUID REFERENCES books(id) ON DELETE CASCADE,
	PRIMARY KEY (library_id, book_id)
);

SELECT * FROM authors;
SELECT * FROM books;
SELECT * FROM publishers;
SELECT * FROM libraries;
SELECT * FROM author_book;
SELECT * FROM book_publisher;
SELECT * FROM library_book;
