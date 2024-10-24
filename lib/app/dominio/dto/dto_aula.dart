import 'dart:ffi';

class DtoAula {
  dynamic id;
  final String nomeAula;
  final String aluno;
  final DateTime data;
  final String? horario;
  final int? capacidadeMaxima;
  final String status;

  DtoAula(
      {this.id,
      required this.nomeAula,
      required this.aluno,
      required this.data,
      this.horario,
      this.capacidadeMaxima,
      this.status = 'A'});
}