program Problem17;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  words:array[0..19] of string;
  words2:array[1..11] of string;
  i,counter,holder:integer;

const
  limit:integer=1000;

begin
  words[0]:='';
  words[1]:='one';
  words[2]:='two';
  words[3]:='three';
  words[4]:='four';
  words[5]:='five';
  words[6]:='six';
  words[7]:='seven';
  words[8]:='eight';
  words[9]:='nine';
  words[10]:='ten';
  words[11]:='eleven';
  words[12]:='twelve';
  words[13]:='thirteen';
  words[14]:='fourteen';
  words[15]:='fifteen';
  words[16]:='sixteen';
  words[17]:='seventeen';
  words[18]:='eighteen';
  words[19]:='nineteen';


  words2[1]:='twenty';
  words2[2]:='thirty';
  words2[3]:='forty';
  words2[4]:='fifty';
  words2[5]:='sixty';
  words2[6]:='seventy';
  words2[7]:='eighty';
  words2[8]:='ninety';
  words2[9]:='hundred';
  words2[10]:='and';
  words2[11]:='thousand';

  counter:=0;

  for i := 1 to 1000 do
  begin
    if i < 20 then
    counter:=counter+length(words[i])
    else if i < 100 then
    begin
      counter:=counter+length(words2[strtoint(inttostr(i)[1])-1]);
      counter:=counter+length(words[strtoint(inttostr(i)[2])]);
    end
    else if i = 1000 then
      counter:=counter+length(words[1])+length(words2[11])
    else if i mod 100 = 0 then
      counter:=counter+length(words[strtoint(inttostr(i)[1])])+length(words2[9])
    else
    begin
      holder:=strtoint(inttostr(i)[2]+inttostr(i)[3]);
      if holder < 20 then
        counter:=counter+length(words[holder])
      else
      begin
        counter:=counter+length(words2[strtoint(inttostr(holder)[1])-1]);
        counter:=counter+length(words[strtoint(inttostr(holder)[2])]);
      end;
      counter:=counter+length(words2[9]);
      counter:=counter+length(words2[10]);
      counter:=counter+length(words[strtoint(inttostr(i)[1])]);
    end;

  end;

  writeln(counter);
  readln;

end.
