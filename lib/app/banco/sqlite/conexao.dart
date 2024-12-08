import 'package:flutter/foundation.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

import 'script.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Conexao {
  static late Database _db;

  static Future<Database> abrir() async {
    if (kIsWeb) {
      databaseFactory = databaseFactoryFfiWeb;
    }

    var path = join(await getDatabasesPath(), 'banco.db');
    deleteDatabase(path);
    _db = await openDatabase(path, version: 1, onCreate: (db, version) {
      criarTabelas.forEach(db.execute);
      insercoes.forEach(db.execute);
    }, singleInstance: true);
    return _db;
  }
}
