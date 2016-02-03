program MPG(Input, Output);
uses wincrt;

const MAX     = 100;
      SENITAL = -1;
type IntArray = array[1..MAX] of integer;
     RealArray = array[1..MAX] of real;
var Gallons, Miles : IntArray;
    MilesPerGallon : RealArray;
    I, Input1, Input2, Days : integer;
    Done : Boolean;

begin

   I := 1;
   Done := false;

   {Get input}
   while Done = false do
      begin
         clrscr;
         writeln('Enter gallons taken, and miles driven for day ', I);
         writeln('Enter ', SENITAL:3,SENITAL:3, ' to stop');
         read(Input1, Input2);
         if Input1 <> -1 then
            begin
               {Assigns to arrays}
               Gallons[I]        := Input1;
               Miles[I]          := Input2;
               MilesPerGallon[I] := Input2 / Input1;
               I := I + 1;
            end
              else Done := true;
      end; {While Done is false}

   readln;
   Days := I - 1;

   {Output}
   writeln('Gallons Taken     Miles Driven     MPG');
   for I := 1 to Days do
      begin
         writeln(Gallons[I]:5, Miles[I]:20, MilesPerGallon[I]:13:2);
      end;

   {End Program}
   readln;
   donewincrt;

end.

{Miles Per Gallon}
{Kaleb Haslam}