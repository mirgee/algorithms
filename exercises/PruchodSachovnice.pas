program PruchodSachovnice;

const   N = 8;
        PocetKroku = 63;
        PocetTahu = 8;
type    Index = 1..N;
var     S: array[Index,Index] of integer;
        Tah: array[1..PocetTahu] of record d1,d2:integer end;
        Start1, Start2: Index;
        Nalezeno: boolean;
        i,j: Index;

procedure Cesta(i1,i2: Index; var Nalezeno: boolean);
        var     Smer: 0..PocetTahu;
                j1,j2: integer;
                Krok: integer;
                Nalez: boolean;
        begin
        Krok := S[i1,i2] + 1;
        Smer := 0;
        Nalez := false;
        repeat
                Smer := Smer + 1;
                j1 := i1 + Tah[Smer].d1;
                j2 := i2 + Tah[Smer].d2;
                if(j1>=1) and (j1<=N) and (j2>=1) and (j2<=N) then
                        if S[j1,j2] = -1 then
                                begin
                                S[j1,j2] := Krok;
                                if Krok = PocetKroku then
                                        Nalez := true
                                else
                                        begin
                                        Cesta(j1,j2,Nalez);
                                        if not Nalez then S[j1,j2] := -1
                                        end
                                end
        until Nalez or (Smer=PocetTahu);
        Nalezeno := Nalez
        end;

begin
Tah[1].d1 := 1; Tah[1].d2 := 2;
Tah[2].d1 := 2; Tah[2].d2 := 1;
Tah[3].d1 := 2; Tah[3].d2 := -1;
Tah[4].d1 := 1; Tah[4].d2 := -2;
Tah[5].d1 := -1; Tah[5].d2 := -2;
Tah[6].d1 := -2; Tah[6].d2 := -1;
Tah[7].d1 := -2; Tah[7].d2 := 1;
Tah[8].d1 := -1; Tah[8].d2 := 2;

write('Pocatecni pozice kone: ');
readln(Start1, Start2);
for i:=1 to N do
        for j:=1 to N do S[i,j] := -1;
S[Start1,Start2] := 0;

Cesta(Start1,Start2,Nalezeno);

writeln;
if Nalezeno then
        for i:=1 to N do
                begin
                for j:=1 to N do write(S[i,j]:4);
                writeln;
                end
        else
                writeln('Cesta neexistuje. :(');
        writeln
end.
