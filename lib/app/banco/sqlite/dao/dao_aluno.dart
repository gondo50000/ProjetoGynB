import 'package:projetogynb/app/dto/dto_aluno.dart';
import 'package:sqflite/sqflite.dart';
import '../conexao.dart';
import '../dao/dao_aluno.dart';

class DAOAluno {
  static late Database _db;

  Future<DTOAluno> inserir(DTOAluno dto) async {
    _db = await Conexao.abrir();
    dto.id = await _db.rawInsert(
      'INSERT INTO aluno (nome, cpf, status) VALUES (?, ?, ?)',
      [dto.nome, dto.cpf, dto.status],
    );
    return dto;
  }

  Future<DTOAluno> alterar(DTOAluno dto) async {
    _db = await Conexao.abrir();
    await _db.rawUpdate(
      'UPDATE aluno SET nome = ?, cpf = ?, status = ? WHERE id = ?',
      [dto.nome, dto.cpf, dto.status, dto.id],
    );
    return dto;
  }

  Future<DTOAluno> consultarPorId(int id) async {
    _db = await Conexao.abrir();
    var resultado = (await _db.rawQuery(
      'SELECT * FROM aluno WHERE id = ?',
      [id],
    )).first;
    DTOAluno aluno = DTOAluno(
      id: resultado['id'],
      nome: resultado['nome'].toString(),
      cpf: resultado['CPF'].toString(),
      status: resultado['status'].toString(),
    );
    return aluno;
  }
}