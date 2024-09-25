-- Criar a tabela Alunos
CREATE TABLE Alunos (
    id_aluno INT PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(15),
    email VARCHAR(100),
    data_inscricao DATE NOT NULL,
    status_ativo BOOLEAN DEFAULT TRUE
);

-- Criar a tabela Mensalidades
CREATE TABLE Mensalidades (
    id_mensalidade INT PRIMARY KEY AUTOINCREMENT,
    valor FLOAT NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    vencimento DATE NOT NULL
);

-- Criar a tabela Pagamentos
CREATE TABLE Pagamentos (
    id_pagamento INT PRIMARY KEY AUTOINCREMENT,
    id_aluno INT,
    id_mensalidade INT,
    data_pagamento DATE NOT NULL,
    valor_pago FLOAT NOT NULL,
    forma_pagamento VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES Alunos(id_aluno),
    FOREIGN KEY (id_mensalidade) REFERENCES Mensalidades(id_mensalidade)
);

-- Inserir dados na tabela Alunos
INSERT INTO Alunos (nome, telefone, email, data_inscricao) 
VALUES ('João Silva', '123456789', 'joao@gmail.com', '2024-01-10');

INSERT INTO Alunos (nome, telefone, email, data_inscricao) 
VALUES ('Maria Souza', '987654321', 'maria@gmail.com', '2024-02-15');

-- Inserir dados na tabela Mensalidades
INSERT INTO Mensalidades (valor, descricao, vencimento) 
VALUES (150.00, 'Mensalidade Jiu-Jitsu Janeiro', '2024-01-30');

INSERT INTO Mensalidades (valor, descricao, vencimento) 
VALUES (150.00, 'Mensalidade Jiu-Jitsu Fevereiro', '2024-02-28');

-- Inserir dados na tabela Pagamentos
INSERT INTO Pagamentos (id_aluno, id_mensalidade, data_pagamento, valor_pago, forma_pagamento) 
VALUES (1, 1, '2024-01-29', 150.00, 'Cartão de Crédito');

INSERT INTO Pagamentos (id_aluno, id_mensalidade, data_pagamento, valor_pago, forma_pagamento) 
VALUES (2, 2, '2024-02-25', 150.00, 'Transferência Bancária');

-- Consultas
SELECT * FROM Alunos WHERE status_ativo = TRUE;

SELECT 
    Pagamentos.id_pagamento, 
    Alunos.nome, 
    Mensalidades.descricao, 
    Pagamentos.data_pagamento, 
    Pagamentos.valor_pago, 
    Pagamentos.forma_pagamento
FROM Pagamentos
JOIN Alunos ON Pagamentos.id_aluno = Alunos.id_aluno
JOIN Mensalidades ON Pagamentos.id_mensalidade = Mensalidades.id_mensalidade;

SELECT 
    Alunos.nome, 
    Mensalidades.descricao, 
    Mensalidades.vencimento
FROM Alunos
JOIN Mensalidades ON Alunos.id_aluno = Mensalidades.id_mensalidade
LEFT JOIN Pagamentos ON Alunos.id_aluno = Pagamentos.id_aluno
WHERE Pagamentos.id_pagamento IS NULL;



