Project Overview
This repository contains a complete MySQL database solution for a bookstore management system. The database tracks books, authors, publishers, customers, orders, and inventory with appropriate relationships and access controls.
Team Members & Contributions
Team Member	Role	Contribution
Leon Juma	Database Architect	Designed the complete database schema and created all tables
Edith	Security Engineer	Implemented role-based access control and created repository
Joy	Visualization Specialist	Created ER diagrams and database visuals
Database Schema
The bookstore_db contains 13 related tables:

Core Tables
Books: book, book_language, book_author

Publishing: publisher, author

Customers: customer, customer_address

Orders: cust_order, order_line, order_history

Supporting: address, country, address_status, shipping_method

Key Features
Proper normalization (3NF)

Comprehensive foreign key relationships

Auto-incrementing primary keys

Appropriate constraints (NOT NULL, UNIQUE)

 Access Control & User Management
User Accounts
Our system implements three distinct user accounts with different privilege levels:

Username		Assigned Role	Access Level
leon@localhost		admin_full	Full administrative privileges
joy@localhost		read_write	Read and write access
edith@localhost		read_only	Read-only access
Role Definitions
We've established three security roles with granular permissions:

admin_full (Assigned to Leon)

SELECT, INSERT, UPDATE privileges on all tables

Full administrative control over the database

read_write (Assigned to Joy)

ALL privileges on all tables

Can read, modify, and delete data

read_only (Assigned to Edith)

SELECT privilege on all tables

Can view data but cannot make changes

📊 Visual Documentation
Joy provided the following visual assets:

Entity-Relationship Diagrams (ERDs)

Database schema visualization

Relationship mapping charts

User permission flow diagrams

(Note: These visuals should be included in the repository as image files or PDFs)

🛠️ Technical Specifications
Database System: MySQL 8.0+

Schema File: bookstore_schema.sql

Test Data: Sample data for all tables included

Special Features:

Multi-table relationships

Transactional order system

Address management system

Historical order tracking
