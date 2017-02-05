{
	* Napsat tento program pro mě bylo zatím to nejtvrději vydřené
	* vítězství. Bylo to hlavně kvůli špatné a neuvážené volbě
	* pořadí iterace jednotlivých příkazů.
}

program Kalendar;
var
	den1, mesic1, rok1 : integer;
	den2, mesic2, rok2 : integer;
	dniVMesici : integer;
	rokPrestupny : boolean;
	i : longint;
begin
	writeln('Zadejte den, měsíc a rok prvního data, oddělené mezerami:');
	read(den1, mesic1, rok1);
	writeln('Zadejte den, měsíc a rok druhého data, oddělené mezerami:');
	read(den2, mesic2, rok2);
	rokPrestupny := false;
	i:=0;
{ 	Dokud se nerovná rok, mesic a den obou datumů 	}
	while (((rok1 <> rok2) or (mesic1 <> mesic2)) or (den1 <> den2))  do
	begin
		if (rok1 mod 4 = 0) and (rok1 mod 100 <> 0) or (rok1 mod 400 = 0) then
			rokPrestupny:=true
		else
			rokPrestupny:=false;
		case mesic1 of 
			1 : dniVMesici := 31;
			2 : if rokPrestupny = false then dniVMesici := 30 else dniVMesici := 28;
			3 : dniVMesici := 31;
			4 : dniVMesici := 30;
			5 : dniVMesici := 31;
			6 : dniVMesici := 30;
			7 : dniVMesici := 31;
			8 : dniVMesici := 31;
			9 : dniVMesici := 30;
			10 : dniVMesici := 31;
			11 : dniVMesici := 30;
			12 : dniVMesici := 31;
		end;
		if (mesic1 = 12) and (den1 = 31) then
		begin
		rok1:=rok1+1;
		mesic1:=1;
		den1:=1;
		end
		else if den1=dniVMesici then
		begin
			mesic1:=mesic1+1;
			den1:=1;
		end
		else den1:=den1+1;
		i:=i+1;
	end;
	writeln(i);
end.
	
