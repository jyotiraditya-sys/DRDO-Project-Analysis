create database DRDO;
Use DRDO;

CREATE TABLE DRDO_Projects (
Project_ID VARCHAR(255),
Project_Name VARCHAR(255),
Category VARCHAR(255),
Budget INT,
Status VARCHAR(255),
Completion_Percentage FLOAT,
Lab_Location VARCHAR(255),
Start_date VARCHAR(255),
Risk_Level VARCHAR(255),
Priority VARCHAR(255)
);

drop table DRDO_Projects;

-- Q1. Display all columns and all records from the table.
SELECT * FROM DRDO_Projects;

-- Q2. List only the names and budgets of all projects.
SELECT Project_Name, Budget FROM DRDO_Projects;

-- Q3. Find all projects that belong to the 'Missiles' category.
SELECT * FROM DRDO_Projects 
WHERE Category = 'Missiles';

-- Q4. Show all projects sorted by Budget from highest to lowest.
SELECT * FROM DRDO_Projects 
ORDER BY Budget DESC;

-- Q5. Find projects where the Risk Level is 'High'.
SELECT * FROM DRDO_Projects 
WHERE Risk_Level = 'High';

-- Q6. Count the total number of projects in the table.
SELECT COUNT(*) AS Total_Projects FROM DRDO_Projects;

-- Q7. Find the average Completion Percentage of all projects.
SELECT AVG(Completion_Percentage) AS Average_Completion 
FROM DRDO_Projects;

-- Q8. Find projects that are 'Ongoing' and have 'Strategic' priority.
SELECT * FROM DRDO_Projects 
WHERE Status = 'Ongoing' AND Priority = 'Strategic';

-- Q9. Show the total budget spent on each category.
SELECT Category, SUM(Budget) AS Total_Budget 
FROM DRDO_Projects 
GROUP BY Category;

-- Q10. Search for projects whose name starts with 'Agni'.
SELECT * FROM DRDO_Projects 
WHERE Project_Name LIKE 'Agni%';

-- Q11. Find categories where the average budget is more than 3000.
SELECT Category, AVG(Budget) 
FROM DRDO_Projects 
GROUP BY Category 
HAVING AVG(Budget) > 3000;

-- Q12. Create a report showing Project Name and a 'Budget_Type' (High if > 5000, else Low).
SELECT Project_Name, Budget,
CASE 
    WHEN Budget > 5000 THEN 'High Budget'
    ELSE 'Normal Budget'
END AS Budget_Type
FROM DRDO_Projects;

-- Q13. Find the Lab Location that has the maximum number of projects.
SELECT Lab_Location, COUNT(*) AS Project_Count 
FROM DRDO_Projects 
GROUP BY Lab_Location 
ORDER BY Project_Count DESC 
LIMIT 1;

-- Q14. Find all projects that have a budget higher than the overall average budget.
SELECT Project_Name, Budget 
FROM DRDO_Projects 
WHERE Budget > (SELECT AVG(Budget) FROM DRDO_Projects);

-- Q15. List the Top 3 most expensive projects in the 'Aeronautics' category.
SELECT * FROM DRDO_Projects 
WHERE Category = 'Aeronautics' 
ORDER BY Budget DESC 
LIMIT 3;