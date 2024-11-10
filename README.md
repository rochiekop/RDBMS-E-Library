# E-Library-System
SQL Database implementation of Library workflow 


# Database Specification:
* Purpose
* Business Rules
* Design Requirements
* Design Decisions
* ERD diagram

# Database Purpose:

The main purpose of the system is to:
* Design and maintain a database of the library as well as book details and users loan
* It also allows users can request/book the book if stock is unavailable in the catalog
* Users can return the book once they have finished reading it
* Users can view their borrowed books and the due date of the book

# Business Rules:

* Users admin entity will have information of all user loan status and book catalog in every library
* Each library has its own book catalogue with different available book stocks.
* Each user can only borrow on 2 book in the same time with duration is 2 week start from first time borrow the book
* Each user it also can be request/book the book if stock if unavailable with queue mechanism
* The library maintains a hold queue, and when a book becomes available, it can be borrowed by the customer at the front of the queue. Additionally, if a customer doesn't borrow a held book within one week, the book is released for other users to borrow. 
* Users can borrow books from any library in this application if the book is available. 
* The loan period is 2 weeks. Users can return books earlier than the due date


# Design Requirements:

* Mission Statement determining the necessary objects for the database 
* Specify the primary key fields in each table by specifying PK beside the fields. Determining candidate keys, then choose the primary key among these candidates.
* Mapping between the fields of each table to show the relationships between each table (one-to-one, one-to-many, or many-to-many etc).
* Determine business rules via constraints for the required fields.


# ER Diagram:

![](https://github.com/rochiekop/RDBMS-E-Library/blob/master/ERD/ERD.svg)
