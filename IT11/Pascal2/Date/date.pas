program Date(input, output);

uses wincrt;

Var Continue, Valid    : Boolean;
    DateFull, DateTemp : longint;
    Day, Month, Year   : Integer;
    YorN               : char;

begin

   Continue := true;

   While Continue do
      begin

         {Get Input}
         Repeat

            Valid := true;

            clrscr;
            write('Type the date in (MMDDYY): ');
            readln(DateFull);

            {Assign and Check If Valid}
            DateTemp := DateFull;
            Year     := DateTemp mod 100;
            DateTemp := DateTemp div 100;
            Day      := DateTemp mod 100;
            DateTemp := DateTemp div 100;
            Month    := DateTemp;

            if (Month < 1) or (Month > 12) then Valid := false;
            if (Day < 1) or (Day > 31)     then Valid := false;
            if (Year < 1) or (Year > 99)   then Valid := false;

            if (Valid = false) then
               begin
                  clrscr;
                  writeln('Invalid input. Try Again.');
                  readln;
               end;

         Until Valid;

         {Write Month}
         Case Month of
            01 : write('January ');
            02 : write('February ');
            03 : write('March ');
            04 : write('April ');
            05 : write('May ');
            06 : write('June ');
            07 : write('July ');
            08 : write('August ');
            09 : write('September ');
            10 : write('October ');
            11 : write('November ');
            12 : write('December ');
		   End; {Case}
		
	     {Write Day}
	    	write(Day);
		
		  {Write Year}
		  If Year < 10 then write(', 190', Year)
		  else write(', 19', Year);
        readln;

        {Check if loop}
        clrscr;
        writeln('Do you want to continue? (Y/N)');
        readln(YorN);

        if (YorN = 'N') or (YorN = 'n') then continue := false;

   end;{Progam Loop}

   {End Program}
   donewincrt;

end.

{Date}
{Kaleb Haslam}