program OhmsLaw(input, output);
uses wincrt;

var ConvertTo      : integer;
    Input1, Input2 : real;

function Amps(Volts, Ohms : real) : real;
   begin
      Amps := Volts / Ohms;
   end;

function Volts(Amps, Ohms : real) : real;
   begin
      Volts := Amps * Ohms;
   end;

function Ohms(Amps, Volts : real) : real;
   begin
      Ohms := Amps * Volts;
   end;

begin

   writeln('What unit would you like to convert to?');
   writeln;
   writeln('1) Amps');
   writeln('2) Volts');
   writeln('3) Ohms');
   readln(ConvertTo);
   clrscr;

   {Get the two inputs}
   Case ConvertTo of
      1: writeln('Enter the Volts, and Ohms');
      2: writeln('Enter the Ampts, and Ohms');
      3: writeln('Enter your Amps, and Volts');
   end;
   readln(Input1, Input2);
   clrscr;

   {Print output}
   Case ConvertTo of
      1: writeln(Amps(Input1, Input2):1:2);
      2: writeln(Volts(Input1, Input2):1:2);
      3: writeln(Ohms(Input1, Input2):1:2);
   end;

   readln;
   donewincrt;

end.

{Ohm's Law}
{Kaleb Haslam}