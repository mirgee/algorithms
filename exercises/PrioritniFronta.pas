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
		if F.prvni = nil then	{	Vkládaný uzel je první ve frontě	}
			begin
			P^.Dalsi := nil;
			F.prvni := P;
			F.posledni := P;
			if (X mod 2) = 0 then 
				P^.priorita := 1
			else 	P^.priorita := 0;
				
			end
		else 					{	Vkládaný uzel je třeba zařadit		}
			begin
			if (X mod 2) = 0 then	{	Vkládaný uzel má vyšší prioritu		}
				begin
				P^.Dalsi := nil;
				P^.Priorita := 1;
				F.posledni^.Dalsi := P;
				F.posledni := P;
				end
			else 				{	Vkládaný uzel má nižší prioritu		}
				begin
				new(I);
				I := F.Prvni;
				while (I^.Priorita < 1) do
					I := I^.Dalsi;			{	I ukazuje na předchůdce prvku který vkládáme	}
				P^.Dalsi := I^.Dalsi;
				P^.Priorita := 0;
				I^.Dalsi := P;
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
	pridat(fr, 42);
	pridat(fr, 19);
	pridat(fr, 13);
	pridat(fr, 12);
	vypis(fr);
end.
	
		
				
