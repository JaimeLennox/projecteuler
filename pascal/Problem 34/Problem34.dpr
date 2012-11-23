program Problem34;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  i,sum:integer;

const
  limit:integer=100000;  //upper bound proper estimate = 9999999, but this is quicker

function factorial(a:integer):integer;
var
  b,temp:integer;
begin
  if a = 0 then
  factorial:=1
  else
  if a = 1 then
  factorial:=1
  else
  if a = 2 then
  factorial:=2
  else
  begin
    b:=2;
    temp:=a;
    repeat
      temp:=temp*b;
      inc(b);
    until b = a;
    factorial:=temp;
  end;
end;

function checkDigits(a:integer):boolean;
var
  temp,temp2:string;
  b,sum:integer;
begin
  b:=1;
  sum:=0;
  temp:=inttostr(a);
  repeat
    temp2:=temp[b];
    sum:=sum+factorial(strtoint(temp2));
    inc(b);
  until b = length(temp) + 1;
  if sum = a then
  checkDigits:=true
  else checkDigits:=false;
end;

begin
sum:=0;
for i := 3 to limit do
if checkDigits(i) then
  begin
    writeln(i);
    sum:=sum+i;
  end;
writeln('The total sum is ',sum,'.');
readln;
end.
