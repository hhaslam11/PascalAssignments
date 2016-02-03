program Rot13(Input, Output);

uses wincrt;

var CorD : char;
    Phrase, NewPhrase : string;
    Loop : integer;

begin
    writeln('Do you wish to code or decode (C/D)');
    readln(CorD);
    CorD := upcase(CorD);
    if CorD = 'C' then writeln('Enter the phrase to be coded')
      else writeln('Enter the phrase to be decoded');
    readln(Phrase);
    NewPhrase := '';  {null or empty string}
    {code the phrase}
    For Loop := 1 to Length(Phrase) do
        begin
          Phrase[Loop] := upcase(Phrase[Loop]);
          if (Phrase[Loop] >= 'A') and (Phrase[Loop] <= 'M') then
             NewPhrase := NewPhrase + chr(ord(Phrase[Loop]) + 13)
             else if (Phrase[Loop] >= 'N') and (Phrase[Loop] <= 'Z') then
               NewPhrase := NewPhrase + chr(ord(Phrase[Loop]) - 13)
                 else NewPhrase := NewPhrase + Phrase[Loop];   {concatenation}
          {write(NewPhrase[Loop]);}
        end;  {For Loop}

    if CorD = 'C' then writeln('The coded version of your phrase is ')
      else writeln('The decoded version of your phrase is ');
     writeln(NewPhrase);
    {End Program}
    readln;
    donewincrt;

end.

{ROT13}
{Kaleb Haslam}