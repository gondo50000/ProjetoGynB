const criarTabelas = [
  '''
    CREATE TABLE aluno(
      id INTEGER NOT NULL PRIMARY KEY
      ,nome VARCHAR(200) NOT NULL
      ,CPF CHAR(14) UNIQUE
      ,status CHAR(1)
    )
  '''

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
    INSERT INTO professor (nome, descricao, CPF, status)
    VALUES ('Joaquim Silva', '174.884.480-65', 'A')
  ''',
  '''
    INSERT INTO professor (nome,descricao,  CPF, status)
    VALUES ('Marta Silva','821.107.140-18','A')
  ''',
  '''
    INSERT INTO professor (nome, descricao, CPF, status)
    VALUES ('Rosana Ribas', '910.791.830-51','I')
  '''

  '''
    INSERT INTO cadastroAula (nomeAula, nomeAluno, data, horario, capacidadeMaxima, status)
    VALUES ('Jump', 'Babi', '2024-08-12', 9:00 ás 10:00, 10, 'A')
  '''
];
