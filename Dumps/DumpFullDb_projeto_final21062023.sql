-- MariaDB dump 10.19  Distrib 10.4.19-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: db_projeto_final
-- ------------------------------------------------------
-- Server version	10.4.19-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_ator`
--

DROP TABLE IF EXISTS `tb_ator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_ator` (
  `id_ator` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `sobrenome` varchar(100) NOT NULL,
  `data_nascimento` date NOT NULL,
  `foto` varchar(100) NOT NULL,
  PRIMARY KEY (`id_ator`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_ator`
--

LOCK TABLES `tb_ator` WRITE;
/*!40000 ALTER TABLE `tb_ator` DISABLE KEYS */;
INSERT INTO `tb_ator` VALUES (1,'Johnny','Depp','1963-06-09','caminho/para/foto1.jpg'),(2,'Tom','Hanks','1956-07-09','caminho/para/foto2.jpg'),(3,'Leonardo','DiCaprio','1974-11-11','caminho/para/foto3.jpg'),(4,'Scarlett','Johansson','1984-11-22','caminho/para/foto4.jpg'),(5,'Brad','Pitt','1963-12-18','caminho/para/foto5.jpg'),(6,'sandra','bullock','1964-07-26','https://exemplo.com/sandra_bullock.jpg'),(7,'george','clooney','1961-05-06','https://exemplo.com/george_clooney.jpg'),(8,'mateus','nascimento','1979-06-08','https://exemplo.com/mateus_nascimento.jpg'),(9,'selton','mello','1972-12-30','https://exemplo.com/selton_mello.jpg'),(10,'matheus','nachtigall','1982-02-18','https://exemplo.com/matheus_nachtigall.jpg'),(11,'leandro','firmino','1978-06-23','https://exemplo.com/leandro_firmino.jpg'),(12,'masaki','suda','1993-02-21','https://exemplo.com/masaki_suda.jpg'),(13,'hana','sugisaki','1997-02-02','https://exemplo.com/hana_sugisaki.jpg'),(14,'ryo','yoshizawa','1994-02-01','https://exemplo.com/ryo_yoshizawa.jpg'),(15,'jo','byung-gyu','1996-04-23','https://exemplo.com/jo_byung_gyu.jpg'),(16,'yoon','chan-young','1997-11-09','https://exemplo.com/yoon_chan_young.jpg'),(17,'itziar','ituño','1974-06-18','https://exemplo.com/itziar_ituno.jpg');
/*!40000 ALTER TABLE `tb_ator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cartao_credito`
--

DROP TABLE IF EXISTS `tb_cartao_credito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_cartao_credito` (
  `id_cartao` int(11) NOT NULL AUTO_INCREMENT,
  `numero` char(20) NOT NULL,
  `data_vencimento` date NOT NULL,
  `cod_seguranca` char(3) NOT NULL,
  `nome_cartao` varchar(100) NOT NULL,
  PRIMARY KEY (`id_cartao`),
  UNIQUE KEY `numero` (`numero`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cartao_credito`
--

LOCK TABLES `tb_cartao_credito` WRITE;
/*!40000 ALTER TABLE `tb_cartao_credito` DISABLE KEYS */;
INSERT INTO `tb_cartao_credito` VALUES (1,'4444555566667777','2024-07-15','890','Carolina Mendes'),(2,'8888999900001111','2023-10-31','345','Fernando Costa'),(3,'2222333344445555','2024-02-28','678','Camila Rodrigues'),(4,'6666777788889999','2023-12-31','912','Rafaela Santos'),(5,'5555666677778888','2024-06-30','543','Gustavo Lima');
/*!40000 ALTER TABLE `tb_cartao_credito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_catalogo`
--

DROP TABLE IF EXISTS `tb_catalogo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_catalogo` (
  `id_catalogo` int(11) NOT NULL AUTO_INCREMENT,
  `pais_origem` varchar(100) NOT NULL,
  `imagem_capa` varchar(255) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `sinopse` varchar(255) NOT NULL,
  `ano_lancamento` year(4) NOT NULL,
  `duracao` time NOT NULL,
  `avaliacao` enum('1','2','3','4','5') NOT NULL,
  `data_atualizacao` date NOT NULL,
  `id_classificacao` int(11) NOT NULL,
  `id_idioma` int(11) NOT NULL,
  `tipo_midia` enum('F','S') DEFAULT NULL,
  PRIMARY KEY (`id_catalogo`),
  KEY `FK_id_classificacao` (`id_classificacao`),
  KEY `FK_id_idioma` (`id_idioma`),
  CONSTRAINT `FK_id_classificacao` FOREIGN KEY (`id_classificacao`) REFERENCES `tb_classificacao` (`id_classificacao`),
  CONSTRAINT `FK_id_idioma` FOREIGN KEY (`id_idioma`) REFERENCES `tb_idioma` (`id_idioma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_catalogo`
--

LOCK TABLES `tb_catalogo` WRITE;
/*!40000 ALTER TABLE `tb_catalogo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_catalogo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_catalogo_ator`
--

DROP TABLE IF EXISTS `tb_catalogo_ator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_catalogo_ator` (
  `id_catalogo_ator` int(11) NOT NULL AUTO_INCREMENT,
  `id_catalogo` int(11) NOT NULL,
  `id_ator` int(11) NOT NULL,
  PRIMARY KEY (`id_catalogo_ator`),
  KEY `FK_id_catalogo_1` (`id_catalogo`),
  KEY `FK_id_ator` (`id_ator`),
  CONSTRAINT `FK_id_ator` FOREIGN KEY (`id_ator`) REFERENCES `tb_ator` (`id_ator`),
  CONSTRAINT `FK_id_catalogo_1` FOREIGN KEY (`id_catalogo`) REFERENCES `tb_catalogo` (`id_catalogo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_catalogo_ator`
--

LOCK TABLES `tb_catalogo_ator` WRITE;
/*!40000 ALTER TABLE `tb_catalogo_ator` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_catalogo_ator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_catalogo_categoria`
--

DROP TABLE IF EXISTS `tb_catalogo_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_catalogo_categoria` (
  `id_catalogo_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `id_categoria` int(11) NOT NULL,
  `id_catalogo` int(11) NOT NULL,
  PRIMARY KEY (`id_catalogo_categoria`),
  KEY `FK_id_categoria_1` (`id_categoria`),
  KEY `FK_id_catalogo_2` (`id_catalogo`),
  CONSTRAINT `FK_id_catalogo_2` FOREIGN KEY (`id_catalogo`) REFERENCES `tb_catalogo` (`id_catalogo`),
  CONSTRAINT `FK_id_categoria_1` FOREIGN KEY (`id_categoria`) REFERENCES `tb_categoria` (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_catalogo_categoria`
--

LOCK TABLES `tb_catalogo_categoria` WRITE;
/*!40000 ALTER TABLE `tb_catalogo_categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_catalogo_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_catalogo_idioma`
--

DROP TABLE IF EXISTS `tb_catalogo_idioma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_catalogo_idioma` (
  `id_catalogo_idioma` int(11) NOT NULL AUTO_INCREMENT,
  `id_catalogo` int(11) NOT NULL,
  `id_idioma` int(11) NOT NULL,
  PRIMARY KEY (`id_catalogo_idioma`),
  KEY `FK_id_idioma_1` (`id_idioma`),
  KEY `FK_id_catalogo_3` (`id_catalogo`),
  CONSTRAINT `FK_id_catalogo_3` FOREIGN KEY (`id_catalogo`) REFERENCES `tb_catalogo` (`id_catalogo`),
  CONSTRAINT `FK_id_idioma_1` FOREIGN KEY (`id_idioma`) REFERENCES `tb_idioma` (`id_idioma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_catalogo_idioma`
--

LOCK TABLES `tb_catalogo_idioma` WRITE;
/*!40000 ALTER TABLE `tb_catalogo_idioma` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_catalogo_idioma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_categoria`
--

DROP TABLE IF EXISTS `tb_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_categoria` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_categoria`
--

LOCK TABLES `tb_categoria` WRITE;
/*!40000 ALTER TABLE `tb_categoria` DISABLE KEYS */;
INSERT INTO `tb_categoria` VALUES (1,'aventura'),(2,'romance'),(3,'comédia'),(4,'suspense'),(5,'terror'),(6,'suspense'),(7,'ficção'),(8,'terror'),(9,'nacional'),(10,'drama'),(11,'comedia');
/*!40000 ALTER TABLE `tb_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_classificacao`
--

DROP TABLE IF EXISTS `tb_classificacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_classificacao` (
  `id_classificacao` int(11) NOT NULL AUTO_INCREMENT,
  `idade` int(11) NOT NULL,
  `descricao` varchar(250) NOT NULL,
  PRIMARY KEY (`id_classificacao`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_classificacao`
--

LOCK TABLES `tb_classificacao` WRITE;
/*!40000 ALTER TABLE `tb_classificacao` DISABLE KEYS */;
INSERT INTO `tb_classificacao` VALUES (1,10,'Essa classificação indica que o conteúdo é adequado para todos os públicos. Não há cenas de violência, linguagem inapropriada, nudez ou temas adultos.'),(2,14,'Essa classificação é apropriada para adolescentes acima de 14 anos. Pode conter violência moderada, linguagem de baixo calão, temas mais maduros e cenas levemente sugestivas.'),(3,16,'Essa classificação é apropriada para pessoas com 16 anos ou mais. Pode conter violência intensa, linguagem forte, cenas de sexo, consumo de drogas e temas adultos.'),(4,18,'Essa classificação é destinada a um público adulto com idade igual ou superior a 18 anos. Pode conter cenas de violência extrema, sexo explícito, linguagem ofensiva, uso de drogas pesadas e temas adultos muito intensos.');
/*!40000 ALTER TABLE `tb_classificacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cliente`
--

DROP TABLE IF EXISTS `tb_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_cliente` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_plano` int(11) NOT NULL,
  `data_vencimento_plano` date DEFAULT NULL,
  `id_cartao` int(11) NOT NULL,
  `data_atualizacao` date NOT NULL,
  PRIMARY KEY (`id_cliente`),
  KEY `FK_id_usuario` (`id_usuario`),
  KEY `FK_id_plano` (`id_plano`),
  KEY `FK_id_cartao` (`id_cartao`),
  CONSTRAINT `FK_id_cartao` FOREIGN KEY (`id_cartao`) REFERENCES `tb_cartao_credito` (`id_cartao`),
  CONSTRAINT `FK_id_plano` FOREIGN KEY (`id_plano`) REFERENCES `tb_plano` (`id_plano`),
  CONSTRAINT `FK_id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cliente`
--

LOCK TABLES `tb_cliente` WRITE;
/*!40000 ALTER TABLE `tb_cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_endereco`
--

DROP TABLE IF EXISTS `tb_endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_endereco` (
  `id_endereco` int(11) NOT NULL AUTO_INCREMENT,
  `cep` varchar(100) NOT NULL,
  `bairro` varchar(100) NOT NULL,
  `rua` varchar(100) DEFAULT NULL,
  `quadra` varchar(100) DEFAULT NULL,
  `numero` int(11) NOT NULL,
  `id_pais` int(11) NOT NULL,
  `data_atualizacao` date NOT NULL,
  PRIMARY KEY (`id_endereco`),
  KEY `FK_id_pais` (`id_pais`),
  CONSTRAINT `FK_id_pais` FOREIGN KEY (`id_pais`) REFERENCES `tb_pais` (`id_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_endereco`
--

LOCK TABLES `tb_endereco` WRITE;
/*!40000 ALTER TABLE `tb_endereco` DISABLE KEYS */;
INSERT INTO `tb_endereco` VALUES (1,'12345-678','Centro','Rua A','Quadra 1',10,1,'2023-06-14'),(2,'54321-098','Vila Nova','Rua B','Quadra 2',20,1,'2023-06-14'),(3,'98765-432','Jardim das Flores','Rua C','Quadra 3',30,2,'2023-06-14'),(4,'45678-901','Bairro Novo','Rua D','Quadra 4',40,3,'2023-06-14'),(5,'56789-012','Centro','Rua E','Quadra 5',50,4,'2023-06-14'),(6,'87654-321','Vila Nova','Rua F','Quadra 6',60,1,'2023-06-14'),(7,'23456-789','Jardim das Flores','Rua G','Quadra 7',70,3,'2023-06-14'),(8,'78901-234','Bairro Novo','Rua H','Quadra 8',80,2,'2023-06-14'),(9,'34567-890','Centro','Rua I','Quadra 9',90,4,'2023-06-14'),(10,'67890-123','Vila Nova','Rua J','Quadra 10',100,1,'2023-06-14');
/*!40000 ALTER TABLE `tb_endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_episodio`
--

DROP TABLE IF EXISTS `tb_episodio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_episodio` (
  `id_episodio` int(11) NOT NULL AUTO_INCREMENT,
  `numero_episodio` int(11) NOT NULL,
  `id_catalogo` int(11) NOT NULL,
  `id_temporada` int(11) NOT NULL,
  PRIMARY KEY (`id_episodio`),
  KEY `FK_id_temporada` (`id_temporada`),
  KEY `FK_id_catalogo_5` (`id_catalogo`),
  CONSTRAINT `FK_id_catalogo_5` FOREIGN KEY (`id_catalogo`) REFERENCES `tb_catalogo` (`id_catalogo`),
  CONSTRAINT `FK_id_temporada` FOREIGN KEY (`id_temporada`) REFERENCES `tb_temporada` (`id_temporada`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_episodio`
--

LOCK TABLES `tb_episodio` WRITE;
/*!40000 ALTER TABLE `tb_episodio` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_episodio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_filme`
--

DROP TABLE IF EXISTS `tb_filme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_filme` (
  `id_filme` int(11) NOT NULL AUTO_INCREMENT,
  `oscar` int(11) NOT NULL,
  `id_catalogo` int(11) NOT NULL,
  PRIMARY KEY (`id_filme`),
  KEY `FK_id_catalogo` (`id_catalogo`),
  CONSTRAINT `FK_id_catalogo` FOREIGN KEY (`id_catalogo`) REFERENCES `tb_catalogo` (`id_catalogo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_filme`
--

LOCK TABLES `tb_filme` WRITE;
/*!40000 ALTER TABLE `tb_filme` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_filme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_funcionario`
--

DROP TABLE IF EXISTS `tb_funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_funcionario` (
  `id_funcionario` int(11) NOT NULL AUTO_INCREMENT,
  `foto_funcionario` varchar(100) NOT NULL,
  `data_atualizacao` date NOT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_funcionario`),
  KEY `FK_id_usuario_2` (`id_usuario`),
  CONSTRAINT `FK_id_usuario_2` FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_funcionario`
--

LOCK TABLES `tb_funcionario` WRITE;
/*!40000 ALTER TABLE `tb_funcionario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_idioma`
--

DROP TABLE IF EXISTS `tb_idioma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_idioma` (
  `id_idioma` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`id_idioma`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_idioma`
--

LOCK TABLES `tb_idioma` WRITE;
/*!40000 ALTER TABLE `tb_idioma` DISABLE KEYS */;
INSERT INTO `tb_idioma` VALUES (1,'português'),(2,'coreano'),(3,'Inglês'),(4,'francês'),(5,'japonês'),(6,'português'),(7,'inglês'),(8,'espanhol'),(9,'coreano'),(10,'japones');
/*!40000 ALTER TABLE `tb_idioma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pagamento`
--

DROP TABLE IF EXISTS `tb_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_pagamento` (
  `id_pagamento` int(11) NOT NULL AUTO_INCREMENT,
  `valor` float NOT NULL,
  `data_pagamento` date NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_tipo_pagamento` int(11) NOT NULL,
  `id_cartao` int(11) NOT NULL,
  PRIMARY KEY (`id_pagamento`),
  KEY `FK_id_cartao_1` (`id_cartao`),
  KEY `FK_id_cliente_1` (`id_cliente`),
  KEY `FK_id_tipo_pagamento` (`id_tipo_pagamento`),
  CONSTRAINT `FK_id_cartao_1` FOREIGN KEY (`id_cartao`) REFERENCES `tb_cartao_credito` (`id_cartao`),
  CONSTRAINT `FK_id_cliente_1` FOREIGN KEY (`id_cliente`) REFERENCES `tb_cliente` (`id_cliente`),
  CONSTRAINT `FK_id_tipo_pagamento` FOREIGN KEY (`id_tipo_pagamento`) REFERENCES `tb_tipo_pagamento` (`id_tipo_pagamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pagamento`
--

LOCK TABLES `tb_pagamento` WRITE;
/*!40000 ALTER TABLE `tb_pagamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pais`
--

DROP TABLE IF EXISTS `tb_pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_pais` (
  `id_pais` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `codigo` char(3) NOT NULL,
  PRIMARY KEY (`id_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pais`
--

LOCK TABLES `tb_pais` WRITE;
/*!40000 ALTER TABLE `tb_pais` DISABLE KEYS */;
INSERT INTO `tb_pais` VALUES (1,'Estados Unidos','EUA'),(2,'frança','FRA'),(3,'alemanha','ALE'),(4,'italia','ITA'),(5,'brasil','bra'),(6,'estados unidos','eua'),(7,'espanha','esp'),(8,'japão','jpn'),(9,'coreia do sul','kor');
/*!40000 ALTER TABLE `tb_pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pais_catalogo`
--

DROP TABLE IF EXISTS `tb_pais_catalogo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_pais_catalogo` (
  `id_pais_catalogo` int(11) NOT NULL AUTO_INCREMENT,
  `id_pais` int(11) NOT NULL,
  `id_catalogo` int(11) NOT NULL,
  PRIMARY KEY (`id_pais_catalogo`),
  KEY `FK_id_pais_3` (`id_pais`),
  KEY `FK_id_catalogo_6` (`id_catalogo`),
  CONSTRAINT `FK_id_catalogo_6` FOREIGN KEY (`id_catalogo`) REFERENCES `tb_catalogo` (`id_catalogo`),
  CONSTRAINT `FK_id_pais_3` FOREIGN KEY (`id_pais`) REFERENCES `tb_pais` (`id_pais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pais_catalogo`
--

LOCK TABLES `tb_pais_catalogo` WRITE;
/*!40000 ALTER TABLE `tb_pais_catalogo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_pais_catalogo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_perfil`
--

DROP TABLE IF EXISTS `tb_perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_perfil` (
  `id_perfil` int(11) NOT NULL AUTO_INCREMENT,
  `foto` varchar(100) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `tipo` enum('A','C') NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `data_atualizacao` date NOT NULL,
  PRIMARY KEY (`id_perfil`),
  KEY `FK_id_cliente` (`id_cliente`),
  CONSTRAINT `FK_id_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `tb_cliente` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_perfil`
--

LOCK TABLES `tb_perfil` WRITE;
/*!40000 ALTER TABLE `tb_perfil` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_plano`
--

DROP TABLE IF EXISTS `tb_plano`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_plano` (
  `id_plano` int(11) NOT NULL AUTO_INCREMENT,
  `valor` float NOT NULL,
  `descricao` varchar(100) NOT NULL,
  PRIMARY KEY (`id_plano`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_plano`
--

LOCK TABLES `tb_plano` WRITE;
/*!40000 ALTER TABLE `tb_plano` DISABLE KEYS */;
INSERT INTO `tb_plano` VALUES (1,35,'plano básico'),(2,45,'plano plus'),(3,55,'plano master'),(4,25.9,'resolução (hd), livre de anúncios, proporciona acesso ao catálogo \ncompleto e permite que você faça '),(5,39.99,'duas telas simultâneas, (full hd). ideal para compartilhar o acesso com outra pessoa em uma mesma re'),(6,55.99,'resolução ultra hd 4k, hdr, dolby vision e dolby audio. além disso, é possível assistir ao streaming');
/*!40000 ALTER TABLE `tb_plano` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_serie`
--

DROP TABLE IF EXISTS `tb_serie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_serie` (
  `id_serie` int(11) NOT NULL AUTO_INCREMENT,
  `quant_episodio_total` int(11) NOT NULL,
  `quantidade_temporada` int(11) NOT NULL,
  `id_catalogo` int(11) NOT NULL,
  PRIMARY KEY (`id_serie`),
  KEY `FK_id_catalogo_4` (`id_catalogo`),
  CONSTRAINT `FK_id_catalogo_4` FOREIGN KEY (`id_catalogo`) REFERENCES `tb_catalogo` (`id_catalogo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_serie`
--

LOCK TABLES `tb_serie` WRITE;
/*!40000 ALTER TABLE `tb_serie` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_serie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_temporada`
--

DROP TABLE IF EXISTS `tb_temporada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_temporada` (
  `id_temporada` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `quantidade_episodio` int(11) NOT NULL,
  `id_serie` int(11) NOT NULL,
  `numero_temporada` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_temporada`),
  KEY `FK_id_serie` (`id_serie`),
  CONSTRAINT `FK_id_serie` FOREIGN KEY (`id_serie`) REFERENCES `tb_serie` (`id_serie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_temporada`
--

LOCK TABLES `tb_temporada` WRITE;
/*!40000 ALTER TABLE `tb_temporada` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_temporada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_tipo_pagamento`
--

DROP TABLE IF EXISTS `tb_tipo_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_tipo_pagamento` (
  `id_tipo_pagamento` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`id_tipo_pagamento`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tipo_pagamento`
--

LOCK TABLES `tb_tipo_pagamento` WRITE;
/*!40000 ALTER TABLE `tb_tipo_pagamento` DISABLE KEYS */;
INSERT INTO `tb_tipo_pagamento` VALUES (3,'boleto'),(2,'cartão'),(7,'deposito bancario'),(1,'pix');
/*!40000 ALTER TABLE `tb_tipo_pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_usuario`
--

DROP TABLE IF EXISTS `tb_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `data_atualizacao` date NOT NULL,
  `sobrenome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `status` enum('A','I') NOT NULL,
  `data_nascimento` date NOT NULL,
  `data_cadastro` date NOT NULL,
  `senha` varchar(100) NOT NULL,
  `id_endereco` int(11) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `email` (`email`),
  KEY `FK_id_endereco` (`id_endereco`),
  CONSTRAINT `FK_id_endereco` FOREIGN KEY (`id_endereco`) REFERENCES `tb_endereco` (`id_endereco`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_usuario`
--

LOCK TABLES `tb_usuario` WRITE;
/*!40000 ALTER TABLE `tb_usuario` DISABLE KEYS */;
INSERT INTO `tb_usuario` VALUES (1,'Carolina','2023-05-09','Mendes','carolina.mendes@example.com','A','1990-01-01','2023-05-01','123456',1),(2,'Fernando','2023-05-09','Costa','fernando.costa@example.com','I','1985-02-15','2023-04-27','secreta123',2),(3,'Camila','2023-05-09','Rodrigues','camila.rodrigues@example.com','A','1992-07-10','2023-05-03','senha@2023',3),(4,'Rafaela','2023-05-09','Santos','rafaela.santos@example.com','A','1994-04-20','2023-05-05','p4ssw0rd',4),(5,'Gustavo','2023-05-09','Lima','gustavo.lima@example.com','I','1998-09-30','2023-04-29','myPass123',5),(6,'Laura','2023-06-14','Ribeiro','laura.ribeiro@example.com','A','1993-03-25','2023-06-14','senha123',6),(7,'Rafael','2023-06-14','Gomes','rafael.gomes@example.com','A','1987-11-12','2023-06-14','senha456',7),(8,'Camila','2023-06-14','Almeida','camila.almeida@example.com','I','1994-08-05','2023-06-14','senha789',8),(9,'Mariana','2023-06-14','Melo','mariana.melo@example.com','A','1989-06-30','2023-06-14','senhaabc',9),(10,'Gustavo','2023-06-14','Costa','gustavo.costa@example.com','A','1996-04-18','2023-06-14','senhadef',10);
/*!40000 ALTER TABLE `tb_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vw_ator`
--

DROP TABLE IF EXISTS `vw_ator`;
/*!50001 DROP VIEW IF EXISTS `vw_ator`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_ator` (
  `nome` tinyint NOT NULL,
  `sobrenome` tinyint NOT NULL,
  `data_nascimento` tinyint NOT NULL,
  `foto` tinyint NOT NULL,
  `qtd_filmes` tinyint NOT NULL,
  `qtd_series` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_catalogo`
--

DROP TABLE IF EXISTS `vw_catalogo`;
/*!50001 DROP VIEW IF EXISTS `vw_catalogo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_catalogo` (
  `id_catalogo` tinyint NOT NULL,
  `pais_origem` tinyint NOT NULL,
  `imagem_capa` tinyint NOT NULL,
  `titulo` tinyint NOT NULL,
  `sinopse` tinyint NOT NULL,
  `ano_lancamento` tinyint NOT NULL,
  `duracao` tinyint NOT NULL,
  `avaliacao` tinyint NOT NULL,
  `data_atualizacao` tinyint NOT NULL,
  `id_idioma` tinyint NOT NULL,
  `idioma_original` tinyint NOT NULL,
  `classificacao` tinyint NOT NULL,
  `categoria` tinyint NOT NULL,
  `Quant_idioma_disponivel` tinyint NOT NULL,
  `Tipo_catalogo` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_episodio`
--

DROP TABLE IF EXISTS `vw_episodio`;
/*!50001 DROP VIEW IF EXISTS `vw_episodio`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_episodio` (
  `nome_serie` tinyint NOT NULL,
  `numero_temporada` tinyint NOT NULL,
  `nome_temporada` tinyint NOT NULL,
  `quantidade_episodio` tinyint NOT NULL,
  `numero_episodio` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_pagamento`
--

DROP TABLE IF EXISTS `vw_pagamento`;
/*!50001 DROP VIEW IF EXISTS `vw_pagamento`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_pagamento` (
  `id_pagamento` tinyint NOT NULL,
  `valor` tinyint NOT NULL,
  `data_pagamento` tinyint NOT NULL,
  `id_cartao` tinyint NOT NULL,
  `id_plano` tinyint NOT NULL,
  `nome_cliente` tinyint NOT NULL,
  `tipo_pagamento` tinyint NOT NULL,
  `nome_plano` tinyint NOT NULL,
  `data_vencimento_plano` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_perfil`
--

DROP TABLE IF EXISTS `vw_perfil`;
/*!50001 DROP VIEW IF EXISTS `vw_perfil`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_perfil` (
  `foto_perfil` tinyint NOT NULL,
  `nome_perfil` tinyint NOT NULL,
  `tipo_perfil` tinyint NOT NULL,
  `nome_cliente` tinyint NOT NULL,
  `id_usuario` tinyint NOT NULL,
  `id_cartao` tinyint NOT NULL,
  `id_plano` tinyint NOT NULL,
  `data_vencimento_plano` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_temporada`
--

DROP TABLE IF EXISTS `vw_temporada`;
/*!50001 DROP VIEW IF EXISTS `vw_temporada`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_temporada` (
  `numero_temporada` tinyint NOT NULL,
  `nome_temporada` tinyint NOT NULL,
  `descricao` tinyint NOT NULL,
  `quantidade_episodio` tinyint NOT NULL,
  `nome_serie` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_usuario`
--

DROP TABLE IF EXISTS `vw_usuario`;
/*!50001 DROP VIEW IF EXISTS `vw_usuario`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_usuario` (
  `id_usuario` tinyint NOT NULL,
  `nome` tinyint NOT NULL,
  `data_atualizacao` tinyint NOT NULL,
  `sobrenome` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `data_nascimento` tinyint NOT NULL,
  `data_cadastro` tinyint NOT NULL,
  `endereco` tinyint NOT NULL,
  `cep` tinyint NOT NULL,
  `nome_pais` tinyint NOT NULL,
  `descricao` tinyint NOT NULL,
  `tipo_usuario` tinyint NOT NULL,
  `qtd_perfis` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'db_projeto_final'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_remover_acento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_remover_acento`(texto VARCHAR(255)) RETURNS varchar(255) CHARSET utf8mb4
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
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_remover_acento_minusculo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_remover_acento_minusculo`(texto VARCHAR(255)) RETURNS varchar(255) CHARSET utf8mb4
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
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_valida_texto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_valida_texto`(texto VARCHAR(255), parametro INT) RETURNS tinyint(1)
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_ator` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_ator`(valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_ator FROM tb_ator WHERE id_ator = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_ator
		WHERE id_ator = valor_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_categoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_categoria`(valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_categoria FROM tb_categoria WHERE id_categoria = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_categoria
		WHERE id_categoria = valor_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_classificacao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_classificacao`(valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_classificacao FROM tb_classificacao_indicativa WHERE id_classificacao = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_classificacao
		WHERE id_classificacao = valor_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_idioma` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_idioma`(valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_idioma FROM tb_idioma WHERE id_idioma = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_idioma
		WHERE id_idioma = valor_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_pais` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_pais`(valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_pais FROM tb_pais WHERE id_pais = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_pais
		WHERE id_pais = valor_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_plano` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_plano`(valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_plano FROM tb_plano WHERE id_plano = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_plano
		WHERE id_plano = valor_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_tipo_pagamento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_tipo_pagamento`(valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_tipo_pagamento FROM tb_tipo_pagamento WHERE id_tipo_pagamento = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_tipo_pagamento
		WHERE id_tipo_pagamento = valor_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_ator` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_ator`(nome_valor VARCHAR(45), sobrenome_valor VARCHAR(45), nascimento DATE, foto_ator VARCHAR(255))
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
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_cartao_credito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_cartao_credito`(num CHAR(19), vencimento DATE, num_seguranca CHAR(3), id_do_cliente INT)
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_catalogo_categoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_catalogo_categoria`(id_do_catalogo INT, id_do_categoria INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_catalogo FROM tb_catalogo WHERE id_catalogo = id_do_catalogo) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_catalogo invalido';
	ELSEIF NOT EXISTS
		(SELECT id_categoria FROM tb_categoria WHERE id_categoria = id_do_categoria) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_categoria invalido';
	ELSE
		INSERT INTO tb_catalogo_categoria
		(id_catalogo_categoria, id_catalogo, id_categoria )
		VALUES
		(id_catalogo_categoria,id_do_catalogo, id_do_categoria);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_catalogo_idioma` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_catalogo_idioma`(id_do_catalogo INT, id_do_idioma INT)
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
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_categoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_categoria`(nome_categoria VARCHAR(45))
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
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_classificacao_indicativa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_classificacao_indicativa`(idade_valor enum('livre','10','12','14','16','18'), descricao_valor VARCHAR(255))
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
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_cliente`(id_do_usuario INT, id_do_plano INT, vencimento_plano DATE)
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_filme` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_filme`(id_do_catalogo INT, possui_oscar BOOLEAN)
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
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_funcionario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_funcionario`(id_do_usuario INT, foto_usuario VARCHAR(255))
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
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_idioma` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_idioma`(nome_idioma VARCHAR(45))
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
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_pagamento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_pagamento`(valor_p FLOAT, data_pagamento DATETIME, id_do_cartao_credito INT, id_do_cliente INT, id_do_tipo_pagamento INT)
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
		(valor, data_pagamento, id_cartao_credito, id_cliente, id_tipo_pagamento)
		VALUES
		(valor_p, data_pagamento, id_do_cartao_credito, id_do_cliente, id_do_tipo_pagamento);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_pais` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_pais`(nome_valor VARCHAR(45), cod_pais CHAR(3))
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
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_perfil` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_perfil`(valor_nome VARCHAR(45), valor_foto VARCHAR(255), valor_tipo enum('adulto','crianca','personalizado'), id_do_cliente INT)
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_plano` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_plano`(nome_valor VARCHAR(45), valor_plano FLOAT, descricao_plano VARCHAR(255))
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
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_tipo_pagamento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_tipo_pagamento`(nome_valor VARCHAR(30))
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
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_usuario`(valor_nome VARCHAR(45), valor_sobrenome VARCHAR(45), valor_email VARCHAR(45), dt_nascimento DATE, 
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
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_pais_catalogo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_pais_catalogo`(id_do_pais INT, id_do_catalogo INT)
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
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_ator` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_ator`(valor_id INT, nome_valor VARCHAR(45), sobrenome_valor VARCHAR(45), nascimento DATE, foto_ator VARCHAR(255))
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
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_categoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_categoria`(valor_id INT, nome_valor VARCHAR(45))
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
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_classificacao_indicativa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_classificacao_indicativa`(valor_id INT, idade_valor enum('livre','10','12','14','16','18'), descricao_valor VARCHAR(255))
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
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_idioma` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_idioma`(valor_id INT, nome_valor VARCHAR(45))
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
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_pais` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_pais`(valor_id INT, nome_valor VARCHAR(45), cod_pais CHAR(3))
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
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_plano` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_plano`(valor_id INT, nome_valor VARCHAR(45), preco FLOAT, descricao_plano  VARCHAR(255))
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
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_tipo_pagamento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_tipo_pagamento`(valor_id INT, nome_valor VARCHAR(30))
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
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_ator`
--

/*!50001 DROP TABLE IF EXISTS `vw_ator`*/;
/*!50001 DROP VIEW IF EXISTS `vw_ator`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_ator` AS select `a`.`nome` AS `nome`,`a`.`sobrenome` AS `sobrenome`,`a`.`data_nascimento` AS `data_nascimento`,`a`.`foto` AS `foto`,count(`f`.`id_catalogo`) AS `qtd_filmes`,count(`s`.`id_catalogo`) AS `qtd_series` from ((((`tb_ator` `a` left join `tb_catalogo_ator` `ca` on(`ca`.`id_ator` = `a`.`id_ator`)) left join `tb_catalogo` `c` on(`c`.`id_catalogo` = `ca`.`id_catalogo`)) left join `tb_filme` `f` on(`f`.`id_catalogo` = `c`.`id_catalogo`)) left join `tb_serie` `s` on(`s`.`id_catalogo` = `c`.`id_catalogo`)) group by `a`.`nome`,`a`.`sobrenome`,`a`.`data_nascimento`,`a`.`foto` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_catalogo`
--

/*!50001 DROP TABLE IF EXISTS `vw_catalogo`*/;
/*!50001 DROP VIEW IF EXISTS `vw_catalogo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_catalogo` AS select `c`.`id_catalogo` AS `id_catalogo`,`c`.`pais_origem` AS `pais_origem`,`c`.`imagem_capa` AS `imagem_capa`,`c`.`titulo` AS `titulo`,`c`.`sinopse` AS `sinopse`,`c`.`ano_lancamento` AS `ano_lancamento`,`c`.`duracao` AS `duracao`,`c`.`avaliacao` AS `avaliacao`,`c`.`data_atualizacao` AS `data_atualizacao`,`c`.`id_idioma` AS `id_idioma`,`i`.`nome` AS `idioma_original`,`cla`.`descricao` AS `classificacao`,`cat`.`nome` AS `categoria`,(select count(0) from `tb_catalogo_idioma` where `tb_catalogo_idioma`.`id_catalogo` = `c`.`id_catalogo`) AS `Quant_idioma_disponivel`,case when `c`.`tipo_midia` = 'F' then 'Filme' when `c`.`tipo_midia` = 'S' then 'Serie' else 'N/A' end AS `Tipo_catalogo` from ((((`tb_catalogo` `c` left join `tb_idioma` `i` on(`i`.`id_idioma` = `c`.`id_idioma`)) left join `tb_classificacao` `cla` on(`cla`.`id_classificacao` = `c`.`id_classificacao`)) left join `tb_catalogo_categoria` `cc` on(`cc`.`id_catalogo` = `c`.`id_catalogo`)) left join `tb_categoria` `cat` on(`cat`.`id_categoria` = `cc`.`id_categoria`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_episodio`
--

/*!50001 DROP TABLE IF EXISTS `vw_episodio`*/;
/*!50001 DROP VIEW IF EXISTS `vw_episodio`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_episodio` AS select `c`.`titulo` AS `nome_serie`,`t`.`numero_temporada` AS `numero_temporada`,`t`.`titulo` AS `nome_temporada`,`t`.`quantidade_episodio` AS `quantidade_episodio`,`e`.`numero_episodio` AS `numero_episodio` from ((`tb_catalogo` `c` join `tb_episodio` `e` on(`e`.`id_catalogo` = `c`.`id_catalogo`)) left join `tb_temporada` `t` on(`t`.`id_temporada` = `e`.`id_temporada`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_pagamento`
--

/*!50001 DROP TABLE IF EXISTS `vw_pagamento`*/;
/*!50001 DROP VIEW IF EXISTS `vw_pagamento`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_pagamento` AS select `p`.`id_pagamento` AS `id_pagamento`,`p`.`valor` AS `valor`,`p`.`data_pagamento` AS `data_pagamento`,`p`.`id_cartao` AS `id_cartao`,`c`.`id_plano` AS `id_plano`,`u`.`nome` AS `nome_cliente`,`tp`.`nome` AS `tipo_pagamento`,`pl`.`descricao` AS `nome_plano`,`c`.`data_vencimento_plano` AS `data_vencimento_plano` from ((((`tb_pagamento` `p` left join `tb_tipo_pagamento` `tp` on(`tp`.`id_tipo_pagamento` = `p`.`id_tipo_pagamento`)) left join `tb_cliente` `c` on(`p`.`id_cliente` = `c`.`id_cliente`)) left join `tb_usuario` `u` on(`u`.`id_usuario` = `c`.`id_usuario`)) left join `tb_plano` `pl` on(`pl`.`id_plano` = `c`.`id_plano`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_perfil`
--

/*!50001 DROP TABLE IF EXISTS `vw_perfil`*/;
/*!50001 DROP VIEW IF EXISTS `vw_perfil`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_perfil` AS select `p`.`foto` AS `foto_perfil`,`p`.`nome` AS `nome_perfil`,`p`.`tipo` AS `tipo_perfil`,`u`.`nome` AS `nome_cliente`,`c`.`id_usuario` AS `id_usuario`,`c`.`id_cartao` AS `id_cartao`,`c`.`id_plano` AS `id_plano`,`c`.`data_vencimento_plano` AS `data_vencimento_plano` from ((`tb_perfil` `p` join `tb_cliente` `c` on(`p`.`id_cliente` = `c`.`id_cliente`)) left join `tb_usuario` `u` on(`u`.`id_usuario` = `c`.`id_usuario`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_temporada`
--

/*!50001 DROP TABLE IF EXISTS `vw_temporada`*/;
/*!50001 DROP VIEW IF EXISTS `vw_temporada`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_temporada` AS select `t`.`numero_temporada` AS `numero_temporada`,`t`.`titulo` AS `nome_temporada`,`t`.`descricao` AS `descricao`,`t`.`quantidade_episodio` AS `quantidade_episodio`,`c`.`titulo` AS `nome_serie` from (((`tb_catalogo` `c` join `tb_episodio` `e` on(`e`.`id_catalogo` = `c`.`id_catalogo`)) left join `tb_temporada` `t` on(`t`.`id_temporada` = `e`.`id_temporada`)) left join `tb_serie` `s` on(`s`.`id_serie` = `t`.`id_serie`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_usuario`
--

/*!50001 DROP TABLE IF EXISTS `vw_usuario`*/;
/*!50001 DROP VIEW IF EXISTS `vw_usuario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_usuario` AS select `u`.`id_usuario` AS `id_usuario`,`u`.`nome` AS `nome`,`u`.`data_atualizacao` AS `data_atualizacao`,`u`.`sobrenome` AS `sobrenome`,`u`.`email` AS `email`,`u`.`status` AS `status`,`u`.`data_nascimento` AS `data_nascimento`,`u`.`data_cadastro` AS `data_cadastro`,concat(`e`.`rua`,', ',`e`.`bairro`,', ',`e`.`quadra`,', ',`e`.`numero`) AS `endereco`,`e`.`cep` AS `cep`,`p`.`nome` AS `nome_pais`,`pl`.`descricao` AS `descricao`,case when `f`.`id_funcionario` is not null then 'Funcionário' when `c`.`id_cliente` is not null then 'Cliente' else 'N/A' end AS `tipo_usuario`,(select count(0) from `tb_perfil` where `tb_perfil`.`id_cliente` = `c`.`id_cliente`) AS `qtd_perfis` from (((((`tb_usuario` `u` left join `tb_funcionario` `f` on(`f`.`id_usuario` = `u`.`id_usuario`)) left join `tb_cliente` `c` on(`c`.`id_usuario` = `u`.`id_usuario`)) left join `tb_endereco` `e` on(`e`.`id_endereco` = `u`.`id_endereco`)) left join `tb_pais` `p` on(`p`.`id_pais` = `e`.`id_pais`)) left join `tb_plano` `pl` on(`pl`.`id_plano` = `c`.`id_plano`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-21  8:58:34
