program SortNames(Input, Output);
uses wincrt;

const MAX = 3;{Max names stored}
type StringArray = Array[1..MAX] of String;

var Names             : StringArray;
    I, Index          : Integer;
    Smallest, Largest : String;
begin

   {Get Names & Store in array}
   writeln('Enter ', MAX, ' names:');
   for I := 1 to MAX do
      begin
         readln(Names[I]);
      end;{For Loop}

   {Find smallest}
   Index := 1;
   for I := 2 to MAX do
      begin
         if Names[I] < Names[Index] then
            Index := I;
         Smallest := Names[Index];
      end;{For loop}

   {Find largest}
   Index := 1;
   for I := 2 to MAX do
      begin
         if Names[I] > Names[Index] then
            Index := I;
         Largest := Names[Index]
      end;{For loop}

   {Output}
   clrscr;
   writeln('Smallest: ', Smallest);
   writeln('Largest: ', Largest);

   readln;
   donewincrt;

end.{Main}

{Sort Names}
{Kaleb Haslam}