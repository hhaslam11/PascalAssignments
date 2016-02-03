program Paystub(input, output);

uses wincrt;

var HourlyPay, HoursWorked, HoursReg,
    HoursOT, PayReg, PayOT, GrossPay,
    NetPay, IncomeTax, Pension, Union,
    TotalDeductions : real;

const INCOME_TAX   = 0.33;
      PENSION_FUND = 0.03;
      UNION_FEES   = 0.05;

begin

	{Get Input}
	writeln('What is your hourly pay?');
	write('$');
	readln(HourlyPay);

	clrscr;
	writeln('How many hours did you work?');
	readln(HoursWorked);

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
   IncomeTax       := GrossPay * INCOME_TAX;
   Pension         := GrossPay * PENSION;
   Union           := GrossPay * UNION_FEES;
   TotalDeductions := IncomeTax + Pension + Union;
   NetPay          := GrossPay - TotalDeductions;

   {Display Results}
   clrscr;
   writeln('_________________________________________________');
   writeln('                     Paystub                     ');
   writeln;
   writeln('Hourly Pay:            $',  HourlyPay:10:2);
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

   {Exit Program}
   readln;
   donewincrt;

end.

{Paystub}
{Kaleb Haslam}