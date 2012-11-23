program Problem3;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  c,d:integer;
  p:int64;

const
  m:int64=600851475143;

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

procedure factors(b:int64);
var
  a:integer;
  n:real;
begin
  n:=sqrt(b);
  for a := 2 to trunc(n) do
  begin
    if b mod a = 0 then
    if prime(a) = true then
    begin
      writeln(a);
      c:=c*a;
    end;
  end;
end;

procedure factors2;
begin
  if m / c <> 1 then
  begin
    d:=m div c;
    factors(d);
  end;
end;

begin
  c:=1;
  factors(m);
  {repeat
  factors2;
  until m / c = 1;}
  writeln('Done!');
  readln;
end.



