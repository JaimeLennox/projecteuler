program Problem187;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type
  //array to hold list of factors for a given number
  TFactorsArray = array of int64;

var
  i,count:integer;

//checks if a number is prime
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

//calculates factors of a given number
function Factors(a:int64):TFactorsArray;
var
  i:integer;
  n:real;
  factorarray:TFactorsArray;
begin
  SetLength(factorarray,1);
  n:=sqrt(a);
  for i := 2 to trunc(n) do
  if a mod i = 0 then
  if prime(i) then
  if prime(a div i) then
  begin
    Factorarray[length(factorarray)-1]:=i;
    setlength(factorarray,Length(factorarray)+1);
  end;
  Factors:=Factorarray;
end;

begin
  count:=0;
  for i := 1 to 1000000 do
    if length(factors(i)) = 2 then
    inc(count);
  writeln(count);
  readln;
end.
