create schema ilusion_services;

create table cliente (
cod_cliente integer auto_increment,
cpf_cnpj_cliente varchar(20) not null unique,
nome_cliente varchar(80) not null,
email_cliente varchar(80) not null,
endereco_cliente varchar(80) not null,
tipo_cliente varchar(80) not null,    
telefone_cliente varchar(20) not null,
	primary key (cod_cliente)
);


create table fornecedor(
cod_fornecedor integer auto_increment,
cpf_cnpj_fornecedor varchar(20) not null unique,
nome_fornecedor varchar(80) not null,
email_fornecedor varchar(80) not null,
endereco_fornecedor varchar(80) not null,
tipo_fornecedor varchar(80) not null,    
telefone_fornecedor varchar(20) not null,
	primary key(cod_fornecedor)
);
 

create table categoria (
cod_categoria integer auto_increment, 
nome_categoria varchar(20) not null,
descricao_categoria varchar(100) not null,
	primary key (cod_categoria)
);


create table servico(
cod_servico integer auto_increment,
descricao_servico varchar(200) not null,
preco_inicial_servico varchar(25) not null, 
nome_servico varchar(80) not null,
categoria_servico integer,
	primary key(cod_servico),
	foreign key (categoria_servico)
		references categoria(cod_categoria)
			on delete no action
			on update no action
);


create table servico_oferecido(
cod_serv_oferecido integer auto_increment,
cod_fornecedor integer not null,
cod_servico integer not null,
	primary key (cod_serv_oferecido),
	foreign key(cod_fornecedor)
		references fornecedor(cod_fornecedor)
			on delete no action
            on update no action,
	foreign key(cod_servico)
        references servico(cod_servico)
            on delete no action
            on update no action
);


create table orcamento (
cod_orcamento integer auto_increment,
validade_orcamento date not null,
status_orcamento varchar(20) not null,
valor_orcamento varchar(20) not null,
descri_orcamento varchar(200) not null,
data_orcamento date not null,
cod_fornecedor integer not null,
cod_cliente integer not null,
	primary key (cod_orcamento),
    foreign key (cod_fornecedor)
		references fornecedor(cod_fornecedor)
			on delete no action
            on update no action,
	foreign key (cod_cliente)
		references cliente(cod_cliente)
            on delete no action
            on update no action
);


create table orcamento_contem(
cod_orcamento integer not null,   
cod_servico_oferecido integer not null,
	primary key (cod_orcamento, cod_servico_oferecido),
	foreign key(cod_orcamento)
		references orcamento(cod_orcamento)
			on delete no action
			on update no action,
	foreign key(cod_servico_oferecido)
	references servico_oferecido(cod_serv_oferecido)
		on delete no action
		on update no action
);


create table contrato (
cod_contrato integer auto_increment,
local_contrato varchar(40) not null,
termos_contrato varchar(200) not null,
data_contrato date not null,
valor_contrato varchar(25) not null,
validade_contrato date not null,
cod_cliente integer not null,
cod_fornecedor integer not null,
	primary key (cod_contrato),
	foreign key (cod_cliente)
		references cliente(cod_cliente)
			on delete no action
			on update no action,
	foreign key (cod_fornecedor)
		references fornecedor(cod_fornecedor)
			on delete no action
			on update no action
);


create table contrato_contem(
cod_contrato integer,   
cod_serv_oferecido integer not null,
	primary key (cod_contrato, cod_serv_oferecido),  
	foreign key(cod_contrato)
		references contrato(cod_contrato)
			on delete no action
			on update no action,
	foreign key(cod_serv_oferecido)
		references servico_oferecido(cod_serv_oferecido)
			on delete no action
			on update no action
);


create table avaliacao (
cod_avaliacao integer auto_increment,
descri_avaliacao varchar(200) not null,
qualidade_avaliacao integer,
data_avaliacao date not null,
cod_serv_oferecido integer not null,
cod_avaliador integer not null,
	primary key (cod_avaliacao),
	foreign key (cod_serv_oferecido)
		references servico_oferecido (cod_serv_oferecido)
			on delete no action
			on update no action,
	foreign key (cod_avaliador)
		references cliente(cod_cliente)
			on delete no action
			on update no action
);


create table chat (
cod_chat integer auto_increment,
data_hora_chat datetime,
cod_fornecedor integer not null,
cod_cliente integer not null,
primary key (cod_chat),
foreign key (cod_fornecedor)
references fornecedor(cod_fornecedor)
on delete no action
on update no action,
foreign key (cod_cliente)
references cliente(cod_cliente)
on delete no action
on update no action
);


create table midia (
cod_midia integer auto_increment,
midia blob,
formato_midia varchar(20),
tamanho_midia integer,
	primary key (cod_midia)
);


create table mensagem (
cod_msg integer auto_increment,
data_hora_msg datetime,
conteudo_msg varchar(200) not null,
cod_cliente integer,
cod_fornecedor integer,
cod_chat integer,
cod_midia integer,
	primary key (cod_msg),
	foreign key (cod_chat)
		references chat(cod_chat)
			on delete no action
			on update no action,
	foreign key (cod_cliente)
		references cliente(cod_cliente)
			on delete no action
			on update no action,
	foreign key (cod_fornecedor)
		references fornecedor(cod_fornecedor)
			on delete no action
			on update no action,
	foreign key (cod_chat)
		references chat(cod_chat)
			on delete no action
			on update no action,
	foreign key (cod_midia)
		references midia(cod_midia)
			on delete no action
			on update no action
);




/* POPULANDO O BANCO */

-- Tabela cliente
INSERT INTO cliente (cpf_cnpj_cliente, nome_cliente, email_cliente, endereco_cliente, tipo_cliente, telefone_cliente)
VALUES
('061.222.333-02', 'João da Silva', 'joao@email.com', 'Rua A, 123', 'Pessoa Física', '(66) 98555-2214'),
('062.333.444-91', 'Maria Oliveira', 'maria@email.com', 'Avenida B, 456', 'Pessoa Física', '(65) 99922-9559'),
('125.123.453-09', 'Fernanda Santos', 'fernanda@email.com', 'Rua C, 789', 'Pessoa Física', '(55) 98765-4321'),
('343.234.745-18', 'Carlos Silva', 'carlos@email.com', 'Avenida D, 012', 'Pessoa Física', '(55) 98765-5678'),
('002.001.100-23', 'Mariana Gonçalves', 'mariana@email.com', 'Rua E, 456', 'Pessoa Física', '(55) 98765-9876'),
('768.231.923-87', 'Roberto Pereira', 'roberto@email.com', 'Avenida F, 123', 'Pessoa Física', '(55) 98765-2345'),
('434.999.323-34', 'Aline Oliveira', 'aline@email.com', 'Rua G, 789', 'Pessoa Física', '(55) 98765-8765'),
('125.352.543-87', 'Pedro Ribeiro', 'pedro@email.com', 'Avenida H, 012', 'Pessoa Física', '(55) 98765-2345'),
('998.555.345-45', 'Camila Santos', 'camila@email.com', 'Rua I, 456', 'Pessoa Física', '(55) 98765-7654'),
('444.123.453-76', 'Lucas Costa', 'lucas@email.com', 'Avenida J, 123', 'Pessoa Física', '(55) 98765-8765'),
('098.666.234-09', 'Ana Souza', 'ana@email.com', 'Rua K, 789', 'Pessoa Física', '(55) 98765-1234'),
('676.098.343-11', 'Júlia Almeida', 'julia@email.com', 'Avenida L, 012', 'Pessoa Física', '(55) 98765-6543');

-- Tabela fornecedor
INSERT INTO fornecedor (cpf_cnpj_fornecedor, nome_fornecedor, email_fornecedor, endereco_fornecedor, tipo_fornecedor, telefone_fornecedor)
VALUES
('311.440.220-00', 'Higiênizações do Celso', 'celohigi@email.com', 'Rua X, 789', 'Pessoa Física','(66) 3419-1200'),
('33.934.223/0001-22', 'Conserta Tudo', 'consertatudo@email.com', 'Avenida W, 456', 'Pessoa Jurídica', '(66) 3419-1100'),
('442.529.330-22', 'Irmãos Mario', 'brosmarios@email.com', 'Avenida Y, 012', 'Pessoa Física', '(66) 3419-9988'),
('77.902.543/0001-08', 'Reparos Rápidos', 'reparosrapidos@email.com', 'Avenida Y, 012', 'Pessoa Jurídica', '(66) 3419-9999'),
('55.223.001/0001-01', 'Assistência Total', 'assistenciatotal@email.com', 'Avenida D, 345', 'Pessoa Jurídica', '(66) 3419-5555'),
('12.123.123/0001-01', 'Mãos afiadas', 'maosafiadas@email.com', 'Rua E, 567', 'Pessoa Jurídica', '(66) 3419-4444'),
('134.345.671-34', 'Buffet Paolo', 'paolo@email.com', 'Rua Z, 123', 'Pessoa Física','(66) 3419-1212'),
('33.444.555/0001-01', 'Manutenções Inteligentes', 'manutencoes@email.com', 'Avenida B, 678', 'Pessoa Jurídica', '(66) 3419-7777'),
('43.153.654/0001-01', 'Hidráulicos Express', 'hidraulicos@email.com', 'Rua X, 789', 'Pessoa Jurídica', '(66) 3419-4321'),
('45.765.233/0001-01', 'Reformas Práticas', 'reformaspraticas@email.com', 'Avenida F, 890', 'Pessoa Jurídica', '(66) 3419-3333'),
('11.000.222/0001-01', 'Tree Contabilidade', 'contabilidadetree@email.com', 'Rua A, 234', 'Pessoa Jurídica', '(66) 3419-8888'),
('98.765.234/0001-01', 'Bem Viver Piscicologia', 'piscicobemviver@email.com', 'Rua C, 901', 'Pessoa Jurídica', '(66) 3419-6666');


-- Tabela categoria
INSERT INTO categoria (nome_categoria, descricao_categoria)
VALUES
('Limpeza', 'Serviços de limpeza residencial e comercial'),
('Manutenção', 'Serviços de manutenção geral'),
('Encanamento', 'Serviços de encanamento residencial e comercial'),
('Elétrica', 'Serviços elétricos gerais'),
('Pintura', 'Serviços de pintura residencial e comercial'),
('Jardinagem', 'Serviços de jardinagem e paisagismo'),
('Buffet', 'Serviços de buffet'),
('Informática', 'Serviços manutenções em aparelhos eletrônicos'),
('Auto Mecânica', 'Serviços de auto mecânica para veículos'),
('Reformas', 'Serviços de reformas residenciais e comerciais'),
('Administrativo', 'Serviços administração, finanças e contabilidade'),
('Saúde', 'Serviços de saúde pessoal');

-- Tabela servico
INSERT INTO servico (descricao_servico, preco_inicial_servico, nome_servico, categoria_servico)
VALUES
('Limpeza geral', '100.00', 'Limpeza Residencial', 1),
('Instalação de torneiras', '50.00', 'Instalação de Torneiras', 2),
('Conserto de encanamento', '100.00', 'Conserto de Encanamento', 3),
('Instalação de padrão', '200.00', 'Instalação de fiação e padrão de energia', 4),
('Pintura de casas e prédios', '260.00', 'Pintura de ambientes internos e externos', 5),
('Jardinagem', '120.00', 'Aparar plantas e limpeza de jardins', 6),
('Buffet para festas', '1000.00', 'Contrato de buffet para festas e eventos', 7),
('Manutenção em smartphones', '200.00', 'Manutenção preventiva e corretiva de aparelhos smartphones e tablets', 8),
('Revisão de automotores', '300.00', 'Revisão preventiva de veículos automotores', 9),
('Reformas residênciais', '800.00', 'Reformas rediênciais em casas e prédios', 10),
('Contabilidade', '110.00', 'Auxilio contabil para emisão e recebimento de documentosd fiscais', 11),
('Sessão piscicológica', '150.00', 'Consulta orientada por profissional de piscicologia', 12);

-- Tabela servico_oferecido
INSERT INTO servico_oferecido (cod_fornecedor, cod_servico)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12);

-- Tabela orcamento
INSERT INTO orcamento (validade_orcamento, status_orcamento, valor_orcamento, descri_orcamento, data_orcamento, cod_fornecedor, cod_cliente)
VALUES
('2023-12-31', 'Aguardando Aprovação', '200.00', 'Orçamento para limpeza residencial', '2023-12-01', 1, 1),
('2023-12-31', 'Aprovado', '300.00', 'Orçamento para conserto de encanamento', '2023-12-02', 2, 2),
('2023-12-31', 'Aguardando Aprovação', '200.00', 'Orçamento para reparos hidráulicos', '2023-12-11', 3, 3),
('2023-12-31', 'Aprovado', '280.00', 'Orçamento para conserto de elétrica', '2023-12-04', 4, 4),
('2023-12-31', 'Aguardando Aprovação', '2400.00', 'Orçamento para pintura de quiosques', '2023-12-09', 5, 5),
('2023-12-31', 'Aprovado', '320.00', 'Orçamento para jardinagem de clube esportivo', '2023-12-06', 6, 6),
('2023-12-31', 'Aguardando Aprovação', '2110.00', 'Orçamento para buffet de formatura', '2023-12-03', 7, 7),
('2023-12-31', 'Aprovado', '2900.00', 'Orçamento para manutenção de celulares empresariais', '2023-12-10', 8, 8),
('2023-12-31', 'Aguardando Aprovação', '170.00', 'Orçamento para revisão de caminhão de carga', '2023-12-05', 9, 9),
('2023-12-31', 'Aprovado', '330.00', 'Orçamento para reforma de banheiro', '2023-12-12', 10, 10),
('2023-12-31', 'Aguardando Aprovação', '4000.00', 'Orçamento para seis mêses de honorários para setor fiscal', '2023-12-07', 11, 11),
('2023-12-31', 'Aprovado', '1200.00', 'Orçamento para um ano de atendimento piscicológico', '2023-12-08', 12, 12);


-- Tabela orcamento_contem
INSERT INTO orcamento_contem (cod_orcamento, cod_servico_oferecido)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12);

-- Tabela contrato
INSERT INTO contrato (local_contrato, termos_contrato, data_contrato, valor_contrato, validade_contrato, cod_cliente, cod_fornecedor)
VALUES
('Residencial', 'Limpar quiosques de confraternização', '2023-12-05', '1200.00', '2024-12-05', 1, 1),
('Residencial', 'Instalação de tornriras e chuveiros', '2023-12-24', '600.00', '2024-12-24', 2, 2),
('Comercial', 'Concerto de vazamento no setor 03 da fábrica', '2023-12-10', '500.00', '2024-12-10', 3, 3),
('Comercial', 'Manutenção elétrica', '2023-12-31', '1500.00', '2024-12-31', 4, 4),
('Residencial', 'Pintura de cinco quartos, pintura interna', '2023-12-26', '3000.00', '2024-12-26', 5, 5),
('Residencial', 'Cortar a grava e aparar os arbustos', '2023-12-25', '600.00', '2024-12-25', 6, 6),
('Comercial', 'Buffet para confraternização de fim de ano, fazer churrasco, saladas e lasanha', '2023-12-30', '2500.00', '2024-12-30', 7, 7),
('Comercial', 'Manutenção de sistemas operacionais nas maquinas dos vendedores', '2023-12-23', '2000.00', '2024-12-23', 8, 8),
('Comercial', 'Manutenções preventivas em caminhões de carga', '2023-12-29', '8000.00', '2024-12-29', 9, 9),
('Residencial', 'Construção de um quarto de  5 mt x 6 mt, na parte de tráz da casa', '2023-12-28', '7000.00', '2024-12-28', 10, 10),
('Comercial', 'Honorários contabieis para o ano de 2024', '2023-01-01', '5000.00', '2025-01-01', 11, 11),
('Residencial', 'Sessões piscicológicas semanais durante o ano de 2024', '2024-01-01', '1200.00', '2025-01-01', 12, 12);



-- Tabela contrato_contem
INSERT INTO contrato_contem (cod_contrato, cod_serv_oferecido)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12);

-- Tabela avaliacao
INSERT INTO avaliacao (descri_avaliacao, qualidade_avaliacao, data_avaliacao, cod_serv_oferecido, cod_avaliador)
VALUES
('Serviço de limpeza excelente', 5, '2023-12-15', 1, 1),
('Bom atendimento, mas um dos ventiladores estragou novamente', 3, '2023-12-20', 2, 2),
('Conserto de encanamento rápido e eficiente', 4, '2023-12-25', 3, 3),
('Rápido e eficiente', 5, '2023-12-28', 4, 4),
('Profissionais qualificados, e tintas com cores lindas', 5, '2024-01-05', 5, 5),
('Satisfeito com o serviço', 3, '2023-12-31', 6, 6),
('Atendimento excelente', 4, '2024-01-08', 7, 7),
('Serviço de alta qualidade', 5, '2024-01-12', 8, 8),
('Bom atendimento ao cliente', 4, '2024-01-15', 9, 9),
('Serviço confiável, mas o preço é um pouco caro', 4, '2024-01-25', 10, 10),
('Rapidez e eficiência', 5, '2024-01-18', 11, 11),
('Satisfação garantida', 4, '2024-01-22', 12, 12);


-- Tabela chat
INSERT INTO chat (data_hora_chat, cod_fornecedor, cod_cliente)
VALUES
('2023-12-01 08:00:00', 1, 1),
('2023-12-02 10:30:00', 2, 2),
('2023-12-03 09:00:00', 3, 3),
('2023-12-06 10:30:00', 4, 4),
('2023-12-09 11:45:00', 5, 5),
('2023-12-12 13:15:00', 6, 6),
('2023-12-15 14:20:00', 7, 7),
('2023-12-18 15:30:00', 8, 8),
('2023-12-21 16:45:00', 9, 9),
('2023-12-24 17:55:00', 10, 10),
('2023-12-27 18:10:00', 11, 11),
('2023-12-30 19:20:00', 12, 12);

-- Tabela midia
INSERT INTO midia (midia, formato_midia, tamanho_midia)
VALUES
('conteudo_binario_1', 'jpg', 1024),
('conteudo_binario_2', 'png', 2048),
('arquivo_binario_3', 'mp4', 4096),
('arquivo_binario_4', 'mov', 8192),
('arquivo_binario_5', 'pdf', 1638),
('arquivo_binario_6', 'jpg', 3276),
('arquivo_binario_7', 'png', 6553),
('arquivo_binario_8', 'mp4', 1310),
('arquivo_binario_9', 'mov', 2621),
('arquivo_binario_10', 'mp3', 5242),
('arquivo_binario_11', 'pdf', 1048),
('arquivo_binario_12', 'jpg', 2097);

-- Tabela mensagem
INSERT INTO mensagem (data_hora_msg, conteudo_msg, cod_cliente, cod_fornecedor, cod_chat, cod_midia)
VALUES
('2023-12-01 08:05:00', 'Olá! Como podemos ajudar?', null, 1, 1, null),
('2023-12-01 08:07:00', 'Bom dia, gostaria de saber se vocês fazem limpeza aqui na área industrial de Diadema ?', 1, null, 1, null),
('2023-12-02 10:35:00', 'Bom dia! Estamos à disposição!', null, 2, 2, null),
('2023-12-02 10:40:00', 'Olá, quanto fica a manutenção de 3 ventiladores ?', 2, null, 2, null),
('2023-12-03 09:00:00', 'Olá! Como posso ajudar?', null, 3, 3, null),
('2023-12-03 09:03:00', 'Boa dia, estamos precisando reformar a parte hidráulica da loja, podem estar vindo fazer uma avaliação?', 3, null, 3, null),
('2023-12-04 10:32:00', 'Estou disponível para esclarecer suas dúvidas.', null, 4, 4, null),
('2023-12-04 10:38:00', 'Ta bem, então eu gostaria de saber o valor da instalção de um padrão de energia 220', 4, null, 4, null),
('2023-12-05 07:00:00', 'Bom dia! Precisa de cores para o seu ambiente? fale conosco!', null, 5, 5, null),
('2023-12-05 07:15:00', 'Olá, gostaria de saber se vocês trabalham com efeitos, tipo efeito de cimento queimado ou grafiato, se sim, quais os valores ?', 5, null, 5, null),
('2023-12-06 09:45:00', 'Olá, somos a Mãos Afiadas Jardinagem, como podemos ajudar?', null, 6, 6, null),
('2023-12-06 10:00:00', 'Olá, vocês conseguem ter disponibilidade para fazer serviçõs todos os dias da semana? Mas cada dia em um endereço ?', 6, null, 6, null),
('2023-12-07 14:20:00', 'Olá, cliente! Bem vindo ao atendimento da Buffet Paolo! Como podemos Servi-lo(a)?', null, 7, 7, 7),
('2023-12-07 14:21:00', 'Bom dia, preciso de um buffet para o dia 16/12, no domingo, vocês tem disponibilidade?', 7, null, 7, 7),
('2023-12-08 15:10:00', 'Manutenções inteligentes! Como podemos te ajudar ?', null, 8, 8, 8),
('2023-12-08 15:12:00', 'Olá o celular da minha esposa fica clicando sozinho, será que tem como concertar? e quanto ficaria?', 8, null, 8, 8),
('2023-12-09 16:30:00', 'Olá, Hidráulicos Express como podemos ajudar?', null, 9, 9, 9),
('2023-12-09 16:31:00', 'Boa tarde, Meu caminhão está vazando fluido de freio, vocÇes conseguem vim até aqui para avaliar e concertar ?', 9, null, 9, 9),
('2023-12-10 17:45:00', 'Bom dia, vamos reformar? Nos diga como podemos ajudar?', null, 10, 10, 10),
('2023-12-10 17:55:00', 'Olá vamos sim, quero construir um quarto aqui em casa, te enviei foto do terreno em anexo para você avaliar a possíbilidade.', 10, null, 10, 10),
('2023-12-11 14:20:00', 'Boa tarde! Tree contabilidade, como podemos ajudar?', null, 11, 11, 11),
('2023-12-11 14:22:00', 'Boa tarde, gostaria de saber como faço para contratar os serviçoes de vocês durante um ano?', 11, null, 11, 11),
('2023-12-12 13:00:00', 'Boa tarde, clinica bem viver, como podemos te auxiliar hoje?', null, 12, 12, 12),
('2023-12-12 13:10:00', 'Boa tarde, eu sou a Júlia e gostaria de marcar uma consuta para segunda as 7:30 da manhã.', 12, null, 12, 12);


select * from cliente;
select * from fornecedor;
select * from categoria;
select * from servico;
select * from servico_oferecido;
select * from orcamento;
select * from orcamento_contem;
select * from contrato;
select * from contrato_contem;
select * from avaliacao;
select * from chat;
select * from midia;
select * from mensagem; 
 