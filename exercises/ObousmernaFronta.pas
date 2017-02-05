program ObousmernaFronta;
type
	FrUk = ^FrUzel;
	FrUzel = record
		Data : integer;
		Dalsi : FrUk;
		Predchozi : FrUk;
	end;
	FrTyp = record
		Prvni : FrUk;
		Posledni : FrUk;
	end;
var
	Fr : FrTyp;

procedure inicializuj(F : FrTyp);
	begin
	F.Prvni := nil;
	F.Posledni := nil;
	end;

procedure vypis(F : FrTyp);
var
	P : FrUk;
begin
	P := F.Prvni;
	while P <> nil do
		begin
		writeln(P^.data);
		P := P^.Dalsi;
		end;
end;

procedure pridejZacatek(var F : FrTyp; X : integer);
var P : FrUk;
	
begin
	with F do
		begin
		new(P);
		P^.Data := X;
		P^.Dalsi := Prvni;
		P^.Predchozi := nil;
		if Prvni = nil then	{	Novy zacatek fronty	}
			begin
			Prvni := P;
			Posledni := P;
			end
		else 					{	Zaradit do fronty	}
			begin
			Prvni^.Predchozi := P;
			Prvni := P;
			end;
		end;
end;

procedure pridejKonec(var F : FrTyp; X : integer);
var
	P : FrUk;
begin
	with F do
		begin
		new(P);
		P^.Data := X;
		P^.Dalsi := nil;
		P^.Predchozi := Posledni;
		if Posledni = nil then
			Posledni := P
		else
			begin
			Posledni^.Dalsi := P;
			Posledni := P
			end;
	end;
end;

function odstranZacatek(var F : FrTyp) : integer;
var
	P : FrUk;
begin
	with F do
		begin
		new(P);
		P := Prvni;
		Prvni := Prvni^.Dalsi;
		Prvni^.Predchozi := nil;
		odstranZacatek := P^.Data;
		end;
end;

function odstranKonec(var F : FrTyp) : integer;
var 
	P : FrUk;
begin
	with F do
		begin
		new(P);
		P := Posledni;
		Posledni := Posledni^.Predchozi;
		Posledni^.Dalsi := nil;
		odstranKonec := P^.Data;
		end;
end;

{	Analogicky odstranKonec	}

begin
Fr.Prvni := nil;
pridejZacatek(Fr, 26);
pridejZacatek(Fr, 20);
pridejZacatek(Fr, 30);
pridejKonec(Fr, 40);
pridejKonec(Fr, 54);
pridejZacatek(Fr, 21);
odstranZacatek(Fr);
odstranKonec(Fr);
vypis(Fr);
end.
