program LoopAsterisk(Input, Output);
uses wincrt;

var I, X : integer;

begin

  for I := 1 to 8 do
      begin
         for X := 1 to I do
            write('*');
         writeln;
      end; {For I}

end.

{Loop Asterisk}
{Kaleb Haslam}