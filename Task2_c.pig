A = LOAD'/home/acadgild/employee_details.txt' USING PigStorage(',')  as (EmpID:Int,Name:Chararray,Salary:Int,Rating:Int);
B = LOAD'/home/acadgild/employee_expenses.txt'  as (EmpID:Int,Expense:Int);
C = GROUP B By EmpID;
D = FOREACH C generate group as EmpID , SUM(B.Expense) as Expense;
E = JOIN A By EmpID, D By EmpID;
F = ORDER E By Expense DESC,Name;
G = LIMIT F 1;
H = FOREACH G generate A::EmpID,A::Name;
dump H;


