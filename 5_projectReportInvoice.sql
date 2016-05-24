spool C:\Users\Me\Documents\CST363\Week8\projectReportInvoice.txt

-- Team 6 - Hyo Lee, Jennifer Dunham, Daniel Cadwell, Francisco Gutierrez
-- TEAM KICK ASCII
-- Invoice Report

SET ECHO OFF
SET VERIFY OFF
SET HEADING OFF
SET PAGESIZE 0
SET LINESIZE 100

PROMPT
PROMPT
ACCEPT invN PROMPT 'Please enter an Invoice Number (10000 - 10019): '
PROMPT
PROMPT
PROMPT INVOICE DETAILS
PROMPT ===============
PROMPT


SELECT 'Invoice Number: ' || invoice.inv_num
FROM    INVOICE
JOIN    LINE ON invoice.inv_num = line.inv_num
WHERE   invoice.inv_num = '&invN'
GROUP BY    invoice.inv_num;

SELECT 'Store Number: ' || invoice.store_num, 'Store Name: ' || store.store_name
FROM    INVOICE
JOIN    LINE ON invoice.inv_num = line.inv_num
JOIN    STORE ON invoice.store_num = store.store_num
WHERE   invoice.inv_num = '&invN'
GROUP BY invoice.store_num, store.store_name;

SELECT 'Sales Rep: ' || UPPER(sales_rep.sls_rep_lname) || ', ' || sales_rep.sls_rep_fname
FROM    INVOICE
JOIN    LINE ON invoice.inv_num = line.inv_num
JOIN    STORE ON invoice.store_num = store.store_num
JOIN    SALES_REP ON sales_rep.sls_rep_id = invoice.sls_rep_id
WHERE   invoice.inv_num = '&invN'
GROUP BY sales_rep.sls_rep_fname, sales_rep.sls_rep_lname;

SELECT 'Ordered By: ' || UPPER(store_contact.contact_lname) || ', ' || store_contact.contact_fname
FROM    INVOICE
JOIN    LINE ON invoice.inv_num = line.inv_num
JOIN    STORE ON invoice.store_num = store.store_num
JOIN    SALES_REP ON sales_rep.sls_rep_id = invoice.sls_rep_id
JOIN    STORE_CONTACT ON store_contact.contact_id = invoice.ordered_by
WHERE   invoice.inv_num = '&invN'
GROUP BY store_contact.contact_lname, store_contact.contact_fname;

SELECT 'Ordered On: ' || TO_CHAR(inv_date, 'MM/DD/YYYY')
FROM    INVOICE
WHERE   invoice.inv_num = '&invN'
GROUP BY inv_date;

SELECT 'Shipped On: ' || TO_CHAR(inv_ship_date, 'MM/DD/YYYY')
FROM    INVOICE
WHERE   invoice.inv_num = '&invN'
GROUP BY inv_ship_date;

BREAK ON REPORT;
COMPUTE SUM LABEL Total OF "Subtotal" ON REPORT;
SELECT 'Product: ' || product.prod_num, 'Description: ' || rpad(prod_desc, 30, '-'), 'Quantity: ' || line.line_qty,
        'Item Price: ' || TO_CHAR(line.line_price, 'FM$999999.00'), line.line_qty*line.line_price AS "Subtotal"
FROM    PRODUCT
JOIN    LINE ON product.prod_num = line.prod_num
JOIN    INVOICE ON invoice.inv_num = line.inv_num
WHERE   invoice.inv_num = '&invN'
GROUP BY product.prod_num, prod_desc, line.line_qty, line.line_price;

CLEAR COMPUTE
SET VERIFY ON
SET HEADING ON
SET PAGESIZE 500
SET LINESIZE 140

SPOOL OFF