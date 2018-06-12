A = LOAD'/home/acadgild/employee_details.txt' USING PigStorage(',') as 	(EmpID:Int,Name:Chararray,Salary:Int,Rating:Int);
B = ORDER A BY Salary DESC,Name;
C = FILTER B BY EmpID%2==1;
D = LIMIT C 3;
E = FOREACH D generate EmpID,Name;
dump E;
