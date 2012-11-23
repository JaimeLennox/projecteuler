program Problem23;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  i:integer;

function SumDivisors(a:integer):integer;
var
  i,b:integer;
begin
  b:=0;
  for i := 2 to (a div 2) do
  if a mod i = 0 then
  b:=b+i;
  SumDivisors:=b+1;
end;

begin
  for i := 1 to 28123 do
  begin

  end;
end.
