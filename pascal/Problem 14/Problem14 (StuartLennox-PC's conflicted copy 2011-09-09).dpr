program Problem14;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  i,j:integer;
  count1,count2,startnum:integer;

begin
count1:=0;
count2:=0;
  for i := 1 to 100000 do
  begin
  j:=i;
  repeat
    if j mod 2 = 0 then
    j:=j div 2
    else j:=3*j+1;
    inc(count1);
  until j=1;
  if count1 > count2 then
  begin
    count2:=count1;
    startnum:=i;
  end;
  count1:=0;
  end;
  writeln(startnum);
  readln;
end.
