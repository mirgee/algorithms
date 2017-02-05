program SpojovySeznam;
type
	Uk = ^Prvek;
	Prvek = record
		data : integer;
		dalsi : Uk;
	end;

var
	n : Uk;
	
function najdiDuplikat(n : Uk; d : integer) : boolean;
var nenalezen : boolean;
begin
	nenalezen := true;
	while nenalezen and (n<>nil) do
	begin
		if n^.data = d then begin najdiDuplikat := true; nenalezen := false end
		else n:=n^.dalsi;
	end;
	if nenalezen then najdiDuplikat := false;
end;

procedure Pridej(n : Uk; d : integer);
var q : Uk;
begin
if najdiDuplikat(n, d) = false then
begin
	while n^.dalsi <> nil do n:=n^.dalsi;
	new(q);
	q^.data := d;
	q^.dalsi := nil;
	n^.dalsi := q;
	end;
end;

procedure Vypis(n : Uk);
begin
	while n <> nil do
	begin
		writeln(n^.data);
		n := n^.dalsi;
	end;
end;

begin
new(n);
n^.data := 18;
n^.dalsi := nil;
Pridej(n, 23);
Pridej(n, 90);
Pridej(n, 40);
Pridej(n, 23);
Vypis(n);
end.
