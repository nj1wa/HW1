20131150 MWANJIWA KAMANGA

QUESTION 1:

CREATE OR REPLACE PROCEDURE swap
  (dep_id  IN employee.department_id%TYPE, man_id IN employee.manager_id%TYPE )
 IS
 BEGIN
  UPDATE department
  SET    manager_id= man_id
  WHERE  department_id = dep_id;
 END swap;


execute swap(100,103);




QUESTION 2:

CREATE OR REPLACE FUNCTION
 takes_dep(dep_id NUMBER)
   RETURN VARCHAR2 IS
   fname system.employees.first_name%type;
   lname system.employees.last_name%type;
BEGIN
  SELECT first_name,last_name
  INTO fname,lname
  FROM system.employees
  WHERE employee_id= (
                       SELECT manager_id
                       FROM system.departments
                       Where department_id=dep_id);
  
  RETURN fname  ||' '|| lname; 
END;

set serveroutput on;
execute dbms_output.put_line(takes_dep(60));
