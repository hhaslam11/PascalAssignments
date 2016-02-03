program Consumption(input, output);

uses wincrt;

var MilesPerWatt, DistMiles, DistKM, TimeTook, Consumed, KWPerKM, AvgSpeed : real;

const KM_PER_MILE = 1.6;
      WATTS_PER_KW = 1000;
begin

   {Get Input}
   write('Miles Per Watt: ');
   readln(MilesPerWatt);

   clrscr;
   write('Distance Travelled (Miles): ');
   readln(DistMiles);

   clrscr;
   write('Time it took (Hours): ');
   readln(TimeTook);

   {Calculate}
   DistKM       := DistMiles * KM_PER_MILE;
   Consumed{KW} := (DistMiles * 1 / MilesPerWatt) / WATTS_PER_KW;
   KWPerKM      := DistKM / Consumed;
   AvgSpeed     := DistKM / (TimeTook * 60);

   {Display Results}
   clrscr;
   writeln('Distance Travelled (KM):       ', DistKM:7:2);
   writeln('Electricity Consumed (KW):     ', Consumed:7:2);
   writeln('KW Per KM:                     ', KWPerKM:7:2);
   writeln('Average Speed Per Minute (KM): ', AvgSpeed:7:2);

   {End Program}
   readln;
   donewincrt;

end.

{Power Consumpsion}
{Kaleb Haslam}