# Module-3-Library-Management-System 


## Overview
This project is a **Library Management System** designed to manage the library’s inventory, track book issues, returns, and manage customer data. It allows users to keep track of books, employees, branches, and customer activity, such as book issuance and returns. The system utilizes SQL to manage the data, and it includes various queries to retrieve and manipulate information.

The database for this system is named **library** and contains the following tables:

1. **Branch**: Contains branch information like branch number, manager details, and contact info.
2. **Employee**: Contains employee details such as ID, name, position, salary, and branch affiliation.
3. **Books**: Contains information about books like ISBN, title, category, author, rental price, and availability.
4. **Customer**: Contains customer information such as ID, name, address, and registration date.
5. **IssueStatus**: Tracks the status of books issued to customers, including issue date and ISBN reference.
6. **ReturnStatus**: Tracks the return details of books, including return date and ISBN reference.

## Queries
The following SQL queries are implemented in this system to retrieve and manipulate the data with screenshots :

Branch table : 
![image](https://github.com/user-attachments/assets/179454eb-7f2f-4a8a-a8db-09dafb78f41f)
Employee table :
![image](https://github.com/user-attachments/assets/2e750245-e3f8-413e-860c-66784532c6a1)

Books table :

![image](https://github.com/user-attachments/assets/a6f8841a-2fdc-40ca-88ef-8a70e188e13e)

Cutomer table :
![image](https://github.com/user-attachments/assets/3ba5322b-957a-42a1-9eb4-d0065d5dc656)

IssueStatus Table:
![image](https://github.com/user-attachments/assets/9d5813bf-db61-4ca5-913b-68c042855f24)

Return status table :
![image](https://github.com/user-attachments/assets/d52fcc0c-fffe-47ac-9f93-e878a2cde215)

1.	Retrieve the book title, category, and rental price of all available books:
 

![image](https://github.com/user-attachments/assets/d2eb5a0e-4278-4d70-9dc7-5d380be45a2c)

2.	List the employee names and their respective salaries in descending order of salary:
    ![image](https://github.com/user-attachments/assets/7ebdce77-5094-4670-947e-10614e2196c9)


3. Retrieve the book titles and the corresponding customers who have issued those books:
   ![image](https://github.com/user-attachments/assets/204fd9b8-0232-4d9b-948b-6d90c1e5cb4e)

4. Display the total count of books in each category:
   ![image](https://github.com/user-attachments/assets/4898faa4-ebef-4d2f-bc82-b11c5ecb8bff)

5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000:
   ![image](https://github.com/user-attachments/assets/d64fec44-d1da-49d5-ba51-6bdce19acc72)

6. List the customer names who registered before 2022-01-01 and have not issued any books yet.
   ![image](https://github.com/user-attachments/assets/59c23cd5-fee5-4743-ad36-6a2cdc3ce017)

7. Display the branch numbers and the total count of employees in each branch:
   ![image](https://github.com/user-attachments/assets/1f57608c-8374-4cc4-b363-0d5944597a02)

8. Display the names of customers who have issued books in the month of June 2023.
   ![image](https://github.com/user-attachments/assets/bc8f1d90-6267-41db-95de-f8b903c8819d)

9. Retrieve book_title from book table containing history
    ![image](https://github.com/user-attachments/assets/e1f0c68b-9771-44de-837c-deeb21677d96)

10.Retrieve the branch numbers along with the count of employees for branches having more than 1 employees.

![image](https://github.com/user-attachments/assets/acaab002-162b-43e1-8f6b-f04810e85115)

11.Retrieve the names of employees who manage branches and their respective branch addresses
![image](https://github.com/user-attachments/assets/cc56dc8a-e838-44b8-bc82-0c427fc75c7d)

12.Display the names of customers who have issued books with a rental price higher than Rs. 15.
![image](https://github.com/user-attachments/assets/b1c8520d-f8d1-401a-8901-16c528d9f82f)








 










