A = LOAD'/home/acadgild/employee_details.txt' USING PigStorage(',') as 	(EmpID:Int,Name:Chararray,Salary:Int,Rating:Int);
B = ORDER A BY Rating DESC,Name;
C = LIMIT B 5;
D = FOREACH A generate EmpID,Name;
dump D;

