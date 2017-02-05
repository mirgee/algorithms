program PrioritniFronta;
type 
	frUk = ^frontaUzel;
	frontaUzel = record
		data : integer;
		priorita : integer;
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

procedure pridat(var F : frontaTyp; X : integer);
var
	P, I : frUk;
begin
		new(P);
		P^.Data := X;
		if (X mod 2) = 0 then P^.priorita := 1
		else 			P^.priorita := 0;
		if F.prvni = nil then				{	Zacatek seznamu		}
			begin
			F.prvni := P;
			F.posledni := P;
			P^.Dalsi := nil;
			end
		else
			begin
			if P^.priorita = F.prvni^.priorita then
				begin
				P^.dalsi := F.prvni;
				F.prvni := P;
				end
			else
				begin
				new(I);
				I := F.prvni;
				while (P^.priorita < I^.priorita) and (I^.dalsi <> nil) do 	I := I^.dalsi;
				P^.dalsi := I^.dalsi;
				
				if I = F.prvni then
					begin
					P := I;
					F.prvni := P;
					end
				else I^.dalsi := P;
				if P^.dalsi = nil then F.posledni := P;
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
	inicializuj(fr);
	pridat(fr, 13);
	pridat(fr, 15);
	pridat(fr, 19);
	pridat(fr, 11);
	pridat(fr, 12);
	vypis(fr);
end.
	
		
				
