program Dice(Input, Output);

uses wincrt;
type IntArray = Array[0..12] of integer;
var I, Temp   : integer;
    Num       : IntArray;

begin

   Randomize;

   {Get Numbers}
   for I := 1 to 500 do
      begin
         Temp := Random(13);
         Num[Temp] := Num[Temp] + 1;
      end;

   {Display Results}
   writeln('Points     Occurrences');
   for I := 2 to 12 do
      begin
         writeln(I:3, Num[I]:14);
      end;
   readln;
   donewincrt;

end.

{Dice}
{Kaleb Haslam}