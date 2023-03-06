/*
    Tabela de empresa

    Você está trabalhando em um projeto em que seus clientes precisam cadastrar alguns dados das empresas que são suas parceiras. Em uma reunião para definir quais dados os seus clientes precisam, ficou acordado as seguintes colunas:

    - Um identificador numérico, sem casas decimais, que deve ser incrementado automaticamente
    - O CNPJ
    - A razão social
    - O nome fantasia
    - A data de abertura da empresa
    
    Quais das alternativas abaixo representa o comando SQL para criar a tabela que armazenará os dados das empresas?
*/

CREATE TABLE empresas (
    id SERIAL,
    cnpj CHAR(14),
    razao_social VARCHAR(255),
    nome_fantasia VARCHAR(255),
    data_abertura DATE
);



/*
    Incluindo um professor

    O seu colega de trabalho conversou com a equipe de RH durante o levantamento de requisitos de um sistema escolar. Ele foi informado que precisa incluir um professor no cadastro do sistema via script, enquanto a tela de cadastro de professores não estava disponível.

    A tabela de professores já estava criada e ele só precisa executar o script SQL de inclusão de um único professor. Apenas os campos matricula, com o valor MT001, e nome, com o valor ROBERTO, precisam ser preenchidos.

    Marque o script que deve ser executado para incluir o professor no banco de dados.
*/

INSERT INTO professores (matricula, nome) VALUES ('MT001','ROBERTO');



/*
    Alterando o percentual do INSS

    Ocorreu uma mudança na lei trabalhista, informando que o valor do desconto do INSS sobre o salário dos funcionários deve ser alterado. Esse valor é baseado na faixa de percentual abaixo:

    até 1.045,00                    7,5%
    de 1.045,01 até 2.089,60        9%
    de 2.089,61 até 3.134,40        12%
    de 3.134,41 até 6.101,06        14%
    
    Baseado na tabela funcionarios, que possui o campo percentual_inss e o campo salario, marque a alternativa correta para a atualização do percentual_inss para 14%:
*/

UPDATE funcionarios SET percentual_inss = 0.14 
WHERE salario >= 3134.41 AND salario <= 6101.06;



/*
    Excluindo produtos

    Você recebeu a tarefa de criar um script para remover os produtos que não possuíam mais estoque, na tabela produtos. Essa tabela possui um campo chamado estoque, que armazena a quantidade de itens disponíveis.

    Marque a alternativa que representa o script de exclusão dos produtos sem estoque.
*/

DELETE FROM produtos WHERE estoque = 0;



/*
    Relatório de pacientes

    A atendente de um hospital precisa gerar o relatório com nome completo e telefone dos pacientes. O sistema possui uma tabela pacientes, onde possui o campo nome e telefone.

    Dentre as alternativas abaixo, selecione aquela que contém o script que representa a geração do relatório para a atendente.
*/

SELECT nome AS "Nome Completo", telefone AS "Telefone"
FROM pacientes ORDER BY 1;



/*
    Pesquisa no dicionário

    Você recebeu uma tarefa para desenvolver uma funcionalidade de um programa em que são listadas as palavras do dicionário que começam com a letra do alfabeto que o usuário clicar. O nome da tabela que armazena as palavras se chama dicionario e o campo que contem as palavras se chama palavra.

    Dentre as alternativas abaixo, selecione aquela que representa a consulta que precisa ser executada quando o usuário clicou na letra F.
*/

SELECT palavra FROM dicionario
WHERE palavra LIKE 'F%' ORDER BY 1;



/*
    Vagas com remuneração alta

    Você está implementando um sistema de vagas de emprego e precisa implementar uma funcionalidade para pesquisar vagas com uma remuneração acima de um determinado valor. Essas vagas estão armazenadas na tabela vagas e possuem um campo chamado remuneracao.

    Selecione a alternativa que representa o script que deve ser implementado para mostrar as vagas com remuneração acima de 5000.
*/

SELECT * FROM vagas
WHERE remuneracao > 5000 
ORDER BY remuneracao DESC;



/*
    Apuração de resultado

    Você está analisando a consulta SQL de um sistema escolar, para identificar o problema no resultado de um relatório, que deve trazer os alunos que tiveram a avaliação maior ou igual a 7 e não possuem nenhuma falta:

    SELECT aluno FROM avaliação 
    WHERE nota_final >= 7 OR faltas > 0

    Baseado na SQL acima, qual das alternativas descrevem a correção do script?
*/

WHERE nota_final >= 7 AND faltas = 0



/*
    Erro de importação

    Você recebeu um script de banco de dados para importação de uma listagem de contatos:

    CREATE TABLE contatos (
        telefone VARCHAR(15) PRIMARY KEY,
        nome VARCHAR(255) NOT NULL
    );
    
    Mas o script apresentou um erro, porque o script abaixo está dando erro no momento da importação:

    INSERT INTO contatos (telefone, nome) VALUES ('(21) 98765-4321', 'João');
    INSERT INTO contatos (telefone, nome) VALUES ('(21) 98765-4321', 'Roberto');
    INSERT INTO contatos (telefone, nome) VALUES ('(21) 91234-5678', 'Maria');
    
    Baseado na SQL acima, qual das alternativas descrevem a correção do script?
*/

INSERT INTO contatos (telefone, nome) VALUES ('(21) 98765-4321', 'João');
INSERT INTO contatos (telefone, nome) VALUES ('(21) 98765-4321', 'Roberto');

Contatos com mesmo número de telefone, sendo que o campo telefone recebe primary key.



/*
    Departamento do funcionário

    Você está reestruturando um cadastro de funcionários e seus departamentos. Antes, a pessoa que incluía os funcionários no sistema podia digitar qualquer nome de departamento, então você resolve criar um cadastro de departamentos e vincular o cadastro do funcionário aos departamentos previamente cadastrados no sistema.

    Visto que você já criou a tabela departamentos, com os campos id e nome:

    CREATE TABLE departamentos (
        id SERIAL PRIMARY KEY,
        nome VARCHAR(255) NOT NULL
    );

    Como a tabela de funcionários deve ser estruturada?
*/

CREATE TABLE funcionarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    departamento_id INTEGER,

    FOREIGN KEY (departamento_id)
    REFERENCES departamentos (id)
);



/*
    Funcionários com departamento

    A gerente do RH te pediu um relatório com o nome de todos os funcionários e o nome dos seus respectivos departamentos. As tabelas seguem a seguinte estrutura:

    CREATE TABLE departamentos (
        id SERIAL PRIMARY KEY,
        nome VARCHAR(255) NOT NULL
    );

    CREATE TABLE funcionarios (
        id SERIAL PRIMARY KEY,
        nome VARCHAR(255) NOT NULL,
        departamento_id INTEGER,
        FOREIGN KEY (departamento_id) REFERENCES departamentos (id)
    );

    Selecione o script que retornaria os dados do relatório.
*/

SELECT
    funcionarios.nome AS "Nome do Funcionário",
    departamentos.nome AS "Departamento"
FROM funcionarios
JOIN departamentos ON funcionarios.departamento_id = departamentos.id



/*
    Exclusão de aluno e turma

    Você está trabalhando em um projeto de escola, em que existe um cadastro de turmas e os alunos são matriculados nelas. O relacionamento da tabela alunos_turma com alunos está configurado como RESTRICT, já o relacionamento com a tabela de turmas está configurado como CASCADE.

    Qual comportamento será respeitado ao tentar excluir um aluno que esteja matriculado em uma turma e qual será o comportamento ao tentar excluir uma turma que possui aluno matriculado?
*/

Erro na exclusão do aluno por causa do `RESTRICT` e sucesso na exclusão da turma por causa do `CASCADE`.



/*
    Atualização de telefone

    Você está trabalhando em um projeto de agenda telefônica, que existe com a estrutura abaixo:

    CREATE TABLE pessoas (
        id INTEGER PRIMARY KEY,
        nome VARCHAR(255) NOT NULL
    );

    CREATE TABLE telefones (
        id INTEGER PRIMARY KEY,
        pessoa_id INTEGER,
        numero VARCHAR(15) NOT NULL,
        FOREIGN KEY (pessoa_id) REFERENCES pessoas (id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
    );

    INSERT INTO pessoas (id, nome) VALUES (1,'Diogo');
    INSERT INTO telefones (id, pessoa_id, numero) VALUES (1,1,'(21) 98765-4321');

    Ao executar os comandos abaixo:

    UPDATE pessoas SET id = 2 WHERE nome = 'Diogo';
    DELETE FROM pessoas WHERE nome = 'Diogo';

    Qual será o resultado?
*/

Sucesso ao UPDATE o id da pessoa e erro em DELETE a pessoa.



/*
    Classificação de vestibular

    Você está trabalhando em uma universidade, que aplicou uma prova de vestibular e precisa saber os 100 primeiros colocados, ordenados pela maior nota e por ordem alfabética.

    Para tal, há a seguinte SQL:

    SELECT nome, nota
    FROM notas
    
    Complete a SQL acima, para listar os 100 primeiros alunos, ordenados pela maior nota e por ordem alfabética.
*/

ORDER BY nota DESC, nome LIMIT 100



/*
    Realização de evento

    Você está organizando um evento, sendo que você precisa cancelar os auditórios das palestras que tinham menos do que 10 inscritos.

    Para tal, há a seguinte SQL:

    SELECT
        palestras.nome       AS "Nome da Palestra",
        count(inscricoes.id) AS "Quantidade de Inscritos"
    FROM inscricoes 
    JOIN palestras ON palestras.id = inscricoes.palestra_id

    Quais das alternativas abaixo completam a SQL para listar o nome das palestras?
*/

GROUP BY 1
HAVING count(inscricoes.id) < 10
ORDER BY 1