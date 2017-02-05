unit libSeznam;

interface
type
	data = integer;
	uPrvek = ^Prvek;
	Prvek = record
		data : data;
		dalsi : uPrvek;
	end;
	Seznam = object
		hlava, konec : uPrvek;
		constructor init;
		function vyjmiPrvni : uPrvek;
		function nty(kolikaty : integer) : uPrvek;
		procedure vlozNaKonec(var co : data);
		procedure vlozZa(p : uPrvek; var co : data);
		procedure vlozNamisto(p : uPrvek; var co : data);
		procedure prohod(p1,p2 : uPrvek);
		procedure vypsat;
		function velikost : integer;
	end;
	
function seznamZeSouboru(jmenoS : string) : seznam;

implementation

{----------------------------metody seznamu----------------------------}
constructor Seznam.init;
begin
	new(hlava);
	konec := hlava;
	hlava^.dalsi := nil;
end;

procedure Seznam.vlozNaKonec(var co : data);
begin
konec^.data := co;
new(konec^.dalsi);
konec := konec^.dalsi;
konec^.dalsi := nil;
end;

function Seznam.vyjmiPrvni : uPrvek;
var pom : uPrvek;
begin
	pom := hlava;
	hlava:=pom^.dalsi;
	vyjmiPrvni := pom;
end;

function Seznam.nty(kolikaty : integer) : uPrvek;
var 
	pom : uPrvek;
	i : integer;
begin
	pom := hlava;
	i := 1;
	while i<>kolikaty do begin
		inc(i);
		pom := pom^.dalsi;
	end;
	nty := pom;
end;

procedure Seznam.vlozZa(p : uPrvek; var co : data);
var novy : uPrvek;
begin
new(novy);
novy^.data := co;
novy^.dalsi := p^.dalsi;
p^.dalsi := novy;
end;

procedure Seznam.vlozNamisto(p : uPrvek; var co : data);
begin
	Seznam.vlozZa(p, p^.data);
	p^.data:=co;
end;

procedure Seznam.prohod(p1,p2 : uPrvek);
var pom : uPrvek;
begin
new(pom);
pom^.data := p1^.data;
p1^.data := p2^.data;
p2^.data := pom^.data;
dispose(pom);
end;

procedure Seznam.vypsat;
var pom : uPrvek;
begin
pom := hlava;
while pom^.dalsi<>nil do begin
	writeln(pom^.data);
	pom:=pom^.dalsi;
end;
end;

function Seznam.velikost : integer;
var 
	pom : uPrvek;
	i : integer;
begin
pom := hlava;
i := 1;
while pom^.dalsi <> konec do begin
	inc(i);
	pom := pom^.dalsi;
end;
velikost := i;
end;

{----------------------------------------------------------------------}
function seznamZeSouboru(jmenoS : string) : seznam;
var 
	userFile : text;
	d : data;
	sez : seznam;
begin
sez.init;
assign(userFile, jmenoS);
reset(userFile);
repeat
	readln(userFile, d);
	sez.vlozNaKonec(d);
until eof(userFile);
close(userFile);
seznamZeSouboru := sez;
end;

end.
