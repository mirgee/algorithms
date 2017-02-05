program ObecnyStrom;
type
  SezUk = ^SezTyp;
  Sez = record
    Nasl = UzelStr;
    Dalsi = SezUk;
  end;
  UzelStr = record
    Info : integer;
    SezNasl : SezUk;
  end;
  
var
  
procedure PruchodHloub(U: UzelStr);
  begin
  if U <> nil then
    begin
    writeln(U)
    
        
    