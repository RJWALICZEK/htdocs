-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Cze 13, 2025 at 01:04 PM
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
-- Database: `cwiczenia`
--
CREATE DATABASE IF NOT EXISTS `cwiczenia` DEFAULT CHARACTER SET utf8 COLLATE utf8_polish_ci;
USE `cwiczenia`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `producenci`
--

CREATE TABLE `producenci` (
  `id_producenta` int(11) NOT NULL,
  `nazwa` varchar(255) NOT NULL,
  `data_powstania` date NOT NULL,
  `kraj` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `producenci`
--

INSERT INTO `producenci` (`id_producenta`, `nazwa`, `data_powstania`, `kraj`) VALUES
(1, 'Samsung', '1995-12-01', 'Korea Poludniowa'),
(2, 'LG', '1991-09-11', 'Korea Poludniowa'),
(3, 'Amica', '1997-07-24', 'Polska');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `produkty`
--

CREATE TABLE `produkty` (
  `id_produktu` int(11) NOT NULL,
  `producent` int(11) NOT NULL,
  `model` varchar(255) NOT NULL,
  `kategoria` varchar(255) NOT NULL,
  `cena` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `produkty`
--

INSERT INTO `produkty` (`id_produktu`, `producent`, `model`, `kategoria`, `cena`) VALUES
(1, 1, 'EP-200', 'pralka', 2500),
(2, 1, 'EP-200X', 'pralka', 2750),
(3, 1, 'EP-300', 'pralka', 3199),
(4, 1, 'EE-1000', 'telewizor', 3999),
(5, 1, 'EE-2000', 'telewizor', 4499),
(6, 1, 'EX-550', 'kuchenka', 2100),
(7, 1, 'EZ-550', 'lodówka', 3500),
(8, 2, 'S-300', 'pralka', 2999),
(9, 2, 'S-400', 'pralka', 2199),
(10, 2, 'X-500', 'telewizor', 1999),
(11, 2, 'X-600', 'telewizor', 2599),
(12, 2, 'Z-700', 'lodówka', 2200),
(13, 3, 'U3000', 'pralka', 1550),
(14, 3, 'U3001', 'pralka', 2400),
(15, 3, 'G1000', 'kuchenka', 1999),
(16, 3, 'L100', 'lodówka', 2500),
(17, 3, 'L105', 'lodówka', 3150);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `producenci`
--
ALTER TABLE `producenci`
  ADD PRIMARY KEY (`id_producenta`),
  ADD UNIQUE KEY `nazwa` (`nazwa`);

--
-- Indeksy dla tabeli `produkty`
--
ALTER TABLE `produkty`
  ADD PRIMARY KEY (`id_produktu`),
  ADD UNIQUE KEY `model` (`model`),
  ADD KEY `producenci_fk` (`producent`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `producenci`
--
ALTER TABLE `producenci`
  MODIFY `id_producenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `produkty`
--
ALTER TABLE `produkty`
  MODIFY `id_produktu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `produkty`
--
ALTER TABLE `produkty`
  ADD CONSTRAINT `producenci_fk` FOREIGN KEY (`producent`) REFERENCES `producenci` (`id_producenta`);
--
-- Database: `dziennik`
--
CREATE DATABASE IF NOT EXISTS `dziennik` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci;
USE `dziennik`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uczniowie`
--

CREATE TABLE `uczniowie` (
  `imie` text DEFAULT NULL,
  `nazwisko` text DEFAULT NULL,
  `wiek` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `uczniowie`
--

INSERT INTO `uczniowie` (`imie`, `nazwisko`, `wiek`) VALUES
('Kamil', 'Ryba', 11),
('Karolina', 'Witecka', 8),
('Karol', 'Rybacki', 9),
('Marina', 'Damiencka', 9),
('kamil', 'urbaniak', 10),
('kamil', 'nowak', 8);
--
-- Database: `ksiegarnia`
--
CREATE DATABASE IF NOT EXISTS `ksiegarnia` DEFAULT CHARACTER SET utf8 COLLATE utf8_polish_ci;
USE `ksiegarnia`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klienci`
--

CREATE TABLE `klienci` (
  `idklienta` int(11) NOT NULL,
  `imie` text NOT NULL,
  `nazwisko` text NOT NULL,
  `miejscowosc` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `klienci`
--

INSERT INTO `klienci` (`idklienta`, `imie`, `nazwisko`, `miejscowosc`) VALUES
(1, 'Łukasz', 'Lewandowski', 'Poznań'),
(2, 'Jan', 'Nowak', 'Katowice'),
(3, 'Maciej', 'Wójcik', 'Bydgoszcz'),
(4, 'Agnieszka', 'Psikuta', 'Lublin'),
(5, 'Tomasz', 'Mazur', 'Jelenia Góra'),
(6, 'Michał', 'Zieliński', 'Kraków'),
(7, 'Artur', 'Rutkowski', 'Kielce'),
(8, 'Mateusz', 'Skorupa', 'Gdańsk'),
(9, 'Jerzy', 'Rutkowski', 'Rybnik'),
(10, 'Joanna', 'Dostojewska', 'Pułtusk'),
(11, 'Franciszek', 'Janowski', 'Chorzow'),
(12, 'Rafał', 'Waliczek', 'Brzezinka'),
(13, 'Michał', 'Waliczek', 'Brzezinka'),
(14, 'Aleksandra', 'Niechcial', 'Bieruń'),
(15, 'Muchamed', 'Alibaba', 'Wilcze doły');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ksiazki`
--

CREATE TABLE `ksiazki` (
  `idksiazki` int(11) NOT NULL,
  `imieautora` text NOT NULL,
  `nazwiskoautora` text NOT NULL,
  `tytul` text NOT NULL,
  `cena` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `ksiazki`
--

INSERT INTO `ksiazki` (`idksiazki`, `imieautora`, `nazwiskoautora`, `tytul`, `cena`) VALUES
(4, 'Tomasz', 'Kowalski', 'Urządzenia techniki komputerowej', 37.19),
(3, 'Paweł', 'Jakubowski', 'HTML5. Tworzenie witryn', 48.42),
(2, 'Andrzej', 'Krawczyk', 'Windows 8 PL. Zaawansowana administracja systemem', 54.44),
(1, 'Jan', 'Michalak', 'Zaawansowane programowanie w PHP', 51.5),
(5, 'Łukasz', 'Pasternak', 'PHP. Tworzenie nowoczesnych stron WWW', 32.66),
(6, '', 'Sapkowski', 'Miecz Przeznaczenia', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamowienia`
--

CREATE TABLE `zamowienia` (
  `idzamowienia` int(11) NOT NULL,
  `idklienta` int(11) NOT NULL,
  `idksiazki` int(11) NOT NULL,
  `data` date NOT NULL,
  `status` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `zamowienia`
--

INSERT INTO `zamowienia` (`idzamowienia`, `idklienta`, `idksiazki`, `data`, `status`) VALUES
(1, 2, 4, '2014-10-08', 'oczekiwanie'),
(2, 7, 1, '2014-09-05', 'wyslano'),
(3, 9, 1, '2014-10-11', 'wyslano'),
(4, 2, 2, '2014-10-15', 'wyslano'),
(5, 2, 5, '2014-08-12', 'wyslano'),
(6, 3, 2, '2014-10-20', 'wyslano'),
(7, 4, 3, '2014-08-14', 'wyslano'),
(8, 8, 1, '2014-08-19', 'wyslano'),
(9, 3, 5, '2014-11-19', 'wyslano'),
(10, 9, 2, '2014-12-28', 'oczekiwanie'),
(11, 7, 3, '2016-01-01', 'oczekiwanie');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `klienci`
--
ALTER TABLE `klienci`
  ADD PRIMARY KEY (`idklienta`),
  ADD KEY `id` (`idklienta`);

--
-- Indeksy dla tabeli `ksiazki`
--
ALTER TABLE `ksiazki`
  ADD PRIMARY KEY (`idksiazki`);

--
-- Indeksy dla tabeli `zamowienia`
--
ALTER TABLE `zamowienia`
  ADD PRIMARY KEY (`idzamowienia`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `klienci`
--
ALTER TABLE `klienci`
  MODIFY `idklienta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `ksiazki`
--
ALTER TABLE `ksiazki`
  MODIFY `idksiazki` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `zamowienia`
--
ALTER TABLE `zamowienia`
  MODIFY `idzamowienia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- Database: `osadnicy`
--
CREATE DATABASE IF NOT EXISTS `osadnicy` DEFAULT CHARACTER SET utf8 COLLATE utf8_polish_ci;
USE `osadnicy`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uzytkownicy`
--

CREATE TABLE `uzytkownicy` (
  `id` int(11) NOT NULL,
  `user` text NOT NULL,
  `pass` text NOT NULL,
  `email` text NOT NULL,
  `drewno` int(11) NOT NULL,
  `kamien` int(11) NOT NULL,
  `zboze` int(11) NOT NULL,
  `dnipremium` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `uzytkownicy`
--

INSERT INTO `uzytkownicy` (`id`, `user`, `pass`, `email`, `drewno`, `kamien`, `zboze`, `dnipremium`) VALUES
(1, 'adam', 'qwerty', 'adam@gmail.com', 213, 5675, 342, 0),
(2, 'marek', 'asdfg', 'marek@gmail.com', 324, 1123, 4325, 15),
(3, 'anna', 'zxcvb', 'anna@gmail.com', 4536, 17, 120, 25),
(4, 'andrzej', 'asdfg', 'andrzej@gmail.com', 5465, 132, 189, 0),
(5, 'justyna', 'yuiop', 'justyna@gmail.com', 245, 890, 554, 0),
(6, 'kasia', 'hjkkl', 'kasia@gmail.com', 267, 980, 109, 12),
(7, 'beata', 'fgthj', 'beata@gmail.com', 565, 356, 447, 77),
(8, 'jakub', 'ertyu', 'jakub@gmail.com', 2467, 557, 876, 0),
(9, 'janusz', 'cvbnm', 'janusz@gmail.com', 65, 456, 2467, 0),
(10, 'roman', 'dfghj', 'roman@gmail.com', 97, 226, 245, 23);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- Database: `pelo_db`
--
CREATE DATABASE IF NOT EXISTS `pelo_db` DEFAULT CHARACTER SET utf8 COLLATE utf8_polish_ci;
USE `pelo_db`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klienci`
--

CREATE TABLE `klienci` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(50) NOT NULL,
  `adres` varchar(100) NOT NULL,
  `opis` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `klienci`
--

INSERT INTO `klienci` (`id`, `nazwa`, `adres`, `opis`) VALUES
(1, 'Żabka', 'ul. Las 1, 32-600 Tychy', NULL),
(2, 'zzzzz', 'aaaaa', '                opis2                        '),
(3, 'test', 'adres testowy', 'tylko dla testu'),
(4, 'ABC Oświęcim', 'ABC Oświęcim', 'fajna firma, dawać rabaty.   \r\n        ');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `operatorzy`
--

CREATE TABLE `operatorzy` (
  `id` int(11) NOT NULL,
  `login` varchar(50) NOT NULL,
  `haslo` varchar(300) NOT NULL,
  `imie` varchar(50) NOT NULL,
  `nazwisko` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `operatorzy`
--

INSERT INTO `operatorzy` (`id`, `login`, `haslo`, `imie`, `nazwisko`, `email`, `status`) VALUES
(1, 'admin', '12345678', 'Adam', 'Administracyjny', 'admin@serwer.pl', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `towary`
--

CREATE TABLE `towary` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(50) NOT NULL,
  `ilosc` int(11) NOT NULL,
  `jm` varchar(5) NOT NULL,
  `cena` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `towary`
--

INSERT INTO `towary` (`id`, `nazwa`, `ilosc`, `jm`, `cena`) VALUES
(1, 'Rezystor', 10, 'szt.', 123),
(2, 'Rezystor', 100, 'szt.', 12.05),
(3, 'towar1', 0, 'm', 0),
(4, 'test123', 0, 'cm', 0),
(5, 'aaaaaaaaaaa', 0, 'cm', 0),
(6, 'aaaa', 0, 'm', 0),
(7, 'aaaa', 0, 'm', 0),
(8, 'aaaa', 0, 'm', 0),
(9, 'aaaa', 0, 'm', 0),
(10, 'aaaa', 0, 'm', 0),
(11, 'aaaa', 0, 'm', 0),
(12, 'sssssssss', 1111, 'm', 1.11);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `klienci`
--
ALTER TABLE `klienci`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `operatorzy`
--
ALTER TABLE `operatorzy`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `towary`
--
ALTER TABLE `towary`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `klienci`
--
ALTER TABLE `klienci`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `operatorzy`
--
ALTER TABLE `operatorzy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `towary`
--
ALTER TABLE `towary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Dumping data for table `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"angular_direct\":\"direct\",\"snap_to_grid\":\"off\",\"relation_lines\":\"true\"}');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Dumping data for table `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'database', 'r2is projekt', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"structure_or_data_forced\":\"0\",\"table_select[]\":[\"produkty\",\"users\"],\"table_structure[]\":[\"produkty\",\"users\"],\"table_data[]\":[\"produkty\",\"users\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@DATABASE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_columns\":\"something\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Struktura tabeli @TABLE@\",\"latex_structure_continued_caption\":\"Struktura tabeli @TABLE@ (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"structure_and_data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"structure_and_data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_procedure_function\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_create_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"uczniowie\",\"table\":\"uczniowie\"},{\"db\":\"ksiegarnia\",\"table\":\"ksiazki\"},{\"db\":\"ksiegarnia\",\"table\":\"klienci\"},{\"db\":\"ksiegarnia\",\"table\":\"zamowienia\"},{\"db\":\"quiz\",\"table\":\"pytania\"},{\"db\":\"r2is\",\"table\":\"produkty\"},{\"db\":\"r2is\",\"table\":\"uzytkownicy\"},{\"db\":\"r2is\",\"table\":\"zamowienia\"},{\"db\":\"r2is\",\"table\":\"kategorie\"},{\"db\":\"r2is\",\"table\":\"users\"}]');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Dumping data for table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'r2is', 'produkty', '[]', '2025-06-01 22:26:41');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2025-06-13 10:50:32', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"pl\"}');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indeksy dla tabeli `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indeksy dla tabeli `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indeksy dla tabeli `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indeksy dla tabeli `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indeksy dla tabeli `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indeksy dla tabeli `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indeksy dla tabeli `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indeksy dla tabeli `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indeksy dla tabeli `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indeksy dla tabeli `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indeksy dla tabeli `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indeksy dla tabeli `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indeksy dla tabeli `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indeksy dla tabeli `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indeksy dla tabeli `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indeksy dla tabeli `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indeksy dla tabeli `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `r2is`
--
CREATE DATABASE IF NOT EXISTS `r2is` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `r2is`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `produkty`
--

CREATE TABLE `produkty` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(255) DEFAULT NULL,
  `opis` text DEFAULT NULL,
  `cena` decimal(10,2) DEFAULT NULL,
  `kategoria` varchar(100) DEFAULT NULL,
  `obrazek` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `produkty`
--

INSERT INTO `produkty` (`id`, `nazwa`, `opis`, `cena`, `kategoria`, `obrazek`) VALUES
(1, 'Cylinder 50cc', 'Cylinder żeliwny 50cc do skutera 2T', 159.99, 'czesci_silnikowe', 'cylinder.jpg'),
(2, 'Pasek napędowy', 'Pasek napędowy 842x20 dla skutera 4T', 49.90, 'uklad_napedowy', 'pasek.jpg'),
(4, 'Tłok 12mm', 'Tłok do cylindra 50cc, sworzeń 12mm', 49.00, 'czesci_silnikowe', 'tlok.jpg'),
(5, 'Uszczelki silnika', 'Komplet uszczelek do skutera 2T', 19.99, 'czesci_silnikowe', 'uszczelki.jpg'),
(6, 'Zawory 4T', 'Komplet zaworów ssących i wydechowych', 79.90, 'czesci_silnikowe', 'zawory.jpg'),
(7, 'Wał korbowy', 'Wał korbowy do skutera 2T', 199.00, 'czesci_silnikowe', 'wal.jpg'),
(9, 'Sprzęgło kompletne 2T', 'Sprzęgło odśrodkowe do skutera 2T', 89.99, 'uklad_napedowy', 'sprzeglo.jpg'),
(10, 'Wariator tuningowy', 'Wariator sportowy do skutera', 109.00, 'uklad_napedowy', 'wariator.jpg'),
(11, 'Rolka wariatora 6g', 'Komplet rolek 6g 15x12mm', 24.00, 'uklad_napedowy', 'rolki.jpg'),
(13, 'Amortyzator tylny', 'Amortyzator tylny 330mm czerwony', 119.00, 'zawieszenie', 'amortyzator.jpg'),
(14, 'Łożyska główki ramy', 'Komplet łożysk główki ramy', 29.99, 'zawieszenie', 'lozyska.jpg'),
(16, 'Półka widelca', 'półka widelca przedniego skuter 2t', 179.00, 'zawieszenie', 'widelec.jpg'),
(18, 'Tarcza hamulcowa', 'Tarcza 190mm do skutera', 59.90, 'hamulce', 'tarcza_hamulcowa.jpg'),
(19, 'Klocki hamulcowe', 'Komplet klocków do hamulców tarczowych', 25.00, 'hamulce', 'klocki.jpg'),
(20, 'Linka hamulca', 'Linka hamulcowa tylna 1800mm', 14.99, 'hamulce', 'linka.jpg'),
(21, 'Pompa hamulcowa', 'Pompa hamulcowa prawa z klamką', 79.00, 'hamulce', 'pompa.jpg'),
(22, 'Płyn hamulcowy DOT4', 'Płyn 500ml do układów hamulcowych', 15.00, 'oleje_i_plyny', 'plyn.jpg'),
(23, 'Świeca zapłonowa NGK', 'Świeca do skutera 2T/4T', 15.90, 'elektryka', 'swieca.jpg'),
(24, 'Moduł CDI sport', 'CDI tuningowy bez ogranicznika', 49.90, 'elektryka', 'cdi.jpg'),
(25, 'Cewka zapłonowa', 'Cewka do zapłonu skutera', 35.00, 'elektryka', 'cewka.jpg'),
(26, 'Akumulator 12V 4Ah', 'Żelowy akumulator do skutera', 89.00, 'elektryka', 'akumulator.jpg'),
(27, 'Zestaw kabli', 'Komplet przewodów elektrycznych', 19.00, 'elektryka', 'kable.jpg'),
(28, 'Lampa przednia', 'Lampa główna do skutera', 69.90, 'nadwozie_i_plastiki', 'lampa.jpg'),
(29, 'Zestaw plastików', 'Plastiki boczne do skutera 2T', 199.00, 'nadwozie_i_plastiki', 'plastiki.jpg'),
(30, 'Owiewka przednia', 'Owiewka z szybą', 89.00, 'nadwozie_i_plastiki', 'owiewka.jpg'),
(31, 'Błotnik tylny', 'Plastikowy błotnik do skutera', 34.90, 'nadwozie_i_plastiki', 'blotnik.jpg'),
(32, 'Siedzenie', 'Tapicerowane siedzenie do skutera', 149.00, 'nadwozie_i_plastiki', 'siedzenie.jpg'),
(33, 'Felga aluminiowa 12\"', 'Felga do skutera 12 cali', 229.00, 'kola', 'felga.jpg'),
(34, 'Opona 120/70-12', 'Opona tylna szosowa', 139.00, 'opony', 'opona.jpg'),
(35, 'Dętka 12\"', 'Dętka 12 cali do skutera', 19.00, 'opony', 'detka.jpg'),
(36, 'Łożysko koła', 'Komplet łożysk przedniego koła', 29.90, 'kola', 'lozysko.jpg'),
(37, 'Zestaw osi', 'Oś przednia i tylna', 39.00, 'kola', 'os.jpg'),
(38, 'Lusterka sportowe', 'Para lusterek karbonowych', 49.90, 'akcesoria_i_tuning', 'lusterka.jpg'),
(39, 'Manetki sportowe', 'Gumowe manetki tuningowe', 24.00, 'akcesoria_i_tuning', 'manetki.jpg'),
(40, 'Tłumik sportowy', 'Sportowy tłumik do skutera 2T', 159.00, 'akcesoria_i_tuning', 'tlumik_sport.jpg'),
(41, 'Filtr stożkowy', 'Filtr powietrza stożkowy 28mm', 19.99, 'akcesoria_i_tuning', 'filtr.jpg'),
(42, 'DZWON SPRZĘGŁA + SZCZĘKI + WARIATOR SPORTOWY SKUTER 4T HIGH SPPED', 'ZESTAW TUNINGOWY DO SKUTERÓW 4T GY6 O POJEMNOŚCI 50 – 100 ccm', 249.60, 'akcesoria_i_tuning', 'zestaw_napedowy.jpg'),
(43, 'Olej 4T 10W40 1L', 'może być stosowany w motocyklach szosowych, miejskich, turystycznych, enduro, trialowych z silnikami 4-suwoywmi z zintegrowaną skrzynią biegów lub bez oraz mokrym lub suchym sprzęgłem.', 8.00, 'oleje_i_plyny', 'olej.jpg'),
(44, 'Kask Integralny Black Matt', 'Kask Integralny Black Matt powstał przede wszystkim po to, aby zapewnić Ci bezpieczeństwo podczas ekstremalnej jazdy. Po wprowadzeniu szeregu modyfikacji udało się stworzyć kask, który oferuje doskonałą aerodynamikę i aeroakustykę', 999.00, 'kask_integralny', 'Black_Matt.jpg'),
(45, 'Kask modułowy Genesis', 'Kask Genesis to arcydzieło nowoczesnej technologii, charakteryzujące się sportową elegancją i funkcjonalnością. Jego aerodynamiczna konstrukcja jest nie tylko atrakcyjna wizualnie, ale także pomaga poprawić osiągi.', 483.00, 'kask_modularny', 'genesis.jpg'),
(46, 'Kask integralny Enduro ', 'Kask Enduro oferuje mnogość zastosowanych technologii które podnoszą komfort i przyjemność z jazdy. Posiada zaawansowany i bardzo wydajny system wentylacji.', 620.00, 'kask_enduro', 'enduro.jpg'),
(47, 'Kask integralny Tiger', 'Wygodny kask do oferujący wysoki komfort podczas jazdy miejskiej, zapewnia podstawowy poziom ochrony i posiada lekko przyciemnianą, otwieraną szybkę.', 139.00, 'kask_integralny', 'tiger.jpg'),
(48, 'Kask Otwarty Groovy', 'Kask Otwarty Groovy jest wyjątkowo lekki, a przy tym wszystkim nie traci żadnych ze swoich właściwości odpowiedzialnych za wysoki poziom bezpieczeństwa oraz komfortu. Nie zwlekaj, wyposaż się w niego już dziś! Z pewnością przypadnie Ci do gustu.', 970.00, 'kask_otwarty', 'groovy.jpg'),
(49, 'Kask otwarty Milhelm', 'Milhelm to ikoniczny kask otwarty, łączący klasyczny styl z zaawansowanymi rozwiązaniami bezpieczeństwa, oferuje doskonałe dopasowanie i wszechstronność. Jego masywna konstrukcja i niebiesko-biała kolorystyka symbolizują władzę, porządek i ducha minionej epoki.', 149.00, 'kask_otwarty', 'mo.jpg'),
(50, 'Klucz do zaworów 3-10 mm ', 'wykonany ze stali, ułatwia regulacje zaworów o zakresie: 3-10 mm', 20.00, 'narzedzia', 'klucz_zaw.jpg\r\n'),
(51, 'Klucz dynamometryczny 1/2\'\' 42-210 Nm', 'Klucz wykonany jest ze stali chromowo wanadowej. co zapewnia jego trwałość i wytrzymałość. Posiada mechaniczny naciąg zapadki dynamometrycznej. która po osiągnięciu żądanej siły dokręcania przeskakuje o jeden ząbek.', 290.54, 'narzedzia', 'klucz_dyn.jpg'),
(53, 'Zestaw narzędziowy 222 pcs', 'Kompletny zestaw nasadek, końcówek wkrętakowych i innych akcesoriów 1/4″, 3/8″, 1/2″. 222 elementów.', 736.77, 'narzedzia', 'klucz_zestaw.jpg'),
(54, 'Turystyczny zestaw narzędzi', 'Narzędzia  do motocykla  51 części', 360.20, 'narzedzia', 'klucz_travel.jpg');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `login` varchar(50) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `haslo` varchar(300) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `imie` varchar(50) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `nazwisko` varchar(50) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `login`, `haslo`, `imie`, `nazwisko`, `email`, `status`) VALUES
(1, 'admin', '25d55ad283aa400af464c76d713c07ad', 'adam', 'administracyjny', 'admin@moto.pl', 1);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `produkty`
--
ALTER TABLE `produkty`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `produkty`
--
ALTER TABLE `produkty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
