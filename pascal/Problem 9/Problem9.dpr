program Problem9;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  a,b:integer;
  ans,temp:real;

begin
  for a := 1 to 999 do
    begin
      for b := 1 to 999 do
        begin
        temp:=sqr(a)+sqr(b);
        temp:=sqrt(temp);
          if a + b + temp = 1000 then
          begin
          writeln(a);
          writeln(b);
          writeln(a*b*trunc(temp));
          readln;
          end;
        end;
    end;
end.
