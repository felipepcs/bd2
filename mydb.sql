-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 08-Set-2021 às 09:38
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
-- Banco de dados: `mydb`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `contem`
--

DROP TABLE IF EXISTS `contem`;
CREATE TABLE IF NOT EXISTS `contem` (
  `emprestimo_id` int(11) NOT NULL,
  `livro_id` int(11) NOT NULL,
  PRIMARY KEY (`emprestimo_id`,`livro_id`),
  KEY `FK_LIVRO` (`livro_id`),
  KEY `FK_EMPRESTIMO` (`emprestimo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `emprestimo`
--

DROP TABLE IF EXISTS `emprestimo`;
CREATE TABLE IF NOT EXISTS `emprestimo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_emprestimo` datetime NOT NULL,
  `data_devolucao` datetime DEFAULT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`usuario_id`),
  KEY `fk_emprestimo_usuario1_idx` (`usuario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `emprestimo`
--

INSERT INTO `emprestimo` (`id`, `data_emprestimo`, `data_devolucao`, `usuario_id`) VALUES
(1, '2020-04-08 10:00:00', '2020-04-18 10:00:00', 1),
(4, '2021-02-25 08:25:00', '2021-03-05 08:25:00', 6),
(5, '2021-06-01 19:00:00', '2021-06-11 19:00:00', 2),
(6, '2020-09-14 11:00:00', '2020-09-25 11:00:00', 5),
(7, '2021-06-12 14:00:00', '2021-06-02 14:00:00', 9),
(8, '2021-01-26 11:18:00', '2021-02-04 11:18:00', 10);

-- --------------------------------------------------------

--
-- Estrutura da tabela `livro`
--

DROP TABLE IF EXISTS `livro`;
CREATE TABLE IF NOT EXISTS `livro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) NOT NULL,
  `autores` text,
  `secao_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`secao_id`),
  KEY `fk_livro_secao_idx` (`secao_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `livro`
--

INSERT INTO `livro` (`id`, `titulo`, `autores`, `secao_id`) VALUES
(1, 'O milagre da manha', 'Hal Erold e Marcelo Schild', 2),
(2, 'A sutil arte de ligar o f*da-se', 'Mark Manson', 2),
(3, 'A  garota do Lago', 'Charlie Donlea', 1),
(4, 'O poder oculto', 'Pe. Reginaldo Manzotti', 7),
(5, 'O livro de Eros ', 'Alfredo Guimaraes Garcia ', 8),
(6, 'Uma breve historia do tempo', 'Stephen Hawking', 6),
(7, 'Batman: The Killing Joke ', 'Allan Moore', 3);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `livro_secao`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `livro_secao`;
CREATE TABLE IF NOT EXISTS `livro_secao` (
`livro_id` int(11)
,`titulo` varchar(45)
,`secao` varchar(45)
);

-- --------------------------------------------------------

--
-- Estrutura da tabela `secao`
--

DROP TABLE IF EXISTS `secao`;
CREATE TABLE IF NOT EXISTS `secao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `secao`
--

INSERT INTO `secao` (`id`, `nome`) VALUES
(1, 'Literatura de ficção'),
(2, 'Autoajuda'),
(3, 'História em quadrinhos '),
(6, 'Livros científicos '),
(7, 'Religião'),
(8, 'Literatura erótica');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQ_EMAIL` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id`, `email`, `nome`) VALUES
(1, 'felipeleonardo@gmail.com', 'Felipe Leonardo '),
(2, 'ingrid@gmail.com', 'Ingrid '),
(5, 'isabella@gmail.com', 'Isabella'),
(6, 'heitorbitencourt@gmail.com', 'Heitor Bitencourt'),
(9, 'laurabitencourt@gmail.com', 'Laura Bitencourt'),
(10, 'pietrabitencourt@gmail.com', 'Pietra Bitencourt'),
(11, 'luarabitencourt@gmail.com', 'Luara Bitencourt'),
(12, 'bolsonaro@gmail.com', 'Bolsonaro'),
(13, 'lula@gmail.com', 'Lula'),
(14, 'dilma@gmail.com', 'Dilma'),
(15, 'fernandoh@gmail.com', 'Fernando'),
(16, 'cirog@gmail.com', 'Ciro'),
(17, 'marinass@gmail.com', 'Marina'),
(18, 'atletico@gmail.com', 'Atlético'),
(19, 'cruzeiro@gmail.com', 'Cruzeiro');

-- --------------------------------------------------------

--
-- Estrutura para vista `livro_secao`
--
DROP TABLE IF EXISTS `livro_secao`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `livro_secao`  AS  select `l`.`id` AS `livro_id`,`l`.`titulo` AS `titulo`,`s`.`nome` AS `secao` from (`livro` `l` join `secao` `s` on((`s`.`id` = `l`.`secao_id`))) ;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `contem`
--
ALTER TABLE `contem`
  ADD CONSTRAINT `fk_emprestimo_has_livro_emprestimo1` FOREIGN KEY (`emprestimo_id`) REFERENCES `emprestimo` (`id`),
  ADD CONSTRAINT `fk_emprestimo_has_livro_livro1` FOREIGN KEY (`livro_id`) REFERENCES `livro` (`id`);

--
-- Limitadores para a tabela `emprestimo`
--
ALTER TABLE `emprestimo`
  ADD CONSTRAINT `fk_emprestimo_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

--
-- Limitadores para a tabela `livro`
--
ALTER TABLE `livro`
  ADD CONSTRAINT `fk_livro_secao` FOREIGN KEY (`secao_id`) REFERENCES `secao` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
