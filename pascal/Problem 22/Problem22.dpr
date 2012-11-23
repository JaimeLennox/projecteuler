program Problem22;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  ULinkedListClass in 'ULinkedListClass.pas';

var
  names:textfile;
  nameslist:TLList;
  line,name,q,temp:string;
  i,total:integer;

begin
  //create list and initialise variables
  nameslist:=TLList.Create;
  line:='';
  //read each line to a single long string
  assignfile(names,'../../names.txt');
  reset(names);
  while not eof(names) do
  begin
    read(names,temp);
    line:=line+temp;
  end;
  name:='';
  q:='';
  //add names alphabetically to list
  for i := 1 to length(line) do
  begin
    if line[i] = '"' then
    q:=q+'"' else
    if (line[i] <> '"') AND (line[i] <> ',') then
    name:=name+line[i];
    if q = '""' then
    begin
      nameslist.Insert(name);
      name:='';
      q:='';
    end;
  end;
  //get total of namescores
  total:=0;
  for i := 1 to nameslist.Length do
    total:=total+(nameslist.GetItem(i)*i);
  nameslist.Destroy;
  //output
  writeln(total);
  readln;
end.
