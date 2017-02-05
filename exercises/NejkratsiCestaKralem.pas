program NejkratsiCestaKralem;
{
	Nejkratsi cesta kralem sachovym polem.
	Na vstupu bude zadano startovni, cilove pole a seznam zakazanych poli.
}
type	Index = 1..8;
var
	S : array[Index,Index] of integer;					{Sachove pole}
	Tah : array[Index] of record d1,d2 : integer; end;	{Seznam moznych tahu krale}
	PocetZakaz : integer;
	Start1,Start2 : Index;								{Startovni pole}
	Cil1,Cil2 : Index;									{Cilove pole}
	Krok : integer;										{Iterator kroku}
	Smer : Index;										{Index v poli Tah}
	i1,i2 : Index;
	j1,j2 : Index;
	i,j,x : integer;

begin
{Inicializace pohybu krale}
Tah[1].d1:=1; Tah[1].d2:=0;
Tah[2].d1:=1; Tah[2].d2:=1;
Tah[3].d1:=0; Tah[3].d2:=1;
Tah[4].d1:=-1; Tah[4].d2:=1;
Tah[5].d1:=-1; Tah[5].d2:=0;
Tah[6].d1:=-1; Tah[6].d2:=-1;
Tah[7].d1:=0; Tah[7].d2:=-1;
Tah[8].d1:=1; Tah[8].d2:=-1;

{Inicializace sachovnice}
write('Pocatecni pozice krale');
readln(Start1,Start2);
write('Cilova pozice krale');
readln(Cil1,Cil2);
write('Zakazana pole (nejdrive pocet dvojic):');
readln(PocetZakaz);

for i:=1 to 8 do
	for j:=1 to 8 do
		S[i,j]:=-1;
		
x:=1;
while (x<>PocetZakaz) do
	begin
	readln(i,j);
	S[i,j]:=-2;
	x:=x+1;
	end;
		
S[Start1,Start2]:=0;
Krok:=1;

while (S[Cil1,Cil2]=-1) or (Krok<>64) do
	begin
	for i1:=1 to 8 do
		for i2:=1 to 8 do
			if (S[i1,i2]=krok-1) and (S[i1,i2]<>-2) then
				for Smer:=1 to 8 do
					begin
					j1:=i1+Tah[Smer].d1;
					j2:=i2+Tah[Smer].d2;
					if(i1>=1)and(i1<=8)and(i2>=1)and(i2<=8)and(S[j1,j2]<>-1) then
						S[j1,j2]:=Krok;
					end;
	Krok:=Krok+1;
	end;
end.


