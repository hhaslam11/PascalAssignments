program planets(Input, Output);

uses wincrt;

const SUN     = 27.94;
      MOON    = 0.17;
      SATURN  = 1.15;
      MERCURY = 0.37;
      MARS    = 0.38;
      URANUS  = 1.17;
      VENUS   = 0.88;
      JUPITER = 2.64;
      NEPTUNE = 1.18;

var FirstLetter, SecondLetter : char;
    Weight                    : real;

begin

   {Get Weight And Planet}
   write('Type your weight: ');
   readln(Weight);
   clrscr;

   writeln('What Planet would you like to see your weight on?');
   readln(FirstLetter, SecondLetter);
   clrscr;

   {Convert to upper case letters}
   FirstLetter  := UpCase(FirstLetter);
   SecondLetter := UpCase(SecondLetter);

   Case FirstLetter of
      'S': Case SecondLetter of
              'U': writeln('Your mass on the Sun is ',  (Weight * SUN):1:2);
              'A': writeln('Your mass on Saturn is ' ,  (Weight * SATURN):1:2);
           end;
      'M': Case SecondLetter of
              'E': writeln('Your mass on Mercury is ',  (Weight * MERCURY):1:2);
              'A': writeln('Your mass on Mars is ',     (Weight * MARS):1:2);
              'O': writeln('Your mass on the Moon is ', (Weight * MOON):1:2);
           end;
      'U': writeln('Your mass on Uranus is ',           (Weight * URANUS):1:2);
      'V': writeln('Your mass on Venus is ',            (Weight * VENUS):1:2);
      'J': writeln('Your mass on Jupiter is ',          (Weight * JUPITER):1:2);
      'N': writeln('Your mass on Neptune is ',          (Weight * NEPTUNE):1:2);
   end;{Case}

   {End Program}
   readln;
   donewincrt;

end.

{Planets}
{Kaleb Haslam}