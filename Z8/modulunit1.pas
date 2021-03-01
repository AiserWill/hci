unit ModulUnit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type Calculation = record
  rad,p:real;   // исходные данные
  n:integer;    // исходные данные
  end;

Tcalc = array[1..128] of Calculation;

procedure read_params(var rad:real; var n:integer; filename:string);
procedure save_params(var rad:real; var n:integer; filename:string);
procedure calculate_p(var rad,p:real; var n:integer);
procedure save_dat(var c:Tcalc; var rad:real; var n,k1:integer; filename:string);

implementation

procedure read_params(var rad:real; var n:integer; filename:string); //открытие файла с параметрами
Var F: text;
begin
  assign(f, filename);
  reset(f);
  readln(f, rad);
  readln(f, n);
  close(f);
end;

procedure save_params(var rad:real; var n:integer; filename:string); //сохранение параметров
var f:text;
begin
  assign(f, filename);
  rewrite(f);
  writeln(f,rad);
  writeln(f, n);
  close(f);
end;

procedure calculate_p(var rad,p:real; var n:integer); //функция вычисления периметра
begin
  p:=2*rad*n*sin(3.14/n)*cos(3.14/n);
end;

procedure save_dat(var c:Tcalc; var rad:real; var n,k1:integer; filename:string);//процедура сохранения отчёта
var
k:integer;
f:text;
begin
assign(f, filename);
rewrite(f);
for k:=1 to k1-1 do
  begin
writeln(f,'Отчёт о работе');
writeln(f,'Радиус описанной окружности: ', c[k].rad:6:2);
writeln(f, 'Кол-во углов многоугольника: ',c[k].n);
writeln(f);
writeln(f,'Периметр многоулоника = '+floattostr(round(c[k].p*100)/100));
writeln(f);
end;
close(f);
end;

end.

