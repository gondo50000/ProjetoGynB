const criarTabelas = [
  '''
    CREATE TABLE aluno(
      id INTEGER NOT NULL PRIMARY KEY
      ,nome VARCHAR(200) NOT NULL
      ,CPF CHAR(14) UNIQUE
      ,status CHAR(1)
    )
  ''',
  '''
    CREATE TABLE cadastroAula(
      id INTEGER NOT NULL PRIMARY KEY
      ,nomeAula VARCHAR(200) NOT NULL
      ,nomeAluno VARCHAR(200) NOT NULL
      ,data DATE NOT NULL
      ,horario VARCHAR(30) NOT NULL
      ,capacidadeMaxima INT NOT NULL 
      ,status CHAR(1)
    )
  '''
];

const insercoes = [
  '''
    INSERT INTO aluno (nome, CPF, status)
    VALUES ('Joaquim Silva', '17488448065', 'A');
  ''',
  '''
    INSERT INTO aluno (nome,  CPF, status)
    VALUES ('Marta Silva','82110714018','A');
  ''',
  '''
    INSERT INTO aluno (nome, CPF, status)
    VALUES ('Rosana Ribas', '91079183051','I');
  '''
      '''
    INSERT INTO cadastroAula (nomeAula, nomeAluno, data, horario, capacidadeMaxima, status)
    VALUES ('Jump', 'Babi', '2024-08-12', 9:00 - 10:00, 10, 'A');
  '''
      '''
    INSERT INTO cadastroAula (nomeAula, nomeAluno, data, horario, capacidadeMaxima, status)
    VALUES ('Aula de Yoga', 'Barbara', '2024-10-25', '08:00 - 09:00', 20, 'A');
  '''
      '''
    INSERT INTO cadastroAula (nomeAula, nomeAluno, data, horario, capacidadeMaxima, status)
    VALUES ('Aula de Pilates', 'Helio', '2024-10-26', 09:00 - 10:00, 15, 'A');
  '''
];
