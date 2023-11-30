
CREATE TABLE users (
    username VARCHAR2(50) PRIMARY KEY NOT NULL,
    email VARCHAR2(100) UNIQUE,
    password VARCHAR2(100) NOT NULL,
    first_name VARCHAR2(50),
    last_name VARCHAR2(50),
    gender VARCHAR2(10),
    registration_date DATE,
    last_login TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create master_books Table
CREATE TABLE master_books (
    book_id NUMBER PRIMARY KEY,
    book_title VARCHAR2(100) NOT NULL,
    author VARCHAR2(100),
    publication_date DATE,
    genre VARCHAR2(50),
    price NUMBER(10, 2),
    CONSTRAINT chk_price_books CHECK (price >= 0)
);

-- Create master_movies Table
CREATE TABLE master_movies (
    movie_id NUMBER PRIMARY KEY,
    movie_title VARCHAR2(100) NOT NULL,
    director VARCHAR2(100),
    release_date DATE,
    genre VARCHAR2(50),
    price NUMBER(10, 2),
    CONSTRAINT chk_price_movies CHECK (price >= 0)
);

-- Create master_products Table
CREATE TABLE master_products (
    product_id NUMBER PRIMARY KEY,
    product_name VARCHAR2(100) NOT NULL,
    brand VARCHAR2(100),
    manufacture_date DATE,
    category VARCHAR2(50),
    price NUMBER(10, 2),
    CONSTRAINT chk_product_price CHECK (price >= 0)
);

-- Create master_courses Table
CREATE TABLE master_courses (
    course_id NUMBER PRIMARY KEY,
    course_name VARCHAR2(100) NOT NULL,
    instructor VARCHAR2(100),
    start_date DATE,
    category VARCHAR2(50),
    price NUMBER(10, 2),
    CONSTRAINT chk_courses_price CHECK (price >= 0)
);

-- Create master_restaurants Table
CREATE TABLE master_restaurants (
    restaurant_id NUMBER PRIMARY KEY,
    restaurant_name VARCHAR2(100) NOT NULL,
    cuisine VARCHAR2(100),
    opening_date DATE,
    rating NUMBER(3, 2),
    price_range VARCHAR2(20),
    CONSTRAINT chk_rating CHECK (rating >= 0 AND rating <= 5)
);

-- Create transactions_books Table
CREATE TABLE transactions_books (
    transaction_id NUMBER PRIMARY KEY,
    username VARCHAR2(200),
    book_id NUMBER,
    transaction_date DATE,
    purchase_price NUMBER(10, 2),
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_user_books FOREIGN KEY (username) REFERENCES users(username),
    CONSTRAINT fk_book_books FOREIGN KEY (book_id) REFERENCES master_books(book_id),
    CONSTRAINT chk_purchase_price_books CHECK (purchase_price >= 0)
);

-- Create transactions_movies Table
CREATE TABLE transactions_movies (
    transaction_id NUMBER PRIMARY KEY,
    username VARCHAR2(200),
    movie_id NUMBER,
    transaction_date DATE,
    purchase_price NUMBER(10, 2),
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_user_movies FOREIGN KEY (username) REFERENCES users(username),
    CONSTRAINT fk_movie_movies FOREIGN KEY (movie_id) REFERENCES master_movies(movie_id),
    CONSTRAINT chk_purchase_price_movies CHECK (purchase_price >= 0)
);

-- Create transactions_products Table
CREATE TABLE transactions_products (
    transaction_id NUMBER PRIMARY KEY,
    username VARCHAR2(200),
    product_id NUMBER,
    transaction_date DATE,
    purchase_price NUMBER(10, 2),
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_user_products FOREIGN KEY (username) REFERENCES users(username),
    CONSTRAINT fk_product_products FOREIGN KEY (product_id) REFERENCES master_products(product_id),
    CONSTRAINT chk_purchase_price_products CHECK (purchase_price >= 0)
);

-- Create transactions_courses Table
CREATE TABLE transactions_courses (
    transaction_id NUMBER PRIMARY KEY,
    username VARCHAR2(200),
    course_id NUMBER,
    transaction_date DATE,
    purchase_price NUMBER(10, 2),
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_user_courses FOREIGN KEY (username) REFERENCES users(username),
    CONSTRAINT fk_course_courses FOREIGN KEY (course_id) REFERENCES master_courses(course_id),
    CONSTRAINT chk_purchase_price_courses CHECK (purchase_price >= 0)
);

-- Create transactions_restaurants Table
CREATE TABLE transactions_restaurants (
    transaction_id NUMBER PRIMARY KEY,
    username VARCHAR2(200),
    restaurant_id NUMBER,
    transaction_date DATE,
    total_bill NUMBER(10, 2),
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_user_restaurants FOREIGN KEY (username) REFERENCES users(username),
    CONSTRAINT fk_restaurant_restaurants FOREIGN KEY (restaurant_id) REFERENCES master_restaurants(restaurant_id),
    CONSTRAINT chk_total_bill CHECK (total_bill >= 0)
);

-- Create transactions_miscellaneous Table
CREATE TABLE transactions_miscellaneous (
    transaction_id NUMBER PRIMARY KEY,
    username VARCHAR2(200),
    description VARCHAR2(4000),
    transaction_date DATE,
    amount NUMBER(10, 2),
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_user_miscellaneous FOREIGN KEY (username) REFERENCES users(username),
    CONSTRAINT chk_amount CHECK (amount >= 0)
);

-- Insert values into users table
INSERT INTO users (username, email, password, first_name, last_name, gender, registration_date)
VALUES
    ('user1', 'user1@example.com', 'password123', 'John', 'Doe', 'Male', '15-05-1990');

INSERT INTO users (username, email, password, first_name, last_name, gender, registration_date)
VALUES
    ('user2', 'user2@example.com', 'securepass', 'Jane', 'Smith', 'Female', '15-02-2023');

INSERT INTO users (username, email, password, first_name, last_name, gender, registration_date)
VALUES
    ('user3', 'user3@example.com', 'p@ssw0rd', 'Michael', 'Johnson', 'Male', '20-03-2023');

INSERT INTO users (username, email, password, first_name, last_name, gender, registration_date)
VALUES
    ('user4', 'user4@example.com', 'strongpass', 'Sarah', 'Brown', 'Female', '05-04-2023');

INSERT INTO users (username, email, password, first_name, last_name, gender, registration_date)
VALUES
    ('user5', 'user5@example.com', 'secret123', 'David', 'Lee', 'Male', '12-05-2023');


-- Insert values into master_books table
INSERT INTO master_books (book_id, book_title, author, publication_date, genre, price)
VALUES
    (1, 'Book Title 1', 'Author A', '15-05-2022', 'Fiction', 19.99);

INSERT INTO master_books (book_id, book_title, author, publication_date, genre, price)
VALUES
    (2, 'Book Title 2', 'Author B', '20-10-2021', 'Mystery', 12.99);

INSERT INTO master_books (book_id, book_title, author, publication_date, genre, price)
VALUES
    (3, 'Book Title 3', 'Author C', '25-08-2022', 'Sci-Fi', 24.99);

INSERT INTO master_books (book_id, book_title, author, publication_date, genre, price)
VALUES
    (4, 'Book Title 4', 'Author D', '20-01-2023', 'Thriller', 15.99);

INSERT INTO master_books (book_id, book_title, author, publication_date, genre, price)
VALUES
    (5, 'Book Title 5', 'Author E', '05-03-2023', 'Non-Fiction', 29.99);

-- Insert values into master_movies table
INSERT INTO master_movies (movie_id, movie_title, director, release_date, genre, price)
VALUES
    (1, 'Movie Title 1', 'Director X', '05-07-2023', 'Action', 14.99);

INSERT INTO master_movies (movie_id, movie_title, director, release_date, genre, price)
VALUES
    (2, 'Movie Title 2', 'Director Y', '10-12-2022', 'Comedy', 9.99);

INSERT INTO master_movies (movie_id, movie_title, director, release_date, genre, price)
VALUES
    (3, 'Movie Title 3', 'Director Z', '10-04-2023', 'Drama', 17.99);

INSERT INTO master_movies (movie_id, movie_title, director, release_date, genre, price)
VALUES
    (4, 'Movie Title 4', 'Director M', '15-06-2023', 'Sci-Fi', 18.99);

INSERT INTO master_movies (movie_id, movie_title, director, release_date, genre, price)
VALUES
    (5, 'Movie Title 5', 'Director N', '30-04-2023', 'Romance', 12.99);

--product
INSERT INTO master_products (product_id, product_name, brand, manufacture_date, category, price)
VALUES
    (1, 'Product 1', 'Brand A', '01-06-2023', 'Electronics', 299.99);

INSERT INTO master_products (product_id, product_name, brand, manufacture_date, category, price)
VALUES
    (2, 'Product 2', 'Brand B', '15-07-2023', 'Home Appliances', 149.99);

INSERT INTO master_products (product_id, product_name, brand, manufacture_date, category, price)
VALUES
    (3, 'Product 3', 'Brand C', '10-08-2023', 'Clothing', 49.99);

INSERT INTO master_products (product_id, product_name, brand, manufacture_date, category, price)
VALUES
    (4, 'Product 4', 'Brand D', '20-07-2023', 'Beauty', 29.99);

INSERT INTO master_products (product_id, product_name, brand, manufacture_date, category, price)
VALUES
    (5, 'Product 5', 'Brand E', '05-08-2023', 'Electronics', 199.99);

-- Insert values into master_courses table
INSERT INTO master_courses (course_id, course_name, instructor, start_date, category, price)
VALUES
    (1, 'Course 1', 'Instructor X', '01-09-2023', 'Programming', 199.99);

INSERT INTO master_courses (course_id, course_name, instructor, start_date, category, price)
VALUES
    (2, 'Course 2', 'Instructor Y', '15-08-2023', 'Design', 149.99);

INSERT INTO master_courses (course_id, course_name, instructor, start_date, category, price)
VALUES
    (3, 'Course 3', 'Instructor Z', '10-09-2023', 'Language', 99.99);

INSERT INTO master_courses (course_id, course_name, instructor, start_date, category, price)
VALUES
    (4, 'Course 4', 'Instructor W', '15-08-2023', 'Music', 79.99);

INSERT INTO master_courses (course_id, course_name, instructor, start_date, category, price)
VALUES
    (5, 'Course 5', 'Instructor X', '20-07-2023', 'Fitness', 149.99);

-- Insert values into master_restaurants table
INSERT INTO master_restaurants (restaurant_id, restaurant_name, cuisine, opening_date, rating, price_range)
VALUES (1, 'Shree Anandhaas', 'Vegetarian', '15-02-2022', 4.3, '100-500');

INSERT INTO master_restaurants (restaurant_id, restaurant_name, cuisine, opening_date, rating, price_range)
VALUES (2, 'Raaju Sri Rayappas Restaurant', 'Chettinadu', '20-11-2021', 3.9, '1000-1500');

INSERT INTO master_restaurants (restaurant_id, restaurant_name, cuisine, opening_date, rating, price_range)
VALUES (3, 'Elite Rottu Kadai', 'Indian', '05-04-2023', 4.0, '500-900');

INSERT INTO master_restaurants (restaurant_id, restaurant_name, cuisine, opening_date, rating, price_range)
VALUES (4, 'Murugan Idli Shop', 'South Indian', '25-06-2010', 4.6, '700-1400');

INSERT INTO master_restaurants (restaurant_id, restaurant_name, cuisine, opening_date, rating, price_range)
VALUES (5, 'Prema Vilas', 'Chettinadu', '10-11-2005', 4.4, '200-600');

-- Insert values into transactions_books table
INSERT INTO transactions_books (transaction_id, username, book_id, transaction_date, purchase_price)
VALUES
    (1, 'user1', 1, '10-08-2023', 19.99);

INSERT INTO transactions_books (transaction_id, username, book_id, transaction_date, purchase_price)
VALUES
    (2, 'user2', 2, '18-08-2023', 12.99);

-- Insert additional values into transactions_books table
INSERT INTO transactions_books (transaction_id, username, book_id, transaction_date, purchase_price)
VALUES
    (3, 'user1', 3, '25-08-2023', 24.99);

INSERT INTO transactions_books (transaction_id, username, book_id, transaction_date, purchase_price)
VALUES
    (4, 'user2', 4, '30-08-2023', 15.99);

INSERT INTO transactions_books (transaction_id, username, book_id, transaction_date, purchase_price)
VALUES
    (5, 'user2', 5, '27-08-2023', 29.99);
delete from master_books where book_id =5;

-- Insert values into transactions_movies table
INSERT INTO transactions_movies (transaction_id, username, movie_id, transaction_date, purchase_price)
VALUES
    (1, 'user1', 1, '12-08-2023', 14.99);

INSERT INTO transactions_movies (transaction_id, username, movie_id, transaction_date, purchase_price)
VALUES
    (2, 'user2', 2, '19-08-2023', 9.99);
INSERT INTO transactions_movies (transaction_id, username, movie_id, transaction_date, purchase_price)
VALUES
    (3, 'user1', 3, '28-08-2023', 17.99);

INSERT INTO transactions_movies (transaction_id, username, movie_id, transaction_date, purchase_price)
VALUES
    (4, 'user2', 4, '31-08-2023', 18.99);

INSERT INTO transactions_movies (transaction_id, username, movie_id, transaction_date, purchase_price)
VALUES
    (5, 'user1', 5, '02-09-2023', 12.99);

-- Insert values into transactions_products table
INSERT INTO transactions_products (transaction_id, username, product_id, transaction_date, purchase_price)
VALUES
    (1, 'user1', 1, '05-08-2023', 299.99);

INSERT INTO transactions_products (transaction_id, username, product_id, transaction_date, purchase_price)
VALUES
    (2, 'user2', 2, '22-08-2023', 149.99);

INSERT INTO transactions_products (transaction_id, username, product_id, transaction_date, purchase_price)
VALUES
    (3, 'user1', 3, '10-08-2023', 49.99);

INSERT INTO transactions_products (transaction_id, username, product_id, transaction_date, purchase_price)
VALUES
    (4, 'user2', 4, '22-08-2023', 29.99);

INSERT INTO transactions_products (transaction_id, username, product_id, transaction_date, purchase_price)
VALUES
    (5, 'user1', 5, '15-08-2023', 199.99);
-- Insert values into transactions_course table
INSERT INTO transactions_courses (transaction_id, username, course_id, transaction_date, purchase_price)
VALUES
    (1, 'user1', 1, '08-08-2023', 199.99);
INSERT INTO transactions_courses (transaction_id, username, course_id, transaction_date, purchase_price)
VALUES
    (2, 'user2', 2, '16-08-2023', 149.99);
INSERT INTO transactions_courses (transaction_id, username, course_id, transaction_date, purchase_price)
VALUES
    (3, 'user1', 3, '08-08-2023', 99.99);
INSERT INTO transactions_courses (transaction_id, username, course_id, transaction_date, purchase_price)
VALUES
    (4, 'user2', 4, '16-08-2023', 79.99);
INSERT INTO transactions_courses (transaction_id, username, course_id, transaction_date, purchase_price)
VALUES
    (5, 'user1', 5, '12-08-2023', 149.99);

-- Insert values into transactions_restaurants table
INSERT INTO transactions_restaurants (transaction_id, username, restaurant_id, transaction_date, total_bill)
VALUES
    (1, 'user1', 1, '05-08-2023', 200.00);
INSERT INTO transactions_restaurants (transaction_id, username, restaurant_id, transaction_date, total_bill)
VALUES
    (2, 'user2', 2, '15-08-2023', 1200.00);
INSERT INTO transactions_restaurants (transaction_id, username, restaurant_id, transaction_date, total_bill)VALUES(3, 'user1', 3, '05-08-2023', 700.00);
INSERT INTO transactions_restaurants (transaction_id, username, restaurant_id, transaction_date, total_bill)VALUES(4, 'user2', 4, '18-08-2023', 500.00);
INSERT INTO transactions_restaurants (transaction_id, username, restaurant_id, transaction_date, total_bill)VALUES(5, 'user1', 5, '22-08-2023', 300.00);

-- Insert values into transactions_miscellaneous table
INSERT INTO transactions_miscellaneous (transaction_id, username, description, transaction_date, amount)VALUES(1, 'user1', 'Miscellaneous Item 1', '08-08-2023', 49.99);
INSERT INTO transactions_miscellaneous (transaction_id, username, description, transaction_date, amount)VALUES(2, 'user2', 'Miscellaneous Item 2', '16-08-2023', 29.99);
INSERT INTO transactions_miscellaneous (transaction_id, username, description, transaction_date, amount)VALUES(3, 'user1', 'Miscellaneous Item 3', '22-08-2023', 19.99);
INSERT INTO transactions_miscellaneous (transaction_id, username, description, transaction_date, amount)VALUES(4, 'user2', 'Miscellaneous Item 4', '30-08-2023', 39.99);
INSERT INTO transactions_miscellaneous (transaction_id, username, description, transaction_date, amount)VALUES(5, 'user1', 'Miscellaneous Item 5', '05-09-2023', 59.99);

DELETE FROM Transaction_books
WHERE book_id = 5;
DELETE FROM master_books
WHERE book_id = 5;

UPDATE master_books
SET price = 24.99
WHERE book_title = 'Book Title 4';

ALTER TABLE master_books
ADD isbn VARCHAR2(20);

DROP TABLE master_books;
select * from master_books;
ROLLBACK;

ALTER TABLE master_movies
ADD (new_column VARCHAR2(50));

UPDATE master_movies
SET price = 29.99
WHERE movie_id = 5;

DELETE FROM transactions_movies
WHERE movie_id = 5;
DELETE FROM master_movies
WHERE movie_id = 5;

SELECT * FROM master_movies
WHERE genre = 'Action';

select * from master_movies;

select * from users;