program HotTub (Input, Output);
uses wincrt;

const HOTTUB_PRICE = 2500;

var HotTubsPerWeek, StraightSal, CommissionSal, Com : real;

procedure GetInput(var HTweek : real);
   begin
      writeln('How many hot tubs would you be able');
      writeln('to sell per week? (On average)     ');
      readln(HTweek);
   end;

procedure CalcStraightSal(var StraightSal : real);
   const SALARY = 325;{Per Week}
   begin
      StraightSal := SALARY * 4; {Gets Salary for the month}
   end;

procedure CalcComSal(var ComSal : real;
                     HTWeek : real);
   const SALARY = 3.50;{Per Hour}
         HOURS  =   40;{Per week}
         COM    = 0.15;{15%}
   var Commission, Sal : real;
   begin
      Commission := (HTWeek * HOTTUB_PRICE * 4) * COM;{Gets Commision for the month}
      Sal        := (SALARY * HOURS) * 4;             {Gets Salary for the month}
      ComSal     := Commission + Sal;                 {Gets Total for the month}
   end;

procedure CalcCom(var Commission : real;
                  HTWeek  : real);
   var HTSold : real;
   const COM = 0.20;{20%}
   begin
      HTSold := HTWeek * 4;                       {Gets hot tubs sold for the month}
      Commission := (HTSold * HOTTUB_PRICE) * COM;{Gets commission for the month}
      Commission := Commission + HTSold;          {Gets total for the month}
   end;

procedure DisplayOutput(StraightSal, CommissionSal, Com : real);
   begin
      writeln('You can choose 3 payment methods. The following is what you''make per month for each method');
      writeln;
      writeln('Straight Salary:             $ ', StraightSal:7:2);
      writeln('Salary and Commission:       $ ', CommissionSal:7:2);
      writeln('Straight Commission:         $ ', Com:7:2);
      readln;
   end;


begin

   GetInput(HotTubsPerWeek);

   {Calculate Straight Salary}
   CalcStraightSal(StraightSal);

   {Calculate Salary with commission}
   CalcComSal(CommissionSal, HotTubsPerWeek);

   {Calculate only commission}
   CalcCom(Com, HotTubsPerWeek);

   DisplayOutput(StraightSal, CommissionSal, Com);

   donewincrt;

end.

{Hot Tub}
{Kaleb Haslam}
