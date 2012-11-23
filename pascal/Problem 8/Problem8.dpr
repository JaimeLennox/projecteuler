program Problem8;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  num:array [1..5] of string;
  num2:string;
  num3:string;
  number: textfile;
  i,j,k,l:integer;
  max,max2:integer;

begin
  i:=1;
  k:=1;
  num3:='';
  max:=1;
  max2:=0;
  assignfile(number,'number.txt');
  reset(number);
  while not eof(number) do
  begin
    readln(number,num[i]);
    inc(i);
  end;
  closefile(number);
  for i := 1 to 5 do
  begin
    num2:=num[i];
    repeat
    for j:=k to k+4 do
    begin
      num3:=num3+num2[j];
    end;
    for l := 1 to 5 do
      begin
        max:=max*strtoint(num3[l]);
      end;
    if max > max2 then
    max2:=max;
    inc(k);
    num3:='';
    max:=1;
    until k=197;
    k:=1;
  end;
  writeln(max2);
  {for i := 1 to 5 do
  writeln(num[i]);}
  readln;
end.
