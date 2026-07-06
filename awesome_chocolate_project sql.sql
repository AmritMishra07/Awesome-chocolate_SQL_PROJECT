-- BAASIC QUERIES
select * from sales;
Select SaleDate , Amount , Customers FROM sales;


-- ADDING CALCULATED COLUMNX IN SELECT
SELECT SaleDate ,Amount , Boxes, Amount/Boxes from sales;


-- ADDING COLUMN NAME USING (AS) OR ' ' 
SELECT SaleDate ,Amount , Boxes, Amount/Boxes 'Amount per box' from sales;

-- IMPOSE ANY CONDITION
SELECT * from sales
WHERE Amount > 10000;

-- USING ORDER CLAUSE
SELECT * from sales
WHERE Amount > 10000
ORDER BY Amount ;

-- USING SEPERATED CONDITION
SELECT * from sales
WHERE GeoID = 'G1'
ORDER BY PID , Amount DESC ;


-- MORE WHERE CLAUSE EXAMPLES
SELECT * from sales
WHERE Amount > 10000 AND SaleDate > '2022-01-01'
ORDER BY Amount  ASC;


-- USING YEAR() CLAUSE
SELECT SaleDate , Amount from sales
WHERE Amount > 10000 and year(SaleDate) = 2022
order by Amount desc;


-- BETWEEN CONDITION
SELECT * from sales
WHERE Boxes>0 and Boxes<=50;

SELECT * from sales
WHERE Boxes between 0 and 50;


-- WEEKDAY FUNCTION

SELECT SaleDate ,Amount,Boxes, weekday(SaleDate) as 'day of week'
from sales
where weekday(SaleDate) = 4;






-- 2ND TABLE PEOPLE

SELECT * FROM people;

SELECT * FROM people
where team = 'Delish' or team = 'Jucies'
order by team;

-- (IN) CLAUSE

SELECT * FROM people
WHERE Team in ('Delish' ,'Jucies');

-- HERE WE USE 'LIKE' AND '%' FOR THE PERSONS WHOSE NAME STARTS WITH B 
SELECT * FROM people
WHERE Salesperson LIKE 'B%';

SELECT * FROM people
WHERE Salesperson LIKE '%B%';


-- CASE OPERATOR
SELECT * FROM sales;


-- CATEGORIZATION OF AMOUNT ( CASE OPERATOR)

SELECT SaleDate , amount , 
		case     when amount <1000 then 'Under 1k'
				 when amount <5000 then 'Under 5k'
				 when amount <10000 then 'Under 10k'
			else '10k or more'
        end as 'Amount category'   
from sales;




-- HOMEWORK
-- 1 -  Print details of shipments (sales) where
-- amounts are > 2,000 and boxes are <100?
SELECT * 
FROM sales
where 
Amount > 2000 and boxes < 100;

-- 2 -  How many shipments (sales) each of the sales
-- persons had in the month of January 2022?

-- USING JOINS 

select p.Salesperson , s.SaleDate
from people p
JOIN  sales s on s.SPID = p.SPID
WHERE s.SaleDate > '2022-01-01'
ORDER BY Salesperson ;
 
 

-- 3-  Which product sells more boxes? Milk Bars or Eclairs?
SELECT SUM(s.Boxes) AS TOTAL_BOXES , p.Product
from products p
JOIN sales S ON s.PID = p.PID
WHERE p.Product IN('Milk Bars','Eclairs') 
GROUP BY p.Product
ORDER BY TOTAL_BOXES DESC
LIMIT 1;


-- 4. Which product sold more boxes in the first 7 
-- days of February 2022? Milk Bars or Eclairs?


SELECT SUM(s.Boxes) AS TOTAL_BOXES , p.Product
FROM products p
JOIN sales s ON s.PID = p.PID
WHERE p.Product IN ('Milk Bars','Eclairs')
  AND s.SaleDate >= '2022-01-01'
  AND s.SaleDate < '2022-01-08'
GROUP BY p.Product
ORDER BY TOTAL_BOXES DESC
LIMIT 1;








