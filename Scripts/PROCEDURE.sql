-- FUNCAO PARA REMOVER ACENTO

-- DROP FUNCTION fn_remover_acento_minusculo;
DELIMITER //
CREATE FUNCTION fn_remover_acento( texto VARCHAR(255))
RETURNS VARCHAR(255)
READS SQL DATA 
	BEGIN
		DECLARE resultado VARCHAR(255);
        SET resultado = REPLACE(texto, 'á','a');
        SET resultado = REPLACE(resultado, 'â','a');
        SET resultado = REPLACE(resultado, 'ã','a');
        SET resultado = REPLACE(resultado, 'é','e');
        SET resultado = REPLACE(resultado, 'ê','e');
		SET resultado = REPLACE(resultado, 'í','i');
		SET resultado = REPLACE(resultado, 'ó','o');
        SET resultado = REPLACE(resultado, 'ô','o');
		SET resultado = REPLACE(resultado, 'ú','u');
        SET resultado = REPLACE(resultado, 'ç','c');
        SET resultado = REPLACE(resultado, 'Á', 'A');
        SET resultado = REPLACE(resultado,'É', 'E');
        SET resultado = REPLACE(resultado, 'Í', 'I');
        SET resultado = REPLACE(resultado,'Ó', 'O');
        SET resultado = REPLACE(resultado,'ó', 'o');
        SET resultado = REPLACE(resultado,'Ú', 'U');
        SET resultado = REPLACE(resultado, 'À', 'A');
		SET resultado = REPLACE(resultado,'õ', 'o');
        SET resultado = REPLACE(resultado,'Ã', 'A'); 
        SET resultado = REPLACE(resultado,'Õ', 'O');
        SET resultado = REPLACE(resultado, 'ê', 'e');
        SET resultado = REPLACE(resultado, 'ô', 'o');
        SET resultado = REPLACE(resultado, 'Â', 'A');
        SET resultado = REPLACE(resultado,'Ê', 'E');
        SET resultado = REPLACE(resultado,'Ô', 'O');
        SET resultado = REPLACE(resultado,'ç', 'c');
        SET resultado = REPLACE(resultado,'Ç', 'c');
        SET resultado = REPLACE(resultado,'^', ' ');
        SET resultado = REPLACE(resultado,'~', ' ');
        SET resultado = REPLACE(resultado,'´', ' ');
        SET resultado = REPLACE(resultado,'`', ' ');
        SET resultado = REPLACE(resultado,';', ' ');
        SET resultado = REPLACE(resultado,':', ' ');
	RETURN resultado;
    END //
DELIMITER ; 


-- fn_validação
DELIMITER //
CREATE FUNCTION fn_valida_texto( texto VARCHAR(255), parametro INT)
RETURNS BOOLEAN
READS SQL DATA 
BEGIN
    DECLARE valor BOOLEAN;
		IF 
			(LENGTH(TRIM(fn_remover_acento(texto)))) <= parametro THEN
            SET valor = 0;
            RETURN valor;
		ELSE
			SET valor = 1;
			RETURN valor;
		END IF;
END //
DELIMITER ;

-- SELECT fn_valida_texto('AN         ', 2);

-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 1
-- procedure INSERT sp_classificacao_indicativa
-- DROP PROCEDURE sp_insert_classificacao_indicativa;

DELIMITER //
CREATE PROCEDURE sp_insert_classificacao_indicativa(idade_valor enum('livre','10','12','14','16','18'), descricao_valor VARCHAR(255))
	BEGIN
    IF 
		(descricao_valor IS NULL ) OR (fn_valida_texto(descricao_valor, 30)) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'descricao invalida';
    ELSE
		INSERT INTO tb_classificacao
        (idade, descricao)
        VALUES
        (idade_valor,  LOWER(descricao_valor), CURDATE());
	END IF;
    END // 
DELIMITER ; 

CALL sp_insert_classificacao_indicativa('livre', 'O programa é considerado apropriado para todas as faixas etárias. Não há conteúdo que seja prejudicial ou ofensivo para crianças.');
CALL sp_insert_classificacao_indicativa('10', 'pode conter algum tipo de violência leve, linguagem moderada ou temas levemente mais complexos, mas adequados para crianças com pelo menos 10 anos de idade.');
CALL sp_insert_classificacao_indicativa('12', ' pode conter violência um pouco mais intensa, linguagem um pouco mais forte e temas que possam ser mais complexos para crianças mais jovens. ');
CALL sp_insert_classificacao_indicativa('14', ' pode conter violência mais intensa, linguagem mais forte, temas adultos e situações que podem não ser adequadas para espectadores com menos de 14 anos');
CALL sp_insert_classificacao_indicativa('16', ' pode conter violência intensa, linguagem mais pesada, conteúdo sexual, temas maduros');
CALL sp_insert_classificacao_indicativa('18', 'é destinado apenas para adultos e pode conter violência extrema, linguagem explícita, cenas de sexo explícito, consumo de drogas, entre outros elementos que não são apropriados para espectadores menores de 18 anos.');



-- Procedure UPDATE tb_classificacao_indicativa
-- DROP PROCEDURE sp_update_classificacao_indicativa;
DELIMITER //
CREATE PROCEDURE sp_update_classificacao_indicativa(valor_id INT, idade_valor enum('livre','10','12','14','16','18'), descricao_valor VARCHAR(255))
	BEGIN
		IF NOT EXISTS
			(SELECT id_classificacao FROM tb_classificacao WHERE id_classificacao = valor_id) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
		ELSEIF
			(descricao_valor IS NULL ) OR (fn_valida_texto(descricao_valor, 30)) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'descricao invalida';
		ELSE
			UPDATE tb_classificacao SET idade = idade_valor, descricao = LOWER(descricao_valor)
			WHERE id_classificacao = valor_id;
		END IF;
    END //
DELIMITER ;

-- SELECT * FROM tb_classificacao_indicativa;
-- CALL sp_update_classificacao_indicativa(1, 'livre','O programa é considerado apropriado para todas as faixas etárias. Não há conteúdo que seja prejudicial ou ofensivo para crianças.'); 

-- Procedure DELETE tb_classificacao_indicativa
DELIMITER //
CREATE PROCEDURE sp_delete_classificacao(valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_classificacao FROM tb_classificacao_indicativa WHERE id_classificacao = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_classificacao
		WHERE id_classificacao = valor_id;
	END IF;
END //
DELIMITER ;

-- DESCRIBE tb_classificacao_indicativa;
-- SELECT * FROM tb_classificacao_indicativa;
-- CALL sp_delete_classificacao_indicativa(9);


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 2
-- Porcedure INSERT tb_categoria
-- DROP PROCEDURE sp_insert_categoria
DELIMITER //
CREATE PROCEDURE sp_insert_categoria(nome_categoria VARCHAR(45))
	BEGIN
    IF 
		(nome_categoria IS NULL ) OR (fn_valida_texto(nome_categoria, 3)) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome muito curto';
    ELSE
		INSERT INTO tb_categoria
        (nome)
        VALUES
        (LOWER(nome_categoria));
	END IF;
    END // 
DELIMITER ;

-- DESCRIBE tb_categoria;

CALL sp_insert_categoria('suspense');
CALL sp_insert_categoria('ficção');
CALL sp_insert_categoria('terror');
CALL sp_insert_categoria('nacional');
CALL sp_insert_categoria('drama');
CALL sp_insert_categoria('comedia');

-- SELECT * FROM tb_categoria;


-- Procedure UPDATE tb_categoria
-- DROP PROCEDURE sp_update_categoria;
DELIMITER //
CREATE PROCEDURE sp_update_categoria(valor_id INT, nome_valor VARCHAR(45))
	BEGIN
		IF NOT EXISTS
			(SELECT id_categoria FROM tb_categoria WHERE id_categoria = valor_id) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
		ELSEIF
			(nome_valor IS NULL ) OR (fn_valida_texto(nome_valor, 3)) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome muito curto';
		ELSE
			UPDATE tb_categoria SET nome = LOWER(nome_valor)
			WHERE id_categoria = valor_id;
		END IF;
    END //
DELIMITER ;

-- DESCRIBE tb_categoria;
-- SELECT * FROM tb_categoria;

-- CALL sp_update_categoria(4, 'NACIONAL' );


-- Procedure DELETE tb_categoria
-- DROP PROCEDURE sp_delete_categoria;
DELIMITER //
CREATE PROCEDURE sp_delete_categoria (valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_categoria FROM tb_categoria WHERE id_categoria = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_categoria
		WHERE id_categoria = valor_id;
	END IF;
END //
DELIMITER ;


-- DESCRIBE tb_categoria;
-- SELECT * FROM tb_categoria;
-- CALL sp_delete_categoria(6);




-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 3
-- Procedure INSERT tb_idioma
-- DROP PROCEDURE sp_insert_idioma;
DELIMITER //
CREATE PROCEDURE sp_insert_idioma(nome_idioma VARCHAR(45))
	BEGIN
    IF 
		(nome_idioma IS NULL ) OR (fn_valida_texto(nome_idioma, 3)) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome muito curto';
    ELSE
		INSERT INTO tb_idioma
        (nome)
        VALUES
        (LOWER(nome_idioma));
	END IF;
    END // 
DELIMITER ;

-- DESCRIBE tb_idioma;
-- SELECT * FROM tb_idioma;

CALL sp_insert_idioma('português');
CALL sp_insert_idioma('inglês');
CALL sp_insert_idioma('espanhol');
CALL sp_insert_idioma('coreano');
CALL sp_insert_idioma('japones');



-- Procedure UPDATE tb_idioma
-- DROP PROCEDURE sp_update_idioma;
DELIMITER //
CREATE PROCEDURE sp_update_idioma(valor_id INT, nome_valor VARCHAR(45))
	BEGIN
		IF NOT EXISTS
			(SELECT id_idioma FROM tb_idioma WHERE id_idioma = valor_id) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
		ELSEIF
			(nome_valor IS NULL ) OR (fn_valida_texto(nome_valor, 3)) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome muito curto';
		ELSE
			UPDATE tb_idioma SET nome = LOWER(nome_valor)
			WHERE id_idioma = valor_id;
		END IF;
    END //
DELIMITER ;

-- DESCRIBE tb_idioma;
-- SELECT * FROM tb_idioma;

-- CALL sp_update_idioma(1, 'po');


-- Procedure DELETE tb_idioma
-- DROP PROCEDURE sp_delete_idioma;
DELIMITER //
CREATE PROCEDURE sp_delete_idioma (valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_idioma FROM tb_idioma WHERE id_idioma = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_idioma
		WHERE id_idioma = valor_id;
	END IF;
END //
DELIMITER ;

-- SELECT * FROM tb_idioma;
-- CALL sp_delete_idioma(5);




-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 4
-- Procedure INSERT tb_tipo_pagamento
-- DROP PROCEDURE sp_insert_tipo_pagamento;
DELIMITER //
CREATE PROCEDURE sp_insert_tipo_pagamento(nome_valor VARCHAR(30))
	BEGIN
    IF 
		(nome_valor IS NULL ) OR (fn_valida_texto(nome_valor, 3)) < 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome muito curto';
    ELSE
		INSERT INTO tb_tipo_pagamento
        (nome)
        VALUES
        (LOWER(nome_valor));
	END IF;
    END // 
DELIMITER ;

-- DESCRIBE tb_tipo_pagamento;
-- SELECT * FROM tb_tipo_pagamento;

CALL sp_insert_tipo_pagamento('cartão');
CALL sp_insert_tipo_pagamento('pix');
CALL sp_insert_tipo_pagamento('boleto');
CALL sp_insert_tipo_pagamento('deposito bancario');


-- Procedure UPDATE tb_tipo_pagamento
-- DROP PROCEDURE sp_update_tipo_pagamento;
DELIMITER //
CREATE PROCEDURE sp_update_tipo_pagamento(valor_id INT, nome_valor VARCHAR(30))
	BEGIN
		IF NOT EXISTS
			(SELECT id_tipo_pagamento FROM tb_tipo_pagamento WHERE id_tipo_pagamento = valor_id) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
		ELSEIF
			(nome_valor IS NULL ) OR (fn_valida_texto(nome_valor, 3)) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome muito curto';
		ELSE
			UPDATE tb_tipo_pagamento SET nome = LOWER(nome_valor)
			WHERE id_tipo_pagamento = valor_id;
		END IF;
    END //
DELIMITER ;

-- DESCRIBE tb_tipo_pagamento;
-- SELECT * FROM tb_tipo_pagamento;
-- CALL sp_update_tipo_pagamento(1,'cartão');



-- Procedure DELETE tb_tipo_pagamento
-- DROP PROCEDURE sp_delete_tipo_pagamento;
DELIMITER //
CREATE PROCEDURE sp_delete_tipo_pagamento(valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_tipo_pagamento FROM tb_tipo_pagamento WHERE id_tipo_pagamento = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_tipo_pagamento
		WHERE id_tipo_pagamento = valor_id;
	END IF;
END //
DELIMITER ;



-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 5
-- Procedure INSERT tb_país
-- DROP PROCEDURE sp_insert_pais;
DELIMITER //
CREATE PROCEDURE sp_insert_pais(nome_valor VARCHAR(45), cod_pais CHAR(3))
	BEGIN
	IF
		(cod_pais IS NULL ) OR (fn_valida_texto(cod_pais, 2) = 0) OR (LENGTH(cod_pais) >3) THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'quantidade de caractere invalida';
	ELSEIF
		(nome_valor IS NULL ) OR (fn_valida_texto(nome_valor, 3)) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome muito curto';
    ELSE
		INSERT INTO tb_pais
        (nome, codigo)
        VALUES
        (LOWER(nome_valor), LOWER(cod_pais));
	END IF;
    END // 
DELIMITER ;

-- DESCRIBE tb_pais;
-- SELECT * FROM tb_pais;

CALL sp_insert_pais('brasil', 'bra');
CALL sp_insert_pais('estados unidos', 'eua');
CALL sp_insert_pais('espanha', 'esp');
CALL sp_insert_pais('japão', 'jpn');
CALL sp_insert_pais('coreia do sul', 'kor');


-- Procedure UPDATE tb_país
-- DROP PROCEDURE sp_update_pais;
DELIMITER //
CREATE PROCEDURE sp_update_pais(valor_id INT, nome_valor VARCHAR(45), cod_pais CHAR(3))
	BEGIN
		IF NOT EXISTS
			(SELECT id_pais FROM tb_pais WHERE id_pais = valor_id) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
		ELSEIF
			(nome_valor IS NULL ) OR (fn_valida_texto(nome_valor, 3)) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome_pais muito curto';
		ELSEIF
			(nome_valor IS NULL ) OR (fn_valida_texto(cod_pais, 2) = 0) OR (LENGTH(cod_pais) > 3 ) THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'quantidade de caractere (id_pais) invalida';
		ELSE
			UPDATE tb_pais SET nome = LOWER(nome_valor), codigo = cod_pais
			WHERE id_pais = valor_id;
		END IF;
    END //
DELIMITER ;

-- DESCRIBE tb_pais;
-- SELECT * FROM tb_pais;
-- CALL sp_update_pais(1,'BRASÍL', 'BRA');

-- Procedure DELETE tb_tipo_pagamento
-- DROP PROCEDURE sp_delete_pais;
DELIMITER //
CREATE PROCEDURE sp_delete_pais(valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_pais FROM tb_pais WHERE id_pais = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_pais
		WHERE id_pais = valor_id;
	END IF;
END //
DELIMITER ;

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 6
-- Procedure INSERT tb_plano
-- DROP PROCEDURE sp_insert_plano;
DELIMITER //
CREATE PROCEDURE sp_insert_plano(nome_valor VARCHAR(45), valor_plano FLOAT, descricao_plano VARCHAR(255))
	BEGIN
	IF
		(descricao_plano IS NULL ) OR (fn_valida_texto(nome_valor, 3 )) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome muito curto';
	ELSEIF
		(valor_plano IS NULL ) OR (valor_plano NOT BETWEEN 20.00 AND 100.00) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'valor fora de parametro';
	ELSEIF
		(descricao_plano IS NULL ) OR (fn_valida_texto(descricao_plano, 99)) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'descricao muito curta';
    ELSE
		INSERT INTO tb_plano
        (valor, descricao)
        VALUES
        (valor_plano, LOWER(descricao_plano));
	END IF;
    END // 
DELIMITER ;

-- DESCRIBE tb_plano;
-- SELECT * FROM tb_plano;
CALL sp_insert_plano('basico', 25.90 ,'resolução (HD), livre de anúncios, proporciona acesso ao catálogo 
completo e permite que você faça downloads em dispositivos para assistir offline.');
CALL sp_insert_plano('padrão', 39.99 , 'duas telas simultâneas, (Full HD). Ideal para compartilhar o acesso com outra pessoa em uma mesma residência. Além disso, é livre de anúncios, 
permite fazer o download dos conteúdos para assistir offline');
CALL sp_insert_plano('premium', 55.99 , 'Resolução Ultra HD 4K, HDR, Dolby Vision e Dolby Audio. Além disso, é possível assistir ao streaming em até quatro telas simultâneas — ideal para famílias numerosas que compartilham a mesma residência.');






-- Procedure UPDATE tb_plano
-- DROP PROCEDURE sp_update_plano;
DELIMITER //
CREATE PROCEDURE sp_update_plano(valor_id INT, nome_valor VARCHAR(45), preco FLOAT, descricao_plano  VARCHAR(255))
	BEGIN
		IF NOT EXISTS
			(SELECT id_plano FROM tb_plano WHERE id_plano = valor_id) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
		ELSEIF
			(nome_valor IS NULL ) OR (fn_valida_texto(nome_valor, 3)) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome muito curto';
        ELSEIF
			(preco IS NULL ) OR (preco NOT BETWEEN 20.00 AND 100.00) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'valor fora de parametro';
		ELSEIF
			(descricao_plano IS NULL ) OR (fn_valida_texto(descricao_plano, 99 )) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'descricao muito curta';
		ELSE
			UPDATE tb_plano SET  valor = preco, descricao = LOWER(descricao_plano) 
			WHERE id_plano = valor_id;
		END IF;
    END //
DELIMITER ;

-- DESCRIBE tb_plano;
-- SELECT * FROM tb_plano;

-- CALL sp_update_plano(3 , 'premium', 55.99 , 'Resolução Ultra HD 4K, HDR, Dolby Vision e Dolby Audio. Além disso, é possível assistir ao streaming em até quatro telas simultâneas — ideal para famílias numerosas que compartilham a mesma residência.');






-- Procedure DELETE tb_plano
-- DROP PROCEDURE sp_delete_plano;
DELIMITER //
CREATE PROCEDURE sp_delete_plano(valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_plano FROM tb_plano WHERE id_plano = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_plano
		WHERE id_plano = valor_id;
	END IF;
END //
DELIMITER ;


-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 7
-- Procedure INSERT tb_ator
-- DROP PROCEDURE sp_insert_ator;
DELIMITER //
CREATE PROCEDURE sp_insert_ator(nome_valor VARCHAR(45), sobrenome_valor VARCHAR(45), nascimento DATE, foto_ator VARCHAR(255))
	BEGIN
	IF
		(nome_valor IS NULL ) OR (fn_valida_texto(nome_valor, 1)) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome muito curto';
	ELSEIF
		(sobrenome_valor IS NULL ) OR (fn_valida_texto(sobrenome_valor, 1)) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'sobrenome muito curto';
	ELSEIF
		nascimento NOT BETWEEN '1800-01-01' AND CURDATE() THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'idade fora de parametro';
    ELSEIF
		(foto_ator IS NULL ) OR (fn_valida_texto(foto_ator, 9)) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'link da foto invalido';
	ELSE
		INSERT INTO tb_ator
        (nome, sobrenome, data_nascimento, foto)
        VALUES
        (LOWER(nome_valor), LOWER(sobrenome_valor), nascimento, foto_ator);
	END IF;
    END // 
DELIMITER ; 


-- DESCRIBE tb_ator;
-- SELECT * FROM tb_ator;
CALL sp_insert_ator('Sandra', 'Bullock', '1964-07-26', 'https://exemplo.com/sandra_bullock.jpg');
CALL sp_insert_ator('George', 'Clooney', '1961-05-06', 'https://exemplo.com/george_clooney.jpg');
CALL sp_insert_ator('Mateus', 'Nascimento', '1979-06-08', 'https://exemplo.com/mateus_nascimento.jpg');
CALL sp_insert_ator('Selton', 'Mello', '1972-12-30', 'https://exemplo.com/selton_mello.jpg');
CALL sp_insert_ator('Matheus', 'Nachtigall', '1982-02-18', 'https://exemplo.com/matheus_nachtigall.jpg');
CALL sp_insert_ator('Leandro', 'Firmino', '1978-06-23', 'https://exemplo.com/leandro_firmino.jpg');
CALL sp_insert_ator('Masaki', 'Suda', '1993-02-21', 'https://exemplo.com/masaki_suda.jpg');
CALL sp_insert_ator('Hana', 'Sugisaki', '1997-02-02', 'https://exemplo.com/hana_sugisaki.jpg');
CALL sp_insert_ator('Ryo', 'Yoshizawa', '1994-02-01', 'https://exemplo.com/ryo_yoshizawa.jpg');
CALL sp_insert_ator('Jo', 'Byung-gyu', '1996-04-23', 'https://exemplo.com/jo_byung_gyu.jpg');
CALL sp_insert_ator('Yoon', 'Chan-young', '1997-11-09', 'https://exemplo.com/yoon_chan_young.jpg');
CALL sp_insert_ator('Itziar', 'Ituño', '1974-06-18', 'https://exemplo.com/itziar_ituno.jpg');

-- Procedure UPDATE tb_ator
-- DROP PROCEDURE sp_update_ator;
DELIMITER //
CREATE PROCEDURE sp_update_ator(valor_id INT, nome_valor VARCHAR(45), sobrenome_valor VARCHAR(45), nascimento DATE, foto_ator VARCHAR(255))
	BEGIN
		IF NOT EXISTS
			(SELECT id_ator FROM tb_ator WHERE id_ator = valor_id) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
		ELSEIF
			(nome_valor IS NULL ) OR (fn_valida_texto(nome_valor, 1)) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome muito curto';
		ELSEIF
			(sobrenome_valor IS NULL ) OR (fn_valida_texto(sobrenome_valor, 1)) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'sobrenome muito curto';
		ELSEIF
			nascimento NOT BETWEEN '1800-01-01' AND CURDATE() THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'idade fora de parametro';
		ELSEIF
			(foto_ator IS NULL ) OR (fn_valida_texto(foto_ator, 9)) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'link da foto invalido';
		ELSE
			UPDATE tb_ator SET nome = LOWER(nome_valor), sobrenome = LOWER(sobrenome_valor), data_nascimento = nascimento , foto = foto_ator
			WHERE id_ator = valor_id;
		END IF;
    END //
DELIMITER ;

-- DESCRIBE tb_ator;
-- SELECT * FROM tb_ator;

-- CALL sp_update_ator(5,'ED', 'Harris', '1950-11-28', 'https://m.media-amazon.com/images/M/MV5BMjE4NDM4ODc2OV5BMl5BanBnXkFtZTcwNzA5NjQ5MQ@@._V1_FMjpg_UX1000_.jpg')


-- Procedure DELETE tb_ator
-- DROP PROCEDURE sp_delete_ator;
DELIMITER //
CREATE PROCEDURE sp_delete_ator(valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_ator FROM tb_ator WHERE id_ator = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_ator
		WHERE id_ator = valor_id;
	END IF;
END //
DELIMITER ;

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------





-- ------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 10
-- Procedure INSERT tb_filme
DELIMITER //
CREATE PROCEDURE sp_insert_filme(id_do_catalogo INT, possui_oscar BOOLEAN)
	BEGIN
		IF NOT EXISTS
			(SELECT id_catalogo FROM tb_catalogo WHERE id_catalogo = id_do_catalogo) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_catalogo invalido';
		ELSEIF
			(possui_oscar IS NULL ) OR (possui_oscar NOT BETWEEN 0 AND 1) THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'coluna oscar só pode assumir valores 0 ou 1';
		ELSE
			INSERT INTO tb_filme
			(id_catalogo, oscar)
			VALUES
			(id_do_catalogo, possui_oscar);
		END IF;
    END // 
DELIMITER ;





-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 11
-- Procedure INSERT tb_catalogo_idioma
DELIMITER //
CREATE PROCEDURE sp_insert_catalogo_idioma(id_do_catalogo INT, id_do_idioma INT)
	BEGIN
		IF NOT EXISTS
			(SELECT id_catalogo FROM tb_catalogo WHERE id_catalogo = id_do_catalogo) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_catalogo invalido';
		ELSEIF NOT EXISTS
			(SELECT id_idioma FROM tb_idioma WHERE id_idioma = id_do_idioma) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_idioma invalido';
		ELSE
			INSERT INTO tb_catalogo_idioma
			(id_catalogo_idioma, id_catalogo, id_idioma)
			VALUES
			(id_catalogo_idioma, id_do_catalogo, id_do_idioma);
		END IF;
    END // 
DELIMITER ;




-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Procedure INSERT tb_pais_catalogo
DELIMITER //
CREATE PROCEDURE sp_pais_catalogo(id_do_pais INT, id_do_catalogo INT)
	BEGIN
		IF NOT EXISTS
			(SELECT id_catalogo FROM tb_catalogo WHERE id_catalogo = id_do_catalogo) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_catalogo invalido';
		ELSEIF NOT EXISTS
			(SELECT id_pais FROM tb_pais WHERE id_pais = id_do_pais) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_pais invalido';
		ELSE
			INSERT INTO tb_pais_catalogo
			(id_pais_catalogo, id_pais, id_catalogo)
			VALUES
			(id_pais_catalogo, id_do_pais, id_do_catalogo);
		END IF;
    END // 
DELIMITER ;




-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 14
-- Procedure INSERT tb_usuario 
-- DROP PROCEDURE sp_insert_usuario;
DELIMITER //
CREATE PROCEDURE sp_insert_usuario(valor_nome VARCHAR(45), valor_sobrenome VARCHAR(45), valor_email VARCHAR(45), dt_nascimento DATE, 
dt_cadastro DATE, valor_senha VARCHAR(255), v_status BOOLEAN, id_do_endereco INT)
	BEGIN
		IF
			(valor_nome IS NULL ) OR (fn_valida_texto(valor_nome, 1)) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome invalido';
		ELSEIF
			(valor_sobrenome IS NULL ) OR (fn_valida_texto(valor_sobrenome, 2)) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'sobrenome invalido';
		ELSEIF
			(valor_email IS NULL ) OR (fn_valida_texto(valor_email, 5) = 0) OR 
            (INSTR(valor_email,'@') = 0) OR (INSTR(valor_email,'.') = 0) THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'email invalido';
		ELSEIF
			dt_nascimento < DATE_ADD(CURDATE(), INTERVAL -100 YEAR)  OR dt_nascimento > DATE_ADD(CURDATE(), INTERVAL -16 YEAR) THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'data de nascimento fora de parametro';
		ELSEIF
			dt_cadastro NOT BETWEEN '2023-06-16' AND CURDATE() THEN -- data de criacao do banco, não tem como se cadastrar antes disso
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'data de cadastro invalida';
		ELSEIF
			(valor_senha IS NULL ) OR (fn_valida_texto(valor_senha, 7)) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'senha deve conter no mínimo 8 digitos';
		ELSEIF
			(v_status IS NULL ) OR (v_status NOT BETWEEN 0 AND 1) THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'coluna status só pode assumir valores 0 ou 1';
		ELSEIF NOT EXISTS
			(SELECT id_endereco FROM tb_endereco WHERE id_endereco = id_do_endereco) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_endereco invalido';
		ELSE
			INSERT INTO tb_usuario
            (nome, sobrenome, email, data_nascimento, data_cadastro, senha, status, id_endereco, data_atualizacao)
            VALUES
            (LOWER(valor_nome), LOWER(valor_sobrenome), valor_email, dt_nascimento, dt_cadastro, MD5(valor_senha), v_status, id_do_endereco, CURDATE());
		END IF;
	END //
DELIMITER ;

-- DESCRIBE tb_usuario;
-- SELECT * FROM tb_usuario ;

-- CALL sp_insert_usuario('John', 'Doe', 'john.doe@example.com', '1995-01-01', '2023-06-16', 'password123', 1, 1);

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 15
-- Procedure INSERT tb_funcionario
-- DROP PROCEDURE sp_insert_funcionario;
DELIMITER //
CREATE PROCEDURE sp_insert_funcionario(id_do_usuario INT, foto_usuario VARCHAR(255))
	BEGIN
		IF NOT EXISTS
			(SELECT id_usuario FROM tb_usuario WHERE id_usuario = id_do_usuario) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_usuario invalido';
		ELSEIF
			(foto_usuario IS NULL ) OR (fn_valida_texto(foto_usuario, 5)) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'Link da foto invalido';
		ELSE
			INSERT INTO tb_funcionario
            (id_usuario, foto, data_atualizacao)
            VALUES
            (id_do_usuario, foto_usuario, CURDATE());
		END IF;
	END //
DELIMITER ;


-- DESCRIBE tb_funcionario;
-- SELECT * FROM tb_funcionario;

-- CALL sp_insert_funcionario(1, 'https://i.pinimg.com/236x/47/c8/e6/47c8e62006fb9b9a8867497f843aefba--john-cena.jpg');


-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Procedure INSERT tb_cliente
-- DROP PROCEDURE sp_insert_cliente;
DELIMITER //
CREATE PROCEDURE sp_insert_cliente(id_do_usuario INT, id_do_plano INT, vencimento_plano DATE)
BEGIN
	IF NOT EXISTS
		(SELECT id_usuario FROM tb_usuario WHERE id_usuario = id_do_usuario) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_usuario invalido';
	ELSEIF NOT EXISTS
		(SELECT id_plano FROM tb_plano WHERE id_plano = id_do_plano) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_plano invalido';
	ELSEIF
		(vencimento_plano IS NULL) OR (vencimento_plano < DATE_ADD(CURDATE(), INTERVAL 30 DAY)) THEN -- 30 DIAS de prazo minimo
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'data de vencimento do plano invalida';
	ELSE
		INSERT INTO tb_cliente
		(id_usuario, id_plano, data_vencimento_plano, data_atualizacao)
		VALUES
		(id_do_usuario, id_do_plano, vencimento_plano, CURDATE());
    END IF;
END //
DELIMITER ;

-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Procedure INSERT tb_perfil
-- DROP PROCEDURE sp_insert_perfil;
DELIMITER //
CREATE PROCEDURE sp_insert_perfil(valor_nome VARCHAR(45), valor_foto VARCHAR(255), valor_tipo enum('adulto','crianca','personalizado'), id_do_cliente INT)
BEGIN
	IF
		(valor_nome IS NULL ) OR (fn_valida_texto(valor_nome, 2)) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome invalido';
    ELSEIF
		(valor_foto IS NULL ) OR (fn_valida_texto(valor_foto, 5)) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'Link da foto invalido';
	ELSEIF NOT EXISTS
		(SELECT id_cliente FROM tb_cliente WHERE id_cliente = id_do_cliente) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_cliente invalido';
    ELSE
		INSERT INTO tb_perfil
		(nome, foto, tipo, id_cliente, data_atualizacao)
		VALUES
		(LOWER(valor_nome), valor_foto, valor_tipo, id_do_cliente, CURDATE());
    END IF;
END //
DELIMITER ;

-- DESCRIBE tb_perfil;
-- SELECT * FROM tb_perfil;

CALL sp_insert_perfil('perfil_a', 'https://img.freepik.com/vetores-premium/avatar-homem-barba_96853-399.jpg?w=2000', 'adulto', 1);

-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Procedure INSERT tb_cartao_credito
-- DROP PROCEDURE sp_cartao_credito;
DELIMITER //
CREATE PROCEDURE sp_insert_cartao_credito(num CHAR(19), vencimento DATE, num_seguranca CHAR(3), id_do_cliente INT)
BEGIN
	IF
		(num IS NULL ) OR (SELECT INSTR(fn_remover_acento('num'), ' ') <> 0) OR (LOWER(num_seguranca) BETWEEN 'a' AND 'z') THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'cod_seguranca pode ter somente 3 digitos numericos';
	ELSEIF
		(vencimento IS NULL) OR (vencimento <= CURDATE()) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'data de vencimento do cartao invalida';
	ELSEIF
		(num_seguranca IS NULL ) OR ((fn_valida_texto(num_seguranca, 2)) = 0) OR (LOWER(num_seguranca) BETWEEN 'a' AND 'z') THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'cod_seguranca pode ter somente 3 digitos numericos';
	ELSEIF NOT EXISTS
		(SELECT id_cliente FROM tb_cliente WHERE id_cliente = id_do_cliente) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_cliente invalido';
	 ELSE
		INSERT INTO cartao_credito
		(numero, data_vencimento, cod_seguranca, id_do_cliente)
		VALUES
		(numero, data_vencimento, cod_seguranca, id_cliente);
    END IF;
END //
DELIMITER ;



-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Procedure INSERT tb_pagamento
-- DROP PROCEDURE sp_insert_pagamento;
DELIMITER //
CREATE PROCEDURE sp_insert_pagamento(valor_p FLOAT, data_pagamento DATETIME, id_do_cartao_credito INT, id_do_cliente INT, id_do_tipo_pagamento INT)
BEGIN
	IF
		(valor_p IS NULL ) OR (valor_p NOT BETWEEN 20.00 AND 100.00) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'valor fora de parametro';
    ELSEIF
		(data_pagamento IS NULL) OR (data_pagamento > CURDATE()) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'data de pagamento invalida';
	ELSEIF NOT EXISTS
		(SELECT id_cartao FROM tb_cartao_credito WHERE id_cartao_credito = id_do_cartao_credito) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_cartao_credito invalido';
	ELSEIF NOT EXISTS
		(SELECT id_cliente FROM tb_cliente WHERE id_cliente = id_do_cliente) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_cliente invalido';
	ELSEIF NOT EXISTS
		(SELECT id_tipo_pagamento  FROM tb_tipo_pagamento  WHERE id_tipo_pagamento  = id_do_tipo_pagamento ) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_cartao_credito invalido';
	ELSE
		INSERT INTO tb__pagamento
		(valor, dt_pagamento, id_cartao_credito, id_cliente, id_tipo_pagamento, dt_atualizacao)
		VALUES
		(valor_p, data_pagamento, id_do_cartao_credito, id_do_cliente, id_do_tipo_pagamento, CURDATE());
    END IF;
END //
DELIMITER ;

-- DESCRIBE tb_pagamento;
-- SELECT * FROM tb_pagamento;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 20
-- Procedure INSERT tb_catalogo_categoria
-- DROP PROCEDURE sp_catalogo_categoria;
DELIMITER //
CREATE PROCEDURE sp_insert_catalogo_categoria(id_do_catalogo INT, id_do_categoria INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_catalogo FROM tb_catalogo WHERE id_catalogo = id_do_catalogo) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_catalogo invalido';
	ELSEIF NOT EXISTS
		(SELECT id_categoria FROM tb_categoria WHERE id_categoria = id_do_categoria) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_categoria invalido';
	ELSE
		INSERT INTO tb_catalogo_categoria
		(id_catalogo, id_categoria, dt_atualizacao)
		VALUES
		(id_do_catalogo, id_do_categoria, CURDATE());
    END IF;
END //
DELIMITER ;

-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 21
-- Procedure INSERT tb_elenco
-- DROP PROCEDURE sp_insert_elenco;
DELIMITER //
CREATE PROCEDURE sp_insert_elenco(id_do_catalogo INT, id_do_ator INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_catalogo FROM tb_catalogo WHERE id_catalogo = id_do_catalogo) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_catalogo invalido';
	ELSEIF NOT EXISTS
		(SELECT id__ator FROM tb__ator WHERE id__ator = id_do_ator) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_ator invalido';
	ELSE
			INSERT INTO tb_elenco
			(id_catalogo, id_ator, dt_atualizacao)
			VALUES
			(id_do_catalogo, id_do_ator, CURDATE());
		END IF;
END //
DELIMITER ;

-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 22
-- Procedure INSERT tb_serie 
-- DROP PROCEDURE sp_insert_serie ;



