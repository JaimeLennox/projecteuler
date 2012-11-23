program Problem4;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  a:integer=999;
  b:integer=999;
  i,j:integer;

function palindrome(b:integer):boolean;
var
  p,q:string;
  k:integer;
begin
  palindrome:=false;
  q:='';
  p:=inttostr(b);
  for k := 1 to length(p) do
  q:=q+p[length(p)+1-k];
  {writeln(p);
  writeln(q);
  readln;}
  if p = q then
  palindrome:=true;
end;

begin
  for i := 100 to a do
  for j := 100 to i do
  if palindrome(i*j) = true then
  writeln(i*j);
  writeln('Done!');
  readln;
end.
