import 'package:projetogynb/app/dto/dto_aula.dart';
import 'package:projetogynb/app/interface/i_dao_aula.dart';

class CadastroAulas {
  dynamic _id;
  String? _nomeAula;
  String? _aluno;
  DateTime? _data;
  String? _horario;
  int? _capacidadeMaxima;
  String? _status = 'A';
  IDaoAula dao;

  CadastroAulas({required this.dao});

  // Método para validar os dados da aula antes de salvar
  void validar({required DTOAula dto}) {
    _nomeAula = dto.nomeAula;
    _aluno = dto.aluno;
    _data = dto.data;
    _horario = dto.horario;
    _capacidadeMaxima = dto.capacidadeMaxima;
    _status = dto.status;
  }

  // Método para salvar uma nova aula
  Future<DTOAula> salvar(DTOAula dto) async {
    validar(dto: dto);
    return await dao.salvar(dto);
  }

  // Método para alterar uma aula existente
  Future<DTOAula> alterar(dynamic id) async {
    this.id = id;
    return await dao.alterar(_id);
  }

  // Método para excluir uma aula (muda o status para inativa)
  Future<bool> excluir(dynamic id) async {
    this.id = id;
    await dao.alterarStatus(_id);
    return true;
  }

  // Método para consultar todas as aulas
  Future<List<DTOAula>> consultar() async {
    return await dao.consultar();
  }

  // Getters
  String? get nomeAula => _nomeAula;
  DateTime? get data => _data;
  String? get horario => _horario;
  int? get capacidadeMaxima => _capacidadeMaxima;
  String? get status => _status;

  // Setters com validações
  set id(dynamic id) {
    if (id == null) throw Exception('ID não pode ser nulo.');
    if (id < 0) throw Exception('ID não pode ser negativo.');
    _id = id;
  }

  set nomeAula(String? nomeAula) {
    if (nomeAula == null) throw Exception('Nome da aula não pode ser nulo.');
    if (nomeAula.isEmpty) throw Exception('Nome da aula não pode ser vazio.');
    _nomeAula = nomeAula;
  }

  set data(DateTime? data) {
    if (data == null) throw Exception('Data da aula não pode ser nula.');
    if (data.isBefore(DateTime.now()))
      throw Exception('A data da aula não pode ser no passado.');
    _data = data;
  }

  set horario(String? horario) {
    if (horario == null) throw Exception('Horário da aula não pode ser nulo.');
    if (horario.isEmpty) throw Exception('Horário da aula não pode ser vazio.');
    _horario = horario;
  }

  set capacidadeMaxima(int? capacidadeMaxima) {
    if (capacidadeMaxima == null)
      throw Exception('Capacidade máxima não pode ser nula.');
    if (capacidadeMaxima <= 0)
      throw Exception('Capacidade máxima deve ser maior que zero.');
    _capacidadeMaxima = capacidadeMaxima;
  }

  set status(String? status) {
    if (status == null) throw Exception('Status não pode ser nulo.');
    if (status != 'A' && status != 'I')
      throw Exception('Status deve ser "A" (ativa) ou "I" (inativa).');
    _status = status;
  }
}
