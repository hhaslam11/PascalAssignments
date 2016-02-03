program Frequency2(Input, Output);
uses wincrt;

const MAX = 25;{Change to 25}
type CharArray = array[1..MAX] of integer;
     RealArray = array[0..9]   of real;
     IntArray  = array[0..9]   of integer;

var  Nums      : CharArray;
     Count     : IntArray;
     Frequency : RealArray;
     I         : integer;
begin

   {Get Input}
   for I := 1 to MAX do
      begin
         repeat

            writeln('Enter a character between 0 and 9 (', I, ')');
            readln(Nums[I]);
            clrscr;

            {If wrong input}
            if (Nums[I] < 0) or (Nums[I] > 9) then
              begin
                writeln('Please enter a character between 0 and 9');
                writeln('Press enter to continue');
                readln;
                clrscr;
              end;{If}

         until((Nums[I] >= 0) and (Nums[I] <= 9));
      end;{For}

   {Count & calulate percent}
   for I := 0 to 9 do
      Count[I] := 0;

   for I := 1 to MAX do
      Count[Nums[I]] := Count[Nums[I]] + 1;

   for I := 0 to 9 do
      Frequency[I] := Count[I] / MAX;

   {Output}
   writeln('Number','Count':10,'Frequency':15);

   for I := 1 to 9 do
     writeln(I, Count[I]:10, Frequency[I] * 100:15:2, '%');

   {End Program}
   readln;
   donewincrt;

end.{Main}

{Frequency}
{Kaleb Haslam}