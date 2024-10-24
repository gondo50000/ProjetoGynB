import 'package:projetogynb/app/dominio/dto/dto_aula.dart';

abstract class IDaoAula {
  Future<DtoAula> salvar(DtoAula dto);
  Future<DtoAula> alterar(DtoAula dto);
  Future<bool> alterarStatus(int id);
  Future<DtoAula> consultarPorId(int id);
  Future<List<DtoAula>> consultar();
}