program Problem12;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  i,j:int64;

function CheckFactors(a:int64):int64;
var
  k,c:integer;
begin
  c:=0;    //initialize counter
  for k := 1 to trunc(sqrt(a)) do
  if a mod k = 0 then
  inc(c);
  CheckFactors:=c*2;
end;

begin
  i:=1;
  j:=2;
  while CheckFactors(i) < 500 do
  begin
    i:=i+j;
    inc(j);
  end;
  writeln(i);
  readln;
end.
