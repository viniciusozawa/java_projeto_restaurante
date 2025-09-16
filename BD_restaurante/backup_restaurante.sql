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
  KEY `fk_cardapio_categoria1_idx` (`categoria_codCategoria`),
  CONSTRAINT `fk_cardapio_categoria1` FOREIGN KEY (`categoria_codCategoria`) REFERENCES `categoria` (`codCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela bd_restaurante.cardapio: ~9 rows (aproximadamente)
INSERT INTO `cardapio` (`codCardapio`, `nomeComida`, `valorComida`, `descricaoComida`, `categoria_codCategoria`) VALUES
	(1, 'BIGTITES', 20.00, 'Grande molho cheddar', 1),
	(2, 'Cheeseburger Clássico', 18.90, 'Pão, hambúrguer artesanal, queijo prato, alface, tomate e molho especial', 1),
	(3, 'Cheesebacon', 22.50, 'Hambúrguer artesanal, queijo cheddar, bacon crocante e maionese da casa', 1),
	(4, 'Smash Duplo', 26.90, 'Dois hambúrgueres smash 100g, queijo cheddar, cebola caramelizada e pão brioche', 1),
	(5, 'Batata Frita Tradicional', 12.00, 'Porção média de batata frita crocante', 4),
	(6, 'Batata com Cheddar e Bacon', 18.00, 'Batata frita coberta com cheddar cremoso e bacon em cubos', 4),
	(7, 'Refrigerante Lata', 6.00, 'Coca-Cola, Guaraná ou Fanta (350ml)', 2),
	(8, 'Milkshake de Chocolate', 15.00, 'Milkshake cremoso com calda de chocolate', 3),
	(9, 'Brownie com Sorvete', 16.50, 'Brownie caseiro com bola de sorvete de creme e calda de chocolate', 3);

-- Copiando estrutura para tabela bd_restaurante.cargo
DROP TABLE IF EXISTS `cargo`;
CREATE TABLE IF NOT EXISTS `cargo` (
  `codCargo` int NOT NULL AUTO_INCREMENT,
  `nomeCargo` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`codCargo`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela bd_restaurante.cargo: ~4 rows (aproximadamente)
INSERT INTO `cargo` (`codCargo`, `nomeCargo`) VALUES
	(1, 'Cozinheiro'),
	(2, 'Garçom'),
	(3, 'Gerente'),
	(4, 'Atentende'),
	(5, 'ddd');

-- Copiando estrutura para tabela bd_restaurante.categoria
DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `codCategoria` int NOT NULL AUTO_INCREMENT,
  `nomeCategoria` varchar(150) NOT NULL,
  PRIMARY KEY (`codCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela bd_restaurante.categoria: ~4 rows (aproximadamente)
INSERT INTO `categoria` (`codCategoria`, `nomeCategoria`) VALUES
	(1, 'Hamburguer'),
	(2, 'Bebida'),
	(3, 'Sobremesa'),
	(4, 'Petiscos');

-- Copiando estrutura para tabela bd_restaurante.cliente
DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `codCliente` int NOT NULL AUTO_INCREMENT,
  `nomeCliente` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `senhaCliente` varchar(150) NOT NULL,
  `telefone` varchar(50) DEFAULT NULL,
  `dataCadastro` datetime NOT NULL DEFAULT (now()),
  PRIMARY KEY (`codCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela bd_restaurante.cliente: ~3 rows (aproximadamente)
INSERT INTO `cliente` (`codCliente`, `nomeCliente`, `senhaCliente`, `telefone`, `dataCadastro`) VALUES
	(1, 'YUJI', 'otaviano', '293821', '2025-09-13 19:15:50'),
	(2, 'Otavio', 'marmota', '(35)99999-9999', '2025-09-14 12:30:38'),
	(3, 'Pedro', 'luquinhas', '(35)91022-1202', '2025-09-14 12:31:02');

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
  KEY `fk_estoque_has_fornecedores_estoque1_idx` (`estoque_codEstoque`),
  CONSTRAINT `fk_estoque_has_fornecedores_estoque1` FOREIGN KEY (`estoque_codEstoque`) REFERENCES `estoque` (`codEstoque`),
  CONSTRAINT `fk_estoque_has_fornecedores_fornecedores1` FOREIGN KEY (`fornecedores_codFornecedor`) REFERENCES `fornecedores` (`codFornecedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela bd_restaurante.estoque_por_fonecedor: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela bd_restaurante.feedback
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE IF NOT EXISTS `feedback` (
  `codFeedback` int NOT NULL AUTO_INCREMENT,
  `nota` varchar(45) DEFAULT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  `cliente_codCliente` int NOT NULL,
  PRIMARY KEY (`codFeedback`,`cliente_codCliente`),
  KEY `fk_feedback_cliente1_idx` (`cliente_codCliente`),
  CONSTRAINT `fk_feedback_cliente1` FOREIGN KEY (`cliente_codCliente`) REFERENCES `cliente` (`codCliente`)
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

-- Copiando dados para a tabela bd_restaurante.fornecedores: ~0 rows (aproximadamente)
INSERT INTO `fornecedores` (`codFornecedor`, `nomeFornecedor`, `cnpj`, `endereco`, `bairro`, `cidade`, `estado`) VALUES
	(1, 's', 's', 's', 's', 's', 's');

-- Copiando estrutura para tabela bd_restaurante.funcionario
DROP TABLE IF EXISTS `funcionario`;
CREATE TABLE IF NOT EXISTS `funcionario` (
  `codFuncionario` int NOT NULL AUTO_INCREMENT,
  `nomeFuncionario` varchar(150) NOT NULL,
  `dataNascimento` date DEFAULT NULL,
  `senhaFuncionario` varchar(45) NOT NULL,
  `cpfFuncionario` varchar(45) DEFAULT NULL,
  `salarioFuncionario` decimal(6,2) NOT NULL,
  `turnos_codTurnos` int NOT NULL,
  `cargo_codCargo` int NOT NULL,
  `disponivel` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`codFuncionario`,`turnos_codTurnos`,`cargo_codCargo`) USING BTREE,
  KEY `fk_funcionario_turnos1_idx` (`turnos_codTurnos`),
  KEY `fk_funcionario_cargo1_idx` (`cargo_codCargo`),
  CONSTRAINT `fk_funcionario_cargo1` FOREIGN KEY (`cargo_codCargo`) REFERENCES `cargo` (`codCargo`),
  CONSTRAINT `fk_funcionario_turnos1` FOREIGN KEY (`turnos_codTurnos`) REFERENCES `turnos` (`codTurnos`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela bd_restaurante.funcionario: ~0 rows (aproximadamente)
INSERT INTO `funcionario` (`codFuncionario`, `nomeFuncionario`, `dataNascimento`, `senhaFuncionario`, `cpfFuncionario`, `salarioFuncionario`, `turnos_codTurnos`, `cargo_codCargo`, `disponivel`) VALUES
	(2, 'yamato', '2025-09-06', 'dksdks', '210290192', 1023.02, 1, 2, 1),
	(3, 'd', '2025-09-13', 'd', 'dd', 2.00, 1, 1, 1);

-- Copiando estrutura para tabela bd_restaurante.mesa
DROP TABLE IF EXISTS `mesa`;
CREATE TABLE IF NOT EXISTS `mesa` (
  `codMesa` int NOT NULL AUTO_INCREMENT,
  `numeroMesa` int NOT NULL,
  `localMesa` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`codMesa`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela bd_restaurante.mesa: ~5 rows (aproximadamente)
INSERT INTO `mesa` (`codMesa`, `numeroMesa`, `localMesa`) VALUES
	(1, 10, 'Jogar'),
	(2, 5, 'f'),
	(3, 2, 'Perto da Cozinha'),
	(4, 1, 'Perto entrada'),
	(5, 4, 'Bancada');

-- Copiando estrutura para tabela bd_restaurante.pagamento
DROP TABLE IF EXISTS `pagamento`;
CREATE TABLE IF NOT EXISTS `pagamento` (
  `codPagamento` int NOT NULL AUTO_INCREMENT,
  `formaPagamento` varchar(150) NOT NULL,
  `valorPago` decimal(10,2) NOT NULL,
  `dataPagamento` date NOT NULL,
  `statusPagamento` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`codPagamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela bd_restaurante.pagamento: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela bd_restaurante.pedido
DROP TABLE IF EXISTS `pedido`;
CREATE TABLE IF NOT EXISTS `pedido` (
  `codpedido` int NOT NULL AUTO_INCREMENT,
  `cliente_codCliente` int NOT NULL,
  `mesa_codMesa` int NOT NULL,
  `funcionario_codFuncionario` int NOT NULL,
  `datahoraPedido` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`codpedido`,`cliente_codCliente`,`mesa_codMesa`,`funcionario_codFuncionario`),
  KEY `fk_pedido_cliente1_idx` (`cliente_codCliente`),
  KEY `fk_pedido_mesa1_idx` (`mesa_codMesa`),
  KEY `fk_pedido_funcionario1_idx` (`funcionario_codFuncionario`),
  CONSTRAINT `fk_pedido_cliente1` FOREIGN KEY (`cliente_codCliente`) REFERENCES `cliente` (`codCliente`),
  CONSTRAINT `fk_pedido_funcionario1` FOREIGN KEY (`funcionario_codFuncionario`) REFERENCES `funcionario` (`codFuncionario`),
  CONSTRAINT `fk_pedido_mesa1` FOREIGN KEY (`mesa_codMesa`) REFERENCES `mesa` (`codMesa`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela bd_restaurante.pedido: ~0 rows (aproximadamente)
INSERT INTO `pedido` (`codpedido`, `cliente_codCliente`, `mesa_codMesa`, `funcionario_codFuncionario`, `datahoraPedido`) VALUES
	(1, 1, 1, 2, '2025-09-14 11:52:40'),
	(2, 3, 3, 2, '2025-09-14 12:34:09'),
	(3, 2, 5, 2, '2025-09-14 12:34:26');

-- Copiando estrutura para tabela bd_restaurante.pedido_por_cardapio
DROP TABLE IF EXISTS `pedido_por_cardapio`;
CREATE TABLE IF NOT EXISTS `pedido_por_cardapio` (
  `codpedido_por_cadapio` int NOT NULL AUTO_INCREMENT,
  `pedido_idpedido` int NOT NULL,
  `cardapio_codCardapio` int NOT NULL,
  `quantidade` int NOT NULL,
  PRIMARY KEY (`codpedido_por_cadapio`,`pedido_idpedido`,`cardapio_codCardapio`),
  KEY `fk_pedido_has_cardapio_cardapio1_idx` (`cardapio_codCardapio`),
  KEY `fk_pedido_has_cardapio_pedido1_idx` (`pedido_idpedido`),
  CONSTRAINT `fk_pedido_has_cardapio_cardapio1` FOREIGN KEY (`cardapio_codCardapio`) REFERENCES `cardapio` (`codCardapio`),
  CONSTRAINT `fk_pedido_has_cardapio_pedido1` FOREIGN KEY (`pedido_idpedido`) REFERENCES `pedido` (`codpedido`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela bd_restaurante.pedido_por_cardapio: ~6 rows (aproximadamente)
INSERT INTO `pedido_por_cardapio` (`codpedido_por_cadapio`, `pedido_idpedido`, `cardapio_codCardapio`, `quantidade`) VALUES
	(1, 1, 1, 2),
	(2, 1, 1, 1),
	(3, 2, 8, 1),
	(4, 3, 5, 1),
	(5, 2, 1, 2),
	(6, 2, 5, 2);

-- Copiando estrutura para procedure bd_restaurante.proc_alterarCardapio
DROP PROCEDURE IF EXISTS `proc_alterarCardapio`;
DELIMITER //
CREATE PROCEDURE `proc_alterarCardapio`(
	IN `entradaCodCardapio` INT,
	IN `entradaNome` VARCHAR(150),
	IN `entradaValor` DECIMAL(6,2),
	IN `entradaDescricao` VARCHAR(500),
	IN `entradaCategoria` INT
)
BEGIN
   

    
    SELECT COUNT(*) INTO @cardapioExistente
    FROM cardapio
    WHERE codCardapio = entradaCodCardapio;

    IF (@cardapioExistente) THEN
        
        IF (entradaNome IS NOT NULL) THEN
            UPDATE cardapio
            SET nomeComida = entradaNome
            WHERE codCardapio = entradaCodCardapio;
        END IF;

        IF (entradaValor IS NOT NULL) THEN
            UPDATE cardapio
            SET valorComida = entradaValor
            WHERE codCardapio = entradaCodCardapio;
        END IF;

        IF (entradaDescricao IS NOT NULL) THEN
            UPDATE cardapio
            SET descricaoComida = entradaDescricao
            WHERE codCardapio = entradaCodCardapio;
        END IF;

        IF (entradaCategoria IS NOT NULL) THEN
            UPDATE cardapio
            SET categoria_codCategoria = entradaCategoria
            WHERE codCardapio = entradaCodCardapio;
        END IF;

        SELECT 'Cardápio atualizado com sucesso!' AS Resultado;
    ELSE
        SELECT 'Item não encontrado no cardápio!' AS Erro;
    END IF;
END//
DELIMITER ;

-- Copiando estrutura para procedure bd_restaurante.proc_alterarCategoria
DROP PROCEDURE IF EXISTS `proc_alterarCategoria`;
DELIMITER //
CREATE PROCEDURE `proc_alterarCategoria`(
	IN `entradaCodCategoria` INT,
	IN `entradaNomeCategoria` VARCHAR(150)
)
BEGIN
    

    
    SELECT COUNT(*) INTO @categoriaExistente
    FROM categoria
    WHERE codCategoria = entradaCodCategoria;

    IF (@categoriaExistente) THEN
        UPDATE categoria
        SET nomeCategoria = entradaNomeCategoria
        WHERE codCategoria = entradaCodCategoria;

        SELECT 'Categoria atualizada com sucesso!' AS Resultado;
    ELSE
        SELECT 'Categoria não encontrada!' AS Erro;
    END IF;
END//
DELIMITER ;

-- Copiando estrutura para procedure bd_restaurante.proc_alterarClienteOpcoes
DROP PROCEDURE IF EXISTS `proc_alterarClienteOpcoes`;
DELIMITER //
CREATE PROCEDURE `proc_alterarClienteOpcoes`(
	IN `entradaCodCliente` INT,
	IN `entradaNome` VARCHAR(150),
	IN `entradaSenha` VARCHAR(150),
	IN `entradaTelefone` VARCHAR(50)
)
BEGIN
    
    SELECT COUNT(*) INTO @clienteExistente
    FROM cliente
    WHERE codCliente = entradaCodCliente;


    IF(@clienteExistente)THEN

        IF (entradaNome IS NOT NULL) THEN
            UPDATE cliente
            SET nomeCliente = entradaNome
            WHERE codCliente = entradaCodCliente;
        END IF;

        
        IF (entradaSenha IS NOT NULL) THEN
            UPDATE cliente
            SET senhaCliente = entradaSenha
            WHERE codCliente = entradaCodCliente;
        END IF;

        
        IF (entradaTelefone IS NOT NULL) THEN
            UPDATE cliente
            SET telefone = entradaTelefone
            WHERE codCliente = entradaCodCliente;
        END IF;

        
        SELECT "Cliente atualizado com sucesso!" AS Resultado;
    ELSE
        
        SELECT "Cliente não encontrado!" AS Erro;
    END IF;

END//
DELIMITER ;

-- Copiando estrutura para procedure bd_restaurante.proc_alterarFornecedor
DROP PROCEDURE IF EXISTS `proc_alterarFornecedor`;
DELIMITER //
CREATE PROCEDURE `proc_alterarFornecedor`(
    IN `entradaCodFornecedor` INT,
    IN `entradaNomeFornecedor` VARCHAR(150),
    IN `entradaCnpj` VARCHAR(45),
    IN `entradaEndereco` VARCHAR(150),
    IN `entradaBairro` VARCHAR(45),
    IN `entradaCidade` VARCHAR(45),
    IN `entradaEstado` VARCHAR(2)
)
BEGIN
    SELECT COUNT(*) INTO @fornecedorExistente
    FROM fornecedores
    WHERE codFornecedor = entradaCodFornecedor;

    IF(@fornecedorExistente) THEN

        IF (entradaNomeFornecedor IS NOT NULL) THEN
            UPDATE fornecedores
            SET nomeFornecedor = entradaNomeFornecedor
            WHERE codFornecedor = entradaCodFornecedor;
        END IF;

        IF (entradaCnpj IS NOT NULL) THEN
            UPDATE fornecedores
            SET cnpj = entradaCnpj
            WHERE codFornecedor = entradaCodFornecedor;
        END IF;

        IF (entradaEndereco IS NOT NULL) THEN
            UPDATE fornecedores
            SET endereco = entradaEndereco
            WHERE codFornecedor = entradaCodFornecedor;
        END IF;

        IF (entradaBairro IS NOT NULL) THEN
            UPDATE fornecedores
            SET bairro = entradaBairro
            WHERE codFornecedor = entradaCodFornecedor;
        END IF;

        IF (entradaCidade IS NOT NULL) THEN
            UPDATE fornecedores
            SET cidade = entradaCidade
            WHERE codFornecedor = entradaCodFornecedor;
        END IF;

        IF (entradaEstado IS NOT NULL) THEN
            UPDATE fornecedores
            SET estado = entradaEstado
            WHERE codFornecedor = entradaCodFornecedor;
        END IF;

        SELECT "Fornecedor atualizado com sucesso!" AS Resultado;
    ELSE
        SELECT "Fornecedor não encontrado!" AS Erro;
    END IF;

END//
DELIMITER ;

-- Copiando estrutura para procedure bd_restaurante.proc_alterarFuncionario
DROP PROCEDURE IF EXISTS `proc_alterarFuncionario`;
DELIMITER //
CREATE PROCEDURE `proc_alterarFuncionario`(
	IN `entradaCodFuncionario` INT,
	IN `entradaNomeFuncionario` VARCHAR(150),
	IN `entradaDataFuncionario` DATE,
	IN `entradaSenhaFuncionario` VARCHAR(45),
	IN `entradaCpfFuncionario` VARCHAR(45),
	IN `entradaSalarioFuncionario` DECIMAL(6,2),
	IN `entradaCodCargo` INT
)
BEGIN
    
    SELECT COUNT(*) INTO @funcionarioExistente
    FROM funcionario
    WHERE codFuncionario = entradaCodFuncionario;
	 SELECT COUNT(*) INTO @cargoExistente
    FROM cargo
    WHERE codCargo = entradaCodCargo;

    IF(@funcionarioExistente)THEN	
        IF (entradaNomeFuncionario IS NOT NULL) THEN
            UPDATE funcionario
            SET nomeFuncionario = entradaNomeFuncionario
            WHERE codFuncionario = entradaCodFuncionario;
        END IF;

        IF (entradaDataFuncionario IS NOT NULL) THEN
            UPDATE funcionario
            SET dataFuncionario = entradaDataFuncionario
            WHERE codFuncionario = entradaCodFuncionario;
        END IF;
        
        IF (entradaSenhaFuncionario IS NOT NULL) THEN
            UPDATE funcionario
            SET senhaFuncionario = entradaSenhaFuncionario
            WHERE codFuncionario = entradaCodFuncionario;
        END IF;
        
        IF (entradaCpfFuncionario IS NOT NULL) THEN
            UPDATE funcionario
            SET senhaFuncionario = entradaCpfFuncionario
            WHERE codFuncionario = entradaCodFuncionario;
        END IF;
        
        IF (entradaSalarioFuncionario IS NOT NULL) THEN
            UPDATE funcionario
            SET salarioFuncionario = entradaSalarioFuncionario
            WHERE codFuncionario = entradaCodFuncionario;
        END IF;
			
        IF (@cargoExistente) THEN
            UPDATE funcionario
            SET cargo_codCargo = entradaCodCargo
            WHERE codFuncionario = entradaCodFuncionario;
         else
         	SELECT "Codígo Cargo errado ou não existe" AS Erro;
        END IF;
        
        SELECT "Funcionario atualizado com sucesso!" AS Resultado;
    ELSE
        
        SELECT "Funcionario não encontrado!" AS Erro;
    END IF;

END//
DELIMITER ;

-- Copiando estrutura para procedure bd_restaurante.proc_alterarMesa
DROP PROCEDURE IF EXISTS `proc_alterarMesa`;
DELIMITER //
CREATE PROCEDURE `proc_alterarMesa`(
    IN `entradaCodMesa` INT,
    IN `entradaNumeroMesa` INT,
    IN `entradaLocalMesa` VARCHAR(150)
)
BEGIN
    
    SELECT COUNT(*) INTO @mesaExistente
    FROM mesa
    WHERE codMesa = entradaCodMesa;

    IF (@mesaExistente) THEN
    
        IF (entradaNumeroMesa IS NOT NULL) then
            UPDATE mesa
            SET numeroMesa = entradaNumeroMesa
            WHERE codMesa = entradaCodMesa;
        END IF;

        IF (entradaLocalMesa IS NOT NULL) then
            UPDATE mesa
            SET localMesa = entradaLocalMesa
            WHERE codMesa = entradaCodMesa;
        END IF;

        SELECT "Mesa atualizada com sucesso!" AS Resultado;
    ELSE
        SELECT "Mesa não encontrada!" AS Erro;
    END IF;

END//
DELIMITER ;

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
    IF (@contador) THEN
        UPDATE turnos SET horarioInicio = entradaHorarioInicial, 
        horarioFinal = entradaHorarioFinal WHERE codTurnos = entradaCodTurno;  
    ELSE
        SELECT "Não foi encontrado o codigo" AS Erro;
    END IF;
END//
DELIMITER ;

-- Copiando estrutura para procedure bd_restaurante.proc_apagarCargo
DROP PROCEDURE IF EXISTS `proc_apagarCargo`;
DELIMITER //
CREATE PROCEDURE `proc_apagarCargo`(
	IN `entradaCodCargo` INT
)
BEGIN
	SELECT COUNT(*) INTO @existe
   FROM cargo
   WHERE codCargo = entradaCodCargo;

   IF (@existe) THEN
      DELETE FROM cargo
      WHERE codCargo = entradaCodCargo;
      SELECT 'Deu certo' AS mensagem;
   ELSE
      SELECT 'Código não encontrado.' AS mensagem;
   END IF;
END//
DELIMITER ;

-- Copiando estrutura para procedure bd_restaurante.proc_apagarCategoria
DROP PROCEDURE IF EXISTS `proc_apagarCategoria`;
DELIMITER //
CREATE PROCEDURE `proc_apagarCategoria`(
	IN `entradaCodCategoria` INT
)
BEGIN
	SELECT COUNT(*) INTO @existe
   FROM categoria
   WHERE codCategoria = entradaCodCategoria;

   IF (@existe) THEN
      DELETE FROM categoria
      WHERE codCategoria = entradaCodCategoria;
      SELECT 'Deu certo' AS mensagem;
   ELSE
      SELECT 'Código não encontrado.' AS mensagem;
   END IF;
END//
DELIMITER ;

-- Copiando estrutura para procedure bd_restaurante.proc_apagarCliente
DROP PROCEDURE IF EXISTS `proc_apagarCliente`;
DELIMITER //
CREATE PROCEDURE `proc_apagarCliente`(
	IN `entradaCodCliente` INT
)
BEGIN
	SELECT COUNT(*) INTO @existe
   FROM cliente
   WHERE codCliente= entradaCodCliente;

   IF (@existe) THEN
      DELETE FROM cliente
      WHERE codCliente = entradaCodCliente;
      SELECT 'Deu certo' AS mensagem;
   ELSE
      SELECT 'Código não encontrado.' AS mensagem;
   END IF;
END//
DELIMITER ;

-- Copiando estrutura para procedure bd_restaurante.proc_apagarFornecedores
DROP PROCEDURE IF EXISTS `proc_apagarFornecedores`;
DELIMITER //
CREATE PROCEDURE `proc_apagarFornecedores`(
	IN `entradaCodFornecedores` INT
)
BEGIN
   SELECT COUNT(*) INTO @existe
   FROM fornecedores
   WHERE codFornecedor = entradaCodFornecedores;

   IF (@existe) THEN
      DELETE FROM fornecedores
      WHERE codFornecedor = entradaCodFornecedores;
      SELECT 'Deu certo' AS mensagem;
   ELSE
      SELECT 'Código não encontrado.' AS mensagem;
   END IF;
END//
DELIMITER ;

-- Copiando estrutura para procedure bd_restaurante.proc_apagarFuncionario
DROP PROCEDURE IF EXISTS `proc_apagarFuncionario`;
DELIMITER //
CREATE PROCEDURE `proc_apagarFuncionario`(
	IN `entradaCodFuncionario` INT
)
BEGIN


    
   SELECT COUNT(*) INTO @existe
   FROM funcionario
   WHERE codFuncionario = entradaCodFuncionario;

   IF (@existe > 0) THEN
      DELETE FROM funcionario
      WHERE codFuncionario = entradaCodFuncionario;
      SELECT 'Deu certo' AS mensagem;
   ELSE
      SELECT 'Código não encontrado.' AS mensagem;
   END IF;

END//
DELIMITER ;

-- Copiando estrutura para procedure bd_restaurante.proc_apagarMesa
DROP PROCEDURE IF EXISTS `proc_apagarMesa`;
DELIMITER //
CREATE PROCEDURE `proc_apagarMesa`(
	IN `entradaCodMesa` INT
)
BEGIN
   SELECT COUNT(*) INTO @existe
   FROM mesa
   WHERE codMesa = entradaCodMesa;

   IF (@existe > 0) THEN
      DELETE FROM mesa
      WHERE codMesa = entradaCodMesa;
      SELECT 'Deu certo' AS mensagem;
   ELSE
      SELECT 'Código não encontrado.' AS mensagem;
   END IF;
END//
DELIMITER ;

-- Copiando estrutura para procedure bd_restaurante.proc_apagarTurnos
DROP PROCEDURE IF EXISTS `proc_apagarTurnos`;
DELIMITER //
CREATE PROCEDURE `proc_apagarTurnos`(
	IN `entradaCodTurnos` INT
)
BEGIN
	  SELECT COUNT(*) INTO @existe
   FROM turnos
   WHERE codTurnos = entradaCodTurnos;

   IF (@existe > 0) THEN
      DELETE FROM turnos
      WHERE codTurnos = entradaCodTurnos;
      SELECT 'Deu certo' AS mensagem;
   ELSE
      SELECT 'Código não encontrado.' AS mensagem;
   END IF;
END//
DELIMITER ;

-- Copiando estrutura para procedure bd_restaurante.proc_insereCardapio
DROP PROCEDURE IF EXISTS `proc_insereCardapio`;
DELIMITER //
CREATE PROCEDURE `proc_insereCardapio`(
	IN `entradaNomeComida` VARCHAR(150),
	IN `entradaValorComida` DECIMAL(6,2),
	IN `entradaDescricaoComida` VARCHAR(500),
	IN `entradaCodCategoria` INT
)
BEGIN
    INSERT INTO cardapio (nomeComida, valorComida, descricaoComida, categoria_codCategoria)
    VALUES(entradaNomeComida, entradaValorComida, entradaDescricaoComida, entradaCodCategoria);

    SELECT 'Novo item do cardápio inserido com sucesso!' AS Resultado;
    
END//
DELIMITER ;

-- Copiando estrutura para procedure bd_restaurante.proc_insereCategoria
DROP PROCEDURE IF EXISTS `proc_insereCategoria`;
DELIMITER //
CREATE PROCEDURE `proc_insereCategoria`(
	IN `entradaCategoria` VARCHAR(500)
)
BEGIN
    INSERT INTO categoria(nomeCategoria) VALUES(entradaCategoria);
    SELECT * FROM categoria;
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
    INSERT INTO cliente(nomeCliente, senhaCliente)
    VALUES(entradaNome, entradaSenha);
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
    IF (@contador) THEN
      	INSERT INTO funcionario(nomeFuncionario, dataNascimento, senhaFuncionario, cpfFuncionario, salarioFuncionario,
        	cargoFuncionario, turnos_codTurnos, disponivel) 
        	VALUES(entradaNome, entradaNascimento, entradaSenha, entradaCpf, entradaSalario, entradaCargo, entradacodTurno,1);
    ELSE
        SELECT "Turno não cadastrado" AS Erro;
    END IF;
END//
DELIMITER ;

-- Copiando estrutura para procedure bd_restaurante.proc_insereMesa
DROP PROCEDURE IF EXISTS `proc_insereMesa`;
DELIMITER //
CREATE PROCEDURE `proc_insereMesa`(
	IN `entradaNumeroMesa` INT,
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

-- Copiando estrutura para procedure bd_restaurante.proc_relatorioClientes
DROP PROCEDURE IF EXISTS `proc_relatorioClientes`;
DELIMITER //
CREATE PROCEDURE `proc_relatorioClientes`()
BEGIN

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
	(1, '09:20:00', '20:30:00');

-- Copiando estrutura para tabela bd_restaurante.venda
DROP TABLE IF EXISTS `venda`;
CREATE TABLE IF NOT EXISTS `venda` (
  `codVenda` int NOT NULL AUTO_INCREMENT,
  `pedido_idpedido` int NOT NULL,
  `pedido_cliente_codCliente` int NOT NULL,
  `pedido_mesa_codMesa` int NOT NULL,
  `pagamento_codPagamento` int NOT NULL,
  PRIMARY KEY (`codVenda`,`pedido_idpedido`,`pedido_cliente_codCliente`,`pedido_mesa_codMesa`,`pagamento_codPagamento`),
  KEY `fk_venda_pedido1_idx` (`pedido_idpedido`,`pedido_cliente_codCliente`,`pedido_mesa_codMesa`),
  KEY `fk_venda_pagamento1_idx` (`pagamento_codPagamento`),
  CONSTRAINT `fk_venda_pagamento1` FOREIGN KEY (`pagamento_codPagamento`) REFERENCES `pagamento` (`codPagamento`),
  CONSTRAINT `fk_venda_pedido1` FOREIGN KEY (`pedido_idpedido`, `pedido_cliente_codCliente`, `pedido_mesa_codMesa`) REFERENCES `pedido` (`codpedido`, `cliente_codCliente`, `mesa_codMesa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela bd_restaurante.venda: ~0 rows (aproximadamente)

-- Copiando estrutura para view bd_restaurante.view_pedidoscardapio
DROP VIEW IF EXISTS `view_pedidoscardapio`;
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `view_pedidoscardapio` (
	`nomeCliente` VARCHAR(1) NOT NULL COLLATE 'utf8mb3_general_ci',
	`codpedido` INT NOT NULL,
	`nomeComida` VARCHAR(1) NOT NULL COLLATE 'utf8mb3_general_ci',
	`valorComida` DECIMAL(6,2) NOT NULL,
	`quantidade` INT NOT NULL,
	`totalItem` DECIMAL(16,2) NOT NULL
) ENGINE=MyISAM;

-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `view_pedidoscardapio`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `view_pedidoscardapio` AS select `cl`.`nomeCliente` AS `nomeCliente`,`p`.`codpedido` AS `codpedido`,`c`.`nomeComida` AS `nomeComida`,`c`.`valorComida` AS `valorComida`,`pc`.`quantidade` AS `quantidade`,(`c`.`valorComida` * `pc`.`quantidade`) AS `totalItem` from (((`pedido` `p` join `pedido_por_cardapio` `pc` on((`p`.`codpedido` = `pc`.`pedido_idpedido`))) join `cardapio` `c` on((`pc`.`cardapio_codCardapio` = `c`.`codCardapio`))) join `cliente` `cl` on((`p`.`cliente_codCliente` = `cl`.`codCliente`)))
;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
