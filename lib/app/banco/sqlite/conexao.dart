import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

import 'script.dart';

class Conexao {
  static late Database _db;

  static Future<Database> abrir() async {
    if (kIsWeb) {
      databaseFactory = databaseFactoryFfiWeb;
    } else {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
    }

    var path = join(await getDatabasesPath(), 'banco.db');
    // deleteDatabase(path); // Remova ou comente esta linha para evitar deletar o banco de dados
    _db = await openDatabase(path, version: 1, onCreate: (db, version) {
      criarTabelas.forEach(db.execute);
      insercoes.forEach(db.execute);
    }, singleInstance: true);
    return _db;
  }
}