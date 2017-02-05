program prioritniFrontaCisla;
type 
	frUk = ^frontaUzel;
	frontaUzel = record
		data : integer;
		dalsi : frUk;
	end;
	frontaTyp = record
		prvni : frUk;
		posledni : frUk;
	end;
var
	fr : frontaTyp;
	
procedure inicializuj(var F : FrontaTyp);
begin
	F.Prvni := nil;
end;

procedure pridej(var F : frontaTyp; X : integer);	
var
	P, I : FrUk;
	K : integer;
begin
	new(P);
	P^.data := X;
	if F.prvni = nil then
		begin
		F.prvni := P;
		F.posledni := P;
		P^.dalsi := nil;
		end
	else if F.prvni^.data <= X then
		begin
		P^.dalsi := F.prvni;
		F.prvni := P;
		end
	else if F.prvni^.data > X then
		begin
		new(I);
		I := F.prvni;
		while (P^.data < I^.data) and (I^.dalsi <> nil) do 	I := I^.dalsi;
		if I^.dalsi = nil then
			begin
			P^.dalsi := I^.dalsi;
			I^.dalsi := P;
			F.posledni := P;
			end
		else if I = F.prvni then
			begin
			P^.dalsi := F.prvni;
			F.prvni := P;
			end
		else
			begin
			K := P^.data;
			P^ := I^;
			I^.data := K;
			I^.dalsi := P;
			end;
		end;
end;

procedure vypis(var F : frontaTyp);
var P : FrUk;
begin
	P := F.Prvni;
	while P <> nil do
		begin
		writeln(P^.Data);
		P := P^.Dalsi;
		end;
end;

begin
pridej(fr, 31);
pridej(fr, 20);
pridej(fr, 50);
pridej(fr, 49);
pridej(fr, 12);
vypis(fr);
end.
		
