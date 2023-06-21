INSERT INTO tb_ator (nome,sobrenome,data_nascimento,foto)
VALUES
('Johnny', 'Depp', '1963-06-09', 'caminho/para/foto1.jpg'),
('Tom', 'Hanks', '1956-07-09', 'caminho/para/foto2.jpg'),
('Leonardo', 'DiCaprio', '1974-11-11', 'caminho/para/foto3.jpg'),
('Scarlett', 'Johansson', '1984-11-22', 'caminho/para/foto4.jpg'),
('Brad', 'Pitt', '1963-12-18', 'caminho/para/foto5.jpg');

select * from tb_ator;

INSERT INTO tb_pais( nome,codigo)
VALUES
('Estados Unidos','EUA'),
('frança','FRA'),
('alemanha','ALE'),
('italia','ITA');

select * from tb_pais;

INSERT INTO tb_plano(valor,descricao)
VALUES
('35.00','plano básico'),
('45.00','plano plus'),
('55.00','plano master');

select * from tb_plano;

INSERT INTO tb_tipo_pagamento(nome)
VALUES
('pix'),
('cartão'),
('boleto');

select * from tb_tipo_pagamento;

INSERT INTO tb_cartao_credito(numero,data_vencimento,cod_seguranca,nome_cartao)
VALUES
('4444555566667777', '2024-07-15', '890', 'Carolina Mendes'),
('8888999900001111', '2023-10-31', '345', 'Fernando Costa'),
('2222333344445555', '2024-02-28', '678', 'Camila Rodrigues'),
('6666777788889999', '2023-12-31', '912', 'Rafaela Santos'),
('5555666677778888', '2024-06-30', '543', 'Gustavo Lima');

select * from tb_cartao_credito;

INSERT INTO tb_classificacao (idade,descricao)
VALUES
(10,'Essa classificação indica que o conteúdo é adequado para todos os públicos. Não há cenas de violência, linguagem inapropriada, nudez ou temas adultos.'),
('14','Essa classificação é apropriada para adolescentes acima de 14 anos. Pode conter violência moderada, linguagem de baixo calão, temas mais maduros e cenas levemente sugestivas.'),
('16','Essa classificação é apropriada para pessoas com 16 anos ou mais. Pode conter violência intensa, linguagem forte, cenas de sexo, consumo de drogas e temas adultos.'),
('18','Essa classificação é destinada a um público adulto com idade igual ou superior a 18 anos. Pode conter cenas de violência extrema, sexo explícito, linguagem ofensiva, uso de drogas pesadas e temas adultos muito intensos.');

select * from tb_classificacao;

INSERT INTO tb_categoria (nome)
VALUES
('aventura'),
('romance'),
('comédia'),
('suspense'),
('terror');

select * from tb_categoria;

INSERT INTO tb_idioma (nome)
VALUES
('português'),
('coreano'),
('Inglês'),
('francês'),
('japonês');

select * from tb_idioma;


INSERT INTO tb_endereco (cep,bairro,rua,quadra,numero,id_pais,data_atualizacao)
VALUES
	('12345-678', 'Centro', 'Rua A', 'Quadra 1', 10, 1, '2023-06-14'),
    ('54321-098', 'Vila Nova', 'Rua B', 'Quadra 2', 20, 1, '2023-06-14'),
    ('98765-432', 'Jardim das Flores', 'Rua C', 'Quadra 3', 30, 2, '2023-06-14'),
    ('45678-901', 'Bairro Novo', 'Rua D', 'Quadra 4', 40, 3, '2023-06-14'),
    ('56789-012', 'Centro', 'Rua E', 'Quadra 5', 50, 4, '2023-06-14'),
    ('87654-321', 'Vila Nova', 'Rua F', 'Quadra 6', 60, 1, '2023-06-14'),
    ('23456-789', 'Jardim das Flores', 'Rua G', 'Quadra 7', 70, 3, '2023-06-14'),
    ('78901-234', 'Bairro Novo', 'Rua H', 'Quadra 8', 80, 2, '2023-06-14'),
    ('34567-890', 'Centro', 'Rua I', 'Quadra 9', 90, 4, '2023-06-14'),
    ('67890-123', 'Vila Nova', 'Rua J', 'Quadra 10', 100, 1, '2023-06-14');

select * from tb_endereco;

INSERT INTO tb_usuario (nome,data_atualizacao,sobrenome,email,status,data_nascimento,data_cadastro,senha,id_endereco)
VALUES 
('Carolina', '2023-05-09', 'Mendes', 'carolina.mendes@example.com', 'A', '1990-01-01', '2023-05-01','123456',1),
('Fernando', '2023-05-09', 'Costa', 'fernando.costa@example.com', 'I', '1985-02-15', '2023-04-27','secreta123',2),
('Camila', '2023-05-09', 'Rodrigues', 'camila.rodrigues@example.com', 'A', '1992-07-10', '2023-05-03','senha@2023',3),
('Rafaela', '2023-05-09', 'Santos', 'rafaela.santos@example.com', 'A', '1994-04-20', '2023-05-05','p4ssw0rd',4),
('Gustavo', '2023-05-09', 'Lima', 'gustavo.lima@example.com', 'I', '1998-09-30', '2023-04-29','myPass123',5),
('Laura', '2023-06-14', 'Ribeiro', 'laura.ribeiro@example.com', 'A', '1993-03-25', '2023-06-14', 'senha123', 6),
('Rafael', '2023-06-14', 'Gomes', 'rafael.gomes@example.com', 'A', '1987-11-12', '2023-06-14', 'senha456', 7),
('Camila', '2023-06-14', 'Almeida', 'camila.almeida@example.com', 'I', '1994-08-05', '2023-06-14', 'senha789', 8),
('Mariana', '2023-06-14', 'Melo', 'mariana.melo@example.com', 'A', '1989-06-30', '2023-06-14', 'senhaabc', 9),
('Gustavo', '2023-06-14', 'Costa', 'gustavo.costa@example.com', 'A', '1996-04-18', '2023-06-14', 'senhadef', 10);

select * from tb_usuario;

INSERT INTO tb_funcionario (foto_funcionario,data_atualizacao,id_usuario)
VALUES 
('caminho1/foto1.jpg', '2023-05-09',36),
('caminho2/foto2.jpg', '2023-05-09',37 ),
('caminho3/foto3.jpg', '2023-05-09',38 ),
('caminho4/foto4.jpg', '2023-05-09',39 ),
('caminho5/foto5.jpg', '2023-05-09',40 );

select *from tb_funcionario;

INSERT INTO tb_cliente (id_usuario,id_plano,data_vencimento_plano,id_cartao,data_atualizacao)
VALUES 
(31,2,'2024-07-15',1,'2023-05-09'),
(32,1,'2023-10-31',2,'2023-05-09'),
(33,3,'2024-02-28',3,'2023-05-09'),
(34,1,'2023-12-31',4,'2023-05-09'),
(35,2,'2024-06-30',5,'2023-05-09');


select*from tb_cliente;
select*from tb_usuario;
select*from tb_cartao_credito;
select* from tb_plano;
select* from tb_tipo_pagamento;

INSERT INTO tb_pagamento (valor,data_pagamento,id_cliente,id_tipo_pagamento,id_cartao) 
VALUES 
('35.00','2023-06-10',1,2,1),
('45.00','2023-06-05',2,2,2),
('55.00','2023-06-01',3,3,3),
('55.00','2023-06-02',4,2,4),
('35.00','2023-06-03',5,1,5);

INSERT INTO tb_catalogo (pais_origem, imagem_capa, titulo, sinopse, ano_lancamento, duracao, avaliacao, data_atualizacao, id_classificacao, id_idioma)
VALUES
('Estados Unidos', 'https://example.com/1.jpg', 'The Lost Treasure', 'Um grupo de aventureiros embarca em uma emocionante jornada em busca de um tesouro perdido em uma ilha remota.', 2022, 120, '1', '2023-06-14', 1, 1),
('França', 'https://example.com/4.jpg', 'Amour Éternel', 'Uma história de amor proibido entre dois jovens artistas parisienses que lutam contra as convenções sociais e os obstáculos culturais.', 2020, 120, '2', '2023-06-14', 3, 5),
('Alemanha', 'https://example.com/8.jpg', 'Der Stille Pfad', 'Ambientado na Alemanha pós-Segunda Guerra Mundial, o filme segue a vida de uma jovem sobrevivente do Holocausto enquanto ela luta para se adaptar a uma sociedade despedaçada.', 2020, 120, '3', '2023-06-14', 2, 2),
('Itália', 'https://example.com/9.jpg', 'La Dolce Vita', 'Um retrato da vida extravagante e decadente da alta sociedade italiana em Roma.', 2022, 125, '5', '2023-06-14', 1, 3);


INSERT INTO tb_catalogo (pais_origem, imagem_capa, titulo, sinopse, ano_lancamento, duracao, avaliacao, data_atualizacao, id_classificacao, id_idioma)
VALUES
('Estados Unidos', 'https://example.com/imagem1.jpg', 'The Unseen Files', 'Uma equipe de investigadores paranormais viaja pelos Estados Unidos para desvendar mistérios sobrenaturais e desvendar eventos inexplicáveis.', 2022, 45, 4, '2023-06-14', 1, 3),
('França', 'https://example.com/imagem2.jpg', 'Les Secrets de Paris', 'A vida de um grupo de amigos parisienses é abalada quando um segredo obscuro é revelado, levando-os a uma jornada de descobertas e consequências imprevisíveis.', 2020, 45, 2, '2023-06-14', 2, 4),
('Alemanha', 'https://example.com/imagem3.jpg', 'Die Schatten der Vergangenheit', 'Após o desaparecimento misterioso de uma jovem, um detetive implacável embarca em uma busca obscura para desvendar segredos enterrados há décadas na pequena cidade alemã.', 2021, 29, 4, '2023-06-14', 1, 6),
('Itália', 'https://example.com/imagem10.jpg', 'LAmore Proibito', 'Em uma vila costeira na Itália, duas famílias rivais lutam contra tradições antigas e rivalidades mortais enquanto tentam proteger um amor proibido que pode desafiar todas as convenções.', 2016, 45, 1, '2023-06-14', 2, 1);

UPDATE tb_catalogo
set tipo_midia = 'F'
where id_catalogo in (25, 26, 27, 28);

UPDATE tb_catalogo
set tipo_midia = 'S'
where id_catalogo in (37, 38, 39, 40);

INSERT INTO tb_perfil (foto,nome,tipo,id_cliente,data_atualizacao)
VALUES 
('/caminho/foto1.jpg', 'Perfil A', 'A', 1, '2023-06-10'),
('/caminho/foto2.jpg', 'Perfil B', 'C', 2, '2023-06-11'),
('/caminho/foto3.jpg', 'Perfil C', 'C', 3, '2023-06-12'),
('/caminho/foto4.jpg', 'Perfil D', 'A', 4, '2023-06-13'),
('/caminho/foto5.jpg', 'Perfil E', 'C', 5,'2023-06-14');

select * from tb_catalogo;

INSERT INTO tb_serie (quant_episodio_total,quantidade_temporada,id_catalogo)
VALUES 
(20,2,37),
(20,2,38),
(20,2,39),
(20,2,40);

select * from tb_serie;

commit;

delete from tb_serie;

INSERT INTO tb_filme (oscar,id_catalogo)
VALUES 
(2,25),
(1,26),
(0,27),
(3,28);

select * from tb_catalogo
where id_catalogo in (37,38,39,40);

select * from tb_serie;

INSERT INTO tb_temporada (id_temporada,titulo,descricao,quantidade_episodio,id_serie, numero_temporada)
values
(1,'Dark Whispers',' Enquanto investigam uma antiga mansão assombrada, a equipe do The Unseen Files se depara com segredos sombrios enterrados nas profundezas',10,5,1),
(2,'Echoes of the Past','Uma onda de fenômenos inexplicáveis assola uma pequena cidade, levando a equipe do The Unseen Files a mergulhar nas histórias do passado',10,5,2),
(3,"Amour Interdit",'Em meio às ruas românticas de Paris, um amor proibido floresce entre dois jovens de famílias rivais',10,6,1),
(4,"Trésors Cachés",'À medida que segredos há muito tempo escondidos vêm à tona, os amigos parisienses embarcam em uma jornada em busca de tesouros perdidos',10,6,2),
(5,'Das Vermächtnis','Um segredo familiar sinistro vem à tona quando um detetive obstinado mergulha nas sombras do passado',10,7,1),
(6,'Verlorene Seelen','Enquanto investiga uma série de desaparecimentos inexplicáveis, o detetive se depara com uma sociedade secreta que busca controlar as almas perdidas',10,7,2),
(7,'Destino Incerto','Os amantes proibidos lutam contra as convenções sociais e as pressões familiares enquanto enfrentam uma série de obstáculos que testam seu amor e os levam',10,8,1),
(8,'Segredos Revelados','Conforme os segredos do passado vêm à tona, os amantes são confrontados com revelações chocantes que ameaçam destruir tudo o que construíram juntos',10,8,2);

select * from tb_episodio;

INSERT INTO tb_episodio (id_episodio,numero_episodio,id_catalogo,id_temporada)
values
(1,1,37,1),
(2,2,37,1),
(3,1,38,3),
(4,2,38,3),
(5,1,39,5),
(6,2,39,5),
(7,1,40,7),
(8,2,40,7);

select*from tb_pais;
select* from tb_episodio;
select *from tb_catalogo;
select *from tb_temporada;
select *from tb_ator;
select *from tb_categoria;
select *from tb_idioma; 
select *from tb_catalogo_ator;

 INSERT INTO tb_pais_catalogo(id_pais,id_catalogo)
 VALUES
(1,25),
(2,26),
(3,27),
(4,28),
(1,37),
(2,38),
(3,39),
(4,40);



INSERT INTO tb_catalogo_ator(id_catalogo,id_ator) 
 VALUES
 (25,1),
 (26,2),
 (27,3),
 (28,4),
 (37,5),
 (38,1),
 (39,2),
 (40,3);
 

INSERT INTO tb_catalogo_categoria(id_catalogo,id_categoria)
 VALUES
(25,1),
(26,2),
(27,3),
(28,4),
(37,5),
(38,1),
(39,2),
(40,3);

INSERT INTO tb_catalogo_idioma(id_catalogo,id_idioma)
 VALUES
(25,1),
(26,2),
(27,3),
(28,4),
(37,5),
(38,6),
(39,1),
(40,2);
 
 select*from tb_catalogo_idioma;