program data(input, output, diskFile);

uses wincrt;

const fileName = 'file.dat';
      LINE_LENGTH = 10;

type intFile  = file of integer;
     intArray = array [1..100] of integer;

var diskFile : intFile;
        i, x : integer;
        ints : intArray;

{Writes numbers 1-100 to file.dat}
procedure writeFile(var diskFile : intFile);
   begin
      assign(diskFile, fileName);
      rewrite(diskFile);
      for i := 1 to 100 do
         begin
            write(diskFile, i);
         end;
      close(diskFile);
   end;

procedure readAndAvg(var diskFile : intFile);
   var int1, int2, int3 : integer;
       avg              : real;
   begin
      reset(diskFile);

      Seek(diskFile, 10);
      read(diskFile, int1);
      
      Seek(diskFile, 57);
      read(diskFile, int2);
      
      Seek(diskFile, 60);
      read(diskFile, int3);
      
      avg := (int1 + int2 + int3);
      write(int1, '  ', int2, '  ', int3);
      writeln;
      write('Average: ');
      writeln(avg:1:1);
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
   begin
      x := 0;
      for i := 0 to 99 do
         begin
            if (x = LINE_LENGTH) then
               begin
                  writeln;
                  x := 0;
               end;
               write(' ', ints[i]);
               x := x + 1;
         end;{For loop}
   end;
   
begin
   writeFile(diskFile);
   readAndAvg(diskFile);
   toArray(diskFile);
   writeln;
   writeln;
   printArray(ints);
   
   {Exit Program}
   readln;
   donewincrt;
end.

{Data Files}
{Kaleb Haslam}