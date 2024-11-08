import 'package:flutter/material.dart';

class Cadastroaluno extends StatefulWidget {
  @override
  _CadastroAluno createState() => _CadastroAluno();
}

class _CadastroAluno extends State<Cadastroaluno> {
  final _formKey = GlobalKey<FormState>();

  final _raController = TextEditingController();
  final _nomeController = TextEditingController();
  final _cursoController = TextEditingController();
  final _emailController = TextEditingController();

  void _enviarFormulario() {
    if (_formKey.currentState?.validate() ?? false) {
      String dados = 'RA: ${_raController.text} ' +
          ' Nome: ${_nomeController.text} ' +
          ' E-mail: ${_emailController.text} ' +
          ' Curso: ${_cursoController.text} ';

      Navigator.pop(context, dados);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Por favor, preencha todos os campos corretamente!'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Formulário')),
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

              // Campo de E-mail
              TextFormField(
                controller: _emailController,
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

              // Campo de Curso
              TextFormField(
                controller: _cursoController,
                decoration: InputDecoration(
                  labelText: 'Altrura',
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

              ElevatedButton(
                onPressed: _enviarFormulario,
                child: Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
