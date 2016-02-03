program Inflation(input, output);

uses wincrt;

var OldPrice, NewPrice, DifferenceInPrice, WeeksBetweenPrices, RateWeekly,
    RateAnually, ObjectPrice, EstPrice, WeeksUntilPurchase, RateOfInflation : real;

begin

   {Get Input}
   writeln('What was the old price of the object?');
   write('$');
   readln(OldPrice);

   clrscr;
   writeln('What is the price now?');
   write('$');
   readln(NewPrice);

   clrscr;
   writeln('How many weeks were between these two prices?');
   readln(WeeksBetweenPrices);

   {Calculate}
   DifferenceInPrice := abs(OldPrice - NewPrice);
   RateofInflation   := DifferenceInPrice / OldPrice * 100;
   RateWeekly        := RateOfInflation / WeeksBetweenPrices;
   RateAnually       := RateWeekly * 52;

   {Display Results}
   clrscr;
   writeln('The difference in price is: $', DifferenceInPrice:7:2);
   writeln('Weekly rate of inflation:   %', RateWeekly:7:2);
   writeln('Annual rate of inflation:   %', RateAnually:7:2);
   readln;

   {Stage III}
   clrscr;
   writeln('What is the current price of the item you wish to buy?');
   write('$');
   readln(ObjectPrice);

   clrscr;
   writeln('How many weeks from now will you purchase the item?');
   readln(WeeksUntilPurchase);

   {Calc EstPrice}
   EstPrice := ObjectPrice + (ObjectPrice * RateWeekly/100 * WeeksUntilPurchase);

   {Display Results}
   clrscr;
   writeln('The estimated cost of the item in ', WeeksUntilPurchase:1:0, ' week(s) is: $', EstPrice:1:2);

   {End Program}
   readln;
   donewincrt;

end.

{Inflation}
{Kaleb Haslam}