program Problem55;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const
  limit:integer=10000;

var
  i,count:integer;
  x:int64;

function Palindrome(palinpot:string):boolean;
var
  nospace,reverse:string;
  i:integer;
begin
  palinpot:=UpperCase(palinpot);
  nospace:='';
  for i := 1 to length(palinpot) do
  begin
    if palinpot[i] <> ' ' then
    nospace:=nospace+palinpot[i];
  end;
  reverse:='';
  for i:=1 to length(nospace) do
  begin
    reverse:=nospace[i]+reverse;
  end;
  if palinpot = reverse then
  Palindrome:=true
  else Palindrome:=false;
end;

function Reverse(a:integer):integer;
var
  i:integer;
  str1,str2:string;
begin
  str2:='';
  str1:=inttostr(a);
  for i := 1 to length(str1) do
  str2:=str2+str1[length(str1)-i+1];
  Reverse:=strtoint(str2);
end;

procedure Lyrchel(var a:integer);
begin

end;

function checkLychrel(var a:int64):boolean;
var
  b,p,q,counter:integer;
begin
  p:=0;
  q:=0;
  counter:=0;
  checkLychrel:=false;
  repeat
  b:=Reverse(a);
  if palindrome(inttostr(a+b)) then
  begin
    p:=1;
    q:=1;
  end
  else
  a:=a+b;
  inc(counter);
  if counter = 15 then
  begin
    p:=2;
    q:=1;
  end;
  until q = 1;
  if p = 0 then
  checkLychrel:=true;
end;

begin
  count:=0;
  writeln('Lychrel Numbers:');
  for i := 1 to limit do
  begin
  x:=i;
  if checkLychrel(x) then
  begin
    writeln(x);
    inc(count);
  end;
  end;
  writeln('Lychrel numbers under ',limit,':');
  writeln(count);
  readln;
end.

