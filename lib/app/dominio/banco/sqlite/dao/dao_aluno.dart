import '../conexao.dart';
import 'package:sqflite/sqflite.dart';
import '../../../dto/dto_aluno.dart';
import '../../../interface/i_dao_aluno.dart';

class DaoAluno implements IDaoAluno {
  late Database _db;
  final sqlInserir = '''
    INSERT INTO aluno (nome,  CPF, status)
    VALUES (?,?,?,?,?)
  ''';
  final sqlAlterar = '''
    UPDATE professor SET nome=?, CPF=?, status=?
    WHERE id = ?
  ''';
  final sqlAlterarStatus = '''
    UPDATE aluno SET status='I'
    WHERE id = ?
  ''';
  final sqlConsultarPorId = '''
    SELECT * FROM aluno WHERE id = ?;
  ''';
  final sqlConsultar = '''
    SELECT * FROM aluno;
  ''';

  @override
  Future<DTOAluno> salvar(DTOAluno dto) async {
    _db = await Conexao.iniciar();
    int id = await _db.rawInsert(sqlInserir, [dto.nome, dto.cpf, dto.status]);
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
  Future<DTOAluno> alterar(DTOAluno dto) async {
    _db = await Conexao.iniciar();
    await _db.rawUpdate(sqlAlterar, [dto.nome, dto.cpf, dto.status, dto.id]);
    return dto;
  }

  @override
  Future<DTOAluno> consultarPorId(int id) async {
    _db = await Conexao.iniciar();
    var resultado = (await _db.rawQuery(sqlConsultarPorId, [id])).first;
    DTOAluno aluno = DTOAluno(
        id: resultado['id'],
        nome: resultado['nome'].toString(),
        cpf: resultado['CPF'].toString(),
        status: resultado['status'].toString());
    return aluno;
  }

  @override
  Future<List<DTOAluno>> consultar() async {
    _db = await Conexao.iniciar();
    var resultado = await _db.rawQuery(sqlConsultar);
    List<DTOAluno> alunos = List.generate(resultado.length, (i) {
      var linha = resultado[i];
      return DTOAluno(
          id: linha['id'],
          nome: linha['nome'].toString(),
          cpf: linha['CPF'].toString(),
          status: linha['status'].toString());
    });
    return alunos;
  }
}
