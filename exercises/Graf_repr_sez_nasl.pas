program Graf;
{Program na vstupu načte počet vrcholů, výčet hran a vytvoří odpovídající
graf ve tvaru seznamu následníků}

const	MaxVrch = 100;
		MaxHran = 1000;
		
var	V : array[1..MaxVrch+1] of 1..MaxHran+1;
	E : array[1..MaxHran] of 1..MaxVrch;
	N : integer;								{Počet vrcholů grafu}
	i,j : integer;
	
begin
write('Počet vrcholů grafu:');
readln(N);
writeln('Po řádcích následníci jendotlivých vrcholů:');
j:=1;
for i:=1 to N do
	begin
	while not eoln do
		begin
		read(E[j]);
		j:=j+1;
		end;
	V[i+1]:=j;
	end;
end.
