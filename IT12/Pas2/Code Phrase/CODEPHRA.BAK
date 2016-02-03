program CodePhrase (Input, Output);
uses wincrt;

type CharArray = array[1..50] of Char;

var InputPhrase, OutputPhrase : string;
    I                         : integer;

begin

   {Get input}
   writeln('Enter your phrase to be encoded/decoded');
   writeln('Type "*" at the end of your phrase');
   for I := 1 to 50 do
      begin

         read(InputPhrase[I]);
         inputPhrase[I] := upcase(InputPhrase[I]);
         {Upcase(InputPhrase[I]);}

         {If done}
         if InputPhrase[I] = '*' then
            begin

               for I := I to 50 do
                  InputPhrase[I] := ' ';

            end;{If}
      end;{For}

   {Encode/Decode}
   for I := 1 to 50 do
      begin
         if InputPhrase[I] <> ' ' then
            OutputPhrase[I] := chr(90 - (Ord(InputPhrase[I]) - Ord('A')))
         else
            OutputPhrase[I] := ' ';
      end;

   {Output}
   clrscr;
   for I := 1 to 50 do
      write(OutputPhrase[I]);

   {End Program}
   readln;
   readln;
   donewincrt;

end.

{CodePhrase}
{Kaleb Haslam}