program OddEven(Input, Output);

uses wincrt;
type IntArray  = array[1..25] of integer;
var I, OddInts, EvenInts : integer;
    RandomInts, OddArray, EvenArray : IntArray;

{Gets random number between Min & Max}
procedure RandomNum(Min, Max : integer;
                    var RandomNumber : integer);
   begin
      RandomNumber := Random(Max - Min + 1) + Min;
   end;

begin {main}

   Randomize;

   {Keeps track of how much odds or evens the array has}
   OddInts  := 0;
   EvenInts := 0;

   {Get 25 random numbers}
   for I := 1 to 25 do
         RandomNum(0, 99, RandomInts[I]);

   {Find out if its even or odd, then puts it in the right array}
   for I := 1 to 25 do
      begin
         if (RandomInts[I] mod 2 = 0) then
            begin
               {Even}
               EvenInts            := EvenInts + 1;
               EvenArray[EvenInts] := RandomInts[I];
            end
         else
            begin
               {Odd}
               OddInts             := OddInts + 1;
               OddArray[OddInts]   := RandomInts[I];
            end;
      end;

   {Display numbers in Odd Array}
   write('Odd: ');
   for I := 1 to OddInts do
      begin
         write(OddArray[I], ' ');
      end;

   {Display numbers in Even Array}
   writeln;
   write('Even: ');
   for I := 1 to EvenInts do
      begin
         write(EvenArray[I], ' ');
      end;

   {End Program}
   readln;
   donewincrt;

end.

{Odd or Even}
{Kaleb Haslam}