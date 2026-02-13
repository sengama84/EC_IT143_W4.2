/* 
EC_IT143_6.3_fwf_s7_se.sql
Author: Sakul Engama
Purpose: Fun with Functions – Step 7
*/

WITH TestCTE AS (
    SELECT 
        ContactName,
        LEFT(ContactName, CHARINDEX(' ', ContactName) - 1) AS AdHocFirstName,
        dbo.fn_GetFirstName(ContactName) AS FunctionFirstName
    FROM dbo.t_w3_schools_customers
)
SELECT *
FROM TestCTE
WHERE AdHocFirstName <> FunctionFirstName;
