program TextFile(Input, Output, DiskFile);
uses wincrt;

var DiskFile : Text;

procedure MakeFile(var DiskFile : Text; Name : String);
   begin
      Assign(DiskFile, Name);
   end;

procedure ReadFile(var DiskFile : Text);
   var Ch : char;
   begin
      Reset(DiskFile);
      while NOT EOF(DiskFile) do
         begin
            while NOT EOLN(DiskFile) do
               begin
                  read(DiskFile, Ch);
                  write(Ch);
               end;{Not EOLN}
            writeln;
            readln(DiskFile);
         end;{Not EOF}
         Close(DiskFile);
   end;

procedure WriteFile(var DiskFile : Text; WriteString : String);
   begin
      Rewrite(DiskFile);
      writeln(DiskFile, WriteString);
      Close(DiskFile);
   end;

procedure AddToFile(var DiskFile : Text; WriteString : String);
   begin
      Append(DiskFile);
      writeln(DiskFile, WriteString);
      Close(DiskFile);
   end;

begin

   MakeFile(DiskFile, 'TextFile.txt');
   ReadFile(DiskFile);
   readln;
   clrscr;

   WriteFile(DiskFile, 'Test String');
   ReadFile(DiskFile);
   readln;
   clrscr;

   AddToFile(DiskFile, 'Another Test String');
   ReadFile(DiskFile);

   {End program}
   readln;
   donewincrt;

end.

{Text File}
{Kaleb Haslam}