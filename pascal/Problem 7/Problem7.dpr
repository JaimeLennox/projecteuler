program Problem7;

{
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
What is the 10001st prime number?
}

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  h,i,j:integer;

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
  readln(h);
  j:=0;
  i:=1;
  while j <= h do
  begin
    if prime(i) = true then inc(j);
    inc(i);
  end;
  writeln(i-1);
  readln;
end.
