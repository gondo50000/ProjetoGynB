import 'dart:ffi';

import 'cpf.dart' as validador;
import '../dto/dto_aluno.dart';
import '../interface/i_dao_aluno.dart';

class Aluno {
  dynamic _id;
  String? _nome;
  int? _idade;
  Float? _altura;
  int? _telefone;
  String? _cpf;
  String? _status = 'A';
  IDaoAluno dao;

  Aluno({required this.dao});

  validar({required DTOAluno dto}) {
    nome = dto.nome;
    idade = dto.idade;
    altura = dto.altura;
    telefone = dto.telefone;
    cpf = dto.cpf;
    status = dto.status;
    validador.CPF(cpf).eValido();
  }

  Future<DTOAluno> salvar(DTOAluno dto) async {
    validar(dto: dto);
    return await dao.salvar(dto);
  }

  Future<DTOAluno> alterar(dynamic id) async {
    this.id = id;
    return await dao.alterar(_id);
  }

  Future<bool> excluir(dynamic id) async {
    this.id = id;
    await dao.alterarStatus(_id);
    return true;
  }

  Future<List<DTOAluno>> consutlar() async {
    return await dao.consultar();
  }

  String? get nome => _nome;
  int? get idade => _idade;
  Float? get altura => _altura;
  int? get telefone => _telefone;
  String? get cpf => _cpf;
  String? get status => status;

  set id(int? id) {
    if (id == null) throw Exception('ID não pode ser nulo');
    if (id < 0) throw Exception('ID não pode ser negativo');
    _id = id;
  }

  set nome(String? nome) {
    if (nome == null) throw Exception('Nome não pode ser nulo.');
    if (nome.isEmpty) throw Exception('Nome não pode ser vazio.');
    nome = nome;
  }

  set idade(int? idade) {
    if (idade == null) throw Exception('Idade não pode ser nulo.');
    idade = idade;
  }

  set altura(Float? altura) {
    if (altura == null) throw Exception('altura não pode ser nulo.');
    altura = altura;
  }

  set telefone(int? telefone) {
    if (telefone == null) throw Exception('telefone não pode ser nulo.');
    telefone = telefone;
  }

  set cpf(String? cpf) {
    if (cpf == null) throw Exception('CPF não pode ser nulo.');
    if (cpf.isEmpty) throw Exception('CPF não pode ser vazio.');
    cpf = cpf;
  }

  set status(String? status) {
    if (status == null) throw Exception('Status não pode ser nulo.');
    if (status != 'A' || status != 'I')
      throw Exception('Status deve ser "A" ou "I".');
    status = status;
  }
}
