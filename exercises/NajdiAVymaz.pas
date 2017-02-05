{
	* Program, který najde v seznamu uzel s danou hodnotou a tento uzel smaže.	}

program NajdiAVymaz;
type
	Uk = ^Prvek;
	Prvek = record
		Info : integer;
		Dalsi : Uk;
	end;
var
	SeznamStart : Uk;
	SmazavanyPredchudce : Uk;
	

{	Funkce, která vrací předchůdce vymazávaného uzlu pro snadné vymazání.	}
function Najdi(N : Uk; X : integer) : Uk;
var
	Q : Uk;
	Predchudce : Uk;
	nenalezen : boolean;
begin
	Q := N;
	nenalezen := true;
	
	while (Q <> nil) and (nenalezen = true) do
	if Q^.Info = X then nenalezen := false
	else
	begin
		Predchudce := Q;
		Q := Q^.Dalsi;
	end;
	
	Najdi := Predchudce;
end;


{	Procedura, která vymaže následníka zadaného uzlu.	}
procedure VymazNaslednika(N : Uk);
var
	Q : Uk;
begin
	Q := N^.Dalsi;
	if Q <> nil then
	begin
		N^.Dalsi := Q^.Dalsi;
		Q^.Dalsi := nil;
	end;
end;

{	Procedura, která smaže všechny uzly, jejichž hodnota se rovná zadanému X.	}
procedure SmazVse(N : Uk; X : integer);
var
	Q : Uk;
	predchudce : Uk;
begin
	Q := N;
	predchudce := Q;
	while Q<>nil do
	begin
		if Q^.Info = X then VymazNaslednika(predchudce);
		predchudce := Q;
		Q := Q^.Dalsi;
	end;
end;
			

{	Procedura, která naplní daný seznam	}
procedure Napln(var P : Uk; X : integer);
var
	Q, R : Uk;	{P - prvni prvek, Q - novy prvek, R - posledni prvek}
	i : integer;
begin
	new(P);
	P^.Info := 1;
	P^.Dalsi := nil;
	R := P;
	for i:=2 to X do
	begin
		new(Q);
		Q^.Info := i;
		R^.Dalsi := Q;
		R := Q;
	end;
	R^.Dalsi := nil;
end;

{	Procedura, která vypíše daný seznam	}
procedure Vypis(P: Uk);
begin
	while P^.Dalsi <> nil do
	begin
		writeln(P^.Info);
		P:=P^.Dalsi;
	end;
end;

begin
	Napln(SeznamStart, 11);
	Vypis(SeznamStart);
	SmazavanyPredchudce := Najdi(SeznamStart, 7);
	VymazNaslednika(SmazavanyPredchudce);
	Vypis(SeznamStart);
end.



