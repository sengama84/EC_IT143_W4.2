/* 
EC_IT143_6.3_fwf_s3_se.sql
Author: Sakul Engama
Purpose: Fun with Functions – Step 3
*/

SELECT 
    ContactName,
    LEFT(ContactName, CHARINDEX(' ', ContactName) - 1) AS FirstName
FROM dbo.t_w3_schools_customers;
