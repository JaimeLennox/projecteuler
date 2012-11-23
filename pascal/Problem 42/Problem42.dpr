program Problem42;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  words:textfile;
  trianglenumbers:array of integer;
  i,j,a,b,counter:integer;
  wordvalue:integer;
  templine,line:string;
  currentword:string;
  new:boolean;

begin
  counter:=0;
  line:='';
  setlength(trianglenumbers,20);

  for j := 1 to 20 do
    trianglenumbers[j-1]:=j*(j+1) div 2;

  assignfile(words,'../../words.txt');
  reset(words);
  while not eof(words) do
  begin
    readln(words,templine);
    line:=line+templine;
  end;
  closefile(words);

  i:=0;
  a:=0;
  b:=1;
  new:=false;

  repeat
    inc(i);
    currentword:='';
    if line[i] = '"' then
      if b >= a then
        a:=i+1
      else
      begin
        b:=i-1;
        for j := a to b do
        currentword:=currentword+line[j];
        new:=true;
      end;
    if new then
    begin
      wordvalue:=0;
      for j := 1 to length(currentword) do
        wordvalue:=wordvalue+ord(currentword[j])-64;
      for j := 0 to 19 do
      if wordvalue = trianglenumbers[j] then
      inc(counter);
      new:=false;
    end;
  until i = length(line);

  writeln(counter);
  readln;

end.
