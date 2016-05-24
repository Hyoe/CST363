spool C:\Users\Me\Documents\CST363\Week8\projectInsertSalesRep.txt

-- Team 6 - Hyo Lee, Jennifer Dunham, Daniel Cadwell, Francisco Gutierrez
-- TEAM KICK ASCII
-- Insert New Sales Rep

SET ECHO OFF
SET VERIFY OFF
SET HEADING OFF
SET PAGESIZE 0
SET LINESIZE 40


PROMPT NEW SALES REP ENTRY
PROMPT
PROMPT
ACCEPT slsF PROMPT 'Please enter Sales Reps First Name: '
ACCEPT slsL PROMPT 'Please enter Sales Reps Last Name: '
ACCEPT slsM PROMPT 'Please enter Sales Reps Middle Initial: '
ACCEPT slsE PROMPT 'Please enter Sales Reps Email Address: '
ACCEPT slsP PROMPT 'Please enter Sales Reps Phone Number (no dashes or symbols): '
PROMPT
PROMPT
PROMPT NEW SALES REP
PROMPT =============
PROMPT

INSERT INTO SALES_REP VALUES (slsRepID.nextval,'&slsF', '&slsL', '&slsM', '&slsE','&slsP');

SELECT  'Sales Rep ID: ' || SLS_REP_ID,
        'First Name: ' || SLS_REP_FNAME,
        'Last Name: ' || SLS_REP_LNAME,
        'Middle Initial: ' || SLS_REP_INITIAL,
        'EMAIL: ' || SLS_REP_EMAIL,
        'PHONE #: ' || '(' || substr(SLS_REP_PHONE, 1, 3) || ') ' || substr(SLS_REP_PHONE, 4, 3) || '-' || substr(SLS_REP_PHONE, 7, 4)
FROM    SALES_REP
WHERE   SLS_REP_FNAME = '&slsF'
AND     SLS_REP_LNAME = '&slsL'
AND     SLS_REP_PHONE = '&slsP';


SET VERIFY ON
SET HEADING ON
SET PAGESIZE 500
SET LINESIZE 140

SPOOL OFF


