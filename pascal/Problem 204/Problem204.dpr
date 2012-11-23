program Problem204;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  i,c,d,counter:integer;

const
  m:int64=20;
  limit:integer=5;

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

function factors(b:int64):boolean;
var
  a:integer;
  n:real;
begin
  factors:=false;
  n:=sqrt(b);
  for a := 2 to trunc(n) do
  begin
    if b mod a = 0 then
    if prime(a) = true then
    begin
      if a > limit then
      factors:=true;
      c:=c*a;
    end;
  end;
end;

function factors2:boolean;
begin
  factors2:=false;
  if m / c <> 1 then
  begin
    d:=m div c;
    if factors(d) then
    factors2:=true;
  end;
end;

function Test:boolean;
begin
  Test:=false;
  repeat
  if factors2 then
  Test:=true;
  until m / c = 1;
end;

begin
  counter:=0;
  for i := 1 to m do
  begin
    c:=1;
    if Test = false then
    begin
      inc(counter);
      writeln(counter);
    end;
  end;
  writeln('Done!');
  readln;
end.
