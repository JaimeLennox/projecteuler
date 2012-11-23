program Problem13;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  i,j,count:integer;
  numfile:textfile;
  numarrstr:array[1..100] of string;
  smallsum:string;
  sum:int64;
begin
  //read each line into an array
  count:=0;
  assignfile(numfile,'numbers.txt');
  reset(numfile);
  while not eof(numfile) do
  begin
    inc(count);
    readln(numfile,numarrstr[count]);
  end;
  closefile(numfile);
  //add first 12 numbers of each big number
  sum:=0;
  for i := 1 to 100 do
  begin
    smallsum:='';
    for j := 1 to 11 do
      smallsum:=smallsum+numarrstr[i][j];
    sum:=sum+strtoint64(smallsum);
  end;
  //output
  write(sum);
  readln;
end.

