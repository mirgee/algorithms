program UsporadanySeznam;
const
	Max = 50;
var
	pole : array [1..Max] of integer;
	pocet : 0..Max;

function najdi(var pole : array of integer; X : integer) : integer;
var i,j,k : integer;
begin
	i:=1;
	j:=pocet;
	repeat
		k := (i+j) div 2;	{	Index prostředního prvku	}
		if X > pole[k] then i:=k+1
					else j:=k-1;
	until (pole[k] = X) or (i > j);
	if pole[k] = X then najdi := k
				   else najdi := null;	{	Není obsaženo	}
end;

procedure pridej(var pole : array of integer; X : integer);
var i,j : integer;
begin
	{	Nejdříve musíme zjistit správnou pozici M[?] pro X	}
	i:=1;
	while pole[i] > X do i:=i+1;
	if pocet < Max then
	begin
		for j:=pocet downto i do pole[j+1]:=pole[j];
		pole[i] := X;
		pocet:=pocet+1;
	end
	else writeln('Chyba');
end;

procedure odeber(var pole : array of integer; X : integer);
var i,j : integer;
begin
	i := najdi(pole, X);
	if pocet > 0 then
	begin
		pocet := pocet-1;
		for j:=i to pocet do pole[j]:=pole[j+1];
	end;
end;

procedure vypis(pole : array of integer);
var i : integer;
begin
	for i:=1 to pocet do writeln(pole[i]);
end;

begin
pridej(pole, 24);
pridej(pole, 32);
pridej(pole, 2);
pridej(pole, 26);
vypis(pole);
writeln(najdi(pole, 2));
end.
