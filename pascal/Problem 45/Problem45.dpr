program Problem45;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  q:integer;
  n:int64;

function checkHex(x:real):boolean;
var
  a:real;
begin
  a:=frac((sqrt(8*x +1)+1)/4);
  if a = 0 then
  checkHex:=true
  else checkHex:=false;
end;

function checkPent(x:real):boolean;
var
  a,b:real;
begin
  a:=frac((sqrt(24*x +1)+1)/6);
  b:=trunc((sqrt(24*x +1)+1))/6;
  if (a = 0) and (b > 0) then
  checkPent:=true
  else checkPent:=false
end;

begin
  q := 0;
  n := 40756;
  repeat
  if checkHex(n) then
  if checkPent(n) then
  q := 1;
  inc(n);
  until q =1;
  n:=n-1;
  writeln(n);
  readln;
end.
