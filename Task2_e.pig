A = LOAD'/home/acadgild/employee_details.txt' USING PigStorage(',')  as (EmpID:Int,Name:Chararray,Salary:Int,Rating:Int);
B = LOAD'/home/acadgild/employee_expenses.txt' as (EmpID:Int,Expense:Int);
C = JOIN A BY EmpID LEFT OUTER, B BY EmpID;
D = FILTER C BY B::EmpID is null;
E = FOREACH D Generate A::EmpID, A::Name;
dump E;
