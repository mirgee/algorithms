program KomplexniCisla;

type
	Uk = ^kom;
	kom = record
		realnaCast : integer;
		komplexniCast : integer;
	end;

var
	P : Uk;
	Q : Uk;
	
procedure Scitani(Cislo1, Cislo2 : Uk);
	var
		SoucetR : integer;
		SoucetK : integer;
	
	begin
		SoucetR := Cislo1^.realnaCast + Cislo2^.realnaCast;
		SoucetK := Cislo1^.komplexniCast + Cislo2^.komplexniCast;
		writeln('Soucet: ', SoucetR, ' + ', SoucetK, 'i');
	end;
	

{ (4 + 6i)*(1 + 3i) = 4*1 + 4*3i + 6i*1 + 6i * 3i}	
procedure Nasobeni(Cislo1, Cislo2: Uk);
var
	vysledekR : integer;
	vysledekK : integer;
begin
	vysledekR := Cislo1^.realnaCast * Cislo2^.realnaCast - Cislo1^.komplexniCast * Cislo2^.komplexniCast;
	vysledekK := Cislo1^.realnaCast * Cislo2^.komplexniCast + Cislo2^.realnaCast * Cislo1^.komplexniCast;
	writeln('Vysledek násobení: ', vysledekR, ' + ', vysledekK, 'i');
end;


begin
new(P);
P^.realnaCast := 4;
P^.komplexniCast := 6;

new(Q);
Q^.realnaCast := 1;
Q^.komplexniCast := 3;

Scitani(P, Q);
Nasobeni(P, Q);
end.
	
