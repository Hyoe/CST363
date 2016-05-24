-- Team 6 - Hyo Lee, Jennifer Dunham, Daniel Cadwell, Francisco Gutierrez
-- TEAM KICK ASCII
-- Queries


--What was our total income from invoices in April 2015?

COLUMN "Total Income in April 2015" format A30
SELECT to_char(SUM(LINE_PRICE*LINE_QTY), '$999,999.99') AS "Total Income in April 2015" 
FROM LINE, INVOICE
WHERE INVOICE.INV_NUM = LINE.INV_NUM and
INV_DATE >= '01-Apr-2015' and
INV_DATE <= '30-Apr-2015';


--What is the average product price?

COLUMN "Average Product Price" format A21
SELECT to_char(avg(prod_price), '$9,999.99') as "Average Product Price"
FROM PRODUCT;


--Which product has the lowest price?

COLUMN "Description" format A21
COLUMN "Price" format A11
SELECT prod_desc as "Description", to_char(prod_price, '$9,999.99') as "Price" 
FROM product 
WHERE prod_price = (select min(prod_price) from product);


--Which product has the highest price?

select prod_desc as "Description", to_char(prod_price, '$9,999.99') as "Price" 
FROM product 
WHERE prod_price = (select max(prod_price) from product);


--What are the total sales of each Sales Rep?

SELECT sls_rep_fname, sls_rep_lname, sum(line_price*line_qty) AS "TOTAL SALES"
FROM sales_rep inner JOIN invoice
on sales_rep.sls_rep_id = invoice.sls_rep_id
inner JOIN line
on invoice.inv_num = line.inv_num
group by sls_rep_fname, sls_rep_lname;


--Which sales rep has generated the most income?

SELECT sales_rep.sls_rep_fname || ' ' || sales_rep.sls_rep_lname AS "SALES REP"
FROM sales_rep
JOIN invoice ON sales_rep.sls_rep_id = invoice.sls_rep_id
JOIN line ON invoice.inv_num = line.inv_num
WHERE line_total = (SELECT MAX(LINE_TOTAL)
                          	FROM line);


--Which product do we have the least of in stock?

SELECT prod_num, prod_desc, prod_qoh
FROM product where prod_qoh = (SELECT min(prod_qoh)
                                FROM product);


--Which store has spent the most money?

SELECT store.store_name
FROM store
JOIN invoice ON invoice.store_num = store.store_num
JOIN line ON invoice.inv_num = line.inv_num
WHERE line_total = (SELECT MAX(LINE_TOTAL)
                    FROM line);
                    
                    
--Show the vendor names, the products they manufacture, and the product category name.

SELECT VEND_NAME, PROD_DESC, CAT_NAME
FROM VENDOR, PRODUCT, CATEGORY
WHERE VENDOR.VEND_NUM = PRODUCT.VEND_NUM AND PRODUCT.CAT_NUM = CATEGORY.CAT_NUM
ORDER BY VEND_NAME ASC;                    


--How many products does each vendor provide?
  
SELECT VEND_NAME, COUNT(*) AS "Number of Products"
FROM VENDOR, PRODUCT
WHERE VENDOR.VEND_NUM = PRODUCT.VEND_NUM
GROUP BY VEND_NAME;


--List invoices with total sales > $10,000.00 (or higher than the average)

SELECT invoice.inv_num, sum(line_price*line_qty) AS "TOTAL SALES"
FROM invoice JOIN line
on invoice.inv_num = line.inv_num
GROUP BY invoice.inv_num
HAVING sum(line_price*line_qty) > avg(line_price*line_qty)
OR sum(line_price*line_qty) > 10000;




