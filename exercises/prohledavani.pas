program prohledavani;
type
	UzUk = ^Uzel;
	HrUk = ^Hrana;
	Uzel = record
		Info : integer;
		Hr : HrUk;			{	Seznam následníků	}
	end;
	Hrana = record
		Nasl : UzUk;		{	Nasledník uzlu stromu	}
		Dalsi : HrUk;
	end;
	
procedure pruchodDoHloubky(var U : UzUk);
begin
	if U <> nil then
	begin
		writeln(U^.Info);
		if U^.Hr^.Nasl<>nil then pruchodDoHloubky(U^.Hr^.Nasl)
		else pruchodDoHloubky(U^.Hr^.Dalsi^.Nasl);
	end;
end;

procedure pruchodDoSirky(var U : UzUk);
type
	FrUk = ^Fronta;
	Fronta = record
		Vrch : UzUk;
		Dalsi : FrUk;
	end;
var ZacFronty, KonecFronty : FrUk;

procedure Vloz(U : UzUk);
var pom : FrUk;
begin
new(pom);
pom^.vrch := U;
pom^.dalsi := nil;
if ZacFronty=nil then begin ZacFronty^.Vrch := U; KonecFronty^.Vrch := U end
else begin KonecFronty^.Dalsi := pom; KonecFronty := pom; end;
end;

function Ven : UzUk;
var pom : FrUk;
begin
new(pom);
Pom := ZacFronty;
ZacFronty := ZacFronty^.Dalsi;
ven := pom^.vrch;
dispose(pom);
end;

begin
	ZacFronty := nil;
	if U<>nil then Vloz(U);
	while ZacFronty<>nil do
	begin
		U := Ven;
		writeln(U^.Info);
		while U^.Hr^.Dalsi<>nil do
		begin
			Vloz(U);
			U := U^.Hr^.Dalsi^.Nasl;
		end;
	end;
end;
		
begin
end.
