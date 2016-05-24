spool C:\Users\Me\Documents\CST363\Week8\salesRepReport.txt

-- Team 6 - Hyo Lee, Jennifer Dunham, Daniel Cadwell, Francisco Gutierrez
-- TEAM KICK ASCII
-- Sales Rep Report

--Create a subtotal and total report for each Sales Rep.

SET ECHO ON
SET VERIFY ON
SET HEADING ON
SET PAGESIZE 5000
SET LINESIZE 140

PROMPT
TTITLE ON
TTITLE CENTER "SALES REPRESENTATIVE REPORT" SKIP 1 -
CENTER ============================== SKIP 2
SET PAGESIZE 1000
SET LINESIZE 110
COLUMN sls_rep_lname FORMAT A20;
COLUMN sls_rep_fname FORMAT A20;
BREAK ON    sls_rep_id SKIP 1 ON sls_rep_fname SKIP 1 ON sls_rep_lname SKIP 1 ON REPORT;
COMPUTE     SUM LABEL Subtotal OF "TOTAL INVOICE" ON sls_rep_id;
COMPUTE     SUM LABEL Total OF "Total Invoice" ON REPORT;
SELECT      sales_rep.sls_rep_id, sls_rep_fname, sls_rep_lname, invoice.store_num, invoice.inv_num,
            line.prod_num, line_qty, SUM(line_price*line_qty) AS "TOTAL INVOICE" 
FROM        sales_rep
JOIN        invoice ON sales_rep.sls_rep_id = invoice.sls_rep_id
JOIN        line ON invoice.inv_num = line.inv_num
GROUP BY    sls_rep_fname, sls_rep_lname, invoice.store_num, invoice.inv_num, line.prod_num, line_qty, sales_rep.sls_rep_id
ORDER BY    sls_rep_lname;
TTITLE OFF
CLEAR COMPUTE

SPOOL OFF