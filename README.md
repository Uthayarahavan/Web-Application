# Web-Application

MyStore Management System
Welcome to the MyStore Management System, a comprehensive application for managing transactions related to various products, including books, movies, products, courses, restaurants, and miscellaneous items. This system is built using Oracle Database with tables to store information about users, master data, and transaction details.

Table Structure

Users Table:
users: Stores user information.

Master Data Tables:
master_books: Information about books.
master_movies: Information about movies.
master_products: Information about products.
master_courses: Information about courses.
master_restaurants: Information about restaurants.

Transaction Tables:
transactions_books: Records transactions related to book purchases.
transactions_movies: Records transactions related to movie purchases.
transactions_products: Records transactions related to product purchases.
transactions_courses: Records transactions related to course purchases.
transactions_restaurants: Records transactions related to restaurant visits.
transactions_miscellaneous: Records miscellaneous transactions.
Initial Data
The application comes with initial data for users, master data, and sample transactions. Feel free to modify or extend this data based on your needs.


Set Up Oracle Database:

Ensure you have an Oracle Database instance with the required schema.
Run the SQL script to create tables and insert initial data.
Configure Database Connection:

Update the connection details in your application code (e.g., add_books.js) to match your Oracle Database settings.
Run the Application:

Start the application using Node.js.

npm install
npm start

use;
npm install oracledb
npm install express oracledb body-parser
npm init -y

node example.js to run the code 

Features
Add New Transactions:

Add new transactions for books, movies, products, courses, restaurants, and miscellaneous items.
View Transaction History:

View transaction history to track user purchases and other activities.
User Management:

Manage user accounts and their information.
Master Data Management:

Update master data, including books, movies, products, courses, and restaurants.
Contributing
Feel free to contribute to the development of this application by submitting issues or pull requests.
