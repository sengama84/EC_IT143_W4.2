/* 
EC_IT143_6.3_fwf_s5_se.sql
Author: Sakul Engama
Purpose: Fun with Functions – Step 5
*/

CREATE FUNCTION dbo.fn_GetFirstName
(
    @FullName NVARCHAR(100)
)
RETURNS NVARCHAR(50)
AS
BEGIN
    RETURN LEFT(@FullName, CHARINDEX(' ', @FullName) - 1);
END;
