program SwapValues(Input, Output);
uses wincrt;
var First, Second : real;

procedure Title;
   begin
   
      writeln('     Swap Values');
      writeln('This program takes in two');
      writeln('numbers and swaps them');
	  readln;
	  
   end;

procedure GetInput(var First, Second : real);
   begin

      clrscr;
      writeln('What two numbers do you wish to swap?');
      readln(First, Second);

   end;

procedure Swap(var First, Second : real);
   var Temp : real;
   begin

      Temp := First;

      First  := Second;
      Second := Temp;

   end;

procedure Display(First, Second : real);
   begin

      clrscr;
      writeln('First:  ', First:5:2);
      writeln('Second: ', Second:5:2);
      readln;

   end;

begin
   
   Title;
   GetInput(First, Second);
   Swap(First, Second);
   Display(First, Second);
   donewincrt;

end.

{SwapValues}
{Kaleb Haslam}