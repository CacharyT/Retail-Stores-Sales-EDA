-- View the entire dataset (modified; removed transaction id)
SELECT *
FROM store_sales_copy
;

-- Determining data types for each column
SELECT COLUMN_NAME, DATA_TYPE
FROM information_schema.columns
WHERE TABLE_NaME = 'store_sales_copy'
;

-- Dealing with NULL or Missing values
SELECT *
FROM store_sales_copy
WHERE `Discount Applied` IS NULL
;

SELECT *
FROM store_sales_copy
WHERE `Discount Applied` = ' '
;

SELECT *
FROM store_sales_copy
WHERE `Discount Applied` = ''
;

DELETE FROM store_sales_copy  -- Removing rows with missing values.
WHERE `Discount Applied` = ''
;

-- Checking for duplicate values (Needed based on date; possible double charge)
SELECT `Customer ID`, Category, Item, `Price Per Unit`, Quantity, `Transaction Date`, COUNT(*)
FROM store_sales_copy
GROUP BY `Customer ID`, Category, Item, `Price Per Unit`, Quantity, `Transaction Date`
HAVING COUNT(*) > 1
;

-- Finding unique customers
SELECT DISTINCT `Customer ID`
FROM store_sales_copy
;

-- Finding average of price per unit and quantity based on the category and item
WITH sumPPU AS (
	SELECT Category, Item, SUM(`Price Per Unit`) AS Sum_Price_Per_Unit
    FROM store_sales_copy
    GROUP BY Category, Item
)

SELECT Item, AVG(sumPPU.Sum_Price_Per_Unit) AS Average_Price_Per_Unit
FROM sumPPU
GROUP BY Item
;

WITH sumAQ AS (
	SELECT Category, Item, SUM(Quantity) AS Sum_Quantity
    FROM store_sales_copy
    GROUP BY Category, Item
)

SELECT Item, AVG(sumAQ.Sum_Quantity) AS Average_Quantity
FROM sumAQ
GROUP BY Item
;