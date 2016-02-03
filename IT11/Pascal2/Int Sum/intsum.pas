Program IntSum (input, output);

uses wincrt;

Var Int1, Int2, Sum, Avg, I : longint;

begin

   Sum =: 0;

   {Get Input}
   write('Starting Integer: ');
   readln(Int1);
   clrscr;

   write('Ending Integer: ');
   readln(Int2);
   clrscr;

   writeln('Sum:');

   {For Loop}
   For I := Int1 to Int2 do
      begin
         Sum := Sum + I;
      end;
   writeln('   For Loop: ', Sum);

   {Reset}
   I   := Int1;
   Sum := 0;

   {While Loop}
   While I <= Int2 do
      begin
         Sum := Sum + I;
         I   := I + 1;
      end;
   writeln('   While Loop: ', Sum);

   {Reset}
   I    := Int1;
   Sum  := 0;

   {Repeat Until Loop}
   Repeat
      Sum := Sum + I;
      I   := I + 1;
   Until I > Int2;
   writeln('   Repeat-Until Loop: ', Sum);

   {Avg}
   Avg := Sum Div (Int2 - Int1);
   writeln;
   writeln('Average: ', Avg);

   {End Program}
   readln;
   donewincrt;

end.

{IntSum}
{Kaleb Haslam}