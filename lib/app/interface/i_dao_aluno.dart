import '../dto/dto_aluno.dart';

abstract class IDaoAluno {
  Future<DTOAluno> salvar(DTOAluno dto);
  Future<DTOAluno> alterar(DTOAluno dto);
  Future<bool> alterarStatus(int id);
  Future<DTOAluno> consultarPorId(int id);
  Future<List<DTOAluno>> consultar();
}
