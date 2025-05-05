# Library Management System

A full-featured Library Management database implemented in MySQL.

## Description

This project defines a relational schema for managing a small library:

- **Authors** (`authors`): stores author metadata.  
- **Books** (`books`): tracks each book and its availability.  
- **Book–Authors** (`book_authors`): many‑to‑many link between books and authors.  
- **Members** (`members`): library patrons.  
- **Loans** (`loans`): which members have borrowed which books and when.

All tables include appropriate primary keys, foreign keys, `NOT NULL` and `UNIQUE` constraints to ensure data integrity.

## Setup / Importing the SQL

1. Clone the repo:

   ```bash
   git clone https://github.com/yourusername/library-management.git
   cd library-management
