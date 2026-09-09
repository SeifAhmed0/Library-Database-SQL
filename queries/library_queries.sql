use lib;

select * from books;
select * from book_copies;
select * from book_loans;
select * from book_authors;
select * from publisher;
select * from borrower;
select * from library_branch;

# 1- Basic Retrieval
# Write a SQL query to list all books (BookID, Title) along with their publisher names, sorted alphabetically by title.
select BookID, Title, PublisherName from books order by Title;

# 2- Counting Records
# Write a query to count the total number of copies available for a specific book (use BookID = X as a placeholder).
select sum(Number_Of_Copies) as Total_Number_of_The_Book_Copies from book_copies where BookID = X;

# 3- Joining Tables
# Write a query to display all borrowers (Name, CardNo) who currently have books checked out (assume "checked out" means DateOut is not null and DateDue is in the future).
select distinct B.CardNo, Name as Borrower_Name from borrower B inner join book_loans L on B.CardNo = L.CardNo
where DateOut is not null and DateDue >= current_date();

# 4- Filtering with Conditions
# Write a query to find all books from a specific publisher (use PublisherName = 'X') that have more than 5 copies in any branch.
select BranchName, Title as Book_Title, PublisherName, Number_Of_Copies from books B inner join book_copies C on B.BookID = C.BookID inner join library_branch L on C.BranchID = L.BranchID
where PublisherName = 'X' and Number_Of_Copies > 5;

# 5- Multiple Joins
# Write a query to list all books (Title) written by a specific author (use AuthorName = 'X') that are available in a specific branch (use BranchName = 'Y').
select BranchName, Title as Book_Title, PublisherName from books B inner join book_authors A on B.BookID = A.BookID inner join book_copies C on A.BookID = C.BookID inner join library_branch L on C.BranchID = L.BranchID
where AuthorName = 'X' and BranchName = 'Y';

# 6- Aggregate Functions
# Write a query to show the branch with the highest total number of book copies across all titles (display BranchName and total copies).
select BranchName, SUM(Number_Of_Copies) as Total_Copies from library_branch L inner join book_copies C on L.BranchID = C.BranchID
group by BranchName order by Total_Copies desc limit 1;

# 7- Date Operations
# Write a query to find all overdue books (DateDue is earlier than today’s date) along with the borrower’s name and phone number.
select BookID, Name as Borrower_Name, Phone as Phone_Number from borrower B inner join book_loans L on B.CardNo = L.CardNo
where DateDue < current_date();

# 8- Subqueries
# Write a query to find borrowers who have never checked out any book.
select Name as Borrower_Name, CardNo from borrower where CardNo != All (select CardNo from book_loans);
# another solution
select Name as Borrower_Name, BookID from borrower B left join book_loans L on B.CardNo = L.CardNo where BookID is null;

# 9- Grouping Data
# Write a query to show the number of books written by each author (AuthorName and count), ordered by count (highest first).
select AuthorName, count(Title) as Number_of_Written_Books from books B inner join book_authors A on B.BookID = A.BookID group by AuthorName
order by Number_of_Written_Books desc;

# 10- Complex Query
# Write a query to find branches that have at least one copy of every book from a specific publisher (use PublisherName = 'X').
select LB.BranchName from library_branch LB join book_copies BC on LB.BranchID = BC.BranchID
join books BK on BC.BookID = BK.BookID join publisher P on BK.PublisherName = P.PublisherName
where P.PublisherName = 'X' group by LB.BranchID, LB.BranchName
having COUNT(distinct BK.BookID) =
(
    select COUNT(*) from books BK join publisher P on BK.PublisherName = P.PublisherName
    where P.PublisherName = 'X'
);
