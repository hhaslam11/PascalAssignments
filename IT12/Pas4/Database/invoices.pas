program dataBase(Input, Output, DiskFile);

uses wincrt;

const MAX_RECORDS = 2;
      BORDER_LENGTH = 30;
      FILE_NAME = 'invoices.dat';
      PSTRATE = 0.05;
      GSTRATE = 0.07;

type itemRecord = record
     quantity : integer;
     price, extPrice : real;
     desc    : String;
     end;

     itemArray = array[1..9] of itemRecord;

     invoice = record
     number, noitems  : integer;
     address : String;
     name    : String;
     date    : String;
     item    : itemArray;
     subtotal, GST, PST, total : real;
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
         With InvArr[i] do
           begin
            clrscr;
            writeln('New Record');

            number := i;
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
            readln(noitems);
            clrscr;
            SubTotal := 0;
            for x := 1 to noitems do
               with invArr[i].item[x] do
               begin
                  write('Item Quantity: ');
                  readln(quantity);
                  clrscr;

                  write('Item description: ');
                  readln(desc);
                  clrscr;

                  write('Unit Price: ');
                  readln(price);

                  ExtPrice := quantity * Price;
                  invArr[i].SubTotal := invArr[i].SubTotal + ExtPrice;
                  clrscr;
               end; {for x}
               PST := SubTotal * PSTRATE;
               GST := Subtotal * GSTRATE;
               Total := SubTotal + PST + GST;
         end; {With}
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

procedure toArray(var diskFile : invoiceFile; var invArr : invoiceArray);
   var i : integer;
   begin
      reset(DiskFile);
      i := 1;
      while not EOF(diskFile) do
         begin
            read(diskFile, invArr[i]);
            i := i + 1;
         end;
     close(DiskFile);
   end;

procedure printArray(var invoiceArray : invoiceArray; index : integer);
   var i,x, numOfDigs : integer;

   begin
      clrscr;
      With invoiceArray[index] do
         begin
            writeln('Invoice Number:   ',   number);
            writeln('Name:             ',   name);
            writeln('Date:               ', date);
            
            {Print invoice item(s)}
            writeln('Quantity', 'Description':20, 'Unit Price':10, 'Ext Price':10);
            
            for x := 1 to NoItems do 
               With Item[x] do
                  writeln(Quantity:2, Desc:20, '$', Price:10:2, '$', ExtPRice:10:2);
                  
            {End invoice item(s)}
            writeln('Subtotal:    $', SubTotal:10:2);
            writeln('PST:         $', PST:10:2);
            writeln('GST:         $', GST:10:2);
            writeln('Total:       $', Total:10:2);
         end; {With InvoiceArray[index]}
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
       menuChoice, InvNo : integer;
   begin
      cont := true;
      while cont do
         begin
            clrscr;
            writeln('1) New record');
            writeln('2) Print record (All)');
            writeln('3) Search records');
            writeln('4) Quit');

            readln(menuChoice);

            case menuChoice of
               1:
               begin
                  newRecord(invArr, diskFile);
               end;
               2:
               begin
                  toArray(diskFile, invArr);
                  For invNo := 1 to MAX_RECORDS do
                    printArray(invArr,InvNo);
               end;
               3:
               begin
                  toArray(diskFile, invArr);
                  searchData(invArr);
               end;
               4:
                  cont := false;
                  end;
         end;
   end;

begin {main}
   assign(diskFile, FILE_NAME);
   menu;
   donewincrt;
end.


{
Things to remember:

   When displaying only one invoice from menu, make sure the # is the same as the inputted one

}

{Invoices}
{Kaleb Haslam}