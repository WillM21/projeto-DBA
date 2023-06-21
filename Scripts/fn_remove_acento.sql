DELIMITER //

CREATE  FUNCTION fn_remove_acento (texto VARCHAR(255)) RETURNS varchar(255) 
    DETERMINISTIC
BEGIN 
	SET texto = REPLACE(texto, 'ã', 'a'),
	  texto = REPLACE(texto, 'â', 'a'),
	  texto = REPLACE(texto, 'á', 'a'),
	  texto = REPLACE(texto, 'à', 'a'),
	  texto = REPLACE(texto, 'ä', 'a'),
	  texto = REPLACE(texto, 'é', 'e'),
      texto = REPLACE(texto, 'è', 'e'),
      texto = REPLACE(texto, 'ë', 'e'),
	  texto = REPLACE(texto, 'ì', 'i'),
	  texto = REPLACE(texto, 'í', 'i'),
      texto = REPLACE(texto, 'ï', 'i'),
      texto = REPLACE(texto, 'õ', 'o'),
      texto = REPLACE(texto, 'ô', 'o'),
      texto = REPLACE(texto, 'ó', 'o'),
      texto = REPLACE(texto, 'ò', 'o'),
	  texto = REPLACE(texto, 'ö', 'o'),
      texto = REPLACE(texto, 'ú', 'u'),
      texto = REPLACE(texto, 'ù', 'u'),
      texto = REPLACE(texto, 'ü', 'u'),
      texto = REPLACE(texto, 'û', 'u'),
      texto = REPLACE(texto, 'ñ', 'n'),
      texto = REPLACE(texto, '^', ''),
      texto = REPLACE(texto, '´', ''),
      texto = REPLACE(texto, '`' , ''),
	  texto = REPLACE(texto, '¨', ''),
	  texto = REPLACE(texto, '~', ''),
      texto = REPLACE(texto, 'Ã', 'A'),
      texto = REPLACE(texto, 'Â', 'A'),
      texto = REPLACE(texto, 'Á', 'A'),
      texto = REPLACE(texto, 'Á', 'A'),
      texto = REPLACE(texto, 'À', 'A'),
      texto = REPLACE(texto, 'Ä', 'A'),
      texto = REPLACE(texto, 'É', 'E'),
      texto = REPLACE(texto, 'È', 'E'),
      texto = REPLACE(texto, 'Ë', 'E'),
      texto = REPLACE(texto, 'É', 'E'),
	  texto = REPLACE(texto, 'ê', 'e'),
      texto = REPLACE(texto, 'Ê', 'E'),
      texto = REPLACE(texto, 'Í', 'I'),
      texto = REPLACE(texto, 'Ì', 'I'),
	  texto = REPLACE(texto, 'Í', 'I'),
      texto = REPLACE(texto, 'Ï', 'I'),
      texto = REPLACE(texto, 'Ô', 'O'),
      texto = REPLACE(texto, 'Õ', 'O'),
      texto = REPLACE(texto, 'Ö', 'O'),
      texto = REPLACE(texto, 'Ó', 'O'),
      texto = REPLACE(texto, 'Ò', 'O'),
      texto = REPLACE(texto, 'Ú', 'U'),
	  texto = REPLACE(texto, 'Ù', 'U'),
      texto = REPLACE(texto, 'Ü', 'U'),
      texto = REPLACE(texto, 'Û', 'U'),
      texto = REPLACE(texto, 'Ñ', 'N');
        
	RETURN texto;
    
    END //
    
    DELIMITER ;