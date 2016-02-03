program Math(input, output);

uses wincrt;

Var FirstNum, SecondNum, Loop : integer;
    Square, Cube : integer;
    FourthRoot : real;

begin

   {Get Input}
   write('First Number: ');
   readln(FirstNum);
   clrscr;

   write('Second Number: ');
   readln(SecondNum);
   clrscr;

   {Display Results}
   writeln('Number     Square     Cube     Forth Root');
   writeln;
   Loop := FirstNum;
   While Loop <= SecondNum do
     begin
       Square := sqr(Loop);
       Cube := Square * loop;
       FourthRoot := sqrt(sqrt(Loop));
       writeln(Loop, Square:16, Cube:9, FourthRoot:14:1);
       Loop := Loop + 1;
     end;  {While}

   {End Program}
   readln;
   donewincrt;

end.

{Math}
{Kaleb Haslam}