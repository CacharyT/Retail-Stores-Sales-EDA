CREATE TABLE store_sales_copy AS
	SELECT `Customer ID`, Category, Item, `Price Per Unit`, Quantity, `Payment Method`, Location, `Transaction Date`, `Discount Applied`
    FROM retail_store_sales
    ;
    
CREATE TABLE new_store_sales AS
	SELECT `Customer ID`, Category, Item, `Price Per Unit`, Quantity, `Payment Method`, Location, `Transaction Date`, `Discount Applied`
	FROM retail_store_sales
;