program Problem303;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  i,x,n:integer;
  sum:int64;
  primear:array[1..5000] of integer;
  
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
  
procedure GeneratePrimes(a:integer);  //generate a list of primes under the given number
var
	i,j:integer;
begin
  for i:=1 to 5000 do
  primar[i]:=0;
  j:=1;
  for i:=1 to a do
  if prime(i) then
  begin
   primar[j]:=i;
   inc(j);
  end;  
end;

function LPN(a:integer):int64; //function as defined in question
var
  i:integer;
  b:int64;
  str:string;
  low:boolean;
begin
  b:=a;
  repeat
  low:=false;
  str:=inttostr(b);
  for i:=1 to length(str) do
  if strtoint(str[i]) > 2 then
  begin
    low:=true;
	b:=b+a;
	break;
  end
  until low = false;
  LPN:=b;
end;
  
begin
  readln(x);
  sum:=0;
  for n:=1 to x  do
  for i:=1 to 1000 do
  if i <> 0 then
  if n 
  sum:=sum+(LPN(n) div n);
  writeln(sum);
  readln;
end.
