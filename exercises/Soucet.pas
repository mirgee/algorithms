program Soucet;

var
	sum : real;
	n : real;
	i, j : integer;

begin

for i:=1 to 20 do 
begin
	n:= 1/i;
	sum:=0;
	for j:=1 to i do
	begin
		sum := sum + n;
	end;
	writeln('Ntina: ', n, ' Soucet: ', sum);
	if sum = 1 then writeln(' = 1')
	else writeln(' <> 1');
end;
end.
		
