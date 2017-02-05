program VelkaCisla;

type
	Charaktery = 0..9;

var
	cislo1 : array[0..100] of integer;
	cislo2 : array[0..100] of integer;
	vysledek : array[0..100] of integer;
	i : integer;
	n : charaktery;
begin
for i:=0 to 100 do
begin
	for n:=Low(charaktery) to High(charaktery) do
	begin
	cislo1[i] := 8;
	end
end;

for i:=0 to 100 do
begin
	for n:=Low(charaktery) to High(charaktery) do
	begin
	cislo2[i] := 8;
	end
end;
for i:=0 to 100 do
begin
	vysledek[i] := cislo1[i] + cislo2[i];
	if (vysledek[i] > 9) and (i <> 0) then
		begin
			vysledek[i] := vysledek[i]-10;
			vysledek[i-1] := vysledek[i-1] + 1;
		end;
	write(vysledek[i]);
end

end.
