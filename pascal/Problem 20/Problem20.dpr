program Problem20;

{$APPTYPE CONSOLE}

uses
  SysUtils;
  
var
  x,sum:int64;
  i:integer;
  temp:string;

function BigNumAdd(a,b:string):string;
var
  i,p,q,smallsum,carry:integer;
  c,d,smallsumstr,sum,temp:string;
begin
  c:=a;
  d:=b;
  carry:=0;
  sum:='';
  if length(d) > length(c) then
  begin
    temp:=c;
    c:=d;
    d:=temp;
  end;
  for i:=1 to (length(c)-length(d)) do
  begin
    d:='0'+d;
  end;
  for i:=0 to (length(c)-1) do
  begin
    p:=strtoint(c[length(c)-i]);
    q:=strtoint(d[length(d)-i]);
    smallsum:=p+q+carry;
    smallsumstr:=inttostr(smallsum);
    if smallsum > 9 then
	  begin
      carry:=1;
	    sum:=smallsumstr[2]+sum;
    end
    else
    begin
      carry:=0;
      sum:=inttostr(smallsum)+sum;
    end;
  end;
  if carry <> 0 then
  sum:=inttostr(carry)+sum;
  BigNumAdd:=sum;
end;

function BigNumMultiply(a:string;b:int64):string;
var
  i:integer;
  total:string;
begin
  total:=a;
  for i:=1 to b-1 do
  total:=BigNumAdd(total,a);
  BigNumMultiply:=total;
end;

function Factorial(a:integer):string;
var
  i:integer;
  total:string;
begin
  total:='1';
  for i := 2 to a do
  total:=BigNumMultiply(total,i);
  Factorial:=total;
end;

begin
  readln(x);
  temp:=Factorial(x);
  writeln(temp);
  sum:=0;
  for i := 1 to length(temp) do
  sum:=sum+strtoint(temp[i]);
  writeln;
  writeln(sum);
  readln;
end.
