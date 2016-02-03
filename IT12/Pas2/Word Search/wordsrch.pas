program WordSearch (input, output);
uses wincrt;

const MAXROWS = 20;
      MAXCOLS = 20;
      MAXWORDS = 5;

type PuzzleArray = array [1..MAXROWS,1..MAXCOLS] of char;
     WordArray   = array [1..MAXWORDS] of string;

var Key, Puzzle : PuzzleArray;
    Words       : WordArray;

procedure GetWords(var Words: WordArray);
var Loop, Loop2 : integer;
begin
   writeln('Please enter ', MAXWORDS, ' words');
   For Loop := 1 to MAXWORDS do
     begin
       readln(Words[Loop]);
       For Loop2 := 1 to Length(Words[Loop]) do
          Words[Loop, Loop2] := upcase(Words[Loop, Loop2]);
     end;
end;  {GetWords}

procedure InitializeKey(var Key : PuzzleArray);
var Row, Col : integer;
begin
  For Row := 1 to MAXROWS do
    For Col := 1 to MAXCOLS do
       Key[Row, Col] := ' ';
end;  {InitializeKey}

procedure MakeKey(var Words : WordArray; var Key : PuzzleArray);
var StartRow, StartCol, Loop, Loop2, Counter, Temp : integer;
    Valid : boolean;

begin
   Randomize;
   For Loop := 1 to MAXWORDS do
     begin

       Case (Random(4) + 1) of
         1 : begin  {Sideways, normal writing}
                repeat
                    Valid := true;
                    StartRow  := random(MAXROWS) + 1;
                    StartCol  := random(MAXCOLS - length(Words[Loop]) + 1) + 1;
					
                    {Check if valid}
                    For Loop2 := 1 to Length(Words[Loop]) do
                       if Key[StartRow, StartCol + Loop2 - 1] <> ' ' then Valid := false;
                until Valid;
                   For Loop2 := 1 to Length(Words[Loop]) do
                      Key[StartRow, StartCol + Loop2 - 1] := Words[Loop, Loop2];

             end; {Case}

         2 : begin  {Sideways, backwards writing}
                repeat
				   Valid := true;
                   StartRow  := random(MAXROWS) + 1;
                   StartCol  := random(MAXCOLS - length(Words[Loop]) + 1) + 1;
				   
				   {Check if valid}
				   Counter   := 1;
				   For Loop2 :=  Length(Words[Loop]) downto 1 do
                      begin
                         if Key[StartRow, StartCol + Counter - 1] <> ' ' then Valid := false;
                         Counter := Counter + 1;
                      end;  {For}
				until Valid;

                Counter   := 1;
			    For Loop2 :=  Length(Words[Loop]) downto 1 do
                   begin
                      Key[StartRow, StartCol + Counter - 1] := Words[Loop, Loop2];
                      Counter := Counter + 1;
                   end;  {For}
								
              end;  {Case 2}
         3 : begin  {Down, normal writing}
               repeat
			      Valid     := true;
			      StartCol  := random(MAXCOLS) + 1;
                  StartRow  := random(MAXROWS - length(Words[Loop]) + 1) + 1;
			   
			      {Check if valid}
			      For Loop2 := 1 to Length(Words[Loop]) do
                     if Key[StartRow + Loop2 - 1, StartCol] <> ' ' then Valid := false;
				  
			   until Valid;
			   
               For Loop2 := 1 to Length(Words[Loop]) do
                  Key[StartRow + Loop2 - 1, StartCol] := Words[Loop,Loop2];
				  
             end;  {Case 3}
         4 : begin  {down, upward writing}
               repeat
			   
			      Valid     := true;
        		   StartCol  := random(MAXCOLS) + 1;
               StartRow  := random(MAXROWS - length(Words[Loop]) + 1) + 1;
			   
			      {Check if Valid}
			      Counter   := 1;
                  For Loop2 :=  Length(Words[Loop]) downto 1 do
                     begin
                        if Key[StartRow + Counter - 1, StartCol] <> ' ' then Valid := false;
                        Counter := Counter + 1;
                      end;  {For}
			   until Valid;
			   
               Counter   := 1;
               For Loop2 :=  Length(Words[Loop]) downto 1 do
                  begin
                     Key[StartRow + Counter - 1, StartCol] := Words[Loop,Loop2];
                     Counter := Counter + 1;
                   end;  {For}
				   
             end;  {Case 4}
          end;  {Case End}
     end;  {For Loop}
end;  {MakeKey}

procedure MakePuzzle(var Puzzle : PuzzleArray; 
                     Key        : PuzzleArray);
var Row, Col, Temp : integer;
begin
  Randomize;
  For Row := 1 to MAXROWS do
    For Col := 1 to MAXCOLS do
       begin
          Temp := (Random(90 - 65) + 1) + 65;
          if Key[Row, Col] = ' ' then Puzzle[Row, Col] := chr(Temp)
             else
                Puzzle[Row, Col] := Key[Row, Col];
       end;
   end;{MakePuzzle}
procedure DisplayPuzzle(var Key : PuzzleArray);
var Row, Col : integer;
begin
   For Row := 1 to MAXROWS do
      begin
         For Col := 1 to MAXCOLS do
            write(Key[Row, Col]);
         writeln;
      end;  {for Row}
 end;  {DisplayPuzzle}


begin {main}

   GetWords(Words);
   InitializeKey(Key);
   MakeKey(Words, Key);
   DisplayPuzzle(Key);
   readln;
   MakePuzzle(Puzzle, Key);
   DisplayPuzzle(Puzzle);

   readln;
   donewincrt;
end.

{Word Search}
{Kaleb Haslam}