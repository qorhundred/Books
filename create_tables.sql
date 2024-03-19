CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL,
    category_index INT
);

-- Authors 테이블 생성
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255),
    age INT
);

-- Books 테이블 생성
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    pub_year DATETIME NOT NULL,
    price INT NOT NULL,
    category_id INT,
    author_id INT,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id),
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- Users 테이블 생성
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    address VARCHAR(255),
    age INT,
    CONSTRAINT uc_name_email UNIQUE (name, email)
);

-- Purchases 테이블 생성
CREATE TABLE Purchases (
    purchase_id INT AUTO_INCREMENT PRIMARY KEY,
    purchase_date DATETIME NOT NULL,
    quantity INT NOT NULL,
    purchase_price INT NOT NULL,
    user_id INT,
    book_id INT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

-- 1번
SELECT name, age FROM Authors;
-- 2번
SELECT * FROM Books WHERE pub_year >= '2020-01-01';
--3번
SELECT user_id, book_id, purchase_date FROM purchases WHERE YEAR(purchase_date) = 2024;
--4번
SELECT name, address FROM users WHERE address = '서울';
--5번
SELECT * FROM Books ORDER BY price DESC;
--6번
SELECT * from categories WHERE category_name = '과학';
--7번
SELECT email, age FROM Users WHERE age >= 28 AND age <= 30;
--8번
Select year(pub_year) as year, COUNT(YEAR(pub_year)) as total_books From books
GROUP BY year(pub_year) ORDER BY year asc;
--9번
SELECT * from purchases where quantity>= 4;
--10
Select books.title, categories.category_name
from books
inner join categories
on books.category_id = categories.category_id;
--11
SELECT * FROM Users
WHERE name LIKE '김%'; 

