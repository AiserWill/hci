unit ModulUnit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Math;

type Calculation = record
  x,y,z,a,b:real; // исходные данные
  end;

Tcalc = array[1..128] of Calculation;

procedure read_params(var x,y,z:real; filename:string);
procedure save_params(var x,y,z:real; filename:string);
function calc_a(var x,y,a:real):real;
function calc_b(var x,z,b:real):real;
procedure save_dat(var c:Tcalc; var x,y,z,a,b:real; filename:string);

implementation

procedure read_params(var x,y,z:real; filename:string); //открытие файла с параметрами
Var F: text;
begin
  assign(f, filename);
  reset(f);
  readln(f, x);
  readln(f, y);
  readln(f, z);
  close(f);
end;

procedure save_params(var x,y,z:real; filename:string);  //сохранение параметров
var f:text;
begin
  assign(f, filename);
  rewrite(f);
  writeln(f, x);
  writeln(f, y);
  writeln(f, z);
  close(f);
end;

function calc_a(var x,y,a:real):real;//функция вычисления переменной А
var a1:real;
begin
  a:=(sqrt(abs(x-1)))+(1+(sqr(x)/2)+(sqr(y)/4));
  calc_a:=round(a*100)/100;
end;

function calc_b(var x,z,b:real):real;  //функция вычисления переменной B
begin
 b:=x*(arctan(Z)+exp(-1*(x+3)));
 calc_b:=round(b*100)/100;
end;

procedure save_dat(var c:Tcalc; var x,y,z,a,b:real; filename:string);//процедура сохранения отчёта
var
k:integer;
f:text;
begin
k:=0;
assign(f, filename);
rewrite(f);
writeln(f,'Отчёт о работе');
while c[k].b<>0 do
begin
writeln(f,' X: ',FloatToStr(c[k].x));
writeln(f,' Y: ',FloatToStr(c[k].Y));
writeln(f,' Z: ',FloatToStr(c[k].Z));
writeln(f,' A: ',FloatToStr(c[k].A));
writeln(f,' B: ',FloatToStr(c[k].B));
writeln(f,'----------------------------------');
inc(k);
end;
writeln(f);
close(f);
end;

end.

