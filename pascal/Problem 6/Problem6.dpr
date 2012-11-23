program Problem6;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  i,j,k,limit,ans:integer;

begin
  j:=0;
  k:=0;
  readln(limit);
  for i := 1 to limit do
  begin
    j:=j+sqr(i);
    k:=k+i;
  end;
  k:=sqr(k);
  if k > j then
  ans:=k-j
  else ans:=j-k;
  writeln(ans);
  readln;
end.
