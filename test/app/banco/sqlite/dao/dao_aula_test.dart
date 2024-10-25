import 'package:flutter_test/flutter_test.dart';
import 'package:projetogynb/app/dominio/banco/sqlite/conexao.dart';
import 'package:projetogynb/app/dominio/banco/sqlite/dao/dao_cadastroAula.dart';
import 'package:projetogynb/app/dominio/dto/dto_aluno.dart';
import 'package:projetogynb/app/dominio/dto/dto_aula.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

main() async {
  late Database db;
  late DaoCadastroAula dao;

  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
    dao = DaoCadastroAula();
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

  test('dao aula - teste sintaxe sql inserir', () async {
    int resultado = await db.rawInsert(dao.sqlInserir, [
      1,
      'Aula de Yoga',
      'Barbara'
          '2024-10-25',
      '08:00 - 09:00',
      20,
      'A'
    ]);
    expect(resultado, isPositive);
  });

  test('dao aula - teste sintaxe sql alterar', () async {
    int resultado = await db.rawUpdate(dao.sqlAlterar, [
      2,
      'Aula de Pilates',
      'Helio'
          '2024-10-26',
      '09:00 - 10:00',
      15,
      'A',
    ]);
    expect(resultado, isPositive);
  });

  test('dao aula - teste sintaxe sql excluir - alterar status', () async {
    int resultado = await db.rawUpdate(dao.sqlAlterarStatus, [1]);
    expect(resultado, isPositive);
  });

  test('dao aula - teste sintaxe sql consultar por id', () async {
    var resultado = await db.rawQuery(dao.sqlConsultarPorId, [1]);
    expect(resultado.length, 1);
  });

  test('dao aula - teste sintaxe sql consultar', () async {
    var resultado = await db.rawQuery(dao.sqlConsultar);
    expect(resultado.length, isPositive);
  });

  test('dao aula - teste inserir', () async {
    var dto = DtoAula(
      nomeAula: 'Aula de Jump',
      aluno: 'Babi',
      data: DateTime.parse('2024-10-27'),
      horario: '18:00 - 19:00',
      capacidadeMaxima: 30,
      status: 'A',
    );
    dto = await dao.salvar(dto);
    expect(dto.id, isPositive);
  });

  test('dao aula - teste alterar', () async {
    var dto = DtoAula(
      nomeAula: 'Aula de Crossfit',
      aluno: 'Eduardo',
      data: DateTime.parse('2024-10-28'),
      horario: '07:00 - 08:00',
      capacidadeMaxima: 25,
      status: 'A',
    );
    dto = await dao.salvar(dto);

    var dtoAlterado = DtoAula(
      nomeAula: 'Aula de HIIT',
      aluno: 'Jose',
      data: DateTime.parse('2024-10-29'),
      horario: '06:00 - 07:00',
      capacidadeMaxima: 25,
      status: 'A',
    );
    dtoAlterado = await dao.alterar(dtoAlterado);

    expect(dtoAlterado.nomeAula, 'Aula de HIIT');
  });

  test('dao aula - teste alterar status', () async {
    var dto = DtoAula(
      nomeAula: 'Aula de Zumba',
      aluno: 'Rozana',
      data: DateTime.parse('2024-10-30'),
      horario: '17:00 - 18:00',
      capacidadeMaxima: 20,
      status: 'A',
    );
    dto = await dao.salvar(dto);
    var resultado = await dao.alterarStatus(dto.id);

    expect(resultado, true);
  });

  test('dao aula - teste consultar por id', () async {
    var dto = DtoAula(
      nomeAula: 'Aula de Funcional',
      aluno: 'Barbara',
      data: DateTime.parse('2024-10-31'),
      horario: '16:00 - 17:00',
      capacidadeMaxima: 20,
      status: 'A',
    );
    dto = await dao.salvar(dto);
    dto = await dao.consultarPorId(1);
    expect(dto.id, isPositive);
  });

  test('dao aula - teste consultar todas as aulas', () async {
    var dto = DtoAula(
      nomeAula: 'Aula de Yoga',
      aluno: 'Renan',
      data: DateTime.parse('2024-10-25'),
      horario: '08:00 - 09:00',
      capacidadeMaxima: 20,
      status: 'A',
    );
    dto = await dao.salvar(dto);
    var resultado = await dao.consultar();
    expect(resultado.length, isPositive);
  });
}
