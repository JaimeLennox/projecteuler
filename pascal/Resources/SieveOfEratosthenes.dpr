program SieveOfEratosthenes;

{Checks if a number is prime by using the Sieve of Eratosthenes?}

{$APPTYPE CONSOLE}

uses
  SysUtils;

const
  limit:integer=100;

var
  num:integer;
  i:integer;
  prime:array[1..100] of integer;

procedure SoE;
var
  i,j,a,c:integer;

begin
  i:=2;
  a:=2*i;
  j:=0;
  c:=2;
  while i < limit do
  begin
    while a <= limit do
    begin
      writeln(a);
      readln;
      prime[a]:=0;
      a:=a+i;
    end;
    while j = 0 do
    begin
      j:=prime[c];
      inc(c);
    end;
    i:=j;
    a:=2*i;
  end;
end;

begin
{readln(num);
if SoE(num) then
writeln('This number is prime.')
else writeln('This number is not prime.');}
SoE;
for i :=1 to limit do
writeln(prime[i]);
readln;
end.
