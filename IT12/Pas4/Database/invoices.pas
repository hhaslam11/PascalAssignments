program invoice(Input, Output, DiskFile);

uses wincrt;

procedure menu();
   var cont : boolean;
       menuChoice : integer;
   begin
      while cont do
         begin
            clrscr;
            writeln('1) New record');
            writeln('2) Print records (Single)');
            writeln('3) Print record (All)');
            writeln('4) Search records');
            writeln('5) Delete records');
            writeln('6) Quit');
            
            readln(menuChoice);
            
            case menuChoice of
               1:
                  inputData;
                  end;
               2:
                  {Get invoice number}
                  clrscr;
                  writeln('What invoice would you like to view: ');
                  readln(menuChoice);
                  printData(menuChoice);
                  end;
               3:
                  printData(0);
                  end;
               4:
                  searchData;
                  end;
               5:
                  delData;
                  end;
               6:
                  cont := false;
                  end;
         end;
   end;
   
procedure inputData;
   begin
   
   end;
   
procedure printData();
   begin
   
   end;

procedure searchData;
   begin
      
   end;
   
procedure delData;
   
begin
   menu;
end.
{Invoices}
{Kaleb Haslam}