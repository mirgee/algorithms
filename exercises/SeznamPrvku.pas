program SeznamPrvku;
const
	D = 1;
	H = 50;
var
	pole : array[D..H] of integer;
	pocet : 0..H;
	
procedure pridej(var pole : array of integer; X : integer);
begin
	pocet := pocet + 1;
	if pocet > H then
	begin
		pocet := pocet - 1;
		Error(TRuntimeError);
	end
	else pole[pocet] := X;
end;

procedure odeber(var pole : array of integer; X : integer);
var i : integer;
begin
	pole[pocet + 1] := X;
	i:=0;
	while i <> pocet do i:=i+1;
	if i <= pocet then 
	begin
		pole[i] := pole[pocet];
		pocet:=pocet-1;
	end;
end;

procedure vypis(var pole : array of integer);
var i : integer;
begin
	i:=1;
	while i <= pocet do
	begin
		writeln(pole[i]);
		i:=i+1;
	end;
end;

begin
	pridej(pole, 28);
	pridej(pole, 12);
	vypis(pole);
	odeber(pole, 28);
	vypis(pole);
end.
