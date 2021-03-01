unit UN;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus,
  ModulUnit1;

type

  { TForm1 }

  TForm1 = class(TForm) //класс формы
    Button1: TButton;
    Label3: TLabel;
    MainMenu1: TMainMenu;//поля класса TForm1
    FormCreate1: TMenuItem;
    OD1: TOpenDialog;
    Results: TMemo;
    MenuItem1: TMenuItem;
    SD2: TSaveDialog;
    SD1: TSaveDialog;
    Spravka: TMenuItem;
    fileopen: TMenuItem;
    FileSave: TMenuItem;
    FileSaveData: TMenuItem;
    ExitProgram: TMenuItem;
    n_uglov: TEdit;
    radius: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure fileopenClick(Sender: TObject);
    procedure FileSaveClick(Sender: TObject);
    procedure FileSaveDataClick(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure FormCreate1Click(Sender: TObject);
    procedure ExitProgramClick(Sender: TObject);
    procedure SpravkaClick(Sender: TObject);
    procedure n_uglovChange(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure DataFromForm();

    procedure ResultsChange(Sender: TObject); //конец списка методов класса
  private

  public

  end;

var
  Form1: TForm1;    //объект класса TForm1
  flag:boolean;
  i:integer;
  k1:integer;
  c:Tcalc;
  rad,p:real;
  n:integer;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.DataFromForm(); //определение метода класса.
begin
  if (TryStrToFloat(radius.text, rad) = false or TryStrToInt(n_uglov.text, n) = false)
  or ( (rad < 0) or (n<3))

  then
  begin
    showmessage('Неправильно введён параметр ');
    flag:=false;
    exit;
  end;
end;

procedure TForm1.ResultsChange(Sender: TObject);
begin

end;


procedure TForm1.n_uglovChange(Sender: TObject);
begin

end;

procedure TForm1.Button1Click(Sender: TObject); // описание метода.
var
  k:integer;
begin
  DataFromForm();
   if flag=true then
      begin
        if k1=0 then k:=1
        else k:=k1;
        rad:=StrToFloat(radius.text);
        n:=StrToInt(n_uglov.text);
        calculate_p(rad, p, n);
        Results.Lines.add('Радиус окружности: '+floattostr(round(rad*100)/100));
        Results.Lines.add('Количество углов: '+inttostr(n));
        Results.Lines.add('Периметр правильного многоугольника описанного окружностью = '
        +floattostr(round(p*100)/100));
        Results.Lines.add('--------------------------------------------------------');
        c[k].rad:=rad;
        c[k].n:=n;
        c[k].p:=p;
        inc(k);
        k1:=k;

      end
 else
     begin
       flag:=true;
       exit;
       end;
end;

procedure TForm1.fileopenClick(Sender: TObject);
begin
 if OD1.execute then
    begin
      if OD1.Filename <> '' then
         begin
           read_params(c[i].rad,c[i].n,OD1.filename);
           radius.text:=floattostr(c[i].rad);
           n_uglov.text:=inttostr(c[i].n);
         end;
    end;
end;

procedure TForm1.FileSaveClick(Sender: TObject);
begin
  if SD1.execute
  then
  save_params(rad,n,sd1.filename);
end;

procedure TForm1.FileSaveDataClick(Sender: TObject);
begin
  if SD2.execute then
     if sd2.filename <> '' then
        begin
          save_dat(c,rad,n,k1,sd2.FileName);
        end;
end;

procedure TForm1.MenuItem1Click(Sender: TObject);
begin

end;

procedure TForm1.FormCreate1Click(Sender: TObject);
begin
 results.lines.clear;
end;

procedure TForm1.ExitProgramClick(Sender: TObject);
begin
 close;
end;

procedure TForm1.SpravkaClick(Sender: TObject);
begin
 showmessage('Студент группы ИВТ-19-1 Сойферман Виталий, задача 8. Условие: Определить периметр правильного n-угольника, описанного около окружности радиуса r.');
end;

procedure TForm1.Label1Click(Sender: TObject);
begin

end;

end.

