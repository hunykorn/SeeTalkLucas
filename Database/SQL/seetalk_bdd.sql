-- phpMyAdmin SQL Dump
-- version 5.1.4
-- https://www.phpmyadmin.net/
--
-- Host: mysql-seetalk.alwaysdata.net
-- Generation Time: Oct 19, 2022 at 09:55 AM
-- Server version: 10.6.7-MariaDB
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `seetalk_bdd`
--

-- --------------------------------------------------------

--
-- Table structure for table `ACTUALITE`
--

CREATE TABLE `ACTUALITE` (
  `ID_ACTU` int(2) NOT NULL,
  `TITRE` varchar(255) DEFAULT NULL,
  `MESSAGE` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `APPELER`
--

CREATE TABLE `APPELER` (
  `ID_APPEL` int(2) NOT NULL,
  `ID_USER` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `APPEL_VIDEO`
--

CREATE TABLE `APPEL_VIDEO` (
  `ID_APPEL` int(2) NOT NULL,
  `DATE_APPEL` timestamp NOT NULL DEFAULT current_timestamp(),
  `DUREE` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ENVOYER`
--

CREATE TABLE `ENVOYER` (
  `ID_USER` int(2) NOT NULL,
  `ID_MESSAGE` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ETRE_APPELE`
--

CREATE TABLE `ETRE_APPELE` (
  `ID_USER` int(2) NOT NULL,
  `ID_APPEL` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `INCLURE`
--

CREATE TABLE `INCLURE` (
  `ID_USER` int(2) NOT NULL,
  `ID_REUNION` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `INCLURE`
--

INSERT INTO `INCLURE` (`ID_USER`, `ID_REUNION`) VALUES
(1, 11),
(1, 12),
(2, 11),
(2, 12),
(3, 11),
(3, 12);

-- --------------------------------------------------------

--
-- Table structure for table `MESSAGE`
--

CREATE TABLE `MESSAGE` (
  `ID_MESSAGE` int(2) NOT NULL,
  `CONTENU` text DEFAULT NULL,
  `DATE_MESSAGE` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `MESSAGE`
--

INSERT INTO `MESSAGE` (`ID_MESSAGE`, `CONTENU`, `DATE_MESSAGE`) VALUES
(1, 'test', '2022-10-02 19:49:41');

-- --------------------------------------------------------

--
-- Table structure for table `RECEVOIR`
--

CREATE TABLE `RECEVOIR` (
  `ID_MESSAGE` int(2) NOT NULL,
  `ID_USER` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `REUNION`
--

CREATE TABLE `REUNION` (
  `ID_REUNION` int(2) NOT NULL,
  `NOM` varchar(255) DEFAULT NULL,
  `DESCRIPTION` text DEFAULT NULL,
  `DATE_REUNION` datetime DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `DATE_CREATED` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `REUNION`
--

INSERT INTO `REUNION` (`ID_REUNION`, `NOM`, `DESCRIPTION`, `DATE_REUNION`, `PASSWORD`, `DATE_CREATED`) VALUES
(2, 'test', NULL, '2022-10-26 00:00:00', 'test', '2022-10-16 16:03:05'),
(4, 'freszhg', NULL, '2022-10-25 02:02:00', 'grezh', '2022-10-16 16:14:04'),
(11, 'fezqgerf', NULL, '2022-10-25 02:20:00', 'fzeqgez', '2022-10-16 18:37:29'),
(12, 'zaertyt', NULL, '2022-10-27 22:20:00', 'eazrzaty', '2022-10-19 06:28:59');

-- --------------------------------------------------------

--
-- Table structure for table `UTILISATEUR`
--

CREATE TABLE `UTILISATEUR` (
  `ID_USER` int(2) NOT NULL,
  `PSEUDO` varchar(255) DEFAULT NULL,
  `NOM` varchar(255) DEFAULT NULL,
  `PRENOM` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `SOCIETE` varchar(255) DEFAULT NULL,
  `BIO` text DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `TELEPHONE` varchar(255) DEFAULT NULL,
  `IMG` varchar(255) DEFAULT NULL,
  `GRADE` int(11) NOT NULL DEFAULT 0,
  `VALIDATION` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `UTILISATEUR`
--

INSERT INTO `UTILISATEUR` (`ID_USER`, `PSEUDO`, `NOM`, `PRENOM`, `PASSWORD`, `SOCIETE`, `BIO`, `EMAIL`, `TELEPHONE`, `IMG`, `GRADE`, `VALIDATION`) VALUES
(1, 'test', 'bioezhag', 'testuser', 'test', 'testtest', 'test', 'test@test.fr', '0123456789', 'test', 0, 1),
(2, 'employe', 'employe', 'employe', 'employe', 'employe', 'employe', 'employe', 'employe', 'employe', 1, 0),
(3, 'gestionnaire', 'gestionnaire', 'gestionnaire', 'gestionnaire', 'gestionnaire', 'gestionnaire', 'gestionnaire', 'gestionnaire', 'gestionnaire', 10, 1),
(4, 'admin', 'admin', 'admin', 'admin', 'admin', 'administrateur', 'admin', 'admin', 'admin', 100, 1),
(9, 'aezrty', 'greqgr', 'freqhresg', 'azer', 'freshreg', NULL, 'azereza', 'gfreshresg', NULL, 100, 1);

-- --------------------------------------------------------

--
-- Table structure for table `PRESENT`
--

CREATE TABLE `PRESENT` (
  `ID_USER` int(2) NOT NULL,
  `ID_REUNION` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ACTUALITE`
--
ALTER TABLE `ACTUALITE`
  ADD PRIMARY KEY (`ID_ACTU`);

--
-- Indexes for table `APPELER`
--
ALTER TABLE `APPELER`
  ADD PRIMARY KEY (`ID_APPEL`,`ID_USER`),
  ADD KEY `I_FK_APPELER_APPEL_VIDEO` (`ID_APPEL`),
  ADD KEY `I_FK_APPELER_UTILISATEUR` (`ID_USER`);

--
-- Indexes for table `APPEL_VIDEO`
--
ALTER TABLE `APPEL_VIDEO`
  ADD PRIMARY KEY (`ID_APPEL`);

--
-- Indexes for table `ENVOYER`
--
ALTER TABLE `ENVOYER`
  ADD PRIMARY KEY (`ID_USER`,`ID_MESSAGE`),
  ADD KEY `I_FK_ENVOYER_UTILISATEUR` (`ID_USER`),
  ADD KEY `I_FK_ENVOYER_MESSAGE` (`ID_MESSAGE`);

--
-- Indexes for table `ETRE_APPELE`
--
ALTER TABLE `ETRE_APPELE`
  ADD PRIMARY KEY (`ID_USER`,`ID_APPEL`),
  ADD KEY `I_FK_ETRE_APPELE_UTILISATEUR` (`ID_USER`),
  ADD KEY `I_FK_ETRE_APPELE_APPEL_VIDEO` (`ID_APPEL`);

--
-- Indexes for table `INCLURE`
--
ALTER TABLE `INCLURE`
  ADD PRIMARY KEY (`ID_USER`,`ID_REUNION`),
  ADD KEY `I_FK_CREER_UTILISATEUR` (`ID_USER`),
  ADD KEY `I_FK_CREER_REUNION` (`ID_REUNION`);

--
-- Indexes for table `MESSAGE`
--
ALTER TABLE `MESSAGE`
  ADD PRIMARY KEY (`ID_MESSAGE`);

--
-- Indexes for table `RECEVOIR`
--
ALTER TABLE `RECEVOIR`
  ADD PRIMARY KEY (`ID_MESSAGE`,`ID_USER`),
  ADD KEY `I_FK_RECEVOIR_MESSAGE` (`ID_MESSAGE`),
  ADD KEY `I_FK_RECEVOIR_UTILISATEUR` (`ID_USER`);

--
-- Indexes for table `REUNION`
--
ALTER TABLE `REUNION`
  ADD PRIMARY KEY (`ID_REUNION`);

--
-- Indexes for table `UTILISATEUR`
--
ALTER TABLE `UTILISATEUR`
  ADD PRIMARY KEY (`ID_USER`);

--
-- Indexes for table `PRESENT`
--
ALTER TABLE `PRESENT`
  ADD PRIMARY KEY (`ID_USER`,`ID_REUNION`),
  ADD KEY `I_FK_PRESENT_UTILISATEUR` (`ID_USER`),
  ADD KEY `I_FK_PRESENT_REUNION` (`ID_REUNION`);


--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ACTUALITE`
--
ALTER TABLE `ACTUALITE`
  MODIFY `ID_ACTU` int(2) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `APPEL_VIDEO`
--
ALTER TABLE `APPEL_VIDEO`
  MODIFY `ID_APPEL` int(2) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `MESSAGE`
--
ALTER TABLE `MESSAGE`
  MODIFY `ID_MESSAGE` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `REUNION`
--
ALTER TABLE `REUNION`
  MODIFY `ID_REUNION` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `UTILISATEUR`
--
ALTER TABLE `UTILISATEUR`
  MODIFY `ID_USER` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `APPELER`
--
ALTER TABLE `APPELER`
  ADD CONSTRAINT `FK_APPELER_APPEL_VIDEO` FOREIGN KEY (`ID_APPEL`) REFERENCES `APPEL_VIDEO` (`ID_APPEL`),
  ADD CONSTRAINT `FK_APPELER_UTILISATEUR` FOREIGN KEY (`ID_USER`) REFERENCES `UTILISATEUR` (`ID_USER`);

--
-- Constraints for table `ENVOYER`
--
ALTER TABLE `ENVOYER`
  ADD CONSTRAINT `FK_ENVOYER_MESSAGE` FOREIGN KEY (`ID_MESSAGE`) REFERENCES `MESSAGE` (`ID_MESSAGE`),
  ADD CONSTRAINT `FK_ENVOYER_UTILISATEUR` FOREIGN KEY (`ID_USER`) REFERENCES `UTILISATEUR` (`ID_USER`);

--
-- Constraints for table `ETRE_APPELE`
--
ALTER TABLE `ETRE_APPELE`
  ADD CONSTRAINT `FK_ETRE_APPELE_APPEL_VIDEO` FOREIGN KEY (`ID_APPEL`) REFERENCES `APPEL_VIDEO` (`ID_APPEL`),
  ADD CONSTRAINT `FK_ETRE_APPELE_UTILISATEUR` FOREIGN KEY (`ID_USER`) REFERENCES `UTILISATEUR` (`ID_USER`);

--
-- Constraints for table `INCLURE`
--
ALTER TABLE `INCLURE`
  ADD CONSTRAINT `FK_CREER_REUNION` FOREIGN KEY (`ID_REUNION`) REFERENCES `REUNION` (`ID_REUNION`),
  ADD CONSTRAINT `FK_CREER_UTILISATEUR` FOREIGN KEY (`ID_USER`) REFERENCES `UTILISATEUR` (`ID_USER`);

--
-- Constraints for table `RECEVOIR`
--
ALTER TABLE `RECEVOIR`
  ADD CONSTRAINT `FK_RECEVOIR_MESSAGE` FOREIGN KEY (`ID_MESSAGE`) REFERENCES `MESSAGE` (`ID_MESSAGE`),
  ADD CONSTRAINT `FK_RECEVOIR_UTILISATEUR` FOREIGN KEY (`ID_USER`) REFERENCES `UTILISATEUR` (`ID_USER`);
COMMIT;

--
-- Constraints for table `PRESENT`
--
ALTER TABLE `PRESENT`
  ADD CONSTRAINT `FK_PRESENT_REUNION` FOREIGN KEY (`ID_REUNION`) REFERENCES `REUNION` (`ID_REUNION`),
  ADD CONSTRAINT `FK_PRESENT_UTILISATEUR` FOREIGN KEY (`ID_USER`) REFERENCES `UTILISATEUR` (`ID_USER`);


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
