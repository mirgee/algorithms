program ChessboardTraversal;

type
	Index = 1..8;
	StackP = ^StackT;
	StackT = record
		s1 : Index;
		s2 : Index;
		step : integer;
		next : StackP;
	end;
var
	found : boolean;
	stack : StackP;
	U : StackP;
	start1,start2 : index;
	Move : array[index] of record d1,d2 : integer; end;
	S : array[index,index] of integer;
	i1,i2 : index;
	i,j : integer;

procedure insert(s1,s2 : index; step : integer);
var Pom : StackP;
begin
	new(Pom);
	Pom^.s1 := s1;
	Pom^.s2 := s2;
	Pom^.step := step;
	Pom^.next := stack;
	stack := Pom;
end;

function remove : StackP;
var Pom : StackP;
begin
	Pom:=Stack;
	Stack:=Stack^.next;
	remove:=Pom;
	{disposing later}
end;

begin	
move[1].d1 := 1; move[1].d2 := 2;
move[2].d1 := 2; move[2].d2 := 1;
move[3].d1 := 2; move[3].d2 := -1;
move[4].d1 := 1; move[4].d2 := -2;
move[5].d1 := -1; move[5].d2 := -2;
move[6].d1 := -2; move[6].d2 := -1;
move[7].d1 := -2; move[7].d2 := 1;
move[8].d1 := -1; move[8].d2 := 2;

write('Starting knight position: ');
readln(Start1, Start2);
for i:=1 to 8 do
		for j:=1 to 8 do S[i,j] := -1;
S[Start1,Start2] := 0;

Found := false;
new(Stack);

insert(Start1,Start2,0);

while (found=false) do
	begin
	j:=0;
	U := remove;														
	for i:=1 to 8 do 										
		begin
		i1 := U^.s1 + move[i].d1;
		i2 := U^.s2 + move[i].d2;
		{If on chessboard and not yet visited or visited following a wrong
		 branch}
		if (i1>=1) and (i1<=8) and (i2>=1) and (i2<=8) 
		and ((S[i1,i2]=-1) or (S[i1,i2]>=U^.step)) then	
			begin
				S[i1,i2] := U^.step+1;								
				insert(i1,i2,(S[i1,i2]));						
			end
		else j:=j+1;
		end;
	if (j=8) and (U^.step=63) then found:=true;	{Nowhere to move and step 63}
	dispose(U);					
	end;
if found=true then
	for i:=1 to 8 do
		begin
		for j:=1 to 8 do
			write(S[i,j]:4);
		writeln;
		end
else
	writeln('Path nonexistent');
writeln;
end.
