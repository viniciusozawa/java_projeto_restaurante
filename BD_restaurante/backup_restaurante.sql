-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           8.0.42 - MySQL Community Server - GPL
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.10.0.7000
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para bd_restaurante
DROP DATABASE IF EXISTS `bd_restaurante`;
CREATE DATABASE IF NOT EXISTS `bd_restaurante` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bd_restaurante`;

-- Copiando estrutura para tabela bd_restaurante.cardapio
DROP TABLE IF EXISTS `cardapio`;
CREATE TABLE IF NOT EXISTS `cardapio` (
  `codCardapio` int NOT NULL AUTO_INCREMENT,
  `nomeComida` varchar(150) NOT NULL,
  `valorComida` decimal(6,2) NOT NULL,
  `descricaoComida` varchar(500) DEFAULT NULL,
  `categoria_codCategoria` int NOT NULL,
  PRIMARY KEY (`codCardapio`,`categoria_codCategoria`),
  KEY `fk_cardapio_categoria1_idx` (`categoria_codCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela bd_restaurante.cardapio: ~1 rows (aproximadamente)
INSERT INTO `cardapio` (`codCardapio`, `nomeComida`, `valorComida`, `descricaoComida`, `categoria_codCategoria`) VALUES
	(1, 'Hamburguer', 20.10, NULL, 2);

-- Copiando estrutura para tabela bd_restaurante.categoria
DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `codCategoria` int NOT NULL AUTO_INCREMENT,
  `nomeCategoria` varchar(150) NOT NULL,
  PRIMARY KEY (`codCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela bd_restaurante.categoria: ~2 rows (aproximadamente)
INSERT INTO `categoria` (`codCategoria`, `nomeCategoria`) VALUES
	(1, 'Doce'),
	(2, 'Salgado');

-- Copiando estrutura para tabela bd_restaurante.cliente
DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `codCliente` int NOT NULL AUTO_INCREMENT,
  `senhaCliente` varchar(150) NOT NULL,
  `nomeCliente` varchar(150) NOT NULL,
  `telefone` varchar(50) DEFAULT NULL,
  `dataCadastro` date NOT NULL,
  PRIMARY KEY (`codCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela bd_restaurante.cliente: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela bd_restaurante.estoque
DROP TABLE IF EXISTS `estoque`;
CREATE TABLE IF NOT EXISTS `estoque` (
  `codEstoque` int NOT NULL AUTO_INCREMENT,
  `nomeItem` varchar(150) NOT NULL,
  `quant` decimal(6,2) NOT NULL,
  `dataProducao` date NOT NULL,
  `dataVencimento` date NOT NULL,
  `descricao` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`codEstoque`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela bd_restaurante.estoque: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela bd_restaurante.estoque_por_fonecedor
DROP TABLE IF EXISTS `estoque_por_fonecedor`;
CREATE TABLE IF NOT EXISTS `estoque_por_fonecedor` (
  `codestoque_por_fonecedor` int NOT NULL AUTO_INCREMENT,
  `estoque_codEstoque` int NOT NULL,
  `fornecedores_codFornecedor` int NOT NULL,
  PRIMARY KEY (`codestoque_por_fonecedor`,`estoque_codEstoque`,`fornecedores_codFornecedor`),
  KEY `fk_estoque_has_fornecedores_fornecedores1_idx` (`fornecedores_codFornecedor`),
  KEY `fk_estoque_has_fornecedores_estoque1_idx` (`estoque_codEstoque`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela bd_restaurante.estoque_por_fonecedor: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela bd_restaurante.feedback
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE IF NOT EXISTS `feedback` (
  `codFeedback` int NOT NULL AUTO_INCREMENT,
  `nota` varchar(45) DEFAULT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  `cliente_codCliente` int DEFAULT NULL,
  PRIMARY KEY (`codFeedback`),
  KEY `FK_feedbackcliente` (`cliente_codCliente`),
  CONSTRAINT `FK_feedbackcliente` FOREIGN KEY (`cliente_codCliente`) REFERENCES `cliente` (`codCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela bd_restaurante.feedback: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela bd_restaurante.fornecedores
DROP TABLE IF EXISTS `fornecedores`;
CREATE TABLE IF NOT EXISTS `fornecedores` (
  `codFornecedor` int NOT NULL AUTO_INCREMENT,
  `nomeFornecedor` varchar(150) NOT NULL,
  `cnpj` varchar(45) DEFAULT NULL,
  `endereco` varchar(150) DEFAULT NULL,
  `bairro` varchar(45) DEFAULT NULL,
  `cidade` varchar(45) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`codFornecedor`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela bd_restaurante.fornecedores: ~1 rows (aproximadamente)
INSERT INTO `fornecedores` (`codFornecedor`, `nomeFornecedor`, `cnpj`, `endereco`, `bairro`, `cidade`, `estado`) VALUES
	(1, 'Neymar', '20302-32/0001', 'Rua piriquito', 'Vila nova', 'Santos', 'SP');

-- Copiando estrutura para tabela bd_restaurante.funcionario
DROP TABLE IF EXISTS `funcionario`;
CREATE TABLE IF NOT EXISTS `funcionario` (
  `codFuncionario` int NOT NULL AUTO_INCREMENT,
  `nomeFuncionario` varchar(150) NOT NULL,
  `dataNascimento` date DEFAULT NULL,
  `senhaFuncionario` varchar(45) NOT NULL,
  `cpfFuncionario` varchar(45) DEFAULT NULL,
  `salarioFuncionario` decimal(6,2) NOT NULL,
  `cargoFuncionario` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `turnos_codTurnos` int NOT NULL,
  PRIMARY KEY (`codFuncionario`,`turnos_codTurnos`),
  KEY `fk_funcionario_turnos1_idx` (`turnos_codTurnos`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela bd_restaurante.funcionario: ~1 rows (aproximadamente)
INSERT INTO `funcionario` (`codFuncionario`, `nomeFuncionario`, `dataNascimento`, `senhaFuncionario`, `cpfFuncionario`, `salarioFuncionario`, `cargoFuncionario`, `turnos_codTurnos`) VALUES
	(1, 'Yuji', '2007-09-16', 'yaudf', '29312414', 900.23, 'Limpar banheiro', 1);

-- Copiando estrutura para tabela bd_restaurante.mesa
DROP TABLE IF EXISTS `mesa`;
CREATE TABLE IF NOT EXISTS `mesa` (
  `codMesa` int NOT NULL AUTO_INCREMENT,
  `numeroMesa` int NOT NULL,
  `localMesa` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`codMesa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela bd_restaurante.mesa: ~0 rows (aproximadamente)

-- Copiando estrutura para procedure bd_restaurante.proc_alterarTurnos
DROP PROCEDURE IF EXISTS `proc_alterarTurnos`;
DELIMITER //
CREATE PROCEDURE `proc_alterarTurnos`(
	IN `entradacodTurno` INT,
	IN `entradaHorarioInicial` DATE,
	IN `entradaHorarioFinal` DATE
)
BEGIN
	SELECT COUNT(*) INTO @contador FROM turnos WHERE codTurnos = entradacodTurno;

	if (@contador) then
		UPDATE turnos SET horarioInicio = entradaHorarioInicial, 
		horarioFinal = entradaHorarioFinal WHERE codTurnos = entradaCodTurno;  
	else
		SELECT "Não foi encontrado o codigo" AS Erro;
	
	END if;
END//
DELIMITER ;

-- Copiando estrutura para procedure bd_restaurante.proc_insereCliente
DROP PROCEDURE IF EXISTS `proc_insereCliente`;
DELIMITER //
CREATE PROCEDURE `proc_insereCliente`(
	IN `entradaNome` VARCHAR(150),
	IN `entradaSenha` VARCHAR(150),
	IN `entradaData` DATE
)
BEGIN
	INSERT INTO cliente(nomeCliente, senhaCliente, dataCadastro)
	VALUES(entradaNome, entradaSenha, entradaData);
END//
DELIMITER ;

-- Copiando estrutura para procedure bd_restaurante.proc_insereFornecedor
DROP PROCEDURE IF EXISTS `proc_insereFornecedor`;
DELIMITER //
CREATE PROCEDURE `proc_insereFornecedor`(
	IN `entradaNomeFornecedor` VARCHAR(150),
	IN `entradaCnpj` VARCHAR(45),
	IN `entradaEndereco` VARCHAR(150),
	IN `entradaBairro` VARCHAR(45),
	IN `entradaCidade` VARCHAR(45),
	IN `entradaEstado` VARCHAR(2)
)
BEGIN
	INSERT INTO fornecedores(nomeFornecedor, cnpj, endereco, bairro, cidade, estado)
	VALUES(entradaNomeFornecedor, entradaCnpj, entradaEndereco, entradaBairro, entradaCidade, entradaEstado);
	
END//
DELIMITER ;

-- Copiando estrutura para procedure bd_restaurante.proc_insereFuncionario
DROP PROCEDURE IF EXISTS `proc_insereFuncionario`;
DELIMITER //
CREATE PROCEDURE `proc_insereFuncionario`(
	IN `entradaNome` VARCHAR(150),
	IN `entradaNascimento` DATE,
	IN `entradaSenha` VARCHAR(45),
	IN `entradaCpf` VARCHAR(45),
	IN `entradaSalario` DECIMAL(6,2),
	IN `entradaCargo` VARCHAR(150),
	IN `entradacodTurno` INT
)
BEGIN
	SELECT COUNT(*) INTO @contador FROM turnos WHERE codTurnos = entradacodTurno;

	if (@contador) then
		INSERT INTO funcionario(nomeFuncionario, dataNascimento, senhaFuncionario, cpfFuncionario, salarioFuncionario,
		cargoFuncionario, turnos_codTurnos ) VALUES(entradaNome, entradaNascimento, entradaSenha, entradaCpf, entradaSalario, 
		entradaCargo, entradacodTurno);
	else
		SELECT "Turno não cadastrado" AS Erro;
	
	END if;
END//
DELIMITER ;

-- Copiando estrutura para procedure bd_restaurante.proc_insereMesa
DROP PROCEDURE IF EXISTS `proc_insereMesa`;
DELIMITER //
CREATE PROCEDURE `proc_insereMesa`(
	IN `entradaNumeroMeasa` INT,
	IN `entradaLocalMesa` VARCHAR(150)
)
BEGIN
	INSERT INTO mesa(numeroMesa, localMesa) 
	VALUES(entradaNumeroMesa, entradaLocalMesa);
END//
DELIMITER ;

-- Copiando estrutura para procedure bd_restaurante.proc_insereTurnos
DROP PROCEDURE IF EXISTS `proc_insereTurnos`;
DELIMITER //
CREATE PROCEDURE `proc_insereTurnos`(
	IN `entradaHorarioInicio` TIME,
	IN `entradaHorarioFinal` TIME
)
BEGIN
	INSERT INTO turnos(horarioInicio , horarioFinal)
	VALUES(entradaHorarioInicio, entradaHorarioFinal);
END//
DELIMITER ;

-- Copiando estrutura para procedure bd_restaurante.proc_inserirCardapio
DROP PROCEDURE IF EXISTS `proc_inserirCardapio`;
DELIMITER //
CREATE PROCEDURE `proc_inserirCardapio`(
	IN `entradaNomeComida` VARCHAR(150),
	IN `entradaValorComida` DECIMAL(6,2),
	IN `entradaCodCategoria` INT
)
BEGIN
	
	INSERT INTO cardapio(nomeComida, valorComida, categoria_codCategoria) 
	VALUES(entradaNomeComida, entradaValorComida, entradaCodCategoria);
END//
DELIMITER ;

-- Copiando estrutura para procedure bd_restaurante.proc_insertCategoria
DROP PROCEDURE IF EXISTS `proc_insertCategoria`;
DELIMITER //
CREATE PROCEDURE `proc_insertCategoria`(
	IN `entradaCategoria` VARCHAR(500)
)
BEGIN
	
	INSERT INTO categoria(nomeCategoria) VALUES(entradaCategoria);
	SELECT * FROM categoria;
END//
DELIMITER ;

-- Copiando estrutura para tabela bd_restaurante.turnos
DROP TABLE IF EXISTS `turnos`;
CREATE TABLE IF NOT EXISTS `turnos` (
  `codTurnos` int NOT NULL AUTO_INCREMENT,
  `horarioInicio` time DEFAULT NULL,
  `horarioFinal` time DEFAULT NULL,
  PRIMARY KEY (`codTurnos`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela bd_restaurante.turnos: ~1 rows (aproximadamente)
INSERT INTO `turnos` (`codTurnos`, `horarioInicio`, `horarioFinal`) VALUES
	(1, '09:30:00', '21:30:00');

-- Copiando estrutura para tabela bd_restaurante.venda
DROP TABLE IF EXISTS `venda`;
CREATE TABLE IF NOT EXISTS `venda` (
  `codVenda` int NOT NULL AUTO_INCREMENT,
  `tipoPagamento` enum('Dinheiro','Cartao de Credito','Cartao de Debito') DEFAULT NULL,
  `funcionario_codFuncionario` int NOT NULL,
  `cliente_codCliente` int NOT NULL,
  `mesa_codMesa` int NOT NULL,
  PRIMARY KEY (`codVenda`,`funcionario_codFuncionario`,`cliente_codCliente`,`mesa_codMesa`),
  KEY `fk_venda_funcionario1_idx` (`funcionario_codFuncionario`),
  KEY `fk_venda_cliente1_idx` (`cliente_codCliente`),
  KEY `fk_venda_mesa1_idx` (`mesa_codMesa`),
  CONSTRAINT `fk_venda_funcionario1` FOREIGN KEY (`funcionario_codFuncionario`) REFERENCES `funcionario` (`codFuncionario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela bd_restaurante.venda: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela bd_restaurante.venda_por_cardapio
DROP TABLE IF EXISTS `venda_por_cardapio`;
CREATE TABLE IF NOT EXISTS `venda_por_cardapio` (
  `codvenda_por_cardapio` int NOT NULL AUTO_INCREMENT,
  `venda_codVenda` int NOT NULL,
  `cardapio_codCardapio` int NOT NULL,
  `quantidaVenda` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`codvenda_por_cardapio`,`cardapio_codCardapio`,`venda_codVenda`) USING BTREE,
  KEY `fk_venda_has_cardapio_cardapio1_idx` (`cardapio_codCardapio`),
  KEY `fk_venda_has_cardapio_venda1_idx` (`venda_codVenda`),
  CONSTRAINT `fk_venda_has_cardapio_venda1` FOREIGN KEY (`venda_codVenda`) REFERENCES `venda` (`codVenda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela bd_restaurante.venda_por_cardapio: ~0 rows (aproximadamente)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
