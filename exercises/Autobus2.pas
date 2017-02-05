program Autobus2;
{Program pro danou dvojici měst určí nejlevnější spojení. Pokud existuje
více různých tras s nejnižší cenou jízdného, vybere tu nejrychlejší.
Užitá metoda: Djisktrův algoritmus a matice incidence}

const 	MaxMest=1000;
		MaxLinek=1000;

var	Cena, Cas : array[1..MaxLinek, 1..MaxMest] of integer;			{Neorientovaný ohodnocený graf - matice incidence}
	HC, HT : array[1..MaxMest] of integer;
	P : array[1..MaxMest] of 0..MaxMest;								{P[i] je predchudce mesta i na nejlevnejsi ceste}
	Docas : array[1..MaxMest] of boolean;								{Seznam mest s docasnou hodnotou}
	M, m1, m2, Start, Cil : 1..MaxMest;
	L : 1..MaxLinek;
	Pruchod : boolean;
	i,j,k : integer;
	
	
begin
write('Zadejte pocet mest: ');
readln(M);
write('Zadejte pocet linek: ');
readln(L);

for i:=1 to M do
	begin
	HC[i]:=MaxInt;
	HT[i]:=MaxInt;
	Docas[i]:=True;
	for j:=1 to L do
		begin
		Cena[j,i]:=MaxInt;
		Cas[j,i]:=MaxInt;
		end;
	end;

writeln('Zadejte informace o spojich ve tvaru MESTO1 MESTO2 CENA CAS: ');
for i:=1 to L do
	begin
	read(m1,m2);
	read(Cena[i,m1], Cas[i,m1]);
	Cena[i,m2]:=Cena[i,m1];
	Cas[i,m2]:=Cas[i,m1];
	end;
write('Zadejte startovni a cilove mesto: ');
readln(Start,Cil);

P[Start]:=0;
HC[Start]:=0;
HT[Start]:=0;
Pruchod:=true;

while Pruchod and Docas[Cil] do
	begin
	k:=Cil;
	for i:=1 to M do
		if Docas[i] and (HC[i]<HC[k]) then k:=i;						{k je mesto s nejnizsi docasnou hodnotou casu}
	if HC[k]=MaxInt then Pruchod:=false
	else
		begin
		Docas[k]:=false;
		for i:=1 to L do
			if Cena[i,k]<MaxInt then 									{i je linka vedouci z mesta k}
				for j:=1 to M do
					begin
					if Cena[i,j]+HC[k]<HC[j] then
						begin
						HC[j]:=Cena[i,j]+HC[k];
						HT[j]:=Cas[i,j]+HT[k];
						P[j]:=k;
						end
					else
						if Cena[i,j]+HC[k]=HC[j] then
							if Cas[i,j]+HT[k]<HT[j] then
								begin
								HT[j]:=Cas[i,j]+HT[k];
								P[j]:=k
								end;
					end;
		end;
	end;

if HC[Cil]=MaxInt then writeln('Cil je nedostupny')
else
	begin
	writeln('Výpis výsledku pozpátku od cílového města k počátečnímu');
	i:=Cil;
	while i<>Start do
		begin
		writeln(i);
		i:=P[i];
		end;
	writeln(Start);
	end;

end.
