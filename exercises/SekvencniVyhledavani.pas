program SekvencniVyhledavani;
const
	N = 100;
type
	Pole = array[1..N+1] of integer;
var
	mojePole : Pole;
	i : integer;
	
procedure Najdi (M : Pole; X : integer);
begin
	M[N+1] := X;
	i:=1;
	while M[i] <> X do i:=i+1;
	if i <= N then writeln('Nalezeno: ', i)
	else writeln('Nenalezeno');
	writeln(M[72]);
end;
	
begin
	for i:=0 to N do
		mojePole[i] := i;
	najdi(mojePole, 72);

end.
	
