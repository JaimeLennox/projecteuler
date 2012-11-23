unit ULinkedListClass;
// defines a simple linked-list class using pointers
//for completion by students

interface

type
  PLList=^TListNode;         // a pointer to a node

  TListNode= record           // node definition:
   data:string;             // to hold the name
   namescore:integer;       //to hold the namescore
   next:PLList;            // to point to the next node
   end;


  TLList=class

  private
    Flength:integer;
    FStart:PLList;
  public


    constructor Create;
    destructor Destroy;override;
    procedure Insert(s:String); //insert s into alphabetical order
    function Delete(s:string):boolean; //remove s if it exists, return false if not found
    function GetItem(n:integer):integer; //return nth item in list
    function Empty:boolean;

    property Start:PLList read FStart write FStart;
    property Length:integer read FLength write FLength;
  end;

implementation

{ TLList }

constructor TLList.Create;
begin
  inherited;
  Start:=nil;
  FLength:=0;
end;

function getNScore(a:string):integer;
var
  i,j:integer;
begin
  j:=0;
  for i := 1 to length(a) do
  j:=j+ord(a[i])-64;
  getNScore:=j;
end;

procedure TLList.Insert(s: String);
//insert s into list, maintaining alphabetical order

var current,newnode:PLlist;

begin
  new(newnode);               // create new node
  newnode^.data:=s;           // populate with string s
  newnode^.namescore:=getNScore(s);
  newnode^.next:=nil;


  if FStart=nil then               // special case: List is empty
     FStart:=newnode  //fill this in yourself
  else
  begin
     if newnode^.data < FStart^.data then       //special case: new node becomes start of list
     begin
        newnode^.next:=Fstart;   //fill this in yourself
        FStart:=newnode;
     end
     else                                //general case: insert new node in correct place
     begin
        current:=FStart;                   // make copy of start pointer
        while (current^.next<> nil)
          and (current^.next^.data<s) do  // traverse until correct node is reached
        current:=current^.next;    //follow pointer to next node

      newnode^.next:=current^.next;  //set newnode's pointer to point to node after current
      current^.next:=newnode;//change current's pointer to point to the new node
     end;
  end;
  inc(FLength);
end;

function TLList.Delete(s: string): boolean;
//step through the list and remove the first item matching s, if one exists
//return false if no item removed, else return true
var
  Current,scrap:PLList;
begin
    if FStart=nil then result:=false
      else
      if FStart^.data=s then           //special case: first item is to be removed
      begin
        scrap:=FStart;
        FStart:=FStart^.next;   //fill this in yourself
        dispose(scrap);
        dec(Flength);
        result:=true;
      end
        else                         //general case
        begin
          Current:=FStart;
          while (Current^.next<>nil)         //traverse until end of list or match found
             and (Current^.next^.data<>s) do
               Current:=Current^.next;
          if Current^.next=nil then result:=false      //string not found
            else                                       //string found
            begin
               scrap:=Current^.next;
               Current^.next:=Current^.next^.next;
               dispose(scrap);
               dec(FLength);
               result:=true;
            end;

      end;
end;

destructor TLList.Destroy;
//destroy List by traversing list and releasing all nodes
//post condition: Startt=nil
var
  scrap:PLList;
begin
   while FStart<>nil do      //loop until nil pointer is reached
     begin
     scrap:=FStart;          //scrap now points to front node
     FStart:=FStart^.next;        //Start now points to next node
     dispose(scrap);    //former front node now released
     end;

end;

function TLList.Empty: boolean;
//returns true if  List is empty else false
begin
  if FStart=nil then Empty:=true
  else Empty:=false;
end;

function TLList.GetItem(n: integer): integer;
var
  current:PLList;
  nodenum:integer;
begin
  if (FStart=nil) or (n>FLength) or (n<1) then result:=0 //deal with impossible requests
  else
    if n=1 then result:=FStart^.namescore      //special case:first node required
    else
      begin
        current:=Fstart;                              //general case
        for nodenum:=1 to n-1 do                  //fill this in yourself
        current:=current^.next;           //start at the beginning
        result:=current^.namescore;            //follow the pointers to the nth node
      end;
end;



end.
