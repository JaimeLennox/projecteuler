program Problem16;

{$APPTYPE CONSOLE}

uses
  SysUtils;
  
var
  x,temp:string;
  i:integer;
  y,sum:int64;

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

begin
  {temp:='0';
  for i := 1 to 2000 do
  begin
  temp:=BigNumAdd(temp,'2*i');
  writeln(temp);
  end;
  readln;}
  {readln(x);
  readln(y);
  writeln(BigNumMultiply(x,y));
  writeln;}
  {writeln('Length x: ', length(x));
  writeln('Length y: ', length(y));
  writeln('Length answer: ', length(BigNumAdd(x,y)));}
  temp:='2';
  for i:=1 to 999 do
  temp:=BigNumMultiply(temp,2);
  writeln(temp);
  sum:=0;
  for i:=1 to length(temp) do
  sum:=sum+strtoint(temp[i]);
  writeln(sum);
  readln;
end.
