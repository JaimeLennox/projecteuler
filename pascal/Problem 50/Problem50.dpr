program Problem50;

{
The prime 41, can be written as the sum of six consecutive primes:

41 = 2 + 3 + 5 + 7 + 11 + 13
This is the longest sum of consecutive primes that adds to a prime below one-hundred.

The longest sum of consecutive primes below one-thousand that adds to a prime, contains 21 terms, and is equal to 953.

Which prime, below one-million, can be written as the sum of the most consecutive primes?
}

{$APPTYPE CONSOLE}

uses
  SysUtils;

const
  max:integer=1000000;

var
  i:integer;

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
    end;
  end;
end;

{procedure factors2;
begin
  if m / c <> 1 then
  begin
    d:=m div c;
    factors(d);
  end;
end;}

begin
  for i := 1 to max - 1 do
  begin
  if prime(i) then
  factors(i);
  end;
end.
