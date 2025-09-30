CREATE DATABASE banco_jsc;
USE banco_jsc;

CREATE TABLE cliente(
id_cliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(75)
);

CREATE TABLE mensalidade(
id_mensalidade INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
cliente_id INT, 
FOREIGN KEY (cliente_id)
REFERENCES cliente(id_cliente), 
valor DECIMAL(5,2),
status_pagamento VARCHAR(50)
);


INSERT INTO cliente (id_cliente, nome)
VALUES
('1','José'),
('2','Carlos'),
('3','Marcus');


INSERT INTO mensalidade (id_mensalidade, cliente_id, valor, status_pagamento)
VALUES
('1','1','650.00','Fatura paga'),
('2','2','670.00','Fatura paga'),
('3','3','690.00','Fatura paga'),
('4','1','720.00','Em débito'),
('5','2','740.00','Em débito'),
('6','3','760.00','Em débito'),
('7','3','800.00','Em débito');

-- CONSULTA QUANTIDADE DE MENSALIDADES
SELECT count(mensalidade.status_pagamento) AS contagem_mensalidades FROM mensalidade;

-- CONSULTA MÉDIA DO VALOR DE MENSALIDADES POR CLIENTES
SELECT cliente.nome, avg(mensalidade.valor) FROM mensalidade
JOIN cliente
ON cliente.id_cliente = mensalidade.cliente_id
GROUP BY cliente.nome;




-- CONSULTA SOMA DO VALOR DE MENSALIDADES POR CLIENTES
SELECT cliente.nome, sum(mensalidade.valor) FROM mensalidade
JOIN cliente
ON cliente.id_cliente = mensalidade.cliente_id
GROUP BY cliente.nome;


-- CONSULTA MENSALIDADES EM DÉBITO DO VALOR DE MENSALIDADES POR CLIENTES
SELECT cliente.nome, sum(mensalidade.valor) FROM mensalidade
JOIN cliente
ON cliente.id_cliente = mensalidade.cliente_id
WHERE mensalidade.status_pagamento = 'Em débito' 
GROUP BY cliente.nome;





SELECT * FROM cliente;

SELECT * FROM mensalidade;

DROP DATABASE banco_jsc
