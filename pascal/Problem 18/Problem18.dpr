program Problem18;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type
  Tarray = array of integer;   //triangle array
  BTarray = array of tarray;   //big triangle array
                               //Marray = main triangle array

procedure writeBTarray(MTarray:BTarray);
var
  i,j:integer;
begin
  for i := 0 to length(MTarray) - 1 do
  begin
    for j := 0 to length(MTarray[i]) - 1 do
    write(MTarray[i][j],' ');
    writeln;
  end;
end;

function parseTriangle:BTarray;  //read the triangle into the array of arrays!
var
  MTarray:BTarray;
  tfile:textfile;
  line:string;
  i,counter:integer;
begin
  counter:=0;
  setlength(MTArray, 0);
  assignfile(tfile,'../../triangle.txt');
  reset(tfile);
  while not eof(tfile) do
  begin
    setlength(MTarray, length(MTArray) + 1);
    setlength(MTarray[counter],length(MTarray[counter]) + 1);
    readln(tfile,line);
    for i := 1 to length(line) do
    if line[i] <> ' ' then
      MTarray[counter][length(MTarray[counter]) - 1] := strtoint(inttostr(MTarray[counter][length(MTarray[counter]) - 1]) + line[i])   //could fail here (on inttostr with no value
    else
      setlength(MTarray[counter],length(MTarray[counter]) + 1);
    inc(counter);
  end;
  parseTriangle:=MTarray;
end;

function sumTriangle(MTarray:BTarray):integer;
var
  i:integer;
  WTarray:BTarray; //working triangle array
begin
  if length(MTarray) = 1 then
    sumTriangle := MTarray[0][0]
  else
  begin
    setlength(WTarray,length(MTarray) - 1);
    for i := 0 to length(MTarray) - 2 do
      setlength(WTarray[i],length(MTarray[i]));
    for i := 0 to length(MTarray[length(MTarray) - 1]) - 2 do
    if MTarray[length(MTarray) - 1][i] > MTarray[length(MTarray) -1][i+1] then

  end;
end;

begin
  writeBTarray(parseTriangle);
  writeln(sumTriangle);
  readln;
end.
