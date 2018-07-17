-- 	1.	Get all customers and their addresses.
SELECT "customers"."first_name", "customers"."last_name", "addresses"."street", "addresses"."city", "addresses"."state", "addresses"."zip"
FROM "customers"
  JOIN "addresses" ON "addresses"."customer_id" = "customers"."id";

--  2.	Get all orders and their line items.
SELECT *
FROM "orders"
  LEFT OUTER JOIN "line_items" ON "line_items"."order_id" = "orders"."id";

-- 	3.	Which warehouses have cheetos?
SELECT "warehouse", "warehouse_product"."on_hand"
FROM "warehouse"
  JOIN "warehouse_product" ON "warehouse_product"."warehouse_id" = "warehouse"."id"
  JOIN "products" ON "products"."id" = "warehouse_product"."product_id"
WHERE "products"."description" = 'cheetos';

-- 	4.	Which warehouses have cheetos?
SELECT "warehouse", "warehouse_product"."on_hand"
FROM "warehouse"
  JOIN "warehouse_product" ON "warehouse_product"."warehouse_id" = "warehouse"."id"
  JOIN "products" ON "products"."id" = "warehouse_product"."product_id"
WHERE "products"."description" = 'diet pepsi';

--  5.  Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT "customers"."first_name", "customers"."last_name", count("orders"."address_id")
FROM "orders"
  JOIN "addresses" ON "orders"."address_id" = "addresses"."id"
  JOIN "customers" ON "addresses"."customer_id" = "customers"."id"
GROUP BY "customers"."first_name", "customers"."last_name";

-- 	6.	How many customers do we have?
SELECT COUNT(*) AS "number_of_customers"
FROM "customers";

--	7.	How many products do we carry?
SELECT COUNT("description") AS "number_of_products"
FROM "products";

--  8.	What is the total available on-hand quantity of diet pepsi?
SELECT SUM("on_hand"), "products"."description"
FROM "warehouse_product"
  JOIN "products" ON "products"."id" = "warehouse_product"."product_id"
WHERE "product_id" = 6
GROUP BY "products"."description";
