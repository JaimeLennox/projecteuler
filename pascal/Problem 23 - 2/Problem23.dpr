program Problem23;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  ar:array[1..28123] of integer;
  arr:array[1..395437503] of integer;
  i,j,k,sum:integer;
  checker:boolean;
  
function checkAbundant(a:integer):boolean;
var
  i:integer;
  sum:integer;  
begin
  sum:=0;
  for i:=1 to (a div 2) do
  if a mod i = 0 then
  sum:=sum+i;
  if sum > a then
  checkAbundant:=true else
  checkAbundant:=false;  
end;

begin
  j:=0;
  for i:=1 to 28123 do
  if checkAbundant(i) then
  begin
    ar[j]:=i;
	inc(j);
  end;
  j:=1;
  k:=2;
  repeat
  for i:=k to 28123-k+1 do
  begin
    arr[j]:=ar[k]+ar[i];
	inc(j);
  end;
  inc(k);
  until k = 28123;
  sum:=0;
  for j:=1 to 28123 do
  begin
    checker:=true;
    for i:=1 to 395437503 do
    if arr[i] = j then
	begin
      checker:=false;	
	  break;
	end;
    if checker = true then
	begin
	sum:=sum+j;
	writeln(sum);
	end;
  end;
  writeln(sum);
  readln;
end.
