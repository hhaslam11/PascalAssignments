program Table5(input, output);

uses wincrt;

Var I, TableType : Integer;

begin

   {Get TableType}
   writeln('What multiplication-table type would you like?');
   readln(TableType);
   clrscr;

   for I := 0 to 15 do
      begin
         writeln(I, ' x ', TableType, ' = ', I * TableType);
      end;

   {End Program}
   readln;
   donewincrt;

end.

{Multiplication Table}
{Kaleb Haslam}