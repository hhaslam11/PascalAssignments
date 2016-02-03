program array2d(Input, Output);
uses wincrt;

type IntArray = array[1..3, 1..3, 1..3] of integer;

var InputArray : IntArray;
    X, Y, Z, Sum  : integer;
begin

   {Get Input}
   writeln('Enter 27 numbers');
   for X := 1 to 3 do
      begin
         for Y  := 1 to 3 do
            begin
               for Z := 1 to 3 do
                  begin
                     read(InputArray[X, Y, Z]);
                     Sum := Sum + InputArray[X, Y, Z];
                  end{For Z}
            end;{For Y}
      end;{For X}
   readln;

   {Print in order}
   for X := 1 to 3 do
      begin
         for Y  := 1 to 3 do
            begin
               for Z := 1 to 3 do
                  begin
                     writeln(InputArray[X, Y, Z]);
                     Sum := Sum + InputArray[X, Y, Z];
                  end{For Z}
            end;{For Y}
      end;{For X}
   readln;

   {Print Avg}
   writeln((Sum / 27):1:1);


   readln;
   donewincrt;

end.

{2D Array}
{Kaleb Haslam}