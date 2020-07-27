unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure desenhaJogo();
    function verificaPosicaoJogada(pPosicaoLinha: Integer;
      pPosicaoColuna: Integer): Integer;
    procedure StringGrid1Click(Sender: TObject);
    procedure fazJogada(pLinha: Integer; pColuna: Integer; pJogador: Integer);
    function verificaStatusJogo(): Integer;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  jogoVelha: array [0 .. 2, 0 .. 2] of Integer;

implementation

{$R *.dfm}

procedure TForm1.desenhaJogo;
var
  Row: Integer;
  Col: Integer;
begin

  // Escrever o conteúdo da matriz em memória na grade
  for Row := 0 to 2 do
  begin

    for Col := 0 to 2 do
    begin

      if jogoVelha[Row, Col] = 0 then
      begin
        StringGrid1.cells[Col, Row] := ' ';
      end
      else if jogoVelha[Row, Col] = 1 then
      begin
        StringGrid1.cells[Col, Row] := ' X';
      end
      else if jogoVelha[Row, Col] = -1 then
      begin
        StringGrid1.cells[Col, Row] := ' #';
      end;

    end;

  end;
end;

procedure TForm1.fazJogada(pLinha, pColuna, pJogador: Integer);
begin
  jogoVelha[pLinha, pColuna] := pJogador;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  Col: Integer;
  Row: Integer;
begin

  // Inicializa a matriz em memória
  for Row := 0 to 2 do
  begin

    for Col := 0 to 2 do
    begin

      jogoVelha[Row, Col] := 0;

    end;

  end;
  desenhaJogo();

end;

procedure TForm1.StringGrid1Click(Sender: TObject);
begin

  if verificaPosicaoJogada(StringGrid1.Row, StringGrid1.Col) = 1 then
  begin

    fazJogada(StringGrid1.Row, StringGrid1.Col, 1);
    desenhaJogo();

  end;

end;

function TForm1.verificaPosicaoJogada(pPosicaoLinha, pPosicaoColuna
  : Integer): Integer;
begin
  if jogoVelha[pPosicaoLinha, pPosicaoColuna] = 0 then
  begin
    Result := 1;
    Exit;
  end
  else
  begin
    Result := 0;
    Exit;
  end

end;

function TForm1.verificaStatusJogo: Integer;
var
  linha: Integer;
  coluna: Integer;
  cont: Integer;
begin

  for linha := 0 to 2 do
  begin
    cont := 0;
    for coluna := 0 to 2 do
    begin
      if jogoVelha[linha,coluna] = 1 then
      begin
        Inc(cont);
      end;
    end;

    if cont = 3 then
    begin
      Result := 1;
      Exit;
    end;

  end;

end;

end.
