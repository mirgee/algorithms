program PruchodSachovniceZasobnik;
{
	* Zpusob realizace: zasobnik.
	* Z kazde pozice v zasobniku se pokusime jit vsemi smery. Pokud
	* budeme uvnitř šachovnice a pokud pole, na ktere se hodlame premistit
	* drzi cislo -1 nebo cislo vetsi nez cislo soucasne, zaznamename na toto
	* misto cislo kroku (ulozene v zaznamu zasobniku). Pokud se cislo kroku
	* bude rovnat 63, nalezeno:=true, jinak neudelame nic a pokracujeme
	* ve smycce. 
}
type
	Index = 1..8;
	ZasUk = ^Zasobnik;
	Zasobnik = record
		s1 : Index;
		s2 : Index;
		krok : integer;
		dalsi : ZasUk;
	end;
var
	Nalezeno : boolean;
	Zasob : ZasUk;
	Start1,Start2 : index;
	Tah : array[index,index] of integer;
	i1,i2 : index;

{Vlozi do zasobniku zaznam s informaci o souradnici a cislem kroku}	
procedure vloz(s1,s2 : index; krok : integer);
var Pom : ZasUk;
begin
	new(Pom);
	Pom^.s1 := s1;
	Pom^.s2 := s2;
	Pom^.krok := krok;
	Pom^.dalsi := Zasob;
	Zasob := Pom;
end;

{Navratovou hodnotou je prvni naboj v zasobniku}
function ven : ZasUk;
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

write('Pocatecni pozice kone: ');
readln(Start1, Start2);
for i:=1 to 8 do
		for j:=1 to 8 do S[i,j] := -1;
S[Start1,Start2] := 0;

Nalezeno := false;

new(Zasob);	
vloz(Start1,Start2,0);

while Nalezeno := false do
	U := Ven;														{Nabijeme}
	begin
	for i:=1 to 8 do 												{Zkusíme jít ze všech směrů ze současné souřadnice}
		begin
		i1 := U^.s1 + Tah[i];
		i2 := U^.s2 + Tah[i];
		if (i1>=1) and (i1<=8) and (i2>=1) and (i2<=8) then			{Pokud lezi na sachovnici}
			begin
			if (S[i1,i2]=-1) or (S[i1,i2]>Zasob^.Krok) then			{Pokud jsme tam jeste nebyli nebo byli pri neuspesnem pruchodu}
				begin
				S[i1,i2] := U^.Krok+1;								{Ulozime na misto cislo kroku o jeden vyssi}
				Vloz(i1,i2,U^.Krok+1);								{Vlozime toto misto do zasobniku}
				end
			else if U^.Krok=63 then									{Jinak se neni kam hnout a pokud pocet kroku je 63}
				Nalezeno := true;									{Reseni Nalezeno}
			end;
		end;
	end;

if Nalezeno=true then
	for i:=1 to 8 do
		begin
		for j:=1 to 8 do
			writeln(S[i,j]:4);
		writeln;
		end
else
	writeln('Cesta neexistuje');
writeln;
end;


