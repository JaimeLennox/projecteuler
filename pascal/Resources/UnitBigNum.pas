{***************************************************************
 
  Projekt Name: TBigNum
  Beschreibung: Mit TBigNum ist möglich mit großen Zahlen in Delphi, Kylix und Object Pascal zu rechnen.
  Copyright © 2003 Martin Winandy
 
This library is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with this library; if not, write to the Free Software
Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

Kontakt:

Martin Winandy
Wenzelbachstr. 122
54595 Prüm
Germany

pmw14@web.de

****************************************************************}
 
unit UniTBigNum;

interface

uses
  Windows;

var
  ISystem: Byte;
  IMaxLenNachKomma: Integer;

type TBigNum = class
   public
      Wert: AnsiString;
      Negativ: Bool;
      Komma: Integer;
      procedure EntferneNullen;
      function GroesserAls(BIZahl: TBigNum): Short;
      procedure Addiere(Summand1,Summand2: TBigNum);
      procedure Subtrahiere(Minuend,Subtrahend: TBigNum);
      procedure Multipliziere(Multiplikand,Multiplikator: TBigNum);
      procedure Dividiere(Dividend,Divisor: TBigNum);
      procedure Potenziere(Basis,Exponent: TBigNum);
      procedure ZieheWurzel(Basis,Exponent: TBigNum);
      procedure ToString(var SString: AnsiString);
      procedure ToRechnung(var SRechnung: AnsiString);
      procedure FromString(var SString: AnsiString);
      procedure FromRechnung(var SRechnung: AnsiString; IAnfang,ILaenge: Integer);
      procedure CopyFrom(BIZahl: TBigNum);
      procedure Runde;
   end;

exports
  ISystem,
  IMaxLenNachKomma;

implementation

procedure TBigNum.EntferneNullen;
var
ISchleife: Integer;
begin

   if length(Wert) = 1 then
      exit;

   if Komma > 1 then begin
   
      for ISchleife := 1 to Komma-1 do begin

         if not (Wert[ISchleife] = #0) then
            break;

      end;

      Delete(Wert,1,ISchleife-1);
      Dec(Komma,ISchleife-1);
      
   end;

   if length(Wert) > Komma  then begin

      for ISchleife := length(Wert) downto Komma+1 do begin

         if not (Wert[ISchleife] = #0) then
            break;

      end;

      Delete(Wert,ISchleife+1,length(Wert)-ISchleife);

   end;

end;

function TBigNum.GroesserAls(BIZahl: TBigNum): Short;
var
IStelle,IEnde: Integer;
begin

   if Komma > BIZahl.Komma then begin

      result := 1;
      exit;

   end
   else if Komma < BIZahl.Komma then begin

      result := -1;
      exit;

   end;

   if length(Wert) > length(BIZahl.Wert) then begin

      IEnde := length(BIZahl.Wert);
      result := 1;

   end
   else if length(Wert) < length(BIZahl.Wert) then begin

      IEnde := length(Wert);
      result := -1;

   end
   else begin

      IEnde := length(Wert);
      result := 0;

   end;

   for IStelle := 1 to IEnde do begin

      if Ord(Wert[IStelle]) > Ord(BIZahl.Wert[IStelle]) then begin

         result := 1;
         exit;

      end
      else if Ord(Wert[IStelle]) < Ord(BIZahl.Wert[IStelle]) then begin

         result := -1;
         exit;

      end

   end;

end;

procedure TBigNum.Addiere(Summand1,Summand2: TBigNum);
var
IStelle,IUebertrag,IZiffer1,IZiffer2,
IPlusZiffernVorneZahl1,IPlusZiffernVorneZahl2,IPlusZiffernHintenZahl1: Integer;
BISummand1,BISummand2: TBigNum;
begin

   BISummand1 := TBigNum.Create;
   BISummand1.CopyFrom(Summand1);
   BISummand2 := TBigNum.Create;
   BISummand2.CopyFrom(Summand2);

   IPlusZiffernVorneZahl2 := 0;
   IPlusZiffernVorneZahl1 := 0;
   IPlusZiffernHintenZahl1 := 0;

   if BISummand1.Komma > BISummand2.Komma then begin

      IPlusZiffernVorneZahl2 := BISummand1.Komma-BISummand2.Komma;

   end
   else if BISummand2.Komma > BISummand1.Komma then begin

      IPlusZiffernVorneZahl1 := BISummand2.Komma-BISummand1.Komma;

   end;

   if length(BISummand2.Wert)+IPlusZiffernVorneZahl2 > length(BISummand1.Wert)+IPlusZiffernVorneZahl1 then begin

      IPlusZiffernHintenZahl1 := length(BISummand2.Wert)+IPlusZiffernVorneZahl2 - (length(BISummand1.Wert)+IPlusZiffernVorneZahl1);

   end;

   SetLength(Wert,IPlusZiffernVorneZahl1+length(BISummand1.Wert)+IPlusZiffernHintenZahl1);
   Komma := IPlusZiffernVorneZahl1+BISummand1.Komma;
   IUebertrag := 0;

   for IStelle := length(Wert) downto 1 do begin

      if (IStelle-IPlusZiffernVorneZahl1 >= 1) and (IStelle-IPlusZiffernVorneZahl1 <= length(BISummand1.Wert)) then
         IZiffer1 := Ord(BISummand1.Wert[IStelle-IPlusZiffernVorneZahl1])
      else
         IZiffer1 := 0;

      if (IStelle-IPlusZiffernVorneZahl2 >= 1) and (IStelle-IPlusZiffernVorneZahl2 <= length(BISummand2.Wert)) then
         IZiffer2 := Ord(BISummand2.Wert[IStelle-IPlusZiffernVorneZahl2])
      else
         IZiffer2 := 0;

      Wert[IStelle] := Char((IZiffer1+IZiffer2+IUebertrag) mod ISystem);

      IUebertrag := (IZiffer1+IZiffer2+IUebertrag) div ISystem;

   end;

   if IUebertrag > 0 then begin
      Wert := Char(IUebertrag)+Wert;
      Inc(Komma);
   end;

   BISummand1.Free;
   BISummand2.Free;

end;

procedure TBigNum.Subtrahiere(Minuend,Subtrahend: TBigNum);
var
IStelle, IUebertrag,IZiffer1,IZiffer2,
IPlusZiffernVorneZahl1,IPlusZiffernVorneZahl2,IPlusZiffernHintenZahl1: Integer;
BIMinuend,BISubtrahend: TBigNum;
begin

   BIMinuend := TBigNum.Create;
   BIMinuend.CopyFrom(Minuend);
   BISubtrahend := TBigNum.Create;
   BISubtrahend.CopyFrom(Subtrahend);

   IPlusZiffernVorneZahl2 := 0;
   IPlusZiffernVorneZahl1 := 0;
   IPlusZiffernHintenZahl1 := 0;

   if BIMinuend.Komma > BISubtrahend.Komma then begin

      IPlusZiffernVorneZahl2 := BIMinuend.Komma-BISubtrahend.Komma;

   end
   else if BISubtrahend.Komma > BIMinuend.Komma then begin

      IPlusZiffernVorneZahl1 := BISubtrahend.Komma-BIMinuend.Komma;

   end;

   if length(BISubtrahend.Wert)+IPlusZiffernVorneZahl2 > length(BIMinuend.Wert)+IPlusZiffernVorneZahl1 then begin

      IPlusZiffernHintenZahl1 := length(BISubtrahend.Wert)+IPlusZiffernVorneZahl2 - (length(BIMinuend.Wert)+IPlusZiffernVorneZahl1);

   end;

   SetLength(Wert,IPlusZiffernVorneZahl1+length(BIMinuend.Wert)+IPlusZiffernHintenZahl1);
   Komma := IPlusZiffernVorneZahl1+BIMinuend.Komma;
   IUebertrag := 0;

   for IStelle := length(Wert) downto 1 do begin

      if (IStelle-IPlusZiffernVorneZahl1 >= 1) and (IStelle-IPlusZiffernVorneZahl1 <= length(BIMinuend.Wert)) then
         IZiffer1 := Ord(BIMinuend.Wert[IStelle-IPlusZiffernVorneZahl1])
      else
         IZiffer1 := 0;

      if (IStelle-IPlusZiffernVorneZahl2 >= 1) and (IStelle-IPlusZiffernVorneZahl2 <= length(BISubtrahend.Wert)) then
         IZiffer2 := Ord(BISubtrahend.Wert[IStelle-IPlusZiffernVorneZahl2])
      else
         IZiffer2 := 0;

      if IZiffer1-IZiffer2-IUebertrag >= 0 then begin

         Wert[IStelle] := Char(IZiffer1-IZiffer2-IUebertrag);
         IUebertrag := 0;

      end
      else begin

         Wert[IStelle] := Char(IZiffer1+ISystem-IZiffer2-IUebertrag);
         IUebertrag := 1;

      end;

   end;

   BIMinuend.Free;
   BISubtrahend.Free;

end;

procedure TBigNum.Multipliziere(Multiplikand,Multiplikator: TBigNum);
var
BIEins,BIMultiplikand,BIMultiplikator: TBigNum;
begin

   BIMultiplikand := TBigNum.Create;
   BIMultiplikand.CopyFrom(Multiplikand);
   BIMultiplikator := TBigNum.Create;
   BIMultiplikator.CopyFrom(Multiplikator);

   Wert := #0;
   komma := 1;

   BIEins := TBigNum.Create;
   BIEins.Wert := #1;
   BIEins.Komma := 1;

   while not (BIMultiplikator.Wert = #0) do begin

      while (BIMultiplikator.GroesserAls(BIEins) > -1) do begin

         Addiere(self,BIMultiplikand);
         BIMultiplikator.Subtrahiere(BIMultiplikator,BIEins);
         BIMultiplikator.EntferneNullen;

      end;

      while (BIMultiplikator.GroesserAls(BIEins) = -1) and (not (BIMultiplikator.Wert = #0)) do begin

         if BIMultiplikand.Komma > 1 then
            Dec(BIMultiplikand.Komma)
         else
            Insert(#0,BIMultiplikand.Wert,1);

         Inc(BIMultiplikator.Komma);
         if BIMultiplikator.Komma > length(BIMultiplikator.Wert) then
            Insert(#0,BIMultiplikator.Wert,length(BIMultiplikator.Wert));

         BIMultiplikand.EntferneNullen;
         BIMultiplikator.EntferneNullen;

      end;

   end;

   BIEins.Free;
   BIMultiplikand.Free;
   BIMultiplikator.Free;

end;

procedure TBigNum.Dividiere(Dividend,Divisor: TBigNum);
var
BIEins,BIDividend,BIDivisor: TBigNum;
begin

   BIDividend := TBigNum.Create;
   BIDividend.CopyFrom(Dividend);
   BIDivisor := TBigNum.Create;
   BIDivisor.CopyFrom(Divisor);

   Wert := #0;
   komma := 1;

   BIEins := TBigNum.Create;
   BIEins.Wert := #1;
   BIEins.Komma := 1;

   while (not (BIDividend.Wert = #0)) and (length(Wert)-Komma < IMaxLenNachKomma+3) do begin

      while (BIDividend.GroesserAls(BIDivisor) > -1) do begin

         BIDividend.Subtrahiere(BIDividend,BIDivisor);
         BIDividend.EntferneNullen;
         Addiere(self,BIEins);

      end;

      while (BIDividend.GroesserAls(BIDivisor) = -1) and not (BIDividend.Wert = #0) do begin

         if BIDivisor.Komma > 1 then
            Dec(BIDivisor.Komma)
         else
            Insert(#0,BIDivisor.Wert,1);

         BIDivisor.EntferneNullen;

         if BIEins.Komma > 1 then
            Dec(BIEins.Komma)
         else
            Insert(#0,BIEins.Wert,1);

         BIEins.EntferneNullen;

      end;

   end;

   BIEins.Free;
   BIDividend.Free;
   BIDivisor.Free;

end;

procedure TBigNum.ZieheWurzel(Basis,Exponent: TBigNum);
var
BIBasis, BIExponent, BIMinimum, BIMaximum, BITempMinimum, BITempMaximum,
BIZwei, BIEins, BIWurzel, BIErgebnis: TBigNum;
begin

   BIBasis := TBigNum.Create;
   BIExponent := TBigNum.Create;
   BIMinimum := TBigNum.Create;
   BIMaximum := TBigNum.Create;
   BITempMinimum := TBigNum.Create;
   BITempMaximum := TBigNum.Create;
   BIEins := TBigNum.Create;
   BIZwei := TBigNum.Create;
   BIWurzel := TBigNum.Create;
   BIErgebnis := TBigNum.Create;

   BIBasis.CopyFrom(Basis);
   BIExponent.CopyFrom(Exponent);
   BIMinimum.Wert := #0;
   BIMinimum.Komma := 1;
   BIMaximum.CopyFrom(Basis);
   BIEins.Wert := #1;
   BIEins.Komma := 1;
   if ISystem = 2 then begin
      BIZwei.Wert := #1#0;
      BIZwei.Komma := 2;
    end
    else begin
       BIZwei.Wert := #2;
       BIZwei.Komma := 1;
    end;

   BITempMaximum.CopyFrom(BIMaximum);
   BITempMaximum.Runde;
   BITempMinimum.CopyFrom(BIMinimum);
   BITempMinimum.Runde;

   while BITempMaximum.GroesserAls(BITempMinimum) <> 0 do begin

      BIWurzel.Addiere(BIMaximum,BIMinimum);
      BIWurzel.Dividiere(BIWurzel,BIZwei);

      BIExponent.CopyFrom(Exponent);
      BIErgebnis.CopyFrom(BIEins);

      while BIExponent.GroesserAls(BIEins) > -1 do begin
         BIExponent.Subtrahiere(BIExponent,BIEins);
         BIExponent.EntferneNullen;
         BIErgebnis.Multipliziere(BIErgebnis,BIWurzel);
      end;

      if BIErgebnis.GroesserAls(BIBasis) = 1 then begin
         BIMaximum.CopyFrom(BIWurzel);
         BITempMaximum.CopyFrom(BIMaximum);
         BITempMaximum.Runde;
      end
      else begin
         BIMinimum.CopyFrom(BIWurzel);
         BITempMinimum.CopyFrom(BIMinimum);
         BITempMinimum.Runde;
      end;

   end;

   CopyFrom(BITempMaximum);

   BIBasis.Free;
   BIExponent.Free;
   BIMinimum.Free;
   BIMaximum.Free;
   BITempMinimum.Free;
   BITempMaximum.Free;
   BIEins.Free;
   BIZwei.Free;
   BIWurzel.Free;
   BIErgebnis.Free;

end;

procedure TBigNum.Potenziere(Basis,Exponent: TBigNum);
var
BIEins,BIBasis,BIExponent: TBigNum;
begin

   BIBasis := TBigNum.Create;
   BIBasis.CopyFrom(Basis);
   BIExponent := TBigNum.Create;
   BIExponent.CopyFrom(Exponent);

   Wert := #1;
   komma := 1;

   BIEins := TBigNum.Create;
   BIEins.Wert := #1;
   BIEins.Komma := 1;

   while (BIExponent.GroesserAls(BIEins) > -1) do begin

      Multipliziere(self,BIBasis);
      BIExponent.Subtrahiere(BIExponent,BIEins);
      BIExponent.EntferneNullen;

   end;

   BIEins.Free;
   BIBasis.Free;
   BIExponent.Free;

end;


procedure TBigNum.ToString(var SString: AnsiString);
var
IStelle: Integer;
begin

   SetLength(SString,length(Wert));

   for IStelle := 1 to length(Wert) do begin

      if Ord(Wert[IStelle]) < 10 then
         SString[IStelle] := Char(Ord(Wert[IStelle])+48)
      else if Ord(Wert[IStelle]) >= 10 then
         SString[IStelle] := Char(Ord(Wert[IStelle])+55)

   end;

   if Komma < length(Wert) then
      Insert(',',SString,Komma+1);

   if Negativ then
      Insert('-',SString,1);

end;

procedure TBigNum.ToRechnung(var SRechnung: AnsiString);
var
IStelle: Integer;
begin

   // Entferne überflüssige Nullen

   if length(Wert) > 1 then begin

      if Komma > 1 then begin

         for IStelle := 1 to Komma-1 do begin

            if not (Wert[IStelle] = #0) then
               break;

         end;

         Delete(Wert,1,IStelle-1);
         Dec(Komma,IStelle-1);
      
      end;

      if length(Wert) > Komma  then begin

         for IStelle := length(Wert) downto Komma+1 do begin

            if not (Wert[IStelle] = #0) then
               break;

         end;

         Delete(Wert,IStelle+1,length(Wert)-IStelle);

      end;

   end;

   // Setze Komma

   SRechnung := Wert;

   if Komma < length(Wert) then
      Insert(#100 { , },SRechnung,Komma+1);

   // Setze Vorzeichen

   if Negativ then
      Insert(#102 { | },SRechnung,1);

end;

procedure TBigNum.FromString(var SString: AnsiString);
var
IStelle: Integer;
IUnterschied: Byte;
begin

   if Pos(',',SString) = 0 then begin
      Komma := length(SString);
      SetLength(Wert,length(SString));
   end
   else begin
      Komma := Pos(',',SString)-1;
      SetLength(Wert,length(SString)-1);
   end;

   IUnterschied := 0;

   for IStelle := 1 to length(SString) do begin

      if Ord(SString[IStelle]) in [Ord('0')..Ord('9')] then
         Wert[IStelle-IUnterschied] := Char(Ord(SString[IStelle])-48)
      else if Ord(SString[IStelle]) in [Ord('A')..Ord('Z')] then
         Wert[IStelle-IUnterschied] := Char(Ord(SString[IStelle])-55)
      else
         Inc(IUnterschied);
   end;


end;

procedure TBigNum.FromRechnung(var SRechnung: AnsiString; IAnfang,ILaenge: Integer);
var
IStelle: Integer;
IUnterschied: Byte;
STemp: AnsiString;
begin

   STemp := Copy(SRechnung,IAnfang,ILaenge);

   if Pos(#100 { , },STemp) = 0 then begin
      Komma := length(STemp);
      SetLength(Wert,length(STemp));
   end
   else begin
      Komma := Pos(#100 { , },STemp)-1;
      SetLength(Wert,length(STemp)-1);
   end;

   IUnterschied := 0;

   for IStelle := 1 to length(STemp) do begin

      if STemp[IStelle] in [#0..#35] then
         Wert[IStelle-IUnterschied] := STemp[IStelle]
      else
         Inc(IUnterschied);
   end;
   
   if IAnfang > 1 then begin

      if SRechnung[IAnfang-1] = #102 { | } then
         Negativ := True
      else if SRechnung[IAnfang-1] = #104 { - } then
         Negativ := True
      else
         Negativ := False;

   end
   else
      Negativ := False;

   if IAnfang > 2 then begin

      if SRechnung[IAnfang-2] = #104 { - } then
         Negativ := not Negativ;

   end;

end;

procedure TBigNum.CopyFrom(BIZahl: TBigNum);
begin

   Wert := BIZahl.Wert;
   Negativ := BIZahl.Negativ;
   Komma := BIZahl.Komma;

end;

procedure TBigNum.Runde;
var
ILetzteZiffer: Byte;
BIZahl: TBigNum;
IStelle: Integer;
begin

   if Komma+IMaxLenNachKomma < length(Wert) then begin

      ILetzteZiffer := Ord(Wert[Komma+IMaxLenNachKomma+1]);
      Delete(Wert,Komma+IMaxLenNachKomma+1,length(Wert));

      if ILetzteZiffer >= ISystem/2 then begin

         BIZahl := TBigNum.Create;

         SetLength(BIZahl.Wert,IMaxLenNachKomma+1);
         BIZahl.Komma := 1;

         for IStelle := 1 to length(BIZahl.Wert)-1 do
            BIZahl.Wert[IStelle] := #0;

         BIZahl.Wert[length(BIZahl.Wert)] := #1;

         Addiere(self,BIZahl);

         BIZahl.Free;

      end;

   end;

   EntferneNullen;

end;

end.
