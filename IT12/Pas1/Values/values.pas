program Values(Input, Output);
uses wincrt;

var I, NumStart, NumEnd : integer;

begin

   {Get input}
   writeln('Enter the starting and ending values');
   read(NumStart, NumEnd);
   clrscr;

   {Output}
   writeln('X     X Squared     X Cubed');

   for I := NumStart to NumEnd do
      begin
         writeln(I, sqr(I):10, (sqr(I) * I):13);
      end;{For}

end.{Main}

{Values (pascal 1-3)}
{Kaleb Haslam}