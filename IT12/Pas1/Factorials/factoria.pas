program Factorials(Input, Output);
uses wincrt;
var Num : integer;

Function Factorial(Num : integer) : LongInt;
   begin
      if Num = 1 then
         begin
           write(Num,' = ');
           Factorial := 1;
         end
            else
              begin
                write(Num,' * ');
                Factorial := Num * Factorial(Num - 1);
              end;
   end; {Factorial}

begin

   {Get Input}
   writeln('What Number would you like to see a factorial table of?');
   readln(Num);
   write(Num, '! = ');
   write(Factorial(Num));
   readln;
   donewincrt;
end. {Main}
{Factorials}
{Kaleb Haslam}