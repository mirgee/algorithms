
program Letiste2;
{Program nalezne nejkratsi cestu mezi letisti Start,Cil zadanymi pravouhlymi
souradnicemi x,y podle poctu presedani. Je zadan dolet letadla, pocet letist,
startovni a cilove letiste.
Metoda: pruchod do hloubky pomoci zasobniku, matice vzdalenosti}

const	MaxLetist = 1000;
	MaxHran = 500000;

var	Matice : array[1..MaxLetist,1..MaxLetist] of real;
	Letiste : array[1..MaxLetist] of record x,y : integer end;
	Zasobnik : array[1..MaxLetist] of 1..MaxLetist;
	Prestup : array[1..MaxLetist] of 1..MaxLetist;				{Kolikrat nejmene prestoupit pro vrchol}
	P : array[1..MaxLetist] of 1..MaxLetist;				{Predchudce i je P[i]}
	Start,Cil : 1..MaxLetist;
	Vrch : 1..MaxLetist;
	Nenalez : boolean;
	Vzdal : real;
	Dolet : integer;
	N : 1..MaxLetist;
	S : 1..MaxHran;
	i,j,k : integer;

begin
writeln('Zadejte pocet letist: ');
readln(N);
writeln('Zadejte dolet letadla: ');
readln(Dolet);
writeln('Zadejte postupne souradnice letist ve tvaru x,y: ');
for i:=1 to N do
	read(Letiste[i].x,Letiste[i].y);
writeln('Zadejte startovni a cilove letiste ve tvaru Start,Cil');
readln(Start,Cil);

S:=0;
for i:=1 to N do
	for j:=1 to N do
		begin
		Vzdal:=sqrt(sqr(Letiste[i].x-Letiste[j].x)+sqr(Letiste[i].y-Letiste[j].y));
		if (i<>j) and (Vzdal<=Dolet) then
			begin
			S:=S+1;
			Matice[i,j]:=Vzdal;
			Matice[j,i]:=Vzdal;
			end
		else
			Matice[i,j]:=-1;
			Matice[j,i]:=-1;
		end;

Vrch:=1;
k:=0;
Zasobnik[Vrch]:=Start;
Prestup[Start]:=0;
while (Zasobnik[Vrch]<>Cil) and (k<>S) do
	begin
	k:=k+1;
	j:=Zasobnik[Vrch];
	Vrch:=Vrch-1;
	for i:=1 to S do
		if Matice[i,j]<>-1 then 
			begin
			Prestup[i]:=k;
			Vrch:=Vrch+1;
			P[i]:=k;
			Zasobnik[Vrch]:=i;	
			end;
	end;

writeln('Nejkratsi cesta mezi dvema letisti podle poctu presedani v obracenem poradi: ');
i:=Cil;
while i<>Start do
	begin
	write(i:5);
	i:=P[i];
	end;
write(Start);

end.
