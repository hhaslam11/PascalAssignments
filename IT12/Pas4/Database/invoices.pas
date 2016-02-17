program invoice(Input, Output, DiskFile);

uses wincrt;

type itemRecord = record
     name    : String;
     quanity : integer;
     price   : integer;
     desc    : String;

var itemArray = array[1..9] of itemRecord;

type invoice = record
     number  : integer;
     address : String;
     name    : String;
     date    : String;
     item    : itemArray;
     
type invoiceFile  = file of invoice;
     invoiceArray = array[1..99] of invoice;
     
var diskFile : invoiceFile;
    invArr   : invoiceArray;
     
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
               1: {By invoice #}
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

procedure search(var i : integer);             {1 = date}
   var cont : boolean;                         {2 = item purchased}
       index, validItems : integer;            {3 = purchaser name}
       valid : itemArray;
       choiceStr : String;
   begin              

      {Get keyword (choiceStr)}
      clrscr;
      write('Enter your keyword you want to search for: ');
      readln(choiceStr);
      clrscr;
      
      for index = 0 to invArr.length do
         begin
            if i = 1 do
               begin
                  if invArr[index].date = choiceStr do
                     validItems := validItems + 1;
               end;
            if i = 2 do
               begin
                  {Loop through all items. Only increment validItems once}
               end;
            if i = 3 do
               begin
                  if invArr[index].name = choiceStr do
                     validItems := validItems + 1;
               end;
               
            {Have 3 if statments (Or a switch) to search through data depending on i.
            Probably need a for loop instead of while loop; add results that fit 
            requirments to another array(of 5), have an index var to keep track of how many items, 
            then show menu}
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
   
procedure printArray(var invoiceArray : invoiceArray, index : integer);
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
      write('| Invoice Number: ', invoiceArray[index].number);
      numOfDigs = 1;
      if(invoiceArray[index].number >= 10) {Assuming there will be only be 1 to 99 records.}
         numOfDigs = 2;
      for i = (17 + numOfDigs) to (BORDER_LENGTH) do
         write(' ');
      write('|');
      writeln;
      {End Invoice #}
      
      {Customer name}
      write('| Name: ', invoiceArray[index].name});
      numOfDigs = invoiceArray[index].name.length;
      for i = (7 + numOfDigs) to (BORDER_LENGTH) do
         write(' ');
      write('|');
      writeln;
      {End Customer name}
      
      {Date}
      write('| Date: ', invoiceArray[index].date);
      numOfDigs = invoiceArray[index].date.length;
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
      var x : integer;
      for x = 1 to invoiceArray[index].item.length do
         begin
            numOfDigs = 1;
            if(invoiceArray[index].item[x].quanity >= 10)
               numOfDigs = 2;
            write('| ', invoiceArray[index].item[x].quanity);
            for i = 1 to (11 - numOfDigs) do
               write(' ');
            write('| ');
            
         end;{for loop}
      {End invoice item(s)}
      
      readln;
      {x := 0;
      for i := 0 to 99 do
         begin
            if (x = LINE_LENGTH) then
               begin
                  writeln;
                  x := 0;
               end;
               write(' ', ints[index]);
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


{
Things to remember:

   When displaying only one invoice from menu, make sure the # is the same as the inputted one
   




}

{Invoices}
{Kaleb Haslam}