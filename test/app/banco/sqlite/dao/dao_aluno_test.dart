import 'package:flutter_test/flutter_test.dart';
import 'package:projetogynb/app/dominio/banco/sqlite/conexao.dart';
import 'package:projetogynb/app/dominio/banco/sqlite/dao/dao_aluno.dart';
import 'package:projetogynb/app/dominio/dto/dto_aluno.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

main() async {
  late Database db;
  late DaoAluno dao;

  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
    dao = DaoAluno();
  });

  setUp(() async {
    db = await Conexao.iniciar();
  });

  tearDown(() async {
    deleteDatabase(db.path);
    db = await Conexao.iniciar();
  });

  tearDownAll(() async {
    db.close();
  });

  test('dao aluno - teste sintaxe sql inserir', () async {
    int resultado = await db
        .rawInsert(dao.sqlInserir, ['PAULO', '', '984.755.560-51', 'A']);
    expect(resultado, isPositive);
  });

  test('dao aluno - teste sintaxe sql alterar ', () async {
    int resultado = await db
        .rawUpdate(dao.sqlAlterar, ['PAULO', '', '425.817.300-21', 'A', 1]);
    expect(resultado, isPositive);
  });

  test('dao aluno - teste sintaxe sql excluir - alterar status ', () async {
    int resultado = await db.rawUpdate(dao.sqlAlterarStatus, [1]);
    expect(resultado, isPositive);
  });

  test('dao aluno - teste sintaxe sql consultar por id ', () async {
    var resultado = await db.rawQuery(dao.sqlConsultarPorId, [1]);
    expect(resultado.length, 1);
  });

  test('dao aluno - teste sintaxe sql consultar ', () async {
    var resultado = await db.rawQuery(dao.sqlConsultar);
    expect(resultado.length, isPositive);
  });

  test('dao aluno - teste inserir', () async {
    var dto = DTOAluno(nome: 'PAULO', cpf: '589.156.920-55', status: 'A');
    dto = await dao.salvar(dto);
    expect(dto.id, isPositive);
  });

  test('dao professor - teste alterar', () async {
    var dto = DTOAluno(nome: 'PAULO', cpf: '589.156.920-55', status: 'A');
    dto = await dao.salvar(dto);
    var dtoAlterado =
        DTOAluno(nome: 'PAULO', cpf: '589.156.920-55', status: 'A');
    dtoAlterado = await dao.alterar(dtoAlterado);

    expect(dtoAlterado.nome, 'Renan');
  });

  test('dao professor - teste alterar status', () async {
    var dto = DTOAluno(nome: 'PAULO', cpf: '589.156.920-55', status: 'A');
    dto = await dao.salvar(dto);
    var resultado = await dao.alterarStatus(dto.id);

    expect(resultado, true);
  });

  test('dao professor - teste consultar por id', () async {
    var dto = DTOAluno(nome: 'PAULO', cpf: '589.156.920-55', status: 'A');
    dto = await dao.salvar(dto);
    dto = await dao.consultarPorId(1);
    expect(dto.id, isPositive);
  });

  test('dao professor - teste consultar', () async {
    var dto = DTOAluno(nome: 'PAULO', cpf: '589.156.920-55', status: 'A');
    dto = await dao.salvar(dto);
    var resultado = await dao.consultar();
    expect(resultado.length, isPositive);
  });
}
