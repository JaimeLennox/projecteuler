program Problem27;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const
  limit:integer=1000;

var
  primearray:array[1..168] of integer;
  a,b,i,j:integer;
  count,count2:int64;

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

procedure fillPrimeArray;
var
  i,count:integer;
begin
  count:=1;
  for i := 2 to 1000 do
  if prime(i) then
  begin
    primearray[count]:=i;
    inc(count);
  end;
end;

function primeFormula(a,b:integer):integer;
var
  count,check,p:integer;
begin
  count:=0;
  p:=0;
  repeat
    check:=(count*count)+(a*count)+(b);
    if check > 0 then
    if prime(check) then
    inc(count)
    else p:=1
    else p:=1;
  until p = 1;
  primeFormula:=count;
end;

begin
fillPrimeArray;
count:=0;
a:=0;
b:=0;
for j :=1 to 168 do
for i := 0 to (limit - 1) do                                //positive a
begin
  count2:=primeFormula(i,primearray[j]);
  if count < count2 then
  begin
    count:=count2;
    a:=i;
    b:=primearray[j];
  end;
end;
for j := 1 to 168 do                                       //negative a
for i := 0 to (limit - 1) do
begin
  count2:=primeFormula((i*-1),primearray[j]);
  if count < count2 then
  begin
    count:=count2;
    a:=(i*-1);
    b:=primearray[j];
  end;
end;
writeln('a = ',a);
writeln('b = ',b);
writeln('product = ',a*b);
readln;
end.
