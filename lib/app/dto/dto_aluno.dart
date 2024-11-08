import 'dart:ffi';

class DTOAluno {
  dynamic id;
  final String nome;
  final int? idade;
  final Float? altura;
  final int? telefone;
  final String cpf;
  final String status;

  DTOAluno(
      {this.id,
      required this.nome,
      this.idade,
      this.altura,
      this.telefone,
      required this.cpf,
      this.status = 'A'});
}
