import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite/sqflite.dart';
import '../../../../../lib/app/banco/sqlite/dao/dao_aluno.dart';
import '../../../../../lib/app/dto/dto_aluno.dart';
import '../../../../../lib/app/banco/sqlite/conexao.dart';

void main() {
  late Database db;
  late DAOAluno dao;

  setUpAll(() async {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
    db = await Conexao.abrir();
    dao = DAOAluno();
  });

  tearDownAll(() async {
    await db.close();
  });

  test('dao aluno - teste sintaxe sql inserir', () async {
    DTOAluno novoAluno = DTOAluno(nome: 'PAULO', cpf: '984.755.560-51', status: 'A');
    DTOAluno alunoInserido = await dao.inserir(novoAluno);
    expect(alunoInserido.id, isNotNull);
  });

  test('dao aluno - teste sintaxe sql alterar', () async {
    DTOAluno alunoExistente = DTOAluno(id: 1, nome: 'PAULO', cpf: '425.817.300-21', status: 'A');
    DTOAluno alunoAlterado = await dao.alterar(alunoExistente);
    expect(alunoAlterado.nome, 'PAULO');
  });
}