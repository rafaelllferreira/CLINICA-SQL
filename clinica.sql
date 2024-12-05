-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 05/12/2024 às 01:24
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `clinica`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `exame`
--

CREATE TABLE `exame` (
  `ID_EXAME` int(11) NOT NULL,
  `DATA` int(11) DEFAULT NULL,
  `CPF` int(11) DEFAULT NULL,
  `NUMERO_EXAME` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `medico`
--

CREATE TABLE `medico` (
  `CRM` int(11) NOT NULL,
  `NOME` varchar(20) DEFAULT NULL,
  `ESPECIALIDADE` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `paciente`
--

CREATE TABLE `paciente` (
  `CPF` int(11) NOT NULL,
  `NOME` varchar(50) DEFAULT NULL,
  `ENDERECO` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `prontuario`
--

CREATE TABLE `prontuario` (
  `NUMERO` int(11) NOT NULL,
  `CRM` int(11) DEFAULT NULL,
  `CPF` int(11) DEFAULT NULL,
  `PRESCRIÇÃO` varchar(100) DEFAULT NULL,
  `DATA` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipo_exame`
--

CREATE TABLE `tipo_exame` (
  `NUMERO_EXAME` int(11) NOT NULL,
  `TIPO_EXAME` varchar(20) DEFAULT NULL,
  `CONVENIO` varchar(20) DEFAULT NULL,
  `REQUISITOS` varchar(100) DEFAULT NULL,
  `VALOR` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `exame`
--
ALTER TABLE `exame`
  ADD PRIMARY KEY (`ID_EXAME`),
  ADD KEY `NUMERO_EXAME` (`NUMERO_EXAME`);

--
-- Índices de tabela `medico`
--
ALTER TABLE `medico`
  ADD PRIMARY KEY (`CRM`);

--
-- Índices de tabela `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`CPF`);

--
-- Índices de tabela `prontuario`
--
ALTER TABLE `prontuario`
  ADD PRIMARY KEY (`NUMERO`),
  ADD KEY `CRM` (`CRM`),
  ADD KEY `CPF` (`CPF`);

--
-- Índices de tabela `tipo_exame`
--
ALTER TABLE `tipo_exame`
  ADD PRIMARY KEY (`NUMERO_EXAME`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `exame`
--
ALTER TABLE `exame`
  ADD CONSTRAINT `exame_ibfk_1` FOREIGN KEY (`NUMERO_EXAME`) REFERENCES `tipo_exame` (`NUMERO_EXAME`);

--
-- Restrições para tabelas `prontuario`
--
ALTER TABLE `prontuario`
  ADD CONSTRAINT `prontuario_ibfk_1` FOREIGN KEY (`CRM`) REFERENCES `medico` (`CRM`),
  ADD CONSTRAINT `prontuario_ibfk_2` FOREIGN KEY (`CPF`) REFERENCES `paciente` (`CPF`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
