program Problem13;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  i,k,sum,count:integer;
  numfile:textfile;
  numarrstr:array[1..100] of string;
  calcarr:array[1..50] of string;
  overflowarr:array[1..50] of integer;
  sumstr,overflowstr,finalnum,extra1,extra2:string;
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
  //initialise overflowarr
  for i := 1 to 50 do
    overflowarr[i]:=0;
  //add columns
  for k := 50 downto 1 do
  begin
    sumstr:='';
    //initial sum
    for i := 1 to 100 do
      sumstr:=sumstr+numarrstr[i][k];
    sum:=strtoint(sumstr[3]);
    //add overflow
    sum:=sum+overflowarr[k];
    //copy to final number
    calcarr[k]:=inttostr(sum);
    //check for near end special cases
    if k > 2 then
    begin
      //calculate new overflow(s)
      overflowarr[k-2]:=overflowarr[k-2]+strtoint(sumstr[1]);
      overflowarr[k-1]:=overflowarr[k-1]+strtoint(sumstr[2]);
    end else
    //special case #1
    if k = 2 then
    begin
      overflowarr[k-1]:=overflowarr[k-1]+strtoint(sumstr[2]);
      extra2:=sumstr[1];
    end else
    //special case #2
    if k = 1 then
    begin
      extra2:=extra2+sumstr[2];
      extra1:=sumstr[1];
    end;
  end;
  //get final number in string form
  finalnum:='';
  for i := 1 to 50 do
  finalnum:=finalnum+calcarr[i];
  //add extras from special cases;
  finalnum:=extra1+extra2+finalnum;
  //output first 10 digits
  for i := 1 to 10 do
    write(finalnum[i]);
  readln;
end.
