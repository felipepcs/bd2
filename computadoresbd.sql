-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 08-Set-2021 às 10:01
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
-- Banco de dados: `computadoresbd`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_computadores`
--

DROP TABLE IF EXISTS `tbl_computadores`;
CREATE TABLE IF NOT EXISTS `tbl_computadores` (
  `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `memoria` int(4) NOT NULL,
  `disco_rigido` varchar(45) NOT NULL,
  `processador` varchar(45) NOT NULL,
  `marca` varchar(45) NOT NULL,
  `placa_mae` varchar(45) NOT NULL,
  `ano` int(4) NOT NULL,
  `status` varchar(45) NOT NULL,
  `defeito` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `tbl_computadores`
--

INSERT INTO `tbl_computadores` (`id`, `nome`, `memoria`, `disco_rigido`, `processador`, `marca`, `placa_mae`, `ano`, `status`, `defeito`) VALUES
(1, 'Computador 1SAM', 8, 'DC HDPC1SAM', 'Processador PC1SAM', 'Samsung', 'Placa mãe PC1SAM', 2016, 'Funcionando', 'Não há defeito'),
(2, 'Computador PC2', 4, 'DC HDPC2DLL', 'Processador PC2', 'DELL', 'Placa Mãe DELL', 2002, 'Com defeito', 'Cabos conectados incorretamente'),
(3, 'Computador PC3', 64, 'DR HDLGPC3', 'Processador gamer PC3', 'LG', 'Placa mãe do PC3', 2018, 'Funcionando', 'Não há defeito'),
(4, 'Computador PC4', 32, 'DC HDPC4APL', 'Processador PC4', 'Apple', 'Placa mãe PC4', 2020, 'Com defeito', 'A maçã está mordida'),
(5, 'Computador PC5', 16, 'DR HDPC5PHLP', 'Processador PC5', 'Philco', 'Placa mãe PC05', 2014, 'Funcionando', 'Não há defeito'),
(6, 'Computador PC6', 254, 'DR HDPC6SN', 'Processador PC6', 'Sony', 'Placa mãe PC6', 2022, 'Com defeito', 'Defeito no monitor'),
(7, 'Computador PC7', 4, 'DR HDPC7EPS', 'Processador PC7', 'EPSON', 'Placa EPSPC7', 2002, 'Com defeito', 'Placa de vídeo queimada');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
