import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite/sqflite.dart';
import '../../../lib/app/banco/sqlite/conexao.dart';

void main() {
  setUpAll(() {
    print('Inicializando sqfliteFfi');
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
    print('sqfliteFfi inicializado');
  });

  test('Teste de conexão com o banco de dados', () async {
    print('Iniciando teste de conexão com o banco de dados');
    try {
      Database db = await Conexao.abrir();
      print('Banco de dados aberto: ${db.isOpen}');
      expect(db.isOpen, true);
    } catch (e) {
      print('Erro ao abrir o banco de dados: $e');
    }
  });
}