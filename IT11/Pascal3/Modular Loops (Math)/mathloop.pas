Program ModularLoops(Input, Output);
uses wincrt;

Var I : Integer;
procedure Math(Num : real);
   var Square, Cube, FourthRoot : real;
   begin
       Square := sqr(Num);
       Cube := Square * Num;
       FourthRoot := sqrt(sqrt(Num));
       writeln(Num:1:0, Square:14:1, Cube:13:1, FourthRoot:14:1);
   end;

begin
   writeln('Number     Square     Cube     Forth Root');

   for I := 0 to 20 do
       begin
          Math(I);
       end;

   {End Program}
   readln;
   donewincrt;

end.

{Modular Loops}
{Kaleb Haslam}