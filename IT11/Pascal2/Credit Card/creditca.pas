program CreditCard(input, output);

uses wincrt;

var cardNum, NumFull : longint;
    Num4, Num3, Num2, Num1, Sum : integer;

begin

   {Get Input}
   write('Enter 8 Digit Credit Card Number: ');
   readln(cardNum);
   clrscr;

   {Calculate}
   NumFull := cardNum;
   Num4    := NumFull mod 100;
   NumFull := NumFull div 100;
   Num3    := NumFull mod 100;
   NumFull := NumFull div 100;
   Num2    := NumFull mod 100;
   NumFull := NumFull div 100;
   Num1    := NumFull mod 100;
   Sum     := Num1 + Num2 + Num3 + Num4;
   Sum     := Sum mod 90;

   {Check Value}
   If (Sum >= 65{A}) and (Sum <= 90{Z}) then
      begin
         writeln('You entered card #',cardNum);
         writeln('This credit card is real.');
      end
   else
      begin
         writeln('This credit card is FAKE!');
      end;

   {End Program}
   readln;
   donewincrt;

end.

{Credit Card}
{Kaleb Haslam}