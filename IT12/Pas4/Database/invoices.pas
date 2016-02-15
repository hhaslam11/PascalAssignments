program invoice(Input, Output, DiskFile);

uses wincrt;

type   
procedure newRecord;
   begin
   
   end;

procedure searchData;
   var cont : boolean;
   begin
      while cont do
         begin
            clrscr;
            writeln('1) By invoice #');
            writeln('2) By date');
            writeln('3) By item purchased');
            writeln('4) By purchaser');
            writeln('5) Back');
            
            readln(menuChoice);
            
            case menuChoice of
               1: {By invoic #}
                  {Get invoice number}
                  clrscr;
                  writeln('What invoice would you like to view: ');
                  readln(menuChoice);
                  printData(menuChoice);
                  end;
               2: {By date}
                  end;
               3: {By item purchased}
                  end;
               4: {By purchaser}
                  end;
               5:
                  cont := false;
                  end;
         end;
   end;

procedure search(var i : integer);  {1 = date}
   var cont : boolean;              {2 = item purchased}
   begin                            {3 = purchaser name}
      while cont do
         begin
            {Have 3 if statments (Or a switch) to search through data depending on i.
            Probably need a for loop instead of while loop; add results that fit 
            requirments to another array, then show menu (Use TF method for help menu)}
         end; {while loop}
   end;
procedure delData;
   var invoiceNumber : integer;
   begin
      clrscr;
      writeln('What invoice # would you like to delete?');
      readln(invoiceNumber)
      
      {Do stuff to delete invoice & renumber inovices}
      
      writeln('Record deleted');
      readln;
      clrscr;
   end;

procedure toArray(var diskFile : intFile);
	begin
      i := 0;
      seek(diskFile, 0);
      while not EOF(diskFile) do
         begin
            read(diskFile, ints[i]);
            i := i + 1;
         end;
	end;
   
procedure printArray(var ints : intArray);
   var i, numOfDigs : integer;
   const BORDER_LENGTH : 30;
   begin
      clrscr;
      
      {Top border}
      write('+');
      for i = 1 to (BORDER_LENGTH)do
         write('-');
      write('+');
      writeln;
      {End top border}
      
      {Invoice #}
      write('| Invoice Number: '{, INVOICE NUMBER});
      numOfDigs = 1;
      if(numOfDigs >= 10) {Assuming there will be only be 1 to 99 records.}
         numOfDigs = 2;
      for i = (17 + numOfDigs) to (BORDER_LENGTH) do
         write(' ');
      write('|');
      writeln;
      {End Invoice #}
      
      {Customer name}
      write('| Name: '{, Customer name: });
      numOfDigs = {Customer Name Length};
      for i = (7 + numOfDigs) to (BORDER_LENGTH) do
         write(' ');
      write('|');
      writeln;
      {End Customer name}
      
      {Date}
      write('| Date: '{, Date});
      numOfDigs = {Date length};
      for i = (7 + numOfDigs) to (BORDER_LENGTH) do
         write(' ');
      write('|');
      writeln;
      {End date}
      
      {Middle Border}
      write('+');
      for i = 1 to (BORDER_LENGTH)do
         write('-');
      write('+');
      writeln;
      {End Middle Border}
      
      {Print invoice item(s)}
      {for loop needed}
      {End invoice item(s)}
      
      {x := 0;
      for i := 0 to 99 do
         begin
            if (x = LINE_LENGTH) then
               begin
                  writeln;
                  x := 0;
               end;
               write(' ', ints[i]);
               x := x + 1;
         end;{For loop}}
   end;
   
procedure menu;
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
                  newRecord;
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
   
begin
   menu;
end.
{Invoices}
{Kaleb Haslam}