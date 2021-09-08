-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 08-Set-2021 às 09:58
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
-- Banco de dados: `cursos_bd`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_curso`
--

DROP TABLE IF EXISTS `tbl_curso`;
CREATE TABLE IF NOT EXISTS `tbl_curso` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `nomeCurso` varchar(40) NOT NULL,
  `conteudo` varchar(200) NOT NULL,
  `valorMensalidade` double NOT NULL,
  `cargaHoraria` int(11) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `tbl_curso`
--

INSERT INTO `tbl_curso` (`codigo`, `nomeCurso`, `conteudo`, `valorMensalidade`, `cargaHoraria`) VALUES
(1, 'Curso Técnico CTBDN1', 'Matéria do Curso Técnico CTBDN1', 850, 90),
(2, 'Curso Técnico CTBDN02', 'Matéria Curso Técnico CTBDN02', 1235, 210),
(3, 'Curso Técnico CTBDN03', 'Matéria do Curso Técnico CTBDN03', 3000, 540),
(4, 'Curso Técnico CTBDN4', 'Computadores, logística, programação', 1800, 230),
(5, 'Curso Técnico CTBDN05', 'Matéria dos Cursos Técnicos: CTBDN1 e CTBDN05', 685, 82),
(6, 'Curso Técnico CTBDN06', 'Redes e manutenção', 460, 30),
(7, 'Curso Técnico CTBDN077', 'Instalação e análise de software', 2150, 540);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_professor`
--

DROP TABLE IF EXISTS `tbl_professor`;
CREATE TABLE IF NOT EXISTS `tbl_professor` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(40) NOT NULL,
  `valorHoraAula` double NOT NULL,
  `telefone` varchar(20) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `tbl_professor`
--

INSERT INTO `tbl_professor` (`codigo`, `nome`, `valorHoraAula`, `telefone`) VALUES
(1, 'Thiago Gomes', 35, '0909-5252'),
(2, 'Alexandre Pires', 65, '0800-0800'),
(3, 'Guilherme Santiago', 40, '5632-4578'),
(4, 'David Terans', 80, '7879-4546'),
(5, 'Daniel Nepomucenno', 100, '3451-3451'),
(6, 'Sérgio Berranteiro', 250, '4549-8888'),
(7, 'Michael Criggor ', 90, '2015-4515');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_turma`
--

DROP TABLE IF EXISTS `tbl_turma`;
CREATE TABLE IF NOT EXISTS `tbl_turma` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `idCurso` int(11) NOT NULL,
  `dataInicio` date NOT NULL,
  `dataTermino` date NOT NULL,
  `horaInicio` varchar(5) NOT NULL,
  `horaTermino` varchar(5) NOT NULL,
  `idProfessor` int(11) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `idCurso` (`idCurso`),
  KEY `idProfessor` (`idProfessor`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `tbl_turma`
--

INSERT INTO `tbl_turma` (`codigo`, `idCurso`, `dataInicio`, `dataTermino`, `horaInicio`, `horaTermino`, `idProfessor`) VALUES
(1, 2, '2021-09-15', '2021-11-18', '9:00', '12:00', 1),
(2, 5, '2021-05-25', '2021-09-22', '7:20', '15:00', 1),
(3, 1, '2021-01-10', '2022-01-13', '10:50', '11:45', 7),
(4, 4, '2022-04-06', '2023-03-03', '14:30', '16:00', 4);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
