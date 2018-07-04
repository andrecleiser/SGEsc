unit uTurmaService;
{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, sqldb, Forms, LCLType, DateUtils, maskutils;

type

  TTurmaService = class
  private
  public
    // retorna a quantidade de alunos da turma.
    class function obterTotalAlunos(idTurma: integer): integer;

    // Aplica as regras de validação referentes à inclusão da turma.
    class procedure validarTurma(dataSet: TDataSet);

    // Aplica as regras de validação referentes à inclusão do aluno na turma.
    class procedure validarTurmaAluno(dataSet: TDataSet);

    // Verifica se aluno está dentro do horário em uma das turmas em que está matriculado
    class procedure validarHorarioAluno(idAluno: integer);
end;

implementation

uses
  uDATMOD;

//******************** MÉTODOS PÚBLICOS ********************//
// retorna a quantidade de alunos da turma.
class function TTurmaService.obterTotalAlunos(idTurma: integer): integer;
begin
  result := 0;
end;

// Aplica as regras de validação referentes à inclusão da turma.
class procedure TTurmaService.validarTurma(dataSet: TDataSet);
var
  horaInicial: TTime;
  horaFinal: TTime;
begin
  // Regra de validação 10
  if dataSet.FieldByName('descricao').IsNull or (dataSet.FieldByName('descricao').AsString.Trim.Length < 10) or (dataSet.FieldByName('descricao').AsString.Trim.Length > 40) then
    raise Exception.Create('A descrição da turma deve conter entre 10 e 40 caracteres.');

  // Regra de validação 1
  if (dataSet.FieldByName('descricao').AsString.Length = 0) then
    raise Exception.Create('A descrição da turma tem que ser informada.');

  // Regra de validação 2
  if (dataSet.FieldByName('fk_perfil_professor_id').IsNull) then
    raise Exception.Create('O responsável pela turma tem que ser informado.');

  // Regra de validação 11
  if (dataSet.FieldByName('controlar_horario').AsString.Equals('S')) then
  begin
    // Regra de validação 03
    if (dataSet.FieldByName('hora_inicio').AsString.Length = 0) then
      raise Exception.Create('O horário inicial tem que ser informado.');

    // Regra de validação 12
    if (dataSet.FieldByName('hora_fim').AsString.Length = 0) then
      raise Exception.Create('O horário final tem que ser informado.');

    // Regra de validação 04 - INÍCIO

    // Valida hora inicial
    try
      horaInicial := StrToTime(FormatMaskText('00:00;1', dataSet.FieldByName('hora_inicio').AsString));
    except
      raise Exception.Create('Hora inicial inválida.');
    end;

    // Valida hora inicial
    try
      horaFinal := StrToTime(FormatMaskText('00:00;1', dataSet.FieldByName('hora_fim').AsString));
    except
      raise Exception.Create('Hora final inválida.');
    end;

    if (horaInicial >= horaFinal) then
      raise Exception.Create('O horário inicial tem que ser menor do que o horário final.');

    // Regra de validação 04 - FIM
  end;

  // Regra de validação 05
  if (dataSet.FieldByName('valor_sugerido').IsNull) then
    raise Exception.Create('O valor da mensalidade tem que ser informado.');

  // Regra de validação 06
  if (dataSet.FieldByName('valor_sugerido').AsFloat <= 0) then
    raise Exception.Create('O valor da mensalidade tem que ser maior do que zero.');

  // Regra de validação 07
  if (dataSet.FieldByName('limite_alunos').IsNull) then
    raise Exception.Create('A quantidade máxima por turma tem que ser informada.');

  // Regra de validação 08
  if (dataSet.FieldByName('limite_alunos').AsFloat <= 0) then
    raise Exception.Create('A quantidade máxima de alunos tem que ser maior do que zero.');
end;

// Aplica as regras de validação referentes à inclusão do aluno na turma.
class procedure TTurmaService.validarTurmaAluno(dataSet: TDataSet);
begin
  // Regra de validação 1
  if (dataSet.FieldByName('fk_turma_id').IsNull) then
    raise Exception.Create('A turma tem que ser informada.');

  // Regra de validação 2
  if (dataSet.FieldByName('fk_aluno_id').IsNull) then
    raise Exception.Create('O aluno tem que ser informado.');

  // Regra de validação 5
  if (DataModuleApp.qryLookUpTurma.FieldByName('limite_alunos').AsInteger < (DataModuleApp.qryLookUpTurma.FieldByName('qtd_alunos_turma').AsInteger) + 1) then
    if Application.MessageBox('Quantidade de alunos à turma selecionada está maior do que o limite registrado. Deseja continuar?', 'Validação', MB_ICONQUESTION + MB_YESNO) = IDNO then
      raise Exception.Create('Inclusão cancelada!');
end;

// Verifica se aluno está dentro do horário em uma das turmas em que está matriculado
class procedure TTurmaService.validarHorarioAluno(idAluno: integer);
var
  sqlQueryTurmaAluno: TSQLQuery;
  horaInicio,
  horaFim: TTime;
  // Identifica que o aluno está vinculdao a uma turma com restrição de horário. True -> acesso dentro do horário | False -> sem acesso porque não está dentro.
  alunoVinculadoComRestricao,
 // Identifica que o aluno está vinculdao a uma turma sem restrição de horário
  alunoVinculadoSemRestricao: Boolean;

begin
  alunoVinculadoSemRestricao := false;
  alunoVinculadoComRestricao := false;

  sqlQueryTurmaAluno := TSQLQuery.Create(nil);
  sqlQueryTurmaAluno.SQLConnection := DataModuleApp.MySQL57Connection;
  sqlQueryTurmaAluno.SQL.Add('select t.controlar_horario, t.hora_inicio, t.hora_fim');
  sqlQueryTurmaAluno.SQL.Add('from   turma t');
  sqlQueryTurmaAluno.SQL.Add('       inner join turma_aluno ta on (t.id = ta.fk_turma_id and ta.fk_aluno_id = ' + idAluno.ToString + ')');
  sqlQueryTurmaAluno.Open;

  if sqlQueryTurmaAluno.IsEmpty then
    raise Exception.Create('O aluno não está matriculado em nenhuma turma!');

  while not sqlQueryTurmaAluno.EOF do
  begin
    // Veriica se o aluno está dentro do horário de alguma turma a que está vinvulado.
    if (sqlQueryTurmaAluno.FieldByName('controlar_horario').AsString = 'S') then
    begin
      horaInicio := StrToTime(FormatMaskText('00:00;1', sqlQueryTurmaAluno.FieldByName('hora_inicio').AsString));
      horaFim    := StrToTime(FormatMaskText('00:00;1', sqlQueryTurmaAluno.FieldByName('hora_fim').AsString));

      if ((Time >= horaInicio) and (Time <= horaFim)) then
      begin
        alunoVinculadoComRestricao := true;
        Break;
      end;
    end
    // Uma vez apresnetada matrícula em um curso sem restrição de horário, esta propriedade não será mais modificada.
    else
      alunoVinculadoSemRestricao := true;

    sqlQueryTurmaAluno.Next;
  end;

  // Situação 1: Aluno cadastrado em uma turma sem restrição e outra(s) com restrição, mas não autorizado.
  if ((alunoVinculadoSemRestricao) and (sqlQueryTurmaAluno.RecordCount > 1)) and (alunoVinculadoComRestricao) then
    if Application.MessageBox('O aluno está registrando frequência em uma turma sem restrição de horário?', 'Validação', MB_ICONQUESTION + MB_YESNO) = IDNO then
      raise Exception.Create('Aluno não autorizado a frequentar a turma!');

  // Situação 2: Aluno cadastrado em uma turma sem restrição apenas
  // Situação 3: Aluno cadastrado em uma turma com restrição apenas
  if (not alunoVinculadoSemRestricao) and (not alunoVinculadoComRestricao) then
      raise Exception.Create('Aluno não autorizado a frequentar a turma!');
end;

//******************** MÉTODOS PRIVADOS ********************//

end.
