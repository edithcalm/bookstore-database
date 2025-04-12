Project Overview
This repository contains a complete MySQL database solution for a bookstore management system. The database tracks books, authors, publishers, customers, orders, and inventory with appropriate relationships and access controls.

Team Members & Contributions
1. Leon Juma Database Architect - Designed the complete database schema and created all tables.
2. Edith Security Engineer - Implemented role-based access control and created the repository.
3. Joy Visualization Specialist- Created ER diagrams and database visuals.

Database Schema
The bookstore_db contains 13 related tables:

Core Tables
1. Books: book, book_language, book_author
2. Publishing: publisher, author
3. Customers: customer, customer_address
4. Orders: cust_order, order_line, order_history
5. Supporting: address, country, address_status, shipping_method

Key Features
1. Proper normalisation (3NF)
2. Comprehensive foreign key relationships
3. Auto-incrementing primary keys
5. Appropriate constraints (NOT NULL, UNIQUE)

Access Control & User Management
-User Accounts
-Our system implements three distinct user accounts with different privilege levels:

Username	                   Assigned Role 	         Access Level
1. leon@localhost		            admin_full	            Full administrative privileges
2. joy@localhost		             read_write	            Read and write access
3. edith@localhost		           read_only	             Read-only access

Role Definitions
We've established three security roles with granular permissions:

1. admin_full (Assigned to Leon)

  SELECT, INSERT, and UPDATE privileges on all tables
  Full administrative control over the database

2. read_write (Assigned to Joy)

   ALL privileges on all tables

   Can read, modify, and delete data

3. read_only (Assigned to Edith)

   SELECT privilege on all tables

   Can view data but cannot make changes

📊 Visual Documentation
Joy provided the following visual assets:

1. Entity-relationship diagrams (ERDs)

2. Database schema visualization

3. Relationship mapping charts

4. User permission flow diagrams

 They are included on the repo

🛠️ Technical Specifications
1. Database System: MySQL 8.0+

2. Schema File: bookstore_schema.sql

3. Test Data: Sample data for all tables included

Special Features:

1. Multi-table relationships

2. Transactional order system

4. Address management system

5. Historical order tracking
