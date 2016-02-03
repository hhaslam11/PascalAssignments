program ArrayFlip(Input, Output);

uses wincrt;

const MAX = 10;{Change this to change the size of the array}
type IntArray = array[1..MAX] of integer;
var I               : integer;
    Input, Flipped  : IntArray;

begin

   {Get input from user & store in array}
   writeln('Please enter ', MAX, ' numbers.');
   for I := 1 to MAX do
      begin
         read(Input[I]);
      end;
   readln;

   {Adds numbers to new array in reverse}
   for I := MAX downto 1 do
      begin
         Flipped[I] := Input[(MAX - I) + 1];
      end;

   {Display all numbers in the new array}
   clrscr;
   for I := 1 to MAX do
      begin
         write(Flipped[I], ' ');
      end;

   readln;
   donewincrt;

end.

{Array Flip}
{Kaleb Haslam}