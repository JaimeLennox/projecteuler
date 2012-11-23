program Problem25;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  counter:integer;
  i,j:string;

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

begin
  counter:=2;
  i:='1';
  j:='1';
  repeat
    i:=BigNumAdd(i,j);
    j:=BigNumAdd(i,j);
    counter:=counter+2;
  until (length(i) > 999) OR (length(j) > 999);
  if length(i) < length(j) then
  begin
    writeln(counter);
    writeln(j);
  end
  else
  begin
    writeln(counter-1);
    writeln(i);
  end;
  readln;
end.
