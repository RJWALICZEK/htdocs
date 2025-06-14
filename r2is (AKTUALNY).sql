-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Cze 14, 2025 at 04:55 PM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `r2is`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `adres`
--

CREATE TABLE `adres` (
  `id_adres` int(11) NOT NULL,
  `id_uzytkownik` int(11) NOT NULL,
  `ulica` varchar(30) NOT NULL,
  `kod` varchar(6) NOT NULL,
  `miejscowosc` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `czesci`
--

CREATE TABLE `czesci` (
  `id_czesci` int(11) NOT NULL,
  `nazwa` varchar(100) NOT NULL,
  `opis` varchar(500) NOT NULL,
  `cena` decimal(7,2) NOT NULL,
  `grafika` varchar(100) NOT NULL,
  `stan_magazynowy` int(11) NOT NULL,
  `id_kategoria` int(11) NOT NULL,
  `promocja` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `czesci`
--

INSERT INTO `czesci` (`id_czesci`, `nazwa`, `opis`, `cena`, `grafika`, `stan_magazynowy`, `id_kategoria`, `promocja`) VALUES
(1, 'Cylinder 50cc', 'Cylinder żeliwny 50cc do skutera 2T', 159.99, 'cylinder.jpg', 10, 2, 1),
(2, 'Pasek napędowy', 'Pasek napędowy 842x20 dla skutera 4T', 49.90, 'pasek.jpg', 10, 14, 0),
(4, 'Tłok 12mm', 'Tłok do cylindra 50cc, sworzeń 12mm', 49.00, 'tlok.jpg', 10, 2, 0),
(5, 'Uszczelki silnika', 'Komplet uszczelek do skutera 2T', 19.99, 'uszczelki.jpg', 10, 2, 0),
(6, 'Zawory 4T', 'Komplet zaworów ssących i wydechowych', 79.90, 'zawory.jpg', 10, 2, 0),
(7, 'Wał korbowy', 'Wał korbowy do skutera 2T', 199.00, 'wal.jpg', 10, 2, 1),
(9, 'Sprzęgło kompletne 2T', 'Sprzęgło odśrodkowe do skutera 2T', 89.99, 'sprzeglo.jpg', 10, 14, 0),
(10, 'Wariator tuningowy', 'Wariator sportowy do skutera', 109.00, 'wariator.jpg', 10, 14, 0),
(11, 'Rolka wariatora 6g', 'Komplet rolek 6g 15x12mm', 24.00, 'rolki.jpg', 10, 14, 0),
(13, 'Amortyzator tylny', 'Amortyzator tylny 330mm czerwony', 119.00, 'amortyzator.jpg', 10, 3, 0),
(14, 'Łożyska główki ramy', 'Komplet łożysk główki ramy', 29.99, 'lozyska.jpg', 10, 3, 0),
(16, 'Półka widelca', 'półka widelca przedniego skuter 2t', 179.00, 'widelec.jpg', 10, 3, 0),
(18, 'Tarcza hamulcowa', 'Tarcza 190mm do skutera', 59.90, 'tarcza_hamulcowa.jpg', 10, 4, 0),
(19, 'Klocki hamulcowe', 'Komplet klocków do hamulców tarczowych', 25.00, 'klocki.jpg', 10, 4, 0),
(20, 'Linka hamulca', 'Linka hamulcowa tylna 1800mm', 14.99, 'linka.jpg', 10, 4, 0),
(21, 'Pompa hamulcowa', 'Pompa hamulcowa prawa z klamką', 79.00, 'pompa.jpg', 10, 4, 0),
(22, 'Płyn hamulcowy DOT4', 'Płyn 500ml do układów hamulcowych', 15.00, 'plyn.jpg', 10, 12, 0),
(23, 'Świeca zapłonowa NGK', 'Świeca do skutera 2T/4T', 15.90, 'swieca.jpg', 10, 3, 0),
(24, 'Moduł CDI sport', 'CDI tuningowy bez ogranicznika', 49.90, 'cdi.jpg', 10, 3, 0),
(25, 'Cewka zapłonowa', 'Cewka do zapłonu skutera', 35.00, 'cewka.jpg', 10, 3, 0),
(26, 'Akumulator 12V 4Ah', 'Żelowy akumulator do skutera', 89.00, 'akumulator.jpg', 10, 3, 0),
(27, 'Zestaw kabli', 'Komplet przewodów elektrycznych', 19.00, 'kable.jpg', 10, 3, 0),
(28, 'Lampa przednia', 'Lampa główna do skutera', 69.90, 'lampa.jpg', 10, 10, 0),
(29, 'Zestaw plastików', 'Plastiki boczne do skutera 2T', 199.00, 'plastiki.jpg', 10, 10, 0),
(30, 'Owiewka przednia', 'Owiewka z szybą', 89.00, 'owiewka.jpg', 10, 10, 0),
(31, 'Błotnik tylny', 'Plastikowy błotnik do skutera', 34.90, 'blotnik.jpg', 10, 10, 0),
(32, 'Siedzenie', 'Tapicerowane siedzenie do skutera', 149.00, 'siedzenie.jpg', 10, 10, 0),
(33, 'Felga aluminiowa 12\"', 'Felga do skutera 12 cali', 229.00, 'felga.jpg', 10, 9, 0),
(34, 'Opona 120/70-12', 'Opona tylna szosowa', 139.00, 'opona.jpg', 10, 13, 0),
(35, 'Dętka 12\"', 'Dętka 12 cali do skutera', 19.00, 'detka.jpg', 10, 13, 0),
(36, 'Łożysko koła', 'Komplet łożysk przedniego koła', 29.90, 'lozysko.jpg', 10, 9, 0),
(37, 'Zestaw osi', 'Oś przednia i tylna', 39.00, 'os.jpg', 10, 9, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kategoria`
--

CREATE TABLE `kategoria` (
  `id_kategoria` int(11) NOT NULL,
  `kategoria` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `kategoria`
--

INSERT INTO `kategoria` (`id_kategoria`, `kategoria`) VALUES
(1, 'akcesoria_i_tuning'),
(2, 'czesci_silnikowe'),
(3, 'elektryka'),
(4, 'hamulce'),
(5, 'kask_enduro'),
(6, 'kask_integralny'),
(7, 'kask_modularny'),
(8, 'kask_otwarty'),
(9, 'kola'),
(10, 'nadwozie_i_plastiki'),
(11, 'narzedzia'),
(12, 'oleje_i_plyny'),
(13, 'opony'),
(14, 'uklad_napedowy');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `koszyk`
--

CREATE TABLE `koszyk` (
  `id_koszyk` int(11) NOT NULL,
  `id_zamowienia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pozycje_koszyk`
--

CREATE TABLE `pozycje_koszyk` (
  `id_pozKoszyk` int(11) NOT NULL,
  `id_koszyk` int(11) NOT NULL,
  `id_czesci` int(11) NOT NULL,
  `ilosc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pozycje_zamowienia`
--

CREATE TABLE `pozycje_zamowienia` (
  `id_pozZamowienia` int(11) NOT NULL,
  `id_zamowienia` int(11) NOT NULL,
  `id_czesci` int(11) NOT NULL,
  `ilosc` int(11) NOT NULL,
  `cena_jednostkowa` decimal(7,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `promocje`
--

CREATE TABLE `promocje` (
  `id_promocja` int(11) NOT NULL,
  `id_czesci` int(11) NOT NULL,
  `znizka_procent` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uzytkownik`
--

CREATE TABLE `uzytkownik` (
  `id_uzytkownik` int(11) NOT NULL,
  `nick` varchar(30) NOT NULL,
  `imie` varchar(30) NOT NULL,
  `nazwisko` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `haslo` varchar(100) NOT NULL,
  `rola` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `uzytkownik`
--

INSERT INTO `uzytkownik` (`id_uzytkownik`, `nick`, `imie`, `nazwisko`, `email`, `haslo`, `rola`) VALUES
(1, 'admin', 'admin', 'admin', 'admin@admin.admin', '21232f297a57a5a743894a0e4a801fc3', '1');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamowienia`
--

CREATE TABLE `zamowienia` (
  `id_zamowienia` int(11) NOT NULL,
  `id_uzytkownik` int(11) NOT NULL,
  `data` date NOT NULL,
  `suma` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `adres`
--
ALTER TABLE `adres`
  ADD PRIMARY KEY (`id_adres`),
  ADD KEY `adres_uzytkownik_FK` (`id_uzytkownik`);

--
-- Indeksy dla tabeli `czesci`
--
ALTER TABLE `czesci`
  ADD PRIMARY KEY (`id_czesci`),
  ADD KEY `czesci_kategoria_FK` (`id_kategoria`);

--
-- Indeksy dla tabeli `kategoria`
--
ALTER TABLE `kategoria`
  ADD PRIMARY KEY (`id_kategoria`);

--
-- Indeksy dla tabeli `koszyk`
--
ALTER TABLE `koszyk`
  ADD PRIMARY KEY (`id_koszyk`),
  ADD KEY `koszyk_zamowienie_FK` (`id_zamowienia`);

--
-- Indeksy dla tabeli `pozycje_koszyk`
--
ALTER TABLE `pozycje_koszyk`
  ADD PRIMARY KEY (`id_pozKoszyk`),
  ADD KEY `poz_koszyk_FK` (`id_koszyk`),
  ADD KEY `poz_koszyk_czesc_FK` (`id_czesci`);

--
-- Indeksy dla tabeli `pozycje_zamowienia`
--
ALTER TABLE `pozycje_zamowienia`
  ADD PRIMARY KEY (`id_pozZamowienia`),
  ADD KEY `poz_zamowienie_FK` (`id_zamowienia`),
  ADD KEY `poz_czesc_FK` (`id_czesci`);

--
-- Indeksy dla tabeli `promocje`
--
ALTER TABLE `promocje`
  ADD PRIMARY KEY (`id_promocja`),
  ADD KEY `promocje_czesc_FK` (`id_czesci`);

--
-- Indeksy dla tabeli `uzytkownik`
--
ALTER TABLE `uzytkownik`
  ADD PRIMARY KEY (`id_uzytkownik`);

--
-- Indeksy dla tabeli `zamowienia`
--
ALTER TABLE `zamowienia`
  ADD PRIMARY KEY (`id_zamowienia`),
  ADD KEY `zamowienie_uzytkownik_FK` (`id_uzytkownik`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adres`
--
ALTER TABLE `adres`
  MODIFY `id_adres` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `czesci`
--
ALTER TABLE `czesci`
  MODIFY `id_czesci` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `kategoria`
--
ALTER TABLE `kategoria`
  MODIFY `id_kategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `koszyk`
--
ALTER TABLE `koszyk`
  MODIFY `id_koszyk` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pozycje_koszyk`
--
ALTER TABLE `pozycje_koszyk`
  MODIFY `id_pozKoszyk` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pozycje_zamowienia`
--
ALTER TABLE `pozycje_zamowienia`
  MODIFY `id_pozZamowienia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `promocje`
--
ALTER TABLE `promocje`
  MODIFY `id_promocja` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `uzytkownik`
--
ALTER TABLE `uzytkownik`
  MODIFY `id_uzytkownik` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `zamowienia`
--
ALTER TABLE `zamowienia`
  MODIFY `id_zamowienia` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adres`
--
ALTER TABLE `adres`
  ADD CONSTRAINT `adres_uzytkownik_FK` FOREIGN KEY (`id_uzytkownik`) REFERENCES `uzytkownik` (`id_uzytkownik`);

--
-- Constraints for table `czesci`
--
ALTER TABLE `czesci`
  ADD CONSTRAINT `czesci_kategoria_FK` FOREIGN KEY (`id_kategoria`) REFERENCES `kategoria` (`id_kategoria`);

--
-- Constraints for table `koszyk`
--
ALTER TABLE `koszyk`
  ADD CONSTRAINT `koszyk_zamowienie_FK` FOREIGN KEY (`id_zamowienia`) REFERENCES `zamowienia` (`id_zamowienia`);

--
-- Constraints for table `pozycje_koszyk`
--
ALTER TABLE `pozycje_koszyk`
  ADD CONSTRAINT `poz_koszyk_FK` FOREIGN KEY (`id_koszyk`) REFERENCES `koszyk` (`id_koszyk`),
  ADD CONSTRAINT `poz_koszyk_czesc_FK` FOREIGN KEY (`id_czesci`) REFERENCES `czesci` (`id_czesci`);

--
-- Constraints for table `pozycje_zamowienia`
--
ALTER TABLE `pozycje_zamowienia`
  ADD CONSTRAINT `poz_czesc_FK` FOREIGN KEY (`id_czesci`) REFERENCES `czesci` (`id_czesci`),
  ADD CONSTRAINT `poz_zamowienie_FK` FOREIGN KEY (`id_zamowienia`) REFERENCES `zamowienia` (`id_zamowienia`);

--
-- Constraints for table `promocje`
--
ALTER TABLE `promocje`
  ADD CONSTRAINT `promocje_czesc_FK` FOREIGN KEY (`id_czesci`) REFERENCES `czesci` (`id_czesci`);

--
-- Constraints for table `zamowienia`
--
ALTER TABLE `zamowienia`
  ADD CONSTRAINT `zamowienie_uzytkownik_FK` FOREIGN KEY (`id_uzytkownik`) REFERENCES `uzytkownik` (`id_uzytkownik`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
