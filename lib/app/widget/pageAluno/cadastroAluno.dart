import 'package:flutter/material.dart';

class Cadastroaluno extends StatefulWidget {
  @override
  _CadastroAluno createState() => _CadastroAluno();
}

class _CadastroAluno extends State<Cadastroaluno> {
  final _formKey = GlobalKey<FormState>();

  final _nomeController = TextEditingController();
  final _alturaController = TextEditingController();
  final _idadeController = TextEditingController();
  final _emailController = TextEditingController();
  final _cpfController = TextEditingController();
  final _statusController = TextEditingController();

  // Variável para armazenar a seleção do status
  String? selectedStatus;

  // Lista de opções para o Dropdown
  List<String> statusOptions = ['Ativo', 'Inativo'];

  void _enviarCadastroAluno() {
    if (_formKey.currentState?.validate() ?? false) {
      // Exibe as informações cadastradas
      print('Nome: ${_nomeController.text} ' +
          ' E-mail: ${_emailController.text} ' +
          ' Idade: ${_idadeController.text} ' +
          ' CPF: ${_cpfController.text} ' +
          ' Altura: ${_alturaController.text} ' +
          ' Status: $selectedStatus');

      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Por favor, preencha todos os campos corretamente!'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastro Aluno')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Campo de Nome
              TextFormField(
                controller: _nomeController,
                decoration: InputDecoration(
                  labelText: 'Nome',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu nome';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Campo de Idade
              TextFormField(
                controller: _idadeController,
                decoration: InputDecoration(
                  labelText: 'Idade',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor Insira sua Idade';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Campo de Altura
              TextFormField(
                controller: _alturaController,
                decoration: InputDecoration(
                  labelText: 'Altura',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a altura';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Campo de E-mail
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: "E-mail",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor insira o e-mail';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Campo de CPF
              TextFormField(
                controller: _cpfController,
                decoration: InputDecoration(
                  labelText: "CPF",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor insira o CPF';
                  }
                  return null;
                },
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
                  setState(() {
                    selectedStatus = newValue;
                  });
                },
                items:
                    statusOptions.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 16),

              ElevatedButton(
                onPressed: _enviarCadastroAluno,
                child: Text('Cadastrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
