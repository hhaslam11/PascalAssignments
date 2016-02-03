Program ElectricBill(Input, Output);

uses wincrt;

var KWUsed, SubTotal, Surcharge, Tax, Total : real;

procedure GetInput(var KWUsed : real);
   begin

      clrscr;
      write('KW hours used: ');
      readln(KWUsed);

   end;

procedure Calc(KWUsed : real;
                    var SubTotal, PriceSurcharge,
                    PriceTax, Total : real);

   const KWHOUR_PRICE = 0.0475;
         SURCHARGE    = 0.10;
         TAX          = 0.03;
   begin

      {Calc Subtotal}
      SubTotal := KWUsed * KWHOUR_PRICE;

      {Calc Charges}
      PriceSurcharge := SubTotal * SURCHARGE;
      PriceTax       := SubTotal * TAX;

      {Calc Total}
      Total := SubTotal + PriceSurcharge + PriceTax;

   end;

procedure Display(KWUsed, SubTotal, Surcharge, Tax, Total : real);
   begin

      clrscr;
      writeln('__________________________________________');
      writeln('               Electric Bill              ');
      writeln;
      writeln('KW-Hours Used: ', KWUsed:7:2);
      writeln;
      writeln('Sub Total:     $', SubTotal:7:2);
      writeln;
      writeln('Extra Charger: ');
      writeln('   Surcharge:  $', Surcharge:7:2);
      writeln('   Tax:        $', Tax:7:2);
      writeln;
      writeln('Total Cost:    $', Total:7:2);
      writeln('__________________________________________');
      readln;

   end;

begin

   GetInput(KWUsed);
   Calc(KWUsed, SubTotal, Surcharge, Tax, Total);
   Display(KWUsed, SubTotal, Surcharge, Tax, Total);
   donewincrt;

end.

{ElectricBill}
{Kaleb Haslam}