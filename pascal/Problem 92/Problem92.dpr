program Problem92;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  i,counter:integer;
  
function p92(a:integer):boolean;
var
  b:string;
  j,sum:integer;
begin
  sum:=0;
  b:=inttostr(a);
  for j := 1 to length(b) do
    sum:=sum+strtoint(b[j])*strtoint(b[j]);
  if sum = 1 then
  p92:=false
  else if sum = 89 then
  p92:=true
  else if p92(sum) then
  p92:=true
  else p92:=false;
end;

begin
  counter:=0;
  for i:=1 to 10000000-1 do
  if p92(i) then
  begin
    inc(counter);
  end;
  writeln(counter);
  readln;
end.
