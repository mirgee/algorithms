program Autobus1;
{Program zjistí, do jakých stanic jsme schopni se dostat z města číslo
1. Nejdříve uloží vstup ve formě matice sousednosti, nalezne linky
vedoucí z města 1 průchodem matice, města těchto linek uloží do pole,
nalezne linky vedoucí z těchto měst průchodem matice, a tak dále.}

const	MaxMest = 1000;
		MaxLinek = 1000;
		
var	Matice : array[1..MaxLinek, 1..MaxMest] of -1..1;					{Matice[Linka,Mesto]}
	Zasob : array[1..MaxLinek] of 1..MaxMest;							{Zasobnik na Linky na pridani mest}
	Mesta : array[1..MaxMest] of 1..MaxMest;							{Mesta, do kterych se dostaneme}
	Vrchol : 1..MaxLinek;
	M : 1..MaxMest;
	L : 1..MaxLinek;
	i,j,k,n : integer;
	
begin
write('Zadejte počet měst: ');
readln(M);
write('Zadejte počet linek: ');
readln(L);

for i:=1 to L do
	for j:=1 to M do
		Matice[i,j]:=0;

writeln('Zadejte po řádcích města, kam jezdí jednotlivé linky: ');
for i:=1 to L do
	begin
	while not eoln do
		begin
		read(j);
		Matice[i,j]:=1;
		end;
	end;

{Linky z prvniho mesta}
k:=1;
Vrchol:=1;
Zasob[1]:=1;
for i:=1 to L do
	if Matice[i,1]=1 then
		begin
		Zasob[Vrchol]:=i;
		Vrchol:=Vrchol+1;
		k:=k+1;
		end;
		
{Pro kazdou linku ze zasobniku vyzkousime, ve kterých mestech se nachazi
dana linka - do techto mest se dostaneme, ulozime je do pole mest, do
kterych se dostaneme, nalezneme vsechny linky, ktere vedou z techto mest,
a ulozime je do zasobniku.}
Mesta[1]:=1;
n:=1;
while Vrchol>0 do
	begin
	for i:=1 to M do
		begin
		Vrchol:=Vrchol-1;
		if Matice[Zasob[Vrchol],i]=1 then 								{V seznamu mesta i je Linka ze zasobniku}
			begin
			n:=n+1;
			Mesta[n]:=i;												{Pridame mesto i do seznamu mest, kam se dostaneme}
			for j:=1 to L do
				if Matice[j,i]=1 then
					begin
					Vrchol:=Vrchol+1;
					Zasob[Vrchol]:=j;
					end;
			end;
		end;
	end;
	
{Vypis vysledku - vypis pole mesta}
for i:=1 to n do
	writeln(Mesta[n]);
	
end.

