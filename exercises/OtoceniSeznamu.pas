program OtoceniSeznamu;

type
	Uk = ^Prvek;
	Prvek = record
		Info : integer;
		Dalsi : Uk;
	end;
var
	Seznam : Uk;

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

{procedure VlozPred(P, Q : Uk);
var
	K : integer;
begin
	K := Q^.Info;
	Q^ := P^;
	P^.Info := K;
	P^.Dalsi := Q;
end;
}	
procedure Vypis(P: Uk);
begin
while P^.Dalsi <> nil do
begin
	writeln(P^.Info);
	P:=P^.Dalsi;
end;
end;

{	Snažíme se vytvořit nový inverzní seznam, na jeho začátek bude ukazovat W}
procedure Otoc(P : Uk);
var
	V, W : Uk;	{V - poslední prvek, W - předcházející prvek}
begin
new(V);
V^.Info := P^.Info;	{	Poslední prvek V se rovná prvnímu prvku P	}
V^.Dalsi := nil;	{	Poslední prvek V na žádný další prvek již neukazuje	}
while P^.Dalsi<>nil do 	{	Dokud nedojdeme na konec P	}
begin
	new(W);
	P := P^.Dalsi;	{	Postoupíme o krok v řetězu	}
	W^.Info := P^.Info;			{	Prvek předcházející V bude mít hodnotu P	}
	W^.Dalsi := V;	{	W bude ukazovat na prvek před ním	}
	V := W;
end;
Vypis(W);
end;

{procedure Vypust(P : Uk);
var
	Q : Uk;
begin;
	Q := P^.Dalsi;
	P := nil;
end;}

procedure VypustSeznam(P : Uk);
var
	temp : uk;
begin
	temp := nil;
	while P <> nil do
	begin
		temp := P^.Dalsi;
		P^.Info := null;
		P^.Dalsi := nil;
		P := temp;
	end
end;

procedure najdiAVypust(P : Uk; X : integer);
var
	temp, Q : Uk;
	nenalezen : boolean;
begin
	new(Q);
	new(P);
	Q := P;
	nenalezen := true;
	while (Q<>nil) and nenalezen do
	if Q^.Info = X then
	begin
		nenalezen := false;
	end
	else
	begin
		temp := Q;
	    Q := Q^.Dalsi;
	end;
	if Q<>nil then
		begin
			temp^.Dalsi := Q^.Dalsi;
			Q^.Info := null;
			Q^.Dalsi := nil;
			writeln('Hodnota smazana');
		end
	else
		writeln('Nic se nestalo');
end;

begin
Napln(Seznam, 10);
Vypis(Seznam);
najdiAVypust(Seznam, 6);
Vypis(Seznam);
end.
