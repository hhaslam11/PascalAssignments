program ArraySum(Input, Output);

uses wincrt;

const MAX = 10;
type SumArray = array[1..MAX] of integer;
var I, Sum : integer;
    Input  : SumArray;

begin

   {Get input from user & store in array}
   writeln('Please enter ', MAX, ' numbers.');
   for I := 1 to MAX do
      begin
         read(Input[I]);
      end;
   readln;

   {Add up all numbers in the array}
   Sum := 0;
   for I := 1 to MAX do
      begin
         Sum := Sum + Input[I];
      end;

   {Display all numbers in the array}
   clrscr;
   for I := 1 to MAX do
      begin
         write(Input[I], ' ');
      end;

   {Display Sum of all the numbers}
   writeln;
   writeln('Sum: ', Sum);
   readln;

   donewincrt;

end.

{Array Sum}
{Kaleb Haslam}