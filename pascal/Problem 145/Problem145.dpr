program Problem145;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  n,i,j,k,count,counter:integer;
  list:array of integer;
  p:boolean;

function checkOdd(a:string):boolean;
var
  i:integer;
begin
  checkOdd:=true;
  for i := 1 to length(a) do
  if strtoint(a[i]) mod 2 = 0 then
  begin
    checkOdd:=false;
    break;
  end;
end;

function CheckReversible(a:integer):integer;
var
  i,d:integer;
  b,c:string;
begin
  c:='';
  b:=inttostr(a);
  for i := 0 to length(b)-1 do
  c:=c+b[length(b)-i];
  if c[1] = '0' then
  checkReversible:=0
  else
  begin
    d:=strtoint(c);
    if checkOdd(inttostr(a+d)) then
    CheckReversible:=d
    else checkReversible:=0;
  end;
end;

begin
  SetLength(list,1);
  count:=0;
  counter:=0;
  readln(n);
  for i := 1 to n-1 do
  begin
    p:=false;
    for k := 0 to length(list) do
    if list[k] = i then
    begin
      p:=true;
      break;
    end;
    if p = false then
    begin
      j:=checkReversible(i);
      if j <> 0 then
      begin
        count:=count+2;
        list[counter]:=j;
        inc(counter);
        SetLength(list,counter+1);
      end;
    end;
  end;
  writeln(count);
  readln;
end.