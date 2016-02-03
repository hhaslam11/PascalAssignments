program Wages(Input, Output);

uses wincrt;

var HourlyPay, HoursWorked, HoursReg,
    HoursOT, PayReg, PayOT, GrossPay,
    NetPay, IncomeTax, Pension, Union,
    TotalDeductions : real;

   {Get User-Data}
   procedure GetData(var Hours, Pay : real);
      begin
         {Get Input}
         writeln('What is your hourly pay?');
	      write('$');
         readln(Pay);

         clrscr;
        	writeln('How many hours did you work?');
         readln(Hours);
      end;{Get Data}

   {Do Calculations}
   procedure CalcPayStub(HoursWorked, HourlyPay : real;
                         var HoursOT, PayReg, PayOT,
                             GrossPay, IncomeTax, HoursReg,
                             Pension, Union, TotalDeductions,
                             NetPay : real);

      const TAX_INCOME  = 0.33;
            TAX_PENSION = 0.03;
            FEES_UNION  = 0.05;

      begin

         {Calculate GrossPay}
         If HoursWorked > 40 then
            begin
               HoursReg  := 40;
               HoursOT   := HoursWorked - 40;
            end
         else
            begin
               HoursReg  := HoursWorked;
               HoursOT   := 0;
            end;
         PayReg          := HourlyPay * HoursReg;
         PayOT           := HourlyPay * HoursOT;
         GrossPay        := PayReg + PayOT;

         {Calculate Deductions}
         IncomeTax       := GrossPay * TAX_INCOME;
         Pension         := GrossPay * PENSION;
         Union           := GrossPay * FEES_UNION;
         TotalDeductions := IncomeTax + Pension + Union;
         NetPay          := GrossPay - TotalDeductions;

      end;{CalcPayStub}

   {Display PayStub}
   procedure Display (HourlyPay, HoursReg, HoursOT, HoursWorked,
                      PayReg, PayOT, GrossPay, IncomeTax, Union,
                      TotalDeductions, NetPay : real);
      begin

         clrscr;
         writeln('_________________________________________________');
         writeln('                     Paystub                     ');
         writeln;
         writeln('Hourly Pay:            $', HourlyPay:10:2);
         writeln('Regular Hours Worked:   ', HoursReg:10:1);
         writeln('Overtime Hours Worked:  ', HoursOT:10:1);
         writeln('Total Hours Worked:     ', HoursWorked:10:1);
         writeln;
         writeln('Regular Pay:           $',  PayReg:10:2);
         writeln('Overtime Pay:          $',  PayOT:10:2);
         writeln('Gross Pay:             $',  GrossPay:10:2);
         writeln;
         writeln('Deductions:');
         writeln('  Income Tax:          $',  IncomeTax:10:2);
         writeln('  Pension:             $',  Pension:10:2);
         writeln('  Union Fees:          $',  Union:10:2);
         writeln('  Total Deductions:    $',  TotalDeductions:10:2);
         writeln;
         writeln('Net Pay:               $',  NetPay:10:2);
         writeln('_________________________________________________');

      end;{Display}
begin

   GetData(HoursWorked, HourlyPay);

   CalcPayStub(HoursWorked, HourlyPay, HoursOT, PayReg, PayOT,
               GrossPay, IncomeTax, HoursReg, Pension, Union,
               TotalDeductions, NetPay);

   Display(HourlyPay, HoursReg, HoursOT, HoursWorked,
                      PayReg, PayOT, GrossPay, IncomeTax,
                      Union, TotalDeductions, NetPay);

   {End Program}
   readln;
   donewincrt;

end.{Main}

{Modular Wages}
{Kaleb Haslam}