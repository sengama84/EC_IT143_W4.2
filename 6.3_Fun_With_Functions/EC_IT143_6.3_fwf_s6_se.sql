/* 
EC_IT143_6.3_fwf_s6_se.sql
Author: Sakul Engama
Purpose: Fun with Functions – Step 6
*/

SELECT 
    ContactName,
    dbo.fn_GetFirstName(ContactName) AS FirstName
FROM dbo.t_w3_schools_customers;
