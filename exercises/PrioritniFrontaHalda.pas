program PrioritniFrontaHalda;
const
	max = 100;
type
	frUk = ^frontaUzel;
	frontaUzel = record
		priorita : integer;
		data : string;
		cislo : integer;
	end;
	halda = record
		data : array[1..max] of frUk;
		pocet : 0..max;
	end;
var
	h : halda;
	a,b,c,d,e,f,g : frUk;

procedure pridej(var H : halda; X : frUk);
var
	p, j : integer;
	pokracovat : boolean;
	d : frUk;
	
begin
	with H do
	begin
	if pocet = max then
		writeln('Překročen maximální počet prvků v haldě')
	else
		begin
		pocet := pocet + 1;
		data[pocet] := X;
		j := pocet;
		pokracovat := j > 1;
		while pokracovat do
			begin
			p := j div 2;
			if data[j]^.priorita > data[p]^.priorita then	{ Vyměnit prvky j a p 	}
				begin
				d := data[j];
				data[j] := data[p];
				data[p] := d;
				j := p;
				pokracovat := j > 1;
				end
			else
				pokracovat := false;
			end;
		end;
	end;
end;

function getNej(var H : halda) : string;
var
	j,n : integer;
	pokracovat : boolean;
	d : frUk;
begin
	with H do
	begin
	getNej := data[1]^.data;
	data[1] := data[pocet];
	pocet := pocet - 1;
	j := 1;
	pokracovat := pocet >= 2;
	while pokracovat do
		begin
		n := 2*j;
		if n < pocet then
			if data[n+1]^.priorita > data[n]^.priorita then n := n+1;	{ Nyní n je index většího z následníků j	}
		if data[n]^.priorita > data[j]^.priorita then
			begin
			d := data[j];
			data[j] := data[n];
			data[n] := d;
			j := n;
			pokracovat := 2*j <= pocet;
			end
		else
			pokracovat := false;
		end;
	end;
end;

procedure vypis(var H : halda);
begin
	with H do
		begin
		while pocet <> 0 do
			writeln(getNej(H));
		end;
end;
		

begin
new(a);
a^.priorita := 2;
a^.data := 'Božena';
a^.cislo := 251;
new(b);
b^.priorita := 3;
b^.data := 'Zkouřená';
b^.cislo := 12;
new(c);
c^.priorita := 2;
c^.data := 'Hledá kořena';
c^.cislo := 84;
new(d);
d^.priorita := 4;
d^.data := 'Krocan!';
d^.cislo := 123;
new(e);
e^.priorita := 2;
e^.data := 'Lupa';
e^.cislo := 134;
new(f);
f^.priorita := 2;
f^.data := 'Brum';
f^.cislo := 2039;
new(g);
g^.priorita := 10;
g^.data := 'Up top';
g^.cislo := 1;
pridej(h, a);
pridej(h, b);
pridej(h, c);
pridej(h, d);
pridej(h, e);
pridej(h, f);
pridej(h, g);

vypis(h);
writeln();
end.
