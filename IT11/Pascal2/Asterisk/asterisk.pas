Program Asterisk1(Input, Output);

uses wincrt;

Var I   : integer;
    Str : String;
begin

   {First Way}
   For I := 0 to 239 do
      begin
         write('*');
      end;
   readln;

   {Second Way}
   clrscr;
   For I := 0 to 239 do
      begin
         Str := Str + '*'
      end;
   writeln(Str);

   {End Program}
   readln;
   donewincrt;

end.

{Asterisk 1}
{Kaleb}