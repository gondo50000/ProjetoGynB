import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projetogynb/app/banco/sqlite/conexao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

main() async {
  setUpAll(() {
    sqfliteFfiInit();
    if (kIsWeb) {
      databaseFactory = databaseFactoryFfiWeb;
    }
  });

  test('Teste classe conexao', () async {
    var db = await Conexao.abrir();
    expect(db.isOpen, true);
    await db.close();
  });
}
