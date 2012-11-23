program Problem18;

{$APPTYPE CONSOLE}

uses
  SysUtils;
	
var
  i:integer;
  trifile:textfile;
  length,l:integer;
  linestr,linestr2:string;
  linestrarr:array of integer;
  linestrarr2:array of integer;
	
begin
  assignfile(trifile,'trifile.txt');
  reset(trifile);
  while not eof(trifile) do
  begin
    inc(length);
  end;
  repeat
    l:=length;
    repeat
      readln(trifile, linestr);
	  if l = 1 then linestr2:=linestr;
      dec(l);
    until l = 0;
	{magic start}
	SetLength(linestrarr,length(linestr) div 2);
	SetLength(linestrarr2,length(linestr2) div 2);
	for i:=1 to length(linestr) div 2) do
	linestrarr:=	
	for i:=1 to length(linestr)-2 do
	begin
	     
	end;
	{magic end}
    dec(length);
  until length = 0;  
end.