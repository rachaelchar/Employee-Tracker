const inquirer = require("inquirer");
const mysql = require("mysql");


function promptUser() {
    inquirer
        .prompt({
            type: "list",
            name: "name",
            message: "What would you like to do?",
            choices: [
                "View all departments",
                "View all roles",
                "View all employees",
                "Add a department",
                "Add a role",
                "Add an employee",
                "Update an employee's role",
                "Exit"
            ]
        })
        .then(function (answer) {
            switch (answer.action) {
                case "View all departments":
                    viewDepartments();
                    break;

                case "View all roles":
                    viewRoles();
                    break;

                case "View all employees":
                    viewEmployees();
                    break;

                case "Add a department":
                    addDepartment();
                    break;

                case "Add a role":
                    addRole();
                    break;
                
                case "Add an employee":
                    addEmployee();
                    break;
                
                case "Update an employee's role":
                    updateEmployee();
                    break;
                
                case "Exit":
                    connection.end();
                    break;
            }
        });
}