import 'package:flutter/material.dart';

class CadastroAluno extends StatelessWidget {
  final _nomeController = TextEditingController();
  final _alturaController = TextEditingController();
  final _idadeController = TextEditingController();
  final _emailController = TextEditingController();
  final _cpfController = TextEditingController();

  String? selectedStatus;
  List<String> statusOptions = ['Ativo', 'Inativo'];

  void _enviarCadastroAluno(BuildContext context) {
    // Validação manual dos campos
    if (_nomeController.text.isEmpty ||
        _alturaController.text.isEmpty ||
        _idadeController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _cpfController.text.isEmpty ||
        selectedStatus == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Por favor, preencha todos os campos corretamente!'),
      ));
    } else {
      print('Nome: ${_nomeController.text} ' +
          ' E-mail: ${_emailController.text} ' +
          ' Idade: ${_idadeController.text} ' +
          ' CPF: ${_cpfController.text} ' +
          ' Altura: ${_alturaController.text} ' +
          ' Status: $selectedStatus');
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastro Aluno')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Campo de Nome
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(
                labelText: 'Nome',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            // Campo de Idade
            TextField(
              controller: _idadeController,
              decoration: InputDecoration(
                labelText: 'Idade',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            // Campo de Altura
            TextField(
              controller: _alturaController,
              decoration: InputDecoration(
                labelText: 'Altura',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            // Campo de E-mail
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: "E-mail",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            // Campo de CPF
            TextField(
              controller: _cpfController,
              decoration: InputDecoration(
                labelText: "CPF",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            // Label para o Dropdown (Status)
            Text(
              'Selecione o status:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),

            // Dropdown de Status
            DropdownButton<String>(
              value: selectedStatus,
              hint: Text('Escolha o status'),
              onChanged: (String? newValue) {
                selectedStatus = newValue;
              },
              items: statusOptions.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 16),

            ElevatedButton(
              onPressed: () => _enviarCadastroAluno(context),
              child: Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }
}
