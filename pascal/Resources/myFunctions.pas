unit myFunctions;

interface

implementation

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


function factors(b:int64):integer;
var
  a,x,c,temp:integer;
  n:real;
begin
  x:=1;
  n:=sqrt(b);
  temp:=0;
  for a := 2 to trunc(n) do
  begin
    if b mod a = 0 then
    if prime(a) = true then
    begin
      inc(x);
      c:=c*a;
    end;
  end;
  repeat
  if b/c <> 1 then
  ^factors(b div c);
  until b/c = 1;
  factors:=x;
end;

function power(mantissa,exponent:integer):int64;
var
  a,i:integer;
begin
  a:=1;
  for i := 1 to exponent do
  a:=a*mantissa;
  power:=a;
end;

end.