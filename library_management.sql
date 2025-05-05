-- Question 1: Complete Database Management System (Library Management)

-- 1. Authors table
CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,   -- Unique author identifier
    name VARCHAR(100) NOT NULL,
    birth_year YEAR,
    country VARCHAR(50)
);

-- 2. Books table
CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,     -- Unique book identifier
    title VARCHAR(200) NOT NULL,
    isbn CHAR(13) UNIQUE NOT NULL,
    published_year YEAR,
    available_copies INT NOT NULL DEFAULT 0
);

-- 3. Junction table for M-M relationship between books and authors
CREATE TABLE book_authors (
    book_id INT NOT NULL,
    author_id INT NOT NULL,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

-- 4. Members table
CREATE TABLE members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,   -- Unique member identifier
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    join_date DATE NOT NULL
);

-- 5. Loans table (tracks which member borrowed which book)
CREATE TABLE loans (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    member_id INT NOT NULL,
    loan_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);

-- Sample Data Inserts

-- Authors
INSERT INTO authors (name, birth_year, country) VALUES
    ('J.K. Rowling', 1965, 'United Kingdom'),
    ('George Orwell', 1903, 'United Kingdom'),
    ('Harper Lee', 1926, 'United States');

-- Books
INSERT INTO books (title, isbn, published_year, available_copies) VALUES
    ('Harry Potter and the Sorcerer''s Stone', '9780439554930', 1997, 5),
    ('1984', '9780451524935', 1949, 3),
    ('To Kill a Mockingbird', '9780061120084', 1960, 4);

-- Book-Authors relationships
INSERT INTO book_authors (book_id, author_id) VALUES
    (1, 1),  -- Harry Potter by J.K. Rowling
    (2, 2),  -- 1984 by George Orwell
    (3, 3);  -- To Kill a Mockingbird by Harper Lee

-- Members
INSERT INTO members (full_name, email, join_date) VALUES
    ('Alice Johnson', 'alice@example.com', '2024-02-15'),
    ('Bob Smith', 'bob@example.com', '2024-03-10');

-- Loans
INSERT INTO loans (book_id, member_id, loan_date, return_date) VALUES
    (1, 1, '2025-04-01', NULL), -- Alice borrowed Harry Potter
    (2, 2, '2025-04-03', '2025-04-20'); -- Bob borrowed 1984 and returned
