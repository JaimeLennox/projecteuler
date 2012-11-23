program Problem4;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  i,j,n,sum:integer;
begin
  i:=0;
  n:=1;
  sum:=1;
  while n < 1001*1001 do
  begin
	i:=i+2;
	for j:=1 to 4 do
	begin
	  n:=n+i;
	  sum:=sum+n;
	end;
  end;
  writeln(sum);
  readln;
end.
