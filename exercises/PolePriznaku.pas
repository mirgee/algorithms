program PolePriznaku;
const
	D = 0;
	H = 50;
var
	pole : array[D..H] of boolean;
	i : integer;

procedure pridej(var pole : array of boolean; X : integer);
begin
pole[X] := true;
end;

procedure odeber(var pole : array of boolean; X : integer);
begin
pole[X] := false;
end;

procedure vypis(pole : array of boolean);
var
	i : integer;
begin
for i:=D to H do
	if(pole[i] = true) then writeln(i);
end;
	
begin
for i:=D to H do pole[i] := false;
pridej(pole, 22);
pridej(pole, 18);
vypis(pole);
odeber(pole, 22);
vypis(pole);
end.
