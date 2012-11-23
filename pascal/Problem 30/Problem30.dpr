program Problem30;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const
  limit:integer=1000000;

var
  i,j:integer;
  sum,total:integer;
  numstr:string;

begin
  total:=0;
  writeln('Numbers found:');
  for i :=2 to limit do
  begin
    sum:=0;
    numstr:=inttostr(i);
    for j := 1 to length(numstr)do
    sum:=sum+strtoint(numstr[j])*strtoint(numstr[j])*
    strtoint(numstr[j])*strtoint(numstr[j])*strtoint(numstr[j]);
    if sum = strtoint(numstr) then
    begin
      writeln(sum);
      total:=total+sum;
    end;
  end;
  writeln('Sum of numbers = ',total);
  readln;
end.
