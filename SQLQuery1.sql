SELECT 
    TeamID,
    SUM(Salary) AS TotalTeamSalary
FROM dbo.Players
GROUP BY TeamID;
