program PascalCode(Input, Output, DiskFile, NewFile);
uses wincrt;

var DiskFile, NewFile  : Text;

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

procedure RemoveComments(var DiskFile, NewFile : Text);
   var Ch : char;
   begin
      Reset(DiskFile);
      rewrite(NewFile);
      while NOT EOF(DiskFile) do
         begin
            while NOT EOLN(DiskFile) do
               begin
                  read(DiskFile, Ch);
                  if Ch = '{' then
                    repeat
                       write(NewFile, ' ');
                       read(DiskFile,Ch);
                     Until Ch = '}'
                       else write(NewFile,Ch);
               end;{Not EOLN}
            writeln(NewFile);
            readln(DiskFile);
         end;{Not EOF}
         Close(DiskFile);
         close(NewFile);
   end;

procedure MakeFile(var DiskFile, NewFile : Text);
   begin
      Assign(DiskFile, 'pascode.pas');
      assign(NewFile,'newtext.txt');
   end;

begin
   MakeFile(DiskFile,NewFile);
   RemoveComments(Diskfile, NewFile);
   {ReadFile(DiskFile);}
   readFile(NewFile);
end.

{Pascal Code}
{Kaleb Haslam}