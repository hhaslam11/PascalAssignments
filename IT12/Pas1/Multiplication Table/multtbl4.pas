program MultTable2(Input, Output);
uses wincrt;

var I, X : integer;

begin

  for I := 2 to 4 do
      begin
         writeln('*************************');
         for X := 1 to I do
            writeln('*                    *');
      end; {For I}
      writeln('*****************');

end.

{Nested Multiplication Table 4}
{Kaleb Haslam}