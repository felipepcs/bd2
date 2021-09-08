-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 08-Set-2021 às 10:00
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
-- Banco de dados: `blog`
--

DELIMITER $$
--
-- Procedimentos
--
DROP PROCEDURE IF EXISTS `prc_listar_artigos`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `prc_listar_artigos` (IN `id` INT)  NO SQL
BEGIN
SELECT * FROM artigo;
END$$

DROP PROCEDURE IF EXISTS `prc_listar_comentarios`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `prc_listar_comentarios` ()  NO SQL
BEGIN
SELECT*FROM comentario;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `artigo`
--

DROP TABLE IF EXISTS `artigo`;
CREATE TABLE IF NOT EXISTS `artigo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) NOT NULL,
  `conteudo` text NOT NULL,
  `data_postagem` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_artigo_usuario_idx` (`usuario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `artigo`
--

INSERT INTO `artigo` (`id`, `titulo`, `conteudo`, `data_postagem`, `usuario_id`) VALUES
(1, 'Artigo do usuário Felipe', 'Publicação do primeiro artigo.', '2021-05-27 22:10:58', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `comentario`
--

DROP TABLE IF EXISTS `comentario`;
CREATE TABLE IF NOT EXISTS `comentario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mensagem` varchar(300) NOT NULL,
  `data_postagem` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuario_id` int(11) NOT NULL,
  `artigo_id` int(11) NOT NULL,
  `pai_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comentario_usuario1_idx` (`usuario_id`),
  KEY `fk_comentario_artigo1_idx` (`artigo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `comentario`
--

INSERT INTO `comentario` (`id`, `mensagem`, `data_postagem`, `usuario_id`, `artigo_id`, `pai_id`) VALUES
(1, 'Obrigado!', '2021-05-27 18:59:48', 1, 1, 0),
(2, 'Parabéns pela publicação do primeiro artigo!', '2021-05-27 18:57:39', 2, 1, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(20) NOT NULL,
  `email` varchar(45) NOT NULL,
  `senha` varchar(45) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `figura` varchar(45) NOT NULL DEFAULT 'usuario.png',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id`, `usuario`, `email`, `senha`, `nome`, `figura`) VALUES
(1, 'usuário 1', 'felipe@gmail.com.br', '', 'Felipe ', 'usuario.png'),
(2, 'usuário 2 ', 'pietra@gmail.com.br', '', 'Pietra', 'usuario.png'),
(3, 'usuário 3 ', 'luara@gmail.com.br', '', 'Luara', 'usuario.png'),
(4, 'usuário 4', 'heitor@gmail.com.br', '', 'Heitor', 'usuario.png'),
(5, 'usuário 5', 'ingrid@gmail.com.br', '', 'Ingrid', 'usuario.png'),
(6, 'usuário 6', 'isabella@gmail.com.br', '', 'Isabella', 'usuario.png');

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `ver_artigos_autores`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `ver_artigos_autores`;
CREATE TABLE IF NOT EXISTS `ver_artigos_autores` (
`id` int(11)
,`titulo` varchar(45)
,`conteudo` text
,`data_postagem` datetime
,`usuario_id` int(11)
,`nome` varchar(45)
,`figura` varchar(45)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `ver_artigo_comentario`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `ver_artigo_comentario`;
CREATE TABLE IF NOT EXISTS `ver_artigo_comentario` (
`titulo` varchar(45)
,`mensagem` varchar(300)
);

-- --------------------------------------------------------

--
-- Estrutura para vista `ver_artigos_autores`
--
DROP TABLE IF EXISTS `ver_artigos_autores`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ver_artigos_autores`  AS  select `artigo`.`id` AS `id`,`artigo`.`titulo` AS `titulo`,`artigo`.`conteudo` AS `conteudo`,`artigo`.`data_postagem` AS `data_postagem`,`artigo`.`usuario_id` AS `usuario_id`,`usuario`.`nome` AS `nome`,`usuario`.`figura` AS `figura` from (`artigo` join `usuario` on((`usuario`.`id` = `artigo`.`usuario_id`))) order by `artigo`.`data_postagem` desc limit 30 ;

-- --------------------------------------------------------

--
-- Estrutura para vista `ver_artigo_comentario`
--
DROP TABLE IF EXISTS `ver_artigo_comentario`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ver_artigo_comentario`  AS  select `artigo`.`titulo` AS `titulo`,`comentario`.`mensagem` AS `mensagem` from (`artigo` join `comentario` on((`artigo`.`id` = `comentario`.`artigo_id`))) ;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `artigo`
--
ALTER TABLE `artigo`
  ADD CONSTRAINT `fk_artigo_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

--
-- Limitadores para a tabela `comentario`
--
ALTER TABLE `comentario`
  ADD CONSTRAINT `fk_comentario_artigo1` FOREIGN KEY (`artigo_id`) REFERENCES `artigo` (`id`),
  ADD CONSTRAINT `fk_comentario_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
