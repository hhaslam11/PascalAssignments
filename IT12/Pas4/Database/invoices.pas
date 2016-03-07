program dataBase(Input, Output, DiskFile);

uses wincrt;

const MAX_RECORDS = 2;
      BORDER_LENGTH = 30;
      FILE_NAME = 'invoices.dat';

type itemRecord = record
     name    : String;
     quantity : integer;
     price, extPrice : real;
     desc    : String;
     end;

     itemArray = array[1..9] of itemRecord;

     invoice = record
     number  : integer;
     address : String;
     name    : String;
     date    : String;
     item    : itemArray;
     end;

     invoiceArray = array[1..MAX_RECORDS] of invoice;
     invoiceFile = file of invoice;

var diskFile : invoiceFile;
    invArr   : invoiceArray;
    arrSize  : integer; {Don't need if arraysize is a constant}

procedure writeFile(var diskFile : invoiceFile; var invArr : invoiceArray);
   var i : integer;
   begin
      assign(diskFile, FILE_NAME);
      rewrite(diskFile);
      For i := 1 to MAX_RECORDS do
        write(diskFile, invArr[i]);
      close(diskFile);
   end;

procedure newRecord(var invArr : invoiceArray; var invFile : invoiceFile);
   var i, x, items : integer;
   begin
      clrscr;
      for i := 1 to MAX_RECORDS do
         begin
            With InvArr[i] do
            clrscr;
            writeln('New Record');

            write('Purchaser Name: ');
            readln(invArr[i].name);
            clrscr;

            write('Address: ');
            readln(invArr[i].address);
            clrscr;

            write('Date: ');
            readln(invArr[i].date);
            clrscr;

            write('How many different items purchased: ');
            readln(items);
            clrscr;
            for x := 1 to items do
               with invArr[i].item[x] do
               begin
                  write('Item name: ');
                  readln(name);
                  clrscr;

                  write('Item description: ');
                  readln(desc);
                  clrscr;

                  write('quantity: ');
                  readln(quantity);
                  clrscr;
               end; {for x}
         end; {for i}
         writeFile(invFile, invArr);
   end;

procedure search(var i : integer);       {1 = date}
   var cont : boolean;                   {2 = item purchased}
       index, validItems : integer;      {3 = purchaser name}
       valid : itemArray;
       choiceStr : String;
   begin

      {Get keyword (choiceStr)}
      clrscr;
      write('Enter your keyword you want to search for: ');
      readln(choiceStr);
      clrscr;

      for index := 0 to high(invArr) - low(invArr) + 1 do
         begin
            if i = 1 then
               begin
                  if invArr[index].date = choiceStr then
                     validItems := validItems + 1;
               end;
            if i = 2 then
               begin
                  {Loop through all items. Only increment validItems once}
               end;
            if i = 3 then
               begin
                  if invArr[index].name = choiceStr then
                     validItems := validItems + 1;
               end;

            {Have 3 if statments (Or a switch) to search through data depending on i.
            Probably need a for loop instead of while loop; add results that fit
            requirments to another array(of 5), have an index var to keep track of how many items,
            then show menu}
         end; {while loop}
   end;
{
procedure delData;
   var invoiceNumber, i, i2 : integer;
       tempArr : invoiceArray;
   begin
      clrscr;
      writeln('What invoice # would you like to delete?');
      readln(invoiceNumber);

      {i2 = index for second array}{
      for i := 1 to MAX_RECORDS do
         begin
            if i <> invoiceNumber then
               begin
                  tempArr[i2] := invArr[i];
                  i2 := i2 + 1;
               end;
         end;
      invArr := tempArr;

      writeln('Record deleted');
      readln;
      clrscr;
   end;
}
procedure toArray(var diskFile : invoiceFile; var invArr : invoiceArray);
        var i,x : integer;
	begin
      i := 0;
      seek(diskFile, 0);
      while not EOF(diskFile) do
         begin
            read(diskFile, invArr[i]);
            i := i + 1;
         end;
	end;

procedure printArray(var invoiceArray : invoiceArray; index : integer);
   var i,x, numOfDigs : integer;

   begin
      clrscr;

      {Top border}
      write('+');
      for i := 1 to (BORDER_LENGTH + 2)do
         write('-');
      write('+');
      writeln;
      {End top border}

      {Invoice #}
      write('| Invoice Number: ', invoiceArray[index].number);
      numOfDigs := 1;
      if(invoiceArray[index].number >= 10) then {Assuming there will be only be 1 to 99 records.}
         numOfDigs := 2;
      for i := (17 + numOfDigs) to (BORDER_LENGTH) do
         write(' ');
      write('|');
      writeln;
      {End Invoice #}

      {Customer name}
      write('| Name: ', invoiceArray[index].name);
      numOfDigs := length(invoiceArray[index].name);
      for i := (7 + numOfDigs) to (BORDER_LENGTH) do
         write(' ');
      write('|');
      writeln;
      {End Customer name}

      {Date}
      write('| Date: ', invoiceArray[index].date);
      numOfDigs := length(invoiceArray[index].date);
      for i := (7 + numOfDigs) to (BORDER_LENGTH) do
         write(' ');
      write('|');
      writeln;
      {End date}

      {Middle Border}
      write('+');
      for i := 1 to (BORDER_LENGTH + 2)do
         write('-');
      write('+');
      writeln;
      {End Middle Border}

      {Print invoice item(s)}

      for x := 1 to high(invoiceArray[index].item)-low(invoiceArray[index].item) + 1 do{use counter, pass to procedure}
         begin
            numOfDigs := 1;
            if(invoiceArray[index].item[x].quantity >= 10)then
               numOfDigs := 2;
            write('| ', invoiceArray[index].item[x].quantity);
            for i := 1 to (11 - numOfDigs) do
               write(' ');
            write('| ');

         end;{for loop}
      {End invoice item(s)}
      readln;
   end;

procedure searchData(var invArr : invoiceArray);
   var cont : boolean;
       menuChoice : integer;
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
                  begin
                     {Get invoice number}
                     clrscr;
                     writeln('What invoice would you like to view: ');
                     readln(menuChoice);
                     printArray(invArr, menuChoice);
                  end;
               2: {By date}
                  begin
                     menuChoice := 1;
                     search(menuChoice);
                  end;
               3: {By item purchased}
                  begin
                     menuChoice := 2;
                     search(menuChoice);
                  end;
               4: {By purchaser}
                  begin
                     menuChoice := 3;
                     search(menuChoice);
                  end;
               5:
                  cont := false;
                  end;
         end;
   end;

procedure menu;
   var cont : boolean;
       menuChoice : integer;
   begin
      cont := true;
      while cont do
         begin
            clrscr;
            writeln('1) New record');
            writeln('2) Print records (Single)');
            writeln('3) Print record (All)');
            writeln('4) Search records');
            writeln('5) Quit');

            readln(menuChoice);

            case menuChoice of
               1:
               begin
                  newRecord(invArr, diskFile);
               end;
               2:
               begin
                  {Get invoice number}
                  clrscr;
                  toArray(diskFile, invArr);
                  writeln('What invoice would you like to view: ');
                  readln(menuChoice);
                  printArray(invArr, menuChoice);
               end;
               3:
               begin
                  toArray(diskFile, invArr);
                  printArray(invArr, 0);
               end;
               4:
               begin
                  toArray(diskFile, invArr);
                  searchData(invArr);
               end;
               5:
                  cont := false;
                  end;
         end;
   end;

begin {main}
   menu;
   donewincrt;
end.


{
Things to remember:

   When displaying only one invoice from menu, make sure the # is the same as the inputted one

}

{Invoices}
{Kaleb Haslam}