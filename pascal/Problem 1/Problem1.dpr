program Problem1;
{
Problem 1 - 05 October 2001
If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
Find the sum of all the multiples of 3 or 5 below 1000.
}

{$APPTYPE CONSOLE}

uses
  SysUtils;

const
  limit:integer = 1000;

var
  num1,num2,num3,sum1,sum2,sum3,total:integer;

procedure Initialise;
begin
  num1:=3;
  num2:=5;
  num3:=15;
  sum1:=0;
  sum2:=0;
  sum3:=0;
  total:=0;
end;

procedure next(m:integer;var num:integer);
begin
  num:=m + num;
end;

procedure Get3;
begin
  while num1 < limit do
  begin
    if num1 < limit then
    begin
      sum1:=sum1+num1;
      next(3,num1);
    end;
  end;
end;

procedure Get5;
begin
  while num2 < limit do
  begin
    if num2 < limit then
    begin
      sum2:=sum2+num2;
      next(5,num2);
    end;
  end;
end;

procedure Get15;
begin
  while num3 < limit do
  begin
    if num3 < limit then
    begin
      sum3:=sum3+num3;
      next(15,num3);
    end;
  end;
end;

begin
  Initialise;
  Get3;
  Get5;
  Get15;
  Total:=sum1+sum2-sum3;
  writeln(Total);
  readln;
end.
