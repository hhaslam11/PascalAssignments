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

   {Assignments}
   write('                ');
   for Assign := 1 to ASSIGNMENTS do
      begin
         write('Assign ', Assign, '   ');
      end;
   writeln;

   {Max Grade}
   write('                ');
   for Assign := 1 to ASSIGNMENTS do
      begin
         write(MaxGrade[Assign], '           ');
      end;
   writeln;

   {Student Grade}
   for Student := 1 to MAX do
      begin
         write(Name[Student]);
         for Assign := 1 to ASSIGNMENTS do
            begin
               if Assign = 1 then write(StudentGrade[Student, Assign]:20 - length(Name[Student]):1)
                  else write(StudentGrade[Student, Assign]:13:1);;
            end;
         write('   Avg. ', Average[Student]:8:1, '%');
         writeln;
      end;

   readln;
   donewincrt;
end.

{Grade Book}
{Kaleb Haslam}