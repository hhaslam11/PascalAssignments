program BubbleSort(Input, Output);
uses wincrt;

const MAX = 5;
type StringArray = Array[1..MAX] of String;
var Names : StringArray;
    I     : integer;

Procedure Swap(var X, Y : String);
   var Temp : String;
   begin
      Temp := X;
      X    := Y;
      Y    := Temp;
   end;{Swap}

Procedure BSort(Start, Finish : integer;
                     Var Sort : StringArray);
   var X        : integer;
       Switched : boolean;
   begin
      repeat
         Switched := false;
         for X := Start to Finish - 1 do
            begin
               if Sort[X] > Sort[X + 1] then
                  begin
                     Swap(Sort[X], Sort[X + 1]);
                     Switched := true;
                  end;{If loop}
            end;{For loop}
         Until Switched = false{repeat..until loop}
   end;{BSort}

begin

   {Get Names & Store in array}
   writeln('Enter ', MAX, ' names:');
   for I := 1 to MAX do
      begin
         readln(Names[I]);
      end;{For Loop}

   {Sort}
   BSort(1, MAX, Names);

   {Output}
   clrscr;
   for I := 1 to MAX do
      begin
         writeln(Names[I]);
      end;{For loop}

   {End Program}
   readln;
   donewincrt;

end.{Main}

{Bubble sort}
{Kaleb Haslam}