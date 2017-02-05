program slucovani;

uses libSeznam;

var
	A,B,C : seznam;
	
function sloucit(A : seznam; B : seznam) : seznam;
var
	ap,bp : uPrvek;
	C : seznam;
begin
	C.init;
	ap := A.vyjmiPrvni; bp := B.vyjmiPrvni;
	while (ap<>A.konec) and (bp<>B.konec) do
	if ap^.data < bp^.data then begin C.vlozNaKonec(ap^.data); ap := A.vyjmiPrvni; end
		else begin C.vlozNaKonec(bp^.data); bp := B.vyjmiPrvni; end;
	if ap = A.konec then while bp^.dalsi<>nil do begin C.vlozNaKonec(bp^.data); bp:=bp^.dalsi; end;
	if bp = B.konec then while ap^.dalsi<>nil do begin C.vlozNaKonec(ap^.data); ap:=ap^.dalsi; end;
	sloucit := C;
end;

procedure setriditSlucovanim(var A : seznam);
var 
	i,n : integer;
	B : seznam;
begin
	n := A.velikost;
	writeln(n);
	if n > 1 then begin
		B.init;
		for i:=0 to (n div 2) do B.vlozNaKonec(A.vyjmiPrvni^.data);
		setriditSlucovanim(B);
		setriditSlucovanim(A);
		sloucit(B,A);
	end;
end;

begin
A.init; B.init; C.init;
A := seznamZeSouboru('sluc1'); B := seznamZeSouboru('sluc2');
C := sloucit(A,B);
C.vypsat;
end.
