program Factorials(Input, Output);
uses wincrt;

var I : integer;
    Num, NumTemp, Total : longInt;

begin
   writeln('What Number would you like to see a factorial table of?');
   readln(Num);

   {Set Vars}
   I       := Num;
   NumTemp := Num;
   Total   := Num;

   clrscr;
   write(I, '! = ', num);

   while I > 1 do
      begin

         NumTemp := NumTemp - 1;
         Total := Total * NumTemp;
         write(' * ', NumTemp);

         I := I - 1;
      end;

   writeln(' = ', Total);

   {End Program}
   readln;
   donewincrt;

end.

{Factorials}
{Kaleb Haslam}