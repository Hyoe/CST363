-- Team 6 - Hyo Lee, Jennifer Dunham, Daniel Cadwell, Francisco Gutierrez
-- TEAM KICK ASCII
-- Select All Tables


--Table formatting to display each table

--Sales_Rep Table
SET PAGESIZE 50000
SET LINESIZE 140
COLUMN PROD_DESC FORMAT A30
COLUMN sls_rep_fname FORMAT A20
COLUMN sls_rep_lname FORMAT A20
COLUMN sls_rep_initial FORMAT A20
COLUMN sls_rep_email FORMAT A28
SELECT * FROM sales_rep;

--Store Table
COLUMN store_address FORMAT A28
COLUMN store_city FORMAT A14
COLUMN store_name FORMAT A28
COLUMN store_phone FORMAT A12
COLUMN store_zip FORMAT A10
SELECT * FROM store;

--Invoice Table
COLUMN inv_date FORMAT A12
COLUMN inv_ship_date FORMAT A15
SELECT * FROM INVOICE;

--Product Table
COLUMN prod_desc FORMAT A62
SELECT * FROM product;

--Store_contact Table
COLUMN contact_fname FORMAT A16
COLUMN contact_lname FORMAT A16
COLUMN contact_initial FORMAT A16
COLUMN contact_email FORMAT A24
COLUMN contact_job_title FORMAT A18
SELECT * FROM store_contact;

--Category Table
COLUMN cat_name FORMAT A22
SELECT * FROM category;

--Line Table
SELECT * FROM line;

--Vendor Table
COLUMN vend_address FORMAT A28
COLUMN vend_city FORMAT A20
SELECT * FROM vendor;