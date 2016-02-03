program GradeBook(Input, Output);
uses wincrt;

const MAX = 2;{Students}
      ASSIGNMENTS = 2;

type StringArray     = Array[1..MAX] of String;
     GradeArray      = Array[1..ASSIGNMENTS] of integer;
     AssignmentArray = Array[1..MAX, 1..ASSIGNMENTS] of real;
     AverageArray    = Array[1..MAX] of real;

var Name            : StringArray;
    Class           : StringArray;
    MaxGrade        : GradeArray;
    StudentGrade, StudentPercentage    : AssignmentArray;
    Average         : AverageArray;
    Student, Assign, TotalPossibleMark : integer;
    Temp            : real;

begin

   {Get names}
   for Student := 1 to MAX do
      begin
         clrscr;
         writeln('Enter the name for student #', Student);
         readln(Name[Student]);
      end;

   {Get Assignment MaxGrade}
   TotalPossibleMark := 0;
   for Assign := 1 to ASSIGNMENTS do
      begin
         clrscr;
         writeln('Enter the max mark for assignment #', Assign);
         readln(MaxGrade[Assign]);
         TotalPossibleMark := totalPossibleMark + MaxGrade[Assign];
      end;

   {Get Student Marks}
   for Student := 1 to MAX do
      begin
         Temp := 0;
         for Assign := 1 to ASSIGNMENTS do
            begin
               clrscr;
               writeln('Enter the mark ', Name[Student], ' got on assignment ', Assign, ' (Out of ', MaxGrade[Assign], ')');
               readln(StudentGrade[Student, Assign]);
               StudentPercentage[Student,Assign] := StudentGrade[Student,Assign]/MaxGrade[Assign] * 100;
               Temp := Temp + StudentGrade[Student,Assign];
            end;
         Average[Student] := Temp / TotalPossibleMark * 100;
      end;


   {Output}
   clrscr;
   For Student := 1 to MAX do
     begin
       writeln('Marks for ',Name[Student]);
       writeln('Assignment','Grade':15,'Out Of':10,'Percent':10);
       For Assign := 1 to ASSIGNMENTS do
          begin
            write('Assign ',Assign,StudentGrade[Student,Assign]:10:1,MaxGrade[Assign]:10);
            writeln(StudentPercentage[Student,Assign]:10:1);
          end;  {For Assign}
       writeln('Average:',Average[Student]:45:1,'%');
     end; {For Student}



   readln;
   donewincrt;
end.

{Grade Book}
{Kaleb Haslam}