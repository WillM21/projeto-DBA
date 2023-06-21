-- FUNCAO PARA REMOVER ACENTO

DELIMITER //
CREATE FUNCTION fn_remover_acento_minusculo( texto VARCHAR(255))
RETURNS VARCHAR(255)
READS SQL DATA 
	BEGIN
		DECLARE resultado VARCHAR(255);
        SET texto = LOWER(texto);
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
			(LENGTH(TRIM(texto))) < parametro THEN
            SET valor = 0;
            RETURN valor;
		ELSE
			SET valor = 1;
			RETURN valor;
		END IF;
END //
DELIMITER ;

-- SELECT fn_valida_texto('AN         ', 2);


-- Crie uma função que deixe todos os caracteres de uma string minusculas.

DELIMITER //
CREATE FUNCTION fn_minuscula2(texto VARCHAR(255))
RETURNS VARCHAR (255)
DETERMINISTIC 
BEGIN
DECLARE resultado VARCHAR (255);
set resultado = lower (texto);
RETURN resultado ;
END//
DELIMITER ;

