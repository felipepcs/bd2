-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 08-Set-2021 às 09:28
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
-- Banco de dados: `receitatpa`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `receita`
--

DROP TABLE IF EXISTS `receita`;
CREATE TABLE IF NOT EXISTS `receita` (
  `email` varchar(45) NOT NULL,
  `nome` varchar(80) NOT NULL,
  `titulo` varchar(80) NOT NULL,
  `ingredientes` varchar(900) NOT NULL,
  `preparo` varchar(900) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `receita`
--

INSERT INTO `receita` (`email`, `nome`, `titulo`, `ingredientes`, `preparo`) VALUES
('anamariabraga@gmail.com.br', 'Ana Maria Braga', 'Receita Ana Maria Braga', 'Farinha de Trigo, óleo, fermento, leite, 5 ovos, queijo, presunto, milho, bacon e sal.', 'Em um recipiente, misture todos os ingredientes. Em seguida, coloque no forno por 20 minutos. Torça para dar certo.'),
('felipesouza@gmail.com.br', 'Felipe Souza', 'Raposa assada', 'Raposa, sal, tempero a gosto.', 'Depois de temperar, coloque a raposa no forno por 50 minutos. Atente-se para não deixar cair. Sirva-se.'),
('ratatoulli@gmail.com.br', 'Ratatoulli', 'Receita do Rato', 'Pão, ovo, queijo, presunto, bacon, milho, frango desfiado, hambúrguer, catupiry, abacaxi e salada. ', 'Monte o sanduíche.'),
('teste@gmail.com.br', 'Autor de teste ', 'Receita de Teste ', 'Bastante paciência.', 'Rezar para a aplicação funcionar.'),
('ufadeucerto@gmail.com.br', 'Autor feliz', 'Ufa! Deu certo.', 'Dor de cabeça e alívio', 'Corra para entregar no prazo.');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
