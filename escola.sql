-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 23-Nov-2021 às 00:38
-- Versão do servidor: 10.4.17-MariaDB
-- versão do PHP: 7.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `escola`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluno`
--

CREATE TABLE `aluno` (
  `cpf` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `telefone` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluno_cursos`
--

CREATE TABLE `aluno_cursos` (
  `alunos_cpf` varchar(255) NOT NULL,
  `cursos_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluno_professores`
--

CREATE TABLE `aluno_professores` (
  `alunos_cpf` varchar(255) NOT NULL,
  `professores_cpf` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `curso`
--

CREATE TABLE `curso` (
  `id` bigint(20) NOT NULL,
  `carga_horaria` varchar(255) DEFAULT NULL,
  `categoria` varchar(255) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `professor_cpf` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `professor`
--

CREATE TABLE `professor` (
  `cpf` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `telefone` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `aluno`
--
ALTER TABLE `aluno`
  ADD PRIMARY KEY (`cpf`),
  ADD UNIQUE KEY `UK_3wpes15e0anbfaa4do0pey97k` (`email`);

--
-- Índices para tabela `aluno_cursos`
--
ALTER TABLE `aluno_cursos`
  ADD KEY `FK9hbn0t6pgg0oe7d4vdwxoynvn` (`cursos_id`),
  ADD KEY `FKpwwilrq4q3cftmg19uornqoij` (`alunos_cpf`);

--
-- Índices para tabela `aluno_professores`
--
ALTER TABLE `aluno_professores`
  ADD KEY `FK48jrp6ghva38ep13u0cqh9pyb` (`professores_cpf`),
  ADD KEY `FKge68sr81xbg87ubdv4kv95eou` (`alunos_cpf`);

--
-- Índices para tabela `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK907fosf44bl0xoi3rnx8es0fp` (`professor_cpf`);

--
-- Índices para tabela `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`cpf`),
  ADD UNIQUE KEY `UK_qjm28ojevoom770jyieljec3e` (`email`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `aluno_cursos`
--
ALTER TABLE `aluno_cursos`
  ADD CONSTRAINT `FK9hbn0t6pgg0oe7d4vdwxoynvn` FOREIGN KEY (`cursos_id`) REFERENCES `curso` (`id`),
  ADD CONSTRAINT `FKpwwilrq4q3cftmg19uornqoij` FOREIGN KEY (`alunos_cpf`) REFERENCES `aluno` (`cpf`);

--
-- Limitadores para a tabela `aluno_professores`
--
ALTER TABLE `aluno_professores`
  ADD CONSTRAINT `FK48jrp6ghva38ep13u0cqh9pyb` FOREIGN KEY (`professores_cpf`) REFERENCES `professor` (`cpf`),
  ADD CONSTRAINT `FKge68sr81xbg87ubdv4kv95eou` FOREIGN KEY (`alunos_cpf`) REFERENCES `aluno` (`cpf`);

--
-- Limitadores para a tabela `curso`
--
ALTER TABLE `curso`
  ADD CONSTRAINT `FK907fosf44bl0xoi3rnx8es0fp` FOREIGN KEY (`professor_cpf`) REFERENCES `professor` (`cpf`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
