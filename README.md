Project Overview This repository contains a complete MySQL database solution for a bookstore management system. The database tracks books, authors, publishers, customers, orders, and inventory with appropriate relationships and access controls.

Team Members & Contributions

Leon Juma Database Architect - Designed the complete database schema and created all tables.
Edith Security Engineer - Implemented role-based access control and created the repository.
Joy Visualization Specialist- Created ER diagrams and database visuals.
Database Schema The bookstore_db contains 13 related tables:

Core Tables

Books: book, book_language, book_author
Publishing: publisher, author
Customers: customer, customer_address
Orders: cust_order, order_line, order_history
Supporting: address, country, address_status, shipping_method
Key Features

Proper normalisation (3NF)
Comprehensive foreign key relationships
Auto-incrementing primary keys
Appropriate constraints (NOT NULL, UNIQUE)
Access Control & User Management -User Accounts -Our system implements three distinct user accounts with different privilege levels:


 Username	                   Assigned Role 	         Access Level
 1. leon@localhost		          admin_full	        Full administrative privileges
 2. joy@localhost		            Read_write	          Read and write access
 3. edith@localhost		          read_only	           Read-only access

user name	Description	Privileges

 | user name     | Description                        | Privileges                                  |
 |-------------- |------------------------------------|---------------------------------------------|
 |leon@localhost | View-only access for data auditing |  Read-only access                           |
 |joy@localhost  | For editors and staff              |  Read and write access                      |
 |edith@localhost| Full administrative control        |  Full administrative privileges             |

admin_full (Assigned to Leon)
SELECT, INSERT, and UPDATE privileges on all tables Full administrative control over the database

read_write (Assigned to Joy)

ALL privileges on all tables

Can read, modify, and delete data

read_only (Assigned to Edith)

SELECT privilege on all tables

Can view data but cannot make changes

📊 Visual Documentation Joy provided the following visual assets:

Entity-relationship diagrams (ERDs)

Database schema visualization

Relationship mapping charts

User permission flow diagrams

(They are included on the repo)

🛠️ Technical Specifications

Database System: MySQL 8.0+

Schema File: bookstore_schema.sql

Test Data: Sample data for all tables included

Special Features:

Multi-table relationships

Transactional order system

Address management system

Historical order tracking
