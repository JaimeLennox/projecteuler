program Problem243;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type
  fraction = record
    numerator:integer;
    denominator:integer;
  end;

var
  i:integer;
  current,val:fraction;

function Simplify(frac:fraction):boolean;
var
  i:integer;
begin
  Simplify:=false;
  for i := 2 to frac.numerator do
  if (frac.numerator mod i = 0) AND (frac.denominator mod i = 0) then
  Simplify:=true;
end;

function Resilience(a:integer):fraction;
var
  i:integer;
  propfrac:fraction;
  answer:fraction;
begin
  answer.numerator:=0;
  answer.denominator:=a-1;
  for i := 1 to a-1 do
  begin
    propfrac.numerator:=i;
    propfrac.denominator:=a;
    if not Simplify(propfrac) then
      answer.numerator:=answer.numerator+1;
  end;
  Resilience:=answer;
end;

begin
  try
    val.numerator:=15499;
    val.denominator:=94744;
    i:=11;
    repeat
      inc(i);
      current:=Resilience(i);
    until current.numerator / current.denominator < val.numerator / val.denominator;
    writeln(i);
    readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

end.
