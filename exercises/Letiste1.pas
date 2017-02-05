Program Letiste1;
{Program zjistí, zda je letadlo se zadaným doletem schopno doletět na 
všechna letiště. Kostru grafu neukládáme, modifikujeme původní graf.}

const	MaxLetist = 1000;
		MaxHran = 500000;											{(MaxLetist^2)/2}

type	Hrana = record
					V1, V2 : 1..MaxLetist;
					Delka : real
				end;

var	Hrany : array[1..MaxHran] of Hrana;
	Letiste : array[1..MaxLetist] of record x,y : integer end;	{Pole letišť se souřadnicemi x,y}
	Komponenta : array[1..MaxLetist] of 1..MaxLetist;				{Pro každý vrchol (letiště) jeho komponentu}
	Dolet : real;
	N : integer;													{Počet letišť}
	S : integer;													{Počet hran}
	Leti : boolean;													{Leti letadlo?}
	PomHrana : Hrana;
	i, j, k : integer;
	
begin

{Inicializace a vstup}
write('Zadejte počet letišť: ');
readln(N);

write('Zadejte dolet letadla: ');
readln(Dolet);

writeln('Zadejte postupně souřadnice letišť ve tvaru x,y');
for i:=1 to N do
	read(Letiste[i].x, Letiste[i].y);

{Vytvoření hran a výpočet vzdáleností mezi letišti}
S:=0;
for i:=1 to N do
	for j:=1 to N do
		begin
		if i<>j then
			begin
			S:=S+1;
			Hrany[S].V1:=i;
			Hrany[S].V2:=j;
			Hrany[S].Delka:=sqrt(sqr(Letiste[i].x-Letiste[j].x)+sqr(Letiste[i].y-Letiste[j].y));
			end;
		end;

{Každé hraně vlastní komponenta souvislosti}
for i:=1 to S do
	Komponenta[i]:=i;

{Seřazení hran podle jejich ohodnocení, třídění přímým výběrem}
for i:=1 to S-1 do
	begin
	k:=i;
	for j:=i+1 to S do
		begin
			if Hrany[j].Delka<Hrany[i].Delka then k:=j;
		if k<>i then
			begin
			PomHrana:=Hrany[k];
			Hrany[j]:=Hrany[i];
			Hrany[i]:=PomHrana;
			end;
		end;
	end;

{Hladový algoritmus - nalezení minimální kostry a úprava pole Hrany[]}
k:=0;
i:=0;
Leti:=true;
while (k<N-1) and Leti do
	begin
	i:=i+1;
	if Komponenta[Hrany[i].V1]<>Komponenta[Hrany[i].V2] then
		begin
		k:=k+1;
		if Hrany[i].Delka>Dolet then Leti:=false;
		for j:=1 to N do
			if Komponenta[j]=Komponenta[Hrany[i].V1] then Komponenta[j]:=Komponenta[Hrany[i].V2]
		end;
	end;

{Výpis výsledku}
if not Leti then
	writeln('Letadlu došlo palivo!')
else
	writeln('Letadlo je schopno doletět na všechna letiště');

end.
	
	
