DROP DATABASE IF EXISTS shop;

CREATE DATABASE shop;

USE shop;

CREATE TABLE IF NOT EXISTS books (
    book_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(128) NOT NULL,
    author VARCHAR(64) NOT NULL,
    price FLOAT NOT NULL,
    quantity INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS category (
    category_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    category VARCHAR(32),
    book_id BIGINT NOT NULL,
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);

CREATE TABLE IF NOT EXISTS orders (
  order_id BIGINT PRIMARY KEY AUTO_INCREMENT,
  book_id BIGINT NOT NULL,
  FOREIGN KEY (book_id) REFERENCES books(book_id)
);

INSERT INTO books (title, author, price, quantity)
VALUES
       ('100 Things every Designer needs to know', 'Susan Weinschenk', 25.0, 12),   -- 1
       ('Atomic Design', 'Brad Frost', 30.0, 15),                                   -- 2
       ('Beginning Jakarta-EE Web Development', 'Luciano Manelli', 5.0, 5),         -- 3
       ('Building a REST API with Spring', 'Baeldung', 100.0, 20),                  -- 4
       ('Introduction to Java Programming', 'Y. Daniel Yang', 35.0, 25),            -- 5
       ('Python Crash Course', 'Eric Matthes', 15.0, 42),                           -- 6
       ('NoSQL Distilled', 'Martin Fowler', 33.0, 20),                              -- 7
       ('SQL in 10 Minutes a Day', 'Ben Forta', 20, 13);                            -- 8

INSERT INTO category (category, book_id)
VALUES
        ('Design', 1),
        ('Design', 2),
        ('Programming', 3),
        ('Programming', 4),
        ('Programming', 5),
        ('Programming', 6),
        ('Database Technology', 7),
        ('Database Technology', 8);