unit Un;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Grids, Menus,
  ModulUnit1;

type

  { TForm1 }

  TForm1 = class(TForm)//класс формы
    Button1: TButton;
    EditX: TEdit;
    EditY: TEdit;
    EditZ: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    MainMenu1: TMainMenu;//поля класса TFOrm1
    MenuItem1: TMenuItem;
    FileOpen: TMenuItem;
    FileSave: TMenuItem;
    FileSaveData: TMenuItem;
    Help1: TMenuItem;
    Exit1: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    SaveDialog2: TSaveDialog;
    StringGrid1: TStringGrid;
    procedure Button1Click(Sender: TObject);
    procedure DataFromForm();
    procedure Exit1Click(Sender: TObject);
    procedure FileOpenClick(Sender: TObject);
    procedure FileSaveClick(Sender: TObject);
    procedure FileSaveDataClick(Sender: TObject);
    procedure Help1Click(Sender: TObject); //конец списка методов класса
  private

  public

  end;

var
  Form1: TForm1;    //объект класса TFOrm1
  flag:boolean;
  i:integer;
  c:Tcalc;

implementation

{$R *.lfm}

 { TForm1 }

 procedure TForm1.Button1Click(Sender: TObject); // описание метода. имя метода класса,TFOrm1-имя класса указывается
 Var
   k:integer;
 begin
   k:=1;
   DataFromForm();
   If flag=true then
      begin
       if k>=1 then
          begin
           StringGrid1.RowCount:=StringGrid1.RowCount+1;
          end;
       while StringGrid1.Cells[0,k]<>'' do
        begin
          inc(k);
      end;
       c[i].x:=StrToFloat(EditX.text);
       c[i].y:=StrToFloat(EditY.text);
       c[i].z:=StrToFloat(EditZ.text);
    c[i].a:=calc_a(c[i].x,c[i].y,c[i].a);
    c[i].B:=calc_b(c[i].x,c[i].z,c[i].b);
    StringGrid1.Cells[0,k]:=FloatToStr(c[i].x);
    StringGrid1.Cells[1,k]:=FloatToStr(c[i].y);
    StringGrid1.Cells[2,k]:=FloatToStr(c[i].z);
    StringGrid1.Cells[3,k]:=FloatToStr(c[i].a);
    StringGrid1.Cells[4,k]:=FloatToStr(c[i].b);
    inc(i);
    end
   else
   begin
     flag:=true;
     exit;
     end;
 end;

 procedure TForm1.DataFromForm(); //определение метода класса.
 begin
  if TryStrToFloat(EditX.text, c[i].x) = false then
  begin
    Showmessage('Неправильно введён параметр x');
    flag:=false;
    exit;
  end
  else if TryStrToFloat(EditY.text, c[i].Y) = false then
  begin
    Showmessage('Неправильно введён параметр Y');
    flag:=false;
    exit;
  end
  else if TryStrToFloat(EditZ.text, c[i].Z) = false then
  begin
    Showmessage('Неправильно введён параметр Z');
    flag:=false;
    exit;
  end;
  flag:=true;
 end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
  close;
end;

procedure TForm1.FileOpenClick(Sender: TObject);
begin
 if OpenDialog1.Execute then
    begin
      if OpenDialog1.FileName <> '' then
        begin
          read_params (c[i].x,c[i].y,c[i].z, OpenDialog1.filename);
          EditX.Text:= floattostr(c[i].x);
          EditY.Text:= floattostr(c[i].Y);
          EditZ.Text:= floattostr(c[i].Z);
        end;
    end;
end;

procedure TForm1.FileSaveClick(Sender: TObject);
begin
 DataFromForm();
    if flag= true then
    begin
      if SaveDialog1.Execute then
        if SaveDialog1.FileName <> '' then
          begin
            save_params(c[i].x,c[i].y,c[i].z, SaveDialog1.FileName);
          end;
     end
     else
       begin
         flag:=true;
         exit;
       end;
end;

procedure TForm1.FileSaveDataClick(Sender: TObject);//сохранения отчёта
begin
  if SaveDialog1.Execute then
    if SaveDialog1.FileName <> '' then
      begin
        save_dat(c,c[i].x,c[i].y,c[i].z,c[i].A,c[i].B,SaveDialog1.FileName);
      end;
end;

procedure TForm1.Help1Click(Sender: TObject);
begin
  showmessage('Студент Группы ИВТ-19-1 Сойферман Виталий, условие задачи: расчитать по формуле')
end;

end.

