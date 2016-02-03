program Wages(Input, Output);
uses wincrt;

const MAX = 5;

type RealArray   = Array[1..MAX] of real;
     StringArray = Array[1..MAX] of String;

var Name : StringArray;
    HourlyRate, HoursWorked, PayGross, PayNet, TaxFees : RealArray;

procedure GetData(var Name : StringArray; var Rate, HoursWorked : RealArray);
   var I : integer;
   begin

      for I := 1 to MAX do
         begin

            clrscr;
            writeln('Enter the name for employee ', I);
            readln(Name[I]);

         end;{For}

      for I := 1 to MAX do
         begin

            clrscr;
            writeln('Enter hourly rate for ', Name[I]);
            readln(Rate[I]);

         end;{For}

      for I := 1 to MAX do
         begin

            clrscr;
            writeln('Enter hours worked (Per week) for ', Name[I]);
            readln(HoursWorked[I]);

         end;{For}
   end;

procedure CalculateData(var HourlyRate, HoursWorked, PayGross, TaxFees, PayNet : RealArray);
   var I : integer;
   begin

      {Calculate PayGross}
      for I := 1 to MAX do
            PayGross[I] := HoursWorked[I] * HourlyRate[I];

      {Calculate TaxFees}
      for I := 1 to MAX do
         begin

            if PayGross[I] > 400 then
               TaxFees[I] := PayGross[I] * 0.27;

            if (PayGross[I] > 50) and (PayGross[I] <= 400) then
               TaxFees[I] := PayGross[I] * 0.20;

            if PayGross[I] <= 50 then
               TaxFees[I] := PayGross[I] * 0.02;

         end;{For}

      {Calculate NetPay}
      for I := 1 to MAX do
         PayNet[I] := PayGross[I] - TaxFees[I];

   end;{CalculateData}

procedure DisplayOutput(Name : StringArray; HourlyRate, HoursWorked, PayGross, TaxFees, PayNet : RealArray);
   var I : integer;
   begin
         for I := 1 to MAX do
            begin
               clrscr;
               writeln('_________________________________________________');
               writeln(Name[I]);
               writeln;
               writeln('Hourly Pay:            $', HourlyRate[I]:10:2);
               writeln('Hours Worked:           ', HoursWorked[I]:10:1);
               writeln;
               writeln('Gross Pay:             $', PayGross[I]:10:2);
               writeln;
               writeln('Tax:                   $', TaxFees[I]:10:2);
               writeln;
               writeln('Net Pay:               $', PayNet[I]:10:2);
               writeln('_________________________________________________');
               readln;
            end;{for}
   end;

begin

   GetData(Name, HourlyRate, HoursWorked);
   CalculateData(HourlyRate, HoursWorked, PayGross, TaxFees, PayNet);
   DisplayOutput(Name, HourlyRate, HoursWorked, PayGross, TaxFees, PayNet);
   donewincrt;

end.

{Wages}
{Kaleb Haslam}