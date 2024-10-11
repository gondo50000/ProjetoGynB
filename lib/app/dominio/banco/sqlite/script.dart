const criarTabelas = [
  '''
    CREATE TABLE professor(
      id INTEGER NOT NULL PRIMARY KEY
      ,nome VARCHAR(200) NOT NULL
      ,CPF CHAR(14) UNIQUE
      ,status CHAR(1)
    )
  '''
];

const insercoes = [
  '''
    INSERT INTO professor (nome, descricao, CPF, url_avatar, status)
    VALUES ('Joaquim Silva', '174.884.480-65', 'A')
  ''',
  '''
    INSERT INTO professor (nome,descricao,  CPF, url_avatar, status)
    VALUES ('Marta Silva','821.107.140-18','A')
  ''',
  '''
    INSERT INTO professor (nome, descricao, CPF, url_avatar, status)
    VALUES ('Rosana Ribas', '910.791.830-51','I')
  '''
];
