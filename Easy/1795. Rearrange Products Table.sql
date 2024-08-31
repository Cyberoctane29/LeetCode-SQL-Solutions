-- Problem 1795: Rearrange Products Table
-- Difficulty: Easy

-- SQL Schema
-- Table: Products
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | product_id  | int     |
-- | store1      | int     |
-- | store2      | int     |
-- | store3      | int     |
-- +-------------+---------+
-- product_id is the primary key (column with unique values) for this table.
-- Each row in this table indicates the product's price in 3 different stores: store1, store2, and store3.
-- If the product is not available in a store, the price will be null in that store's column.

-- Problem Statement
-- Write a solution to rearrange the Products table so that each row has (product_id, store, price).
-- If a product is not available in a store, do not include a row with that product_id and store combination in the result table.
-- Return the result table in any order.

-- Solution:
-- Using UNION to combine results for each store into a single table format.

SELECT product_id, 'store1' AS store, store1 AS price
FROM Products
WHERE store1 IS NOT NULL

UNION 

SELECT product_id, 'store2' AS store, store2 AS price
FROM Products
WHERE store2 IS NOT NULL

UNION 

SELECT product_id, 'store3' AS store, store3 AS price
FROM Products
WHERE store3 IS NOT NULL;

-- Intuition:
-- The goal is to transform the table from having multiple columns for different stores into a single column for the store name and price.
-- Each store's prices are separated into different queries, which are then combined using the UNION operation to ensure all relevant rows are included.

-- Explanation:
-- The first part of the UNION selects the product_id, the literal string 'store1' as the store name, and the price from store1 where it is not null.
-- The second part of the UNION does the same for store2, and the third part for store3.
-- Each part of the UNION excludes rows where the price is null, effectively filtering out products that are not available in that store.
-- The UNION operation combines these results into a single result set with each row representing a product's price in a specific store.
