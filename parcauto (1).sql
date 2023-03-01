-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gazdă: 127.0.0.1
-- Timp de generare: ian. 20, 2023 la 11:29 AM
-- Versiune server: 10.4.25-MariaDB
-- Versiune PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Bază de date: `parcauto`
--

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `agent`
--

CREATE TABLE `agent` (
  `IDAgent` int(11) NOT NULL,
  `Nume` varchar(255) NOT NULL,
  `Prenume` varchar(255) NOT NULL,
  `Comision` int(11) NOT NULL,
  `NrVanzari` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Eliminarea datelor din tabel `agent`
--

INSERT INTO `agent` (`IDAgent`, `Nume`, `Prenume`, `Comision`, `NrVanzari`) VALUES
(1, 'Darius', 'Stefan', 30, 10),
(2, 'dani', 'flori', 0, 0),
(3, 'marius', 'lacatus', 24, 2),
(9, 'marius', 'lo', 2, 3);

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `client`
--

CREATE TABLE `client` (
  `IDClient` int(11) NOT NULL,
  `IDAgent` int(11) NOT NULL,
  `Nume` varchar(255) NOT NULL,
  `Prenume` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `marca`
--

CREATE TABLE `marca` (
  `IDMarca` int(11) NOT NULL,
  `Model` varchar(255) NOT NULL,
  `Motor` int(11) NOT NULL,
  `Putere` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Eliminarea datelor din tabel `marca`
--

INSERT INTO `marca` (`IDMarca`, `Model`, `Motor`, `Putere`) VALUES
(2, 'BMW', 3000, 400),
(3, 'BMW', 2000, 150),
(4, 'Dacia', 600, 55),
(5, 'Renault', 1600, 80),
(6, 'BMW', 1600, 100),
(7, 'Mercedes', 1400, 98),
(8, 'honda', 1900, 200);

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `marcaagent`
--

CREATE TABLE `marcaagent` (
  `IDAgent` int(11) NOT NULL,
  `IDMarca` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `tipmasina`
--

CREATE TABLE `tipmasina` (
  `IDMasina` int(11) NOT NULL,
  `IDMarca` int(11) NOT NULL,
  `Caroserie` varchar(255) NOT NULL,
  `Combustibil` varchar(255) NOT NULL,
  `AnFabricatie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Eliminarea datelor din tabel `tipmasina`
--

INSERT INTO `tipmasina` (`IDMasina`, `IDMarca`, `Caroserie`, `Combustibil`, `AnFabricatie`) VALUES
(2, 2, 'coupe', 'diesel', 2009),
(3, 2, 'break', 'benzina', 2005),
(4, 3, 'sedan', 'benzina', 2010),
(5, 2, 'sedan', 'diesel', 2018),
(6, 4, 'coupe', 'benzina', 2000),
(7, 5, 'cabrio', 'diesel', 2006),
(8, 6, 'cabrio', 'gaz', 2001),
(9, 7, 'coupe', 'benzina', 2009),
(10, 3, 'sedan', 'benzina', 2000);

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `vanzari`
--

CREATE TABLE `vanzari` (
  `IDVanzare` int(11) NOT NULL,
  `IDAgent` int(11) NOT NULL,
  `Pret` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexuri pentru tabele eliminate
--

--
-- Indexuri pentru tabele `agent`
--
ALTER TABLE `agent`
  ADD PRIMARY KEY (`IDAgent`);

--
-- Indexuri pentru tabele `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`IDClient`),
  ADD KEY `idagent_fk` (`IDAgent`);

--
-- Indexuri pentru tabele `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`IDMarca`);

--
-- Indexuri pentru tabele `marcaagent`
--
ALTER TABLE `marcaagent`
  ADD PRIMARY KEY (`IDAgent`,`IDMarca`),
  ADD KEY `cos2_fk` (`IDMarca`);

--
-- Indexuri pentru tabele `tipmasina`
--
ALTER TABLE `tipmasina`
  ADD PRIMARY KEY (`IDMasina`),
  ADD KEY `idmarca_fk` (`IDMarca`);

--
-- Indexuri pentru tabele `vanzari`
--
ALTER TABLE `vanzari`
  ADD PRIMARY KEY (`IDVanzare`),
  ADD KEY `idv_fk` (`IDAgent`);

--
-- AUTO_INCREMENT pentru tabele eliminate
--

--
-- AUTO_INCREMENT pentru tabele `agent`
--
ALTER TABLE `agent`
  MODIFY `IDAgent` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pentru tabele `client`
--
ALTER TABLE `client`
  MODIFY `IDClient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pentru tabele `marca`
--
ALTER TABLE `marca`
  MODIFY `IDMarca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pentru tabele `tipmasina`
--
ALTER TABLE `tipmasina`
  MODIFY `IDMasina` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pentru tabele `vanzari`
--
ALTER TABLE `vanzari`
  MODIFY `IDVanzare` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constrângeri pentru tabele eliminate
--

--
-- Constrângeri pentru tabele `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `idagent_fk` FOREIGN KEY (`IDAgent`) REFERENCES `agent` (`IDAgent`);

--
-- Constrângeri pentru tabele `marcaagent`
--
ALTER TABLE `marcaagent`
  ADD CONSTRAINT `cos1_fk` FOREIGN KEY (`IDAgent`) REFERENCES `agent` (`IDAgent`),
  ADD CONSTRAINT `cos2_fk` FOREIGN KEY (`IDMarca`) REFERENCES `marca` (`IDMarca`);

--
-- Constrângeri pentru tabele `tipmasina`
--
ALTER TABLE `tipmasina`
  ADD CONSTRAINT `idmarca_fk` FOREIGN KEY (`IDMarca`) REFERENCES `marca` (`IDMarca`);

--
-- Constrângeri pentru tabele `vanzari`
--
ALTER TABLE `vanzari`
  ADD CONSTRAINT `idv_fk` FOREIGN KEY (`IDAgent`) REFERENCES `agent` (`IDAgent`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
