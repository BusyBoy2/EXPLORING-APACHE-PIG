A = LOAD'/home/acadgild/employee_details.txt' USING PigStorage(',')  as (EmpID:Int,Name:Chararray,Salary:Int,Rating:Int);
B = LOAD'/home/acadgild/employee_expenses.txt'  as (EmpID:Int,Expense:Int);
C = JOIN A BY EmpID, B BY EmpID;
D = FOREACH (GROUP C BY A::EmpID) {
	E = C.(A::EmpID,A::Name);
	F = DISTINCT E;
	GENERATE FLATTEN(F);
	};
dump D;
