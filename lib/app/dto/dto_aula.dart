import 'dart:ffi';

class DTOAula {
  dynamic id;
  final String nomeAula;
  final String aluno;
  final DateTime data;
  final String? horario;
  final int capacidadeMaxima;
  final String status;

  DTOAula(
      {this.id,
      required this.nomeAula,
      required this.aluno,
      required this.data,
      this.horario,
      required this.capacidadeMaxima,
      this.status = 'A'});
}
