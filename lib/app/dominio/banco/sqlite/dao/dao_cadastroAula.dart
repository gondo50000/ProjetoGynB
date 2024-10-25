import '../conexao.dart';
import 'package:sqflite/sqflite.dart';
import '../../../dto/dto_aula.dart';
import '../../../interface/i_dao_aula.dart';

class DaoCadastroAula implements IDaoAula {
  late Database _db;

  final sqlInserir = '''
    INSERT INTO aula (nome_aula, data, horario, capacidade_maxima, status)
    VALUES (?, ?, ?, ?, ?)
  ''';

  final sqlAlterar = '''
    UPDATE aula SET nome_aula=?, data=?, horario=?, capacidade_maxima=?, status=?
    WHERE id = ?
  ''';

  final sqlAlterarStatus = '''
    UPDATE aula SET status='I'
    WHERE id = ?
  ''';

  final sqlConsultarPorId = '''
    SELECT * FROM aula WHERE id = ?;
  ''';

  final sqlConsultar = '''
    SELECT * FROM aula;
  ''';

  @override
  Future<DtoAula> salvar(DtoAula dto) async {
    _db = await Conexao.iniciar();
    int id = await _db.rawInsert(sqlInserir, [
      dto.nomeAula,
      dto.data.toIso8601String(),
      dto.horario,
      dto.capacidadeMaxima,
      dto.status
    ]);
    dto.id = id;
    return dto;
  }

  @override
  Future<bool> alterarStatus(int id) async {
    _db = await Conexao.iniciar();
    await _db.rawUpdate(sqlAlterarStatus, [id]);
    return true;
  }

  @override
  Future<DtoAula> alterar(DtoAula dto) async {
    _db = await Conexao.iniciar();
    await _db.rawUpdate(sqlAlterar, [
      dto.nomeAula,
      dto.data.toIso8601String(),
      dto.horario,
      dto.capacidadeMaxima,
      dto.status,
      dto.id
    ]);
    return dto;
  }

  @override
  Future<DtoAula> consultarPorId(int id) async {
    _db = await Conexao.iniciar();
    var resultado = (await _db.rawQuery(sqlConsultarPorId, [id])).first;
    DtoAula aula = DtoAula(
        id: resultado['id'],
        nomeAula: resultado['nome'].toString(),
        aluno: resultado['nome Aluno'].toString(),
        data: DateTime.parse('data'),
        horario: resultado['horario'].toString(),
        capacidadeMaxima: resultado['Capacidade Máxima'] as int,
        status: resultado['status'].toString());
    return aula;
  }

  @override
  Future<List<DtoAula>> consultar() async {
    _db = await Conexao.iniciar();
    var resultado = await _db.rawQuery(sqlConsultar);
    List<DtoAula> aula = List.generate(resultado.length, (i) {
      var linha = resultado[i];
      return DtoAula(
          id: linha['id'],
          nomeAula: linha['nome'].toString(),
          aluno: linha['nome Aluno'].toString(),
          data: DateTime.parse('data'),
          horario: linha['horario'].toString(),
          capacidadeMaxima: i,
          status: linha['status'].toString());
    });
    return aula;
  }
}
