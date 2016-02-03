program Grade(input, output);

uses wincrt;

Var AvgGrade : real;

begin

   {Get Grade}
   writeln('Grade Average(%): ');
   readln(AvgGrade);
   clrscr;

   {Output}
   If (AvgGrade > 90) Then
      begin
         writeln('High Honours');
      end;

   If (AvgGrade > 80) and (AvgGrade <= 90) Then
      begin
         writeln('Honours');
      end;

   If (AvgGrade >= 60) and (AvgGrade <= 80) Then
      begin
         writeln('Acceptable');
      end;

   If (AvgGrade < 60) Then
      begin
         writeln('Failing');
      end;

     { begin
         writeln('Failing');
      end;}

   {End Program}
   readln;
   donewincrt;

end.

{Grade}
{Kaleb}











