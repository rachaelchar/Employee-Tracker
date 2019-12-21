DROP DATABASE IF EXISTS employee_tracker;
CREATE DATABASE employee_tracker;
USE employee_tracker;

CREATE TABLE departments(
	id INTEGER AUTO_INCREMENT, 
	dep_name VARCHAR(30) NOT NULL UNIQUE,
	PRIMARY KEY(id)
);

INSERT INTO departments (dep_name) VALUES 
	("Sales"),
   ("Engineering"),
   ("Finance"),
   ("Legal")
;

CREATE TABLE roles(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(30) NOT NULL UNIQUE,
	salary DECIMAL,
	department_id INTEGER NOT NULL,
	CONSTRAINT fk_department_id FOREIGN KEY (department_id) REFERENCES departments(id)
);

INSERT INTO roles (title, department_id, salary) VALUES 
	("Sales Lead", 1, 100000),
   ("Salesperson", 1, 80000),
   ("Software Engineer", 2, 120000),
   ("Accountant", 3, 125000),
   ("Lead Engineer", 2, 150000),
	("Lawyer", 4, 190000),
	("Legal Team Lead", 4, 250000)
;

CREATE TABLE employees(
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    role_id INTEGER NOT NULL,
    CONSTRAINT fk_role_id FOREIGN KEY (role_id) REFERENCES roles(id),
    manager_id INTEGER NULL,
    CONSTRAINT fk_manager_id FOREIGN KEY (manager_id) REFERENCES employees(id)
);

-- Insert Managers
INSERT INTO employees (first_name, last_name, role_id, manager_id) VALUES
	("Bob", "Saget", 3, NULL),
	("Mike", "Wazowski", 1, NULL),
	("Elle", "Woods", 4, NULL),
	("Jimmy", "Neutron", 2, NULL)
;

-- Insert Employees
INSERT INTO employees (first_name, last_name, role_id, manager_id) VALUES
	("Thor", "Odinson", 2, 2),
	("Carol", "Danvers", 6, 3),
	("Tony", "Stark", 5, 4),
	("Wanda", "Maximoff", 4, 4),
	("Natasha", "Romanoff", 1, 2),
	("Steve", "Rogers", 7, 1),
	("Bucky", "Barnes", 3, 1)
;

-- Join tables
SELECT 
		employees.id as employee_id, employees.first_name, employees.last_name, title, salary, dep_name, CONCAT(manager_name.first_name, " ", manager_name.last_name) as manager_name
FROM 
	employees
LEFT JOIN
	roles
ON 
	(employees.role_id = roles.id)
LEFT JOIN
	departments
ON
	(roles.department_id = departments.id)
LEFT JOIN
	employees manager_name
ON
	(manager_name.id = employees.manager_id);