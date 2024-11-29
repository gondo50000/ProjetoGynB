import 'package:projetogynb/app/dto/dto_aula.dart';

abstract class IDaoAula {
  Future<DTOAula> salvar(DTOAula dto);
  Future<DTOAula> alterar(DTOAula dto);
  Future<bool> alterarStatus(int id);
  Future<DTOAula> consultarPorId(int id);
  Future<List<DTOAula>> consultar();
}
