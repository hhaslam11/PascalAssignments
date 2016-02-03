program NumTable(Input, Output);

uses wincrt;
type IntArray = Array[0..9] of integer;
var I, Temp   : integer;
    Num       : IntArray;

begin

   Randomize;

   {Get Numbers}
   for I := 1 to 500 do
      begin
         Temp := Random(10);
         Num[Temp] := Num[Temp] + 1;
      end;

   {Display Results}
   writeln('Number     Occurrences');
   for I := 1 to 9 do
      begin
         writeln(I:3, Num[I]:14);
      end;
   readln;
   donewincrt;

end.

{Num Table}
{Kaleb Haslam}