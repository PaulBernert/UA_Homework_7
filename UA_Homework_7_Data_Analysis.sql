-- DATA ANALYSIS -- 

-- List the following details of each employee: --
-- employee number, last name, first name, gender, and salary --
SELECT EMPLOYEES.employee_number,
	EMPLOYEES.employee_lastname,
	EMPLOYEES.employee_firstname,
	EMPLOYEES.employee_gender,
	SALARIES.employee_salary
FROM EMPLOYEES
INNER JOIN SALARIES
ON SALARIES.employee_number = EMPLOYEES.employee_number;

-- List employees who were hired in 1986 --
SELECT EMPLOYEES.employee_number,
	EMPLOYEES.employee_lastname,
	EMPLOYEES.employee_firstname,
	EMPLOYEES.employee_gender,
	EMPLOYEES.employee_hiredate
FROM EMPLOYEES
INNER JOIN SALARIES
ON SALARIES.employee_number = EMPLOYEES.employee_number
WHERE EMPLOYEES.employee_hiredate LIKE '1986%';

-- List the manager of each department with the following information: --
-- department number, department name, the manager's employee number, --
-- last name, first name, and start and end employment dates --
SELECT DISTINCT DEPARTMENT_MANAGERS.department_number,
	DEPARTMENTS.department_name,
	DEPARTMENT_MANAGERS.employee_number,
	EMPLOYEES.employee_lastname,
	EMPLOYEES.employee_firstname,
	DEPARTMENT_MANAGERS.from_date,
	DEPARTMENT_MANAGERS.to_date
FROM EMPLOYEES
INNER JOIN DEPARTMENT_MANAGERS
ON EMPLOYEES.employee_number = DEPARTMENT_MANAGERS.employee_number
INNER JOIN DEPARTMENTS
ON DEPARTMENT_MANAGERS.department_number = DEPARTMENTS.department_number
ORDER BY employee_number;

-- List the department of each employee with the following information: --
-- employee number, last name, first name, and department name --
SELECT DISTINCT DEPARTMENT_EMPLOYEES.employee_number,
	EMPLOYEES.employee_firstname,
	EMPLOYEES.employee_lastname,
	DEPARTMENTS.department_name  
FROM DEPARTMENT_EMPLOYEES
JOIN EMPLOYEES
ON DEPARTMENT_EMPLOYEES.employee_number = EMPLOYEES.employee_number
JOIN DEPARTMENTS
ON  DEPARTMENT_EMPLOYEES.department_number = DEPARTMENTS.department_number
ORDER BY employee_number;

-- List all employees whose first name is "Hercules" and last names begin with "B."
SELECT EMPLOYEES.employee_lastname,
	EMPLOYEES.employee_firstname
FROM EMPLOYEES
WHERE EMPLOYEES.employee_firstname LIKE 'Hercules' 
AND EMPLOYEES.employee_lastname LIKE 'B%';

-- List all employees in the Sales department, including their: --
-- employee number, last name, first name, and department name --
SELECT DISTINCT EMPLOYEES.employee_number,
	EMPLOYEES.employee_lastname,
	EMPLOYEES.employee_firstname,
	DEPARTMENTS.department_name
FROM EMPLOYEES
JOIN DEPARTMENT_EMPLOYEES
ON EMPLOYEES.employee_number = DEPARTMENT_EMPLOYEES.employee_number
JOIN DEPARTMENTS
ON DEPARTMENTS.department_number = DEPARTMENT_EMPLOYEES.department_number
WHERE DEPARTMENTS.department_name = 'Sales'
ORDER BY employee_number;

-- List all employees in the Sales and Development departments, including -- 
-- their employee number, last name, first name, and department name --
SELECT DISTINCT EMPLOYEES.employee_number,
	EMPLOYEES.employee_lastname,
	EMPLOYEES.employee_firstname,
	DEPARTMENTS.department_name
FROM EMPLOYEES
JOIN DEPARTMENT_EMPLOYEES
ON EMPLOYEES.employee_number = DEPARTMENT_EMPLOYEES.employee_number
JOIN DEPARTMENTS
ON DEPARTMENTS.department_number = DEPARTMENT_EMPLOYEES.department_number
WHERE DEPARTMENTS.department_name = 'Sales'
OR DEPARTMENTS.department_name = 'Development'
ORDER BY employee_number;

-- In descending order, list the frequency count of employee last names --
SELECT EMPLOYEES.employee_lastname,
	COUNT(EMPLOYEES.employee_number)
FROM EMPLOYEES
GROUP BY EMPLOYEES.employee_lastname
ORDER BY COUNT(EMPLOYEES.employee_number)
DESC;