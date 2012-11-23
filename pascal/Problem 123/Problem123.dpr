program Problem123;

{$APPTYPE CONSOLE}

uses
  SysUtils, Math;

const
  limit:integer=1000000000;

var
  rem:integer;
  i,j,k,l:integer;
  temp1,temp2,temp3:int64;

function prime(a:real):boolean;
var
  n,o:real;
  count:integer;
begin
  prime:=true;
  n:=sqrt(a);
  for count := 2 to round(n) do
  begin
    o:=round(a / count);
    if a = (o * count) then prime:=false;
  end;
end;

begin
  i:=2;
  j:=1;
  l:=1;
  temp1:=1;
  temp2:=1;
  rem:=1;
  while rem < limit do
  begin
    if prime(i) = true then
    begin
      for k := 1 to j do
      begin
        temp1:=temp1*(i-1);
        temp2:=temp2*(i+1);
      end;
      temp3:=i*i;
      rem:=(temp1 + temp2) mod temp3;
      inc(l);
      writeln(temp1);
      writeln(temp2);
      writeln(temp3);
      writeln(rem);
      writeln(j);
      readln;
    end;
    inc(i);
    j:=l;
    temp1:=1;
    temp2:=1;
  end;
  writeln(j-1);
  readln;
end.
