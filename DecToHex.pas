uses
  System;
const
  MAX_INT = Cardinal.MaxValue;
begin
  var uNumber : Cardinal;
  Console.WriteLine('Input an unsigned integer number');
  var bIsRightNumber := (Cardinal.TryParse(Console.ReadLine(), uNumber)) and
                     (uNumber <= MAX_INT);
  if (not bIsRightNumber) then
  begin
    Console.WriteLine('Invalid number format or number too big');
    Console.Read();
    exit();
  end;
  Console.WriteLine('Lower case ? (y/n)');
  var chAnswer := Console.Read();
  var bLowerCase := (chAnswer = ord('y'));
  var strHexNum := '';
  var uTempVal := uNumber;
  while (uTempVal > 0) do
  begin
    var chHexDigit := #0;
    var nHexDigit := uTempVal mod 16;
    if (nHexDigit >= 0) and (nHexDigit <= 9) then
      chHexDigit := chr(nHexDigit+ord('0'))
    else if (nHexDigit >= 10) and (nHexDigit <=15) and (bLowerCase) then
      chHexDigit := chr(nHexDigit - 10 + ord('a'))
    else if (nHexDigit >= 10) and (nHexDigit <=15) then
      chHexDigit := chr(nHexDigit - 10 + ord('A'));
    strHexNum := chHexDigit + strHexNum;
    uTempVal := uTempVal div 16;
  end;
  if (strHexNum.Length = 0) then
  begin
    strHexNum := '0';
  end;
  Console.WriteLine
  (
    'The hexadecimal equavalent of the decimal number {0} is: {1}',
    uNumber, strHexNum
  );
  Console.Read();
 end.