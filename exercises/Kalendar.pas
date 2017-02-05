{
	* 27.4.2008 | 14.5.2010
	* Prvním možným způsobem řešení, který mě napadá, je nejdříve zjistit počet dní
	* do konce měsíce. Poté zjistit počet dní do konce aktuálního roku.
	* Zjistit počet dní do začátku roku koncového je pak jednoduché, ale
	* je třeba si dát pozor na přestupné roky (tzn. zjistit počet
	* přestupných roků v zadaném intervalu a od výsledku odečíst daný
	* počet dní). Pak již stačí zjistit počet dní od počátku koncového roku
	* do koncového data.
}

program Kalendar;

var
	den1, mesic1, rok1 : integer;
	den2, mesic2, rok2 : integer;
	v : integer;
	dniVMesici : integer;
	rok1Prestupny, rok2Prestupny : boolean;
	i : integer {iteratory}
begin
	writeln('Zadejte den, měsíc a rok prvního data, oddělené mezerami:');
	read(den1, mesic1, rok1);
	writeln('Zadejte den, měsíc a rok druhého data, oddělené mezerami:');
	read(den2, mesic2, rok2);
	{writeln(den1, '.', mesic1, '.', rok1, ' je vzdálen ode dne ', den2, '.', mesic2, '.', rok2, ' o ', v, ' dni.');}
	rok1Prestupny := false;
	rok2Prestupny := false;
	{Zjistime, kolik je v intervalu přestupných roků}
	for i:=0 to (abs(rok2-rok1)) do
		if (i mod 4) = 0 and ((i mod 100) <> 0 or (i mod 400 = 0)) then
		begin
			v := v+366;
			if i=0 then rok1Prestupny := true;
			if i=abs(rok2-rok1) then rok2Prestupny := true;
		end;
		else v := v+365;
	
	{Dopocitame pocet dni do konce mesice prvního data}
	if rok1Prestupny = false;
		if mesic1 mod 2 = 0 and mesic1 <> 7 and mesic1 <> 8 and then
				if mesic1 = 2 and rok1Prestupny = true then
					v=v+ (28 - den1);
				else v:=v+ (30 - den1);
		else v:=v+ (31 - den1);
	
	{Dopocitame pocet dni do konce prvniho roku}
	v:=v+ (11-mesic1)*

		
	
	 
	
	
	
	
