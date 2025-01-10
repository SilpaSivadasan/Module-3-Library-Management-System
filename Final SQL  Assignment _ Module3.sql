-- Create the Database Library
CREATE DATABASE library;
use library;

# creating table Branch
CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(15)
);

# creating table Employee
CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(100),
    Position VARCHAR(50),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

# creating table Books
CREATE TABLE Books (
    ISBN INT PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(100),
    Rental_Price DECIMAL(10, 2),
    Status VARCHAR(3) CHECK (Status IN ('yes', 'no')), 
    Author VARCHAR(100),
    Publisher VARCHAR(100)
);

# creating table Customer
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(100),
    Customer_address VARCHAR(255),
    Reg_date DATE
);

# creating table IssueStatus 
CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    Isbn_book INT,
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

# creating table ReturnStatus
CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    Isbn_book2 INT,
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);

# inserting values to branch table 
INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no)
VALUES 
(1, 101, '123 Main Street', '9876543210'),
(2, 102, '456 High Road', '9876543220'),
(3, 103, '789 Park Avenue', '9876543230'),
(4, 104, '321 Oak Street', '9876543240'),
(5, 105, '654 Pine Road', '9876543250');

# display table Branch 
select * from Branch;

# inserting values to employee table 
INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no)
VALUES 
(101, 'John Doe', 'Manager', 60000, 1),
(102, 'Jane Smith', 'Manager', 58000, 2),
(103, 'Alice Johnson', 'Staff', 45000, 1),
(104, 'Bob Brown', 'Staff', 42000, 2),
(105, 'Charlie White', 'Assistant', 40000, 3);

# display table Employee
select * from Employee;

# Insert Data into Books Table
INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES 
(1001, 'The Great Gatsby', 'Fiction', 15.50, 'yes', 'F. Scott Fitzgerald', 'Scribner'),
(1002, '1984', 'Dystopian', 12.75, 'no', 'George Orwell', 'Secker & Warburg'),
(1003, 'A Brief History of Time', 'Science', 18.00, 'yes', 'Stephen Hawking', 'Bantam Books'),
(1004, 'To Kill a Mockingbird', 'Fiction', 14.00, 'no', 'Harper Lee', 'J.B. Lippincott & Co.'),
(1005, 'The Silent Patient', 'Thriller', 16.00, 'yes', 'Alex Michaelides', 'Celadon Books');

# display table Books
select * from Books;


# Insert Data into Customer Table
INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES 
(1, 'Emily Clark', '789 Willow Lane', '2021-12-15'),
(2, 'Michael Davis', '654 Elm Street', '2022-01-10'),
(3, 'Sarah Wilson', '321 Oak Avenue', '2023-03-25'),
(4, 'Daniel Garcia', '951 Maple Street', '2020-11-05'),
(5, 'Olivia Martin', '357 Birch Avenue', '2022-06-18');


# display table Customer
select * from Customer;

#Insert Data into IssueStatus Table
INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES 
(1, 1, '1984', '2023-06-10', 1002),   -- Customer 1 issued '1984'
(2, 2, 'The Great Gatsby', '2023-06-15', 1001),   -- Customer 2 issued 'The Great Gatsby'
(3, 3, 'A Brief History of Time', '2023-06-20', 1003),  -- Customer 3 issued 'A Brief History of Time'
(4, 4, 'The Silent Patient', '2023-06-25', 1005),  -- Customer 4 issued 'The Silent Patient'
(5, 5, 'To Kill a Mockingbird', '2023-07-01', 1004);  -- Customer 5 issued 'To Kill a Mockingbird'

# display table IssueStatus
select * from IssueStatus;


#Insert  Values into ReturnStatus:
INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES 
(1, 1, '1984', '2023-07-10', 1002),   -- Customer 1 returned '1984'
(2, 2, 'The Great Gatsby', '2023-07-15', 1001),   -- Customer 2 returned 'The Great Gatsby'
(3, 3, 'A Brief History of Time', '2023-07-18', 1003),  -- Customer 3 returned 'A Brief History of Time'
(4, 4, 'The Silent Patient', '2023-07-22', 1005),  -- Customer 4 returned 'The Silent Patient'
(5, 5, 'To Kill a Mockingbird', '2023-07-25', 1004);  -- Customer 5 returned 'To Kill a Mockingbird'


# display table ReturnStatus
select * from ReturnStatus;


# 1. Retrieve the book title, category, and rental price of all available books

select Book_title, Category, Rental_Price from Books 
where status = 'yes';


#2. List the employee names and their respective salaries in descending order of salary.
select Emp_name, Salary
from Employee
order by Salary desc;


#3. Retrieve the book titles and the corresponding customers who have issued those books.
SELECT B.Book_title, C.Customer_name
FROM Books B
JOIN IssueStatus I ON B.ISBN = I.Isbn_book
JOIN Customer C ON I.Issued_cust = C.Customer_Id;


#4 Display the total count of books in each category:
SELECT Category, COUNT(*) AS Total_Books
FROM Books
GROUP BY Category;


#5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
select Emp_name, Position 
from Employee
where Salary > '50000' ;


# 6. List the customer names who registered before 2022-01-01 and have not issued any books yet.
SELECT C.Customer_name
FROM Customer C
LEFT JOIN IssueStatus I ON C.Customer_Id = I.Issued_cust
WHERE C.Reg_date < '2022-01-01' 
AND I.Issued_cust IS NULL;


#7  Display the branch numbers and the total count of employees in each branch:
SELECT Branch_no, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Branch_no;

# 8. Display the names of customers who have issued books in the month of June 2023.
SELECT C.Customer_name
FROM Customer C
JOIN IssueStatus I ON C.Customer_Id = I.Issued_cust
WHERE I.Issue_date BETWEEN '2023-06-01' AND '2023-06-30';

# 9. Retrieve book_title from book table containing history
SELECT Book_title
FROM Books
WHERE Book_title LIKE '%history%';

#10.Retrieve the branch numbers along with the count of employees for branches having more than 1 employees
SELECT Branch_no, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Branch_no
HAVING COUNT(*) > 1;

# 11. Retrieve the names of employees who manage branches and their respective branch addresses.
SELECT E.Emp_name, B.Branch_address
FROM Employee E
JOIN Branch B ON E.Branch_no = B.Branch_no
WHERE E.Position = 'Manager';


# 12  Display the names of customers who have issued books with a rental price higher than Rs. 15.
SELECT C.Customer_name
FROM Customer C
JOIN IssueStatus I ON C.Customer_Id = I.Issued_cust
JOIN Books B ON I.Isbn_book = B.ISBN
WHERE B.Rental_Price > 15;















