-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Cze 14, 2025 at 06:49 PM
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
('root', '{\"angular_direct\":\"direct\",\"relation_lines\":\"true\",\"snap_to_grid\":\"off\"}');

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
('root', '[{\"db\":\"r2is\",\"table\":\"kategoria\"},{\"db\":\"r2is\",\"table\":\"czesci\"},{\"db\":\"r2is\",\"table\":\"uzytkownik\"},{\"db\":\"r2is\",\"table\":\"promocje\"},{\"db\":\"r2is\",\"table\":\"pozycje_zamowienia\"},{\"db\":\"r2is\",\"table\":\"pozycje_koszyk\"},{\"db\":\"r2is\",\"table\":\"koszyk\"},{\"db\":\"r2is\",\"table\":\"adres\"},{\"db\":\"r2is\",\"table\":\"zamowienia\"},{\"db\":\"r2is\",\"table\":\"produkty\"}]');

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
('root', '2025-06-14 16:33:45', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"pl\"}');

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
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

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
CREATE DATABASE IF NOT EXISTS `r2is` DEFAULT CHARACTER SET utf8 COLLATE utf8_polish_ci;
USE `r2is`;

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
(14, 'Łożyska główki ramy', 'Komplet łożysk główki ramy', 29.99, 'lozyska.jpg', 10, 10, 0),
(15, 'Amortyzator tylny', 'Amortyzator tylny 330mm czerwony', 119.00, 'amortyzator.jpg', 10, 15, 0),
(16, 'Półka widelca', 'półka widelca przedniego skuter 2t', 179.00, 'widelec.jpg', 10, 10, 0),
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
(37, 'Zestaw osi', 'Oś przednia i tylna', 39.00, 'os.jpg', 10, 9, 0),
(46, 'Lusterka sportowe', 'Para lusterek karbonowych', 49.90, 'lusterka.jpg', 10, 1, 0),
(47, 'Manetki sportowe', 'Gumowe manetki tuningowe', 24.00, 'manetki.jpg', 10, 1, 0),
(48, 'Tłumik sportowy', 'Sportowy tłumik do skutera 2T', 159.00, 'tlumik_sport.jpg', 10, 1, 0),
(49, 'Filtr stożkowy', 'Filtr powietrza stożkowy 28mm', 19.99, 'filtr.jpg', 10, 1, 0),
(50, 'DZWON SPRZĘGŁA + SZCZĘKI + WARIATOR SPORTOWY SKUTER 4T HIGH SPPED', 'ZESTAW TUNINGOWY DO SKUTERÓW 4T GY6 O POJEMNOŚCI 50 – 100 ccm', 249.60, 'zestaw_napedowy.jpg', 10, 1, 0),
(51, 'Olej 4T 10W40 1L', 'może być stosowany w motocyklach szosowych, miejskich, turystycznych, enduro, trialowych z silnikami 4-suwoywmi z zintegrowaną skrzynią biegów lub bez oraz mokrym lub suchym sprzęgłem.', 8.00, 'olej.jpg', 10, 12, 0),
(52, 'Kask Integralny Black Matt', 'Kask Integralny Black Matt powstał przede wszystkim po to, aby zapewnić Ci bezpieczeństwo podczas ekstremalnej jazdy. Po wprowadzeniu szeregu modyfikacji udało się stworzyć kask, który oferuje doskonałą aerodynamikę i aeroakustykę', 999.00, 'Black_Matt.jpg', 10, 6, 0),
(53, 'Kask modułowy Genesis', 'Kask Genesis to arcydzieło nowoczesnej technologii, charakteryzujące się sportową elegancją i funkcjonalnością. Jego aerodynamiczna konstrukcja jest nie tylko atrakcyjna wizualnie, ale także pomaga poprawić osiągi.', 483.00, 'genesis.jpg', 10, 7, 0),
(54, 'Kask integralny Enduro ', 'Kask Enduro oferuje mnogość zastosowanych technologii które podnoszą komfort i przyjemność z jazdy. Posiada zaawansowany i bardzo wydajny system wentylacji.', 620.00, 'enduro.jpg', 10, 5, 0),
(55, 'Kask integralny Tiger', 'Wygodny kask do oferujący wysoki komfort podczas jazdy miejskiej, zapewnia podstawowy poziom ochrony i posiada lekko przyciemnianą, otwieraną szybkę.', 139.00, 'tiger.jpg', 10, 6, 0),
(56, 'Kask Otwarty Groovy', 'Kask Otwarty Groovy jest wyjątkowo lekki, a przy tym wszystkim nie traci żadnych ze swoich właściwości odpowiedzialnych za wysoki poziom bezpieczeństwa oraz komfortu. Nie zwlekaj, wyposaż się w niego już dziś! Z pewnością przypadnie Ci do gustu.', 970.00, 'groovy.jpg', 10, 8, 0),
(57, 'Kask otwarty Milhelm', 'Milhelm to ikoniczny kask otwarty, łączący klasyczny styl z zaawansowanymi rozwiązaniami bezpieczeństwa, oferuje doskonałe dopasowanie i wszechstronność. Jego masywna konstrukcja i niebiesko-biała kolorystyka symbolizują władzę, porządek i ducha minionej epoki.', 149.00, 'mo.jpg', 10, 8, 0),
(58, 'Klucz do zaworów 3-10 mm ', 'wykonany ze stali, ułatwia regulacje zaworów o zakresie: 3-10 mm', 20.00, 'klucz_zaw.jpg', 10, 11, 0),
(59, 'Klucz dynamometryczny 1/2\'\' 42-210 Nm', 'Klucz wykonany jest ze stali chromowo wanadowej. co zapewnia jego trwałość i wytrzymałość. Posiada mechaniczny naciąg zapadki dynamometrycznej. która po osiągnięciu żądanej siły dokręcania przeskakuje o jeden ząbek.', 290.54, 'klucz_dyn.jpg', 10, 11, 0),
(60, 'Zestaw narzędziowy 222 pcs', 'Kompletny zestaw nasadek, końcówek wkrętakowych i innych akcesoriów 1/4″, 3/8″, 1/2″. 222 elementów.', 736.77, 'klucz_zestaw.jpg', 10, 11, 0),
(61, 'Turystyczny zestaw narzędzi', 'Narzędzia  do motocykla  51 części', 360.20, 'klucz_travel.jpg', 10, 11, 0);

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
(14, 'uklad_napedowy'),
(15, 'zawieszenie');

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

--
-- Dumping data for table `promocje`
--

INSERT INTO `promocje` (`id_promocja`, `id_czesci`, `znizka_procent`) VALUES
(1, 1, 10),
(2, 7, 10);

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
(1, 'admin', 'admin', 'admin', 'admin@admin.admin', '21232f297a57a5a743894a0e4a801fc3', '1'),
(2, 'rafal', '', '', 'waf@raf.pl', '35aae02cc4b1b9c9aee4d7c892309bef', ''),
(3, 'Ola', '', '', 'ola@ola.pl', '$2y$10$zyKMNWLUAeVPFYCGYpe0L.bScGeaE5NvwE.SghFkOOynTljG95VSq', ''),
(4, 'Olek', '', '', 'olek@olek.pl', '$2y$10$fIvkHl6d5fnsaxK4Qa575eJb9hHp68BC2rdVdpa97nlb8KnHpWt7a', '');

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
  MODIFY `id_czesci` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `kategoria`
--
ALTER TABLE `kategoria`
  MODIFY `id_kategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

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
  MODIFY `id_promocja` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `uzytkownik`
--
ALTER TABLE `uzytkownik`
  MODIFY `id_uzytkownik` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
