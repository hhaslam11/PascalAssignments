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

procedure printArray(var invoiceArray : invoiceArray; index : integer);
   var i,x, numOfDigs : integer;

   begin
      clrscr;
      With invoiceArray[index] do
         begin
            writeln('___________________________________________________________');
            writeln('Invoice Number:   ', number);
            writeln('Name:             ', name);
            writeln('Date:             ', date);
            writeln('___________________________________________________________');
            {Print invoice item(s)}
            writeln('Quantity':8, 'Description':15, 'Unit Price':15, 'Ext Price':15);

            for x := 1 to NoItems do
               With Item[x] do
                  writeln(Quantity:8, Desc:15, '$':8, Price:1:2, '$':10, ExtPRice:0:2);
            writeln('___________________________________________________________');
                  
            {End invoice item(s)}
            writeln('Subtotal:    ', '$':5, SubTotal:1:2);
            writeln('PST:         ', '$':5, PST:1:2);
            writeln('GST:         ', '$':5, GST:1:2);
            writeln('Total:       ', '$':5, Total:1:2);
            writeln('___________________________________________________________');
         end; {With InvoiceArray[index]}
      readln;
   end;

procedure search(var invArr : invoiceArray);
   var index     : integer;
       choiceStr : String;
   begin

      {Get keyword (choiceStr)}
      clrscr;
      write('Enter your name you want to search for: ');
      readln(choiceStr);
      clrscr;

      for index := 1 to MAX_RECORDS do
         if (invArr[index].name = choiceStr) then
            printArray(invArr, index);
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

procedure searchData(var invArr : invoiceArray);
   var cont : boolean;
       menuChoice : integer;
   begin
      while cont do
         begin
            clrscr;
            writeln('1) By invoice #');
            writeln('2) By purchaser');
            writeln('3) Back');

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
               2: {By purchaser}
                  begin
                     search(invArr);
                  end;
               3:
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
            writeln('2) Print records');
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