program Problem4;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  p,a,b,c,solnum,highnum:integer;
  x,y:real;
begin
  highnum:=0;
  for p:=900 to 1000 do
  begin
  solnum:=0;
  for a:=1 to 1000 do
  for b:=1 to 1000 do
  for c:=1 to 1000 do
  begin
  x:=sqrt(a*a+b*b+c*c);
  y:=int(sqrt(a*a+b*b+c*c));
  if x = y then
  if a+b+c=p then
  inc(solnum);
  end;
  if solnum > highnum then
  begin
  highnum:=solnum;
  writeln(highnum);
  end;
  end;
  writeln(highnum);
  readln;
end.
