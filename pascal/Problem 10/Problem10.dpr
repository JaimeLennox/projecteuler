program Problem10;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const
  limit:integer=2000000;

var
  i:integer;
  j:int64;

function prime(a:real):boolean;
var
  n,o:real;
  count:integer;
begin
  prime:=true;
  n:=sqrt(a);
  for count := 2 to trunc(n) do
  begin
    o:=round(a / count);
    if a = (o * count) then
    begin
    prime:=false;
    end;
  end;
end;

begin
j:=0;
for i := 2 to limit do
if prime(i) = true then
j:=j+i;
writeln(j);
readln;
end.
