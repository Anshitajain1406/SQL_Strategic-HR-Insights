use employees ;

select * FROM employees
WHERE first_name = "Kellie" AND gender = "F" ;


SELECT * FROM employees
WHERE last_name = "Denis" AND (gender= "M" or gender = "F");
SELECT * FROM employees 
WHERE gender = "F" AND (first_name = "Aruna" OR first_name = "Kellie ");

SELECT * FROM employees
WHERE first_name IN ("Denis", "Elvis");

SELECT * FROM employees
where first_name  = "Denis" or "Elvis";


SELECT * FROM employees
WHERE first_name NOT IN ('John', 'Mark','Jacob');

SELECT * FROM employees
WHERE first_name LIKE ("Mar__");

SELECT * FROM employees
WHERE hire_date LIKE ("2000%");

SELECT

    *

FROM

    employees

WHERE

    hire_date LIKE ('%2000%');

SELECT * FROM employees
WHERE emp_no LIKE ("1000_");

SELECT * from salaries
WHERE salary BETWEEN "66000" AND "70000";

SELECT * FROM employees
WHERE emp_no NOT BETWEEN "10004" AND "10012";


SELECT * FROM departments
WHERE dept_no BETWEEN "d003" AND "d006";


SELECT * FROM departments
WHERE dept_no IS NOT NULL ;

SELECT * FROM employees
WHERE hire_date < "1985-02-01";

SELECT * FROM employees
WHERE gender="F" AND hire_date >= "2000-01-01";

SELECT emp_no,salary  FROM salaries
where salary > "150000";

SELECT DISTINCT hire_date from employees;
SELECT distinct COUNT(emp_no) from employees ;


SELECT COUNT(salary >= 100000 ) from salaries ;

SELECT COUNT(*) from dept_manager;

SELECT * FROM employees 
ORDER BY first_name DESC ;


SELECT * FROM employees
ORDER BY hire_date DESC 
LIMIT 1 ;

SELECT gender , COUNT(gender)
from employees 
GROUP BY gender ; 

SELECT salary, COUNT(salary) as no_of_emp 
from salaries 
WHERE salary > 80000 
GROUP BY salary
ORDER BY salary ASC ;

SELECT * FROM salaries ;

SELECT
    emp_no, AVG(salary)
FROM
salaries
GROUP BY emp_no
HAVING salary> 120000
ORDER BY emp_no ;

SELECT emp_no , AVG(salary) 
from salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000
ORDER BY emp_no ;

SELECT * FROM salaries 
ORDER BY salary DESC 
LIMIT 10 ;


SELECT * FROM salaries
where salary > 100000
LIMIT 10 ;

INSERT INTO departments (dept_no,dept_name)
VALUES ("232", "DMT");
SELECT * FROM departments ; 

DELETE FROM departments where dept_no ="232";

SELECT * FROM titles 
LIMIT 10 ;

INSERT INTO employees

VALUES

(

    999903,

    '1977-09-14',

    'Johnathan',

    'Creek',

    'M',

    '1999-01-01'

);

INSERT INTO titles (emp_no,title,from_date)
VALUES ("999903","Senior Engineer","1997-10-01");

SELECT

    *

FROM

    titles

ORDER BY emp_no DESC;

SELECT * FROM departments ;
INSERT INTO departments VALUES ("d010", "Business Analysis");
SELECT * FROM departments ; 

/*UPDATE*/

SELECT * FROM departments ;

UPDATE departments
SET 
    dept_no = "d200",
	dept_name = ("BA")
WHERE dept_no = "d010";

select  * FROM dept_emp ;

select count(distinct dept_no) 
from dept_emp ;


select * from salaries ;

SELECT sum(salary)
from salaries 
WHERE from_date > "1997-01-01" ;  /*put date in " " */ 

select min(emp_no) from employees ;
select max(emp_no) from employees ;

SELECT AVG(salary) from salaries 
where from_date > "1997-01-01";

/* Round Function */
SELECT ROUND(avg(salary),2)
FROM salaries 
where from_date > "1997-01-01";


CREATE TABLE departments_dup

(

    dept_no CHAR(4) NULL,

    dept_name VARCHAR(40) NULL

);

 
INSERT INTO departments_dup (dept_no,dept_name) 
SELECT * FROM departments ;
SELECT * from departments_dup;

INSERT INTO departments_dup (dept_name)

VALUES ('Public Relations');
DELETE FROM departments_dup

WHERE

    dept_no = 'd002'; 
INSERT INTO departments_dup(dept_no) VALUES ('d010'), ('d011');


DROP TABLE IF EXISTS dept_manager_dup;

CREATE TABLE dept_manager_dup (

  emp_no int(11) NOT NULL,

  dept_no char(4) NULL,

  from_date date NOT NULL,

  to_date date NULL

  );

 

INSERT INTO dept_manager_dup

select * from dept_manager;

 

INSERT INTO dept_manager_dup (emp_no, from_date)

VALUES                (999904, '2017-01-01'),

                                (999905, '2017-01-01'),

                               (999906, '2017-01-01'),

                               (999907, '2017-01-01');

 

DELETE FROM dept_manager_dup

WHERE

    dept_no = 'd001';
    
    SELECT * from dept_manager_dup ;
    SELECT * FROM departments_dup 
    order by dept_no asc;
    
    delete from departments_dup
    where dept_no = "d200";
    
    
SELECT E.emp_no,E.first_name,E.last_name,M.dept_no,E.hire_date 
FROM employees as E
INNER JOIN dept_manager as M ON E.emp_no = M.emp_no ;


SELECT

    e.emp_no,  

    e.first_name,  

    e.last_name,  

    dm.dept_no,  

    dm.from_date  

FROM  

    employees e  

        LEFT JOIN   

   

dept_manager dm ON e.emp_no = dm.emp_no  

WHERE  

    e.last_name = 'Markovitch'  

ORDER BY dm.dept_no DESC, e.emp_no;


SELECT

    e.emp_no,  

    e.first_name,  

    e.last_name,  

    dm.dept_no,  

    dm.from_date  

FROM  

    employees e  

        LEFT JOIN   

   

dept_manager dm ON e.emp_no = dm.emp_no  

WHERE  

    e.last_name = 'Markovitch'  
    ORDER BY dm.dept_no DESC, e.emp_no;
    
SELECT 
    E.gender, ROUND(AVG(S.salary), 2) as Average_salary
FROM
    employees AS E
        JOIN
    salaries AS S ON E.emp_no = S.emp_no
GROUP BY gender;



SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    dm.from_date,
    d.dept_name
FROM
    employees AS e
        JOIN
    dept_manager AS dm ON e.emp_no = dm.emp_no
        JOIN
    departments AS d ON dm.dept_no = d.dept_no;
    
    SELECT d.dept_name,AVG(s.salary)
    from departments as d
    join dept_manager as dm on d.dept_no = dm.dept_no 
    join salaries as s on s.emp_no = dm.emp_no 
    GROUP BY d.dept_name ;


DELETE FROM departments 
WHERE dept_no = "d200";


#incorrect 
SELECT e.first_name,e.last_name from employees as e
WHERE hire_date IN (select dm.from_date from dept_manager as dm where from_date between "1990-01-01" and "1995-01-01");



SELECT

    *

FROM

    dept_manager

WHERE

    emp_no IN (SELECT

            emp_no

        FROM

            employees

        WHERE

            birth_date='1955-01-01');
            
Select emp_no,dept_no,from_date from dept_manager where emp_no IN 
(select emp_no from employees where birth_date >= "1955-01-01");

select emp_no from employees where birth_date = "1955-01-01";



SELECT * FROM employees e where exists (select * FROM titles t where t.emp_no = e.emp_no

                AND  title = "Assistant Engineer");
                
                
 SELECT COUNT(emp_no) from titles where title = "Assistant Engineer" ;
 
SELECT 
    *
FROM
    dept_emp;
    
    
    
    
-- SUBQUERY--    
SELECT A.*
FROM  
(SELECT 
    e.emp_no AS employees_id,
    MIN(dept_no) AS departmrnt_code,
    (SELECT 
            emp_no
        FROM
            dept_manager
        WHERE
            emp_no = '110022') AS manager_id
FROM
    employees e
        JOIN
    dept_emp de ON e.emp_no = de.emp_no
    where e.emp_no <= 10020
    group by e.emp_no
    order by e.emp_no ) AS A 
  UNION  
SELECT B.*
FROM     
(SELECT e.emp_no as emp_id,
     MIN(dept_no) AS departmrnt_code,
(SELECT emp_no FROM dept_manager 
WHERE emp_no = "110039") as manager_id
from employees e join dept_emp de ON e.emp_no =de.emp_no
where e.emp_no >10020 
group by e.emp_no
order by e.emp_no
limit 20) as B;
   
    -- excercise 213 -- 
    DROP TABLE IF EXISTS emp_manager;

CREATE TABLE emp_manager (

   emp_no INT(11) NOT NULL,

   dept_no CHAR(4) NULL,

   manager_no INT(11) NOT NULL

);

INSERT INTO emp_manager
SELECT 
    u.*
FROM
    (SELECT 
        a.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS a UNION SELECT 
        b.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no > 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no
    LIMIT 20) AS b UNION SELECT 
        c.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110022
    GROUP BY e.emp_no) AS c UNION SELECT 
        d.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110039
    GROUP BY e.emp_no) AS d) as u;
    
    SELECT * FROM emp_manager ;
    
    -- VIEWS --  
    CREATE OR REPLACE VIEW v_manager_avg_salary AS
    SELECT ROUND(AVG(salary),2) FROM salaries s 
    JOIN  dept_manager dp ON s.emp_no = dp.emp_no ;
    
    
   DELIMITER $$
   
   CREATE PROCEDURE daily_data()
   BEGIN 
   SELECT * FROM employees 
   LIMIT 1000;
   END $$ 
   DELIMITER ;
   
   call daily_data() ;
   
 DELIMITER $$
 
 CREATE PROCEDURE avg_salary()
 BEGIN 
SELECT AVG(salary) from salaries ;
END $$
DELIMITER ;

    select * from employees ;
    
    
    
    
    DELIMITER $$

CREATE PROCEDURE emp_info_solution(in p_first_name varchar(255), in p_last_name varchar(255), out p_emp_no integer)

BEGIN

                SELECT

                                e.emp_no

                INTO p_emp_no FROM

                                employees e

                WHERE

                                e.first_name = p_first_name

                                                AND e.last_name = p_last_name;

END$$

DELIMITER ;