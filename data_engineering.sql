-- drop if exists
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

-- the mitochondria is the power house of the cell
-- create dept table
CREATE TABLE "departments" (
"dept_no" VARCHAR   NOT NULL,
"dept_name" VARCHAR   NOT NULL,
CONSTRAINT "pk_departments" PRIMARY KEY ("dept_no"));

-- create dept_emp table
CREATE TABLE "dept_emp" (
"emp_no" INT   NOT NULL,
"dept_no" VARCHAR   NOT NULL,
"from_date" DATE   NOT NULL,
"to_date" DATE   NOT NULL);

-- create dept_manager table
CREATE TABLE "dept_manager" (
"emp_no" INT   NOT NULL,
"dept_no" VARCHAR   NOT NULL,
"from_date" DATE   NOT NULL,
"to_date" DATE   NOT NULL);

-- create employees table
CREATE TABLE "employees" (
"emp_no" INT   NOT NULL,
"birth_date" DATE   NOT NULL,
"first_name" VARCHAR   NOT NULL,
"last_name" VARCHAR   NOT NULL,
"gender" VARCHAR   NOT NULL,
"hire_date" DATE   NOT NULL,
CONSTRAINT "pk_employees" PRIMARY KEY ("emp_no"));

-- create salaries table
CREATE TABLE "salaries" (
"emp_no" INT   NOT NULL,
"salary" INT   NOT NULL,
"from_date" DATE   NOT NULL,
"to_date" DATE   NOT NULL);

-- create titles table
CREATE TABLE "titles" (
"emp_no" INT   NOT NULL,
"title" VARCHAR   NOT NULL,
"from_date" DATE   NOT NULL,
"to_date" DATE   NOT NULL);

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");