Program guess(Input, Output);

uses wincrt;

var NumGuess, Number, Score : integer;
    Correct                 : boolean;

begin

   Randomize;
   {Set vars}
   Score   := 100;
   Number  := Random(100) + 1;
   Correct := false;

   {Main Loop}
   while (Correct = false) do
      begin

         writeln('Guess a number between 1 and 100!');
         readln(NumGuess);

         if (NumGuess < Number) then
            begin
               writeln('Guess Higher!');
               readln;
               Score := Score - 10;
            end;

         if (NumGuess > Number) then
            begin
               writeln('Guess Lower!');
               readln;
               Score := Score - 10;
            end;

         if (NumGuess = Number) then
            begin
               Correct := true;
            end;

         clrscr;

      end;{Main Loop}

      {Win}
      writeln('You win!');
      writeln('Your final score is: ', Score);

   {End Program}
   readln;
   donewincrt;

end.

{Guessing Game}
{Kaleb Haslam}