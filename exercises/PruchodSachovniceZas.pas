program PruchodSachovniceZas;
{
	Bude pouzit zasobnik.
	Z kazde pozice se pokusime jit na vsechny smery, jejichz souradnice
	zaznamename, spolecne s cislem kroku, ktery provadime, do zasobniku.
	Pokud se cislo kroku bude rovnat 63, konec. Pokud ne a nebude mozne
	se nikam pohnout, krok proste preskocime a pokracujeme zbytkem
	zasobniku.
}
type
	ZasUk = ^Zasobnik;
	Zasobnik = record
		s1,s2 : integer;
		krok : 1..63;
		dalsi : ZasUk;
		rodic: ZasUk;	{Pole, ze ktereho jsme se na aktualni dostali}
	end;
var
	Tah : array[1..8] of record d1,d2 : integer end;
	S : array[1..8,1..8] of integer;
	Nalezeno : boolean;
	Start1, Start2 : integer;
	Zasob : ZasUk;
	i,j : integer;
	U : ZasUk;
	i1,i2 : integer;

procedure Vloz(s1,s2,krok : integer; rodic : ZasUk);
var Pom : ZasUk;
begin
	new(Pom);
	Pom^.s1 := s1;
	Pom^.s2 := s2;
	Pom^.Dalsi := Zasob;
	Pom^.Rodic := rodic;
	Zasob := Pom;
end;

function Ven : ZasUk;
var Pom : ZasUk;
begin
	new(Pom);
	Pom := Zasob;
	Zasob := Zasob^.Dalsi;
	Ven := Pom;
	dispose(Pom);
end;

begin
Tah[1].d1 := 1; Tah[1].d2 := 2;
Tah[2].d1 := 2; Tah[2].d2 := 1;
Tah[3].d1 := 2; Tah[3].d2 := -1;
Tah[4].d1 := 1; Tah[4].d2 := -2;
Tah[5].d1 := -1; Tah[5].d2 := -2;
Tah[6].d1 := -2; Tah[6].d2 := -1;
Tah[7].d1 := -2; Tah[7].d2 := 1;
Tah[8].d1 := -1; Tah[8].d2 := 2;

for i:=1 to 8 do
	for j:=1 to 8 do
		S[i,j]:= -1;
		
write('Pocatecni pozice kone: ');
readln(Start1);
readln(Start2);
i1 := Start1;
i2 := Start2;
S[Start1,Start2]:= 0;
Nalezeno := false;
new(Zasob);

Vloz(Start1,Start2,0,nil);

while Nalezeno = false do
	begin
	Zasob^.Krok := Zasob^.Krok+1;
	j:=1;
	{Zkusime vsechny pozice z aktualni pozice v zasobniku, kam je ulozime}
	for i:= 1 to 8 do
		begin
		i1 := Zasob^.s1 + Tah[i].d1;
		i2 := Zasob^.s2 + Tah[i].d2;
		if ((i1 >= 1) and (i1 <= 8) and (i2 >= 1) and (i2 <= 8)) then 	{Lezi na sachovnici}		
			begin
			if (Zasob^.Krok<=63) and (S[i1,i2]=-1) then
				begin
				Vloz(i1,i2,Zasob^.Krok,Zasob);
				S[i1,i2]:= Zasob^.Krok;
				writeln('Hmm');
				end
			else
				begin
				U:=Ven;
				S[i1,i2]:=-1;
				j:=j+1;
				writeln('Tady!');
				end;
			end	
		end;
	if (j=8) and (U^.Krok=63) then begin Nalezeno := true; writeln('Yes!'); end;
end;
end.
