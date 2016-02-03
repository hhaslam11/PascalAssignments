program Temperature(Input, Output);
uses wincrt;

var First, ConvertedFirst, Second, ConvertedSecond : real;
    CorF : char;

procedure GetInput(var First, Second : real;
                   var CorF : char);
   begin
      clrscr;
      writeln('Enter the lower and upper values of the range to be converted');
      readln(First, Second);

      clrscr;
      writeln('Convert to Celcsius, or to Farenheit? (C/F)');
      readln(CorF);
      CorF := upcase(CorF);
   end;

procedure ConvertCtoF(First, Second : real;
                      var ConvertedFirst, ConvertedSecond : real);
   begin
      ConvertedFirst  := 9 / 5 * First + 32;
      ConvertedSecond := 9 / 5 * Second + 32;
   end;

procedure ConvertFtoC(First, Second : real;
                      var ConvertedFirst, ConvertedSecond : real);
   begin
      ConvertedFirst  := 5 / 9 * (First  - 32);
      ConvertedSecond := 5 / 9 * (Second - 32);
   end;

procedure DisplayResults(ConvertedFirst, ConvertedSecond : real;
                         CorF : char);
   begin
      clrscr;
      write  ('Converted Values: ');
      write  (ConvertedFirst:1:0, '°', CorF, ' to ');
      writeln(ConvertedSecond:1:0, '°', CorF);
      readln;
   end;

begin
   GetInput(First, Second, CorF);

   if (CorF = 'C') then
      begin
         ConvertFtoC(First, Second, ConvertedFirst, ConvertedSecond);
      end;

   if (CorF = 'F') then
      begin
         ConvertCtoF(First, Second, ConvertedFirst, ConvertedSecond);
      end;

   DisplayResults(ConvertedFirst, ConvertedSecond, CorF);

   donewincrt;
end.

{Temperature Equivalence Table}
{Kaleb Haslam}