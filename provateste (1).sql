-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 08-Set-2021 às 09:32
-- Versão do servidor: 8.0.18
-- versão do PHP: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `provateste`
--

DELIMITER $$
--
-- Procedimentos
--
DROP PROCEDURE IF EXISTS `prc_teste`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `prc_teste` (IN `id_do_ator` INT)  NO SQL
SELECT * FROM `ator` WHERE id = id_do_ator$$

DROP PROCEDURE IF EXISTS `prc_tststs4`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `prc_tststs4` ()  NO SQL
SELECT * FROM `ator` ORDER BY ator.id ASC$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ator`
--

DROP TABLE IF EXISTS `ator`;
CREATE TABLE IF NOT EXISTS `ator` (
  `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `data_ultima_alteracao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `ator`
--

INSERT INTO `ator` (`id`, `nome`, `email`) VALUES
(1, 'Felipe Leonardo', 'felipeleonardopcs@gmail.com'),
(2, 'Edsandra', 'edsandra@gmail.com.br'),
(3, 'Anselmo', 'anselmo@gmail.com.br'),
(4, 'Ingrid', 'ingridl@gmail.com.br'),
(5, 'Isabella', 'isabellaa@gmail.com.br'),
(6, 'Heitor Bitencourt', 'heitorbitencourt@gmail.com.br'),
(7, 'Pietra ', 'pietra@gmail.com.br'),
(8, 'Laura', 'laura@gmail.com.br'),
(9, 'Letícia ', 'leticia@gmail.com.br'),
(10, 'Nikolas', 'nikolas@gmail.com.br'),
(11, 'Emanuelle', 'emanuelle@gmail.com.br'),
(12, 'Arthur', 'arturs@gmail.com.br');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
