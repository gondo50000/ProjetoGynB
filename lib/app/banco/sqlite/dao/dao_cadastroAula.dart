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
  Future<DTOAula> salvar(DTOAula dto) async {
    _db = await Conexao.abrir();
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
    _db = await Conexao.abrir();
    await _db.rawUpdate(sqlAlterarStatus, [id]);
    return true;
  }

  @override
  Future<DTOAula> alterar(DTOAula dto) async {
    _db = await Conexao.abrir();
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
  Future<DTOAula> consultarPorId(int id) async {
    _db = await Conexao.abrir();
    var resultado = (await _db.rawQuery(sqlConsultarPorId, [id])).first;
    DTOAula aula = DTOAula(
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
  Future<List<DTOAula>> consultar() async {
    _db = await Conexao.abrir();
    var resultado = await _db.rawQuery(sqlConsultar);
    List<DTOAula> aula = List.generate(resultado.length, (i) {
      var linha = resultado[i];
      return DTOAula(
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
