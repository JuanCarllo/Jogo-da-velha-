unit UntJogoDaVelha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, math, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure StringGrid1Click(Sender: TObject);
    procedure jogadaHumana();
    procedure jogadapc();
    function funcaoteste(): integer;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  bode: integer;

  matriz: array [0 .. 2, 0 .. 2] of string;
  j: string;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var
  x: integer;
  y: integer;
begin

  matriz[1, 1] := 'x';
  StringGrid1.Cells[1, 1] := matriz[1,1];
end;

function TForm1.funcaoteste: integer;
begin
  if ((StringGrid1.Cells[0, 0] = 'x') and (StringGrid1.Cells[0, 1] = 'x') and
    (StringGrid1.Cells[0, 2] = 'x')) or
    ((StringGrid1.Cells[1, 0] = 'x') and (StringGrid1.Cells[1, 1] = 'x') and
    (StringGrid1.Cells[1, 2] = 'x')) or
    ((StringGrid1.Cells[2, 0] = 'x') and (StringGrid1.Cells[2, 1] = 'x') and
    (StringGrid1.Cells[2, 2] = 'x')) then
  begin
    result := 1;
    exit;
  end;
  if ((StringGrid1.Cells[0, 0] = 'x') and (StringGrid1.Cells[1, 0] = 'x') and
    (StringGrid1.Cells[2, 0] = 'x')) or
    ((StringGrid1.Cells[0, 1] = 'x') and (StringGrid1.Cells[1, 1] = 'x') and
    (StringGrid1.Cells[2, 1] = 'x')) or
    ((StringGrid1.Cells[0, 2] = 'x') and (StringGrid1.Cells[1, 2] = 'x') and
    (StringGrid1.Cells[2, 2] = 'x')) or
    ((StringGrid1.Cells[0, 0] = 'x') and (StringGrid1.Cells[1, 1] = 'x') and
    (StringGrid1.Cells[2, 2] = 'x')) or
    ((StringGrid1.Cells[2, 0] = 'x') and (StringGrid1.Cells[1, 1] = 'x') and
    (StringGrid1.Cells[0, 2] = 'x')) then
  begin
    result := 1;
    exit;
  end;

  if ((StringGrid1.Cells[0, 0] = 'O') and (StringGrid1.Cells[0, 1] = 'O') and
    (StringGrid1.Cells[0, 2] = 'O')) or
    ((StringGrid1.Cells[1, 0] = 'O') and (StringGrid1.Cells[1, 1] = 'O') and
    (StringGrid1.Cells[1, 2] = 'O')) or
    ((StringGrid1.Cells[2, 0] = 'O') and (StringGrid1.Cells[2, 1] = 'O') and
    (StringGrid1.Cells[2, 2] = 'O')) then
  begin
    result := 2;
    exit;
  end;
  if ((StringGrid1.Cells[0, 0] = 'O') and (StringGrid1.Cells[1, 0] = 'O') and
    (StringGrid1.Cells[2, 0] = 'O')) or
    ((StringGrid1.Cells[0, 1] = 'O') and (StringGrid1.Cells[1, 1] = 'O') and
    (StringGrid1.Cells[2, 1] = 'O')) or
    ((StringGrid1.Cells[0, 2] = 'O') and (StringGrid1.Cells[1, 2] = 'O') and
    (StringGrid1.Cells[2, 2] = 'O')) or
    ((StringGrid1.Cells[0, 0] = 'O') and (StringGrid1.Cells[1, 1] = 'O') and
    (StringGrid1.Cells[2, 2] = 'O')) or
    ((StringGrid1.Cells[2, 0] = 'O') and (StringGrid1.Cells[1, 1] = 'O') and
    (StringGrid1.Cells[0, 2] = 'O')) then
  begin
    result := 2;
    exit;
  end;

end;

procedure TForm1.jogadaHumana;
var
  cont: integer;
begin
  cont := 0;

  if (matriz[StringGrid1.Row, StringGrid1.Col] = '') then

  begin
    matriz[StringGrid1.Row, StringGrid1.Col] := 'O';
    StringGrid1.Cells[StringGrid1.Col, StringGrid1.Row] := 'O';
    bode := 1;
  end
  else
  begin
    if (matriz[StringGrid1.Row, StringGrid1.Col] <> '') then
    begin
      ShowMessage('essa posição ja foi selecionada');
      bode := 0
    end;
  end;

end;

procedure TForm1.jogadapc;
var
  cont: integer;
  x: integer;
  y: integer;
begin
  cont := 0;
  x := 1;
  y := 1;
  while cont <> 1 do
  begin
    if StringGrid1.Cells[y, x] = '' then
    begin
      StringGrid1.Cells[y, x] := 'x';
      matriz[x, y] := 'x';
      cont := cont + 1;

    end
    else
    begin
      x := RandomRange(0, 3);
      y := RandomRange(0, 3);

    end;

  end;

end;

procedure TForm1.StringGrid1Click(Sender: TObject);
var
  x, y,cont: integer;
begin
  cont:=0;
  jogadaHumana();
  funcaoteste();
  if funcaoteste = 2 then
  begin
    ShowMessage('jogador "homem" ganhou');
    Form1.close;

  end;

  if bode = 1 then
  begin
    jogadapc();
    funcaoteste();
    if funcaoteste = 1 then
    begin
      ShowMessage('jogador pc ganhou');
      Form1.close;

    end;

  end;

  for x := 0 to 2 do
  begin
    for y := 0 to 2 do
    begin
     if matriz[x,y] <> '' then
     cont:=cont+1

    end;

  end;
  if cont=9 then
  begin
    ShowMessage('empate');
      Form1.close;
  end;

end;

end.
