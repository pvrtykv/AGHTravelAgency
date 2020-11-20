-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 16 Cze 2020, 22:36
-- Wersja serwera: 10.4.11-MariaDB
-- Wersja PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `travel_agency`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `booking`
--

CREATE TABLE `booking` (
  `id` int(11) NOT NULL,
  `offer_id` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `payment_deadline` date NOT NULL,
  `payment_time` date NOT NULL,
  `paid` tinyint(1) NOT NULL,
  `client_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `phone_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `client`
--

INSERT INTO `client` (`id`, `full_name`, `phone_number`) VALUES
(1, 'John Smith', 555123404),
(2, 'Anna Nowak', 123456789);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `country`
--

INSERT INTO `country` (`id`, `name`) VALUES
(1, 'Italy'),
(2, 'England'),
(3, 'France'),
(4, 'Spain');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `hotel`
--

CREATE TABLE `hotel` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `stars` enum('0','1','2','3','4','5') NOT NULL,
  `location_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `hotel`
--

INSERT INTO `hotel` (`id`, `name`, `stars`, `location_id`) VALUES
(2, 'Ant Hostel', '0', 7),
(3, 'Kings Cross Hotel', '4', 4),
(4, 'King Solomon Hotel', '3', 4),
(5, 'Bianca Maria Palace Hotel City', '4', 1),
(6, '43 Station Hotel', '3', 1),
(7, 'Four Seasons Hotel Firenze', '5', 2),
(8, 'Hotel Jane', '3', 2),
(9, 'Playa Sol Costa Brava', '2', 8),
(10, 'Hotel Diana', '4', 8),
(11, 'Locarno', '3', 6),
(12, 'Hôtel Jeanne d\'Arc Le Marais', '2', 5),
(13, 'Holiday Inn Paris Notre Dame', '4', 5);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `hotel_service`
--

CREATE TABLE `hotel_service` (
  `id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `room_type_id` int(11) NOT NULL,
  `days_of_stay` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `location`
--

CREATE TABLE `location` (
  `id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `city_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `location`
--

INSERT INTO `location` (`id`, `country_id`, `city_name`) VALUES
(1, 1, 'Milan'),
(2, 1, 'Florence'),
(3, 1, 'Roma'),
(4, 2, 'London'),
(5, 3, 'Paris'),
(6, 3, 'Nice'),
(7, 4, 'Barcelona'),
(8, 4, 'Lloret de Mar');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `offer`
--

CREATE TABLE `offer` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `location_id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `departure_date` date NOT NULL,
  `return_date` date NOT NULL,
  `trip_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `offer`
--

INSERT INTO `offer` (`id`, `name`, `location_id`, `hotel_id`, `departure_date`, `return_date`, `trip_price`) VALUES
(1, 'Wakacje w Mediolanie', 1, 6, '2020-08-01', '2020-08-08', 2000),
(2, 'Włoska stolica mody', 1, 5, '2020-08-07', '2020-08-14', 2300),
(3, 'Podróż do Florencji', 2, 8, '2020-07-24', '2020-07-27', 1700),
(4, 'Zwiedzanie Londynu', 4, 3, '2020-08-21', '2020-08-28', 2000),
(5, 'Miasto zakochanych', 5, 12, '2020-08-15', '2020-08-19', 1500),
(6, 'Zwiedzanie Paryża', 5, 13, '2020-07-03', '2020-07-10', 2000),
(7, 'Wycieczka do Nicei', 6, 11, '2020-08-14', '2020-08-19', 1500),
(8, 'Zwiedzanie Barcelony', 7, 2, '2020-09-01', '2020-09-09', 1200),
(9, 'Beztroski wypoczynek', 8, 10, '2020-07-01', '2020-07-11', 2200),
(10, 'Plażowanie w Hiszpanii', 8, 9, '2020-07-16', '2020-07-23', 1900);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `room_type`
--

CREATE TABLE `room_type` (
  `id` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `name` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `room_type`
--

INSERT INTO `room_type` (`id`, `type`, `name`) VALUES
(1, 'single', 'one single bed'),
(2, 'double', 'two single beds'),
(3, 'double', 'one double bed'),
(4, 'double', 'one bunk bed'),
(5, 'triple', 'three single beds'),
(6, 'triple', 'one bunk bed and one single bed '),
(7, 'triple', 'one double bed and one single bed');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `transport_service`
--

CREATE TABLE `transport_service` (
  `id` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `origin_city_name` varchar(20) NOT NULL,
  `location_id` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `transport_service`
--

INSERT INTO `transport_service` (`id`, `type`, `origin_city_name`, `location_id`, `price`) VALUES
(1, 'plane', 'Cracow', 7, 500);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `offer_id` (`offer_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indeksy dla tabeli `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `location_id` (`location_id`);

--
-- Indeksy dla tabeli `hotel_service`
--
ALTER TABLE `hotel_service`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hotel_id` (`hotel_id`),
  ADD KEY `booking_id` (`booking_id`),
  ADD KEY `room_type_id` (`room_type_id`);

--
-- Indeksy dla tabeli `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_id` (`country_id`);

--
-- Indeksy dla tabeli `offer`
--
ALTER TABLE `offer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hotel_id` (`hotel_id`),
  ADD KEY `location_id` (`location_id`);

--
-- Indeksy dla tabeli `room_type`
--
ALTER TABLE `room_type`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `transport_service`
--
ALTER TABLE `transport_service`
  ADD PRIMARY KEY (`id`),
  ADD KEY `location_id` (`location_id`);

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`offer_id`) REFERENCES `offer` (`id`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`);

--
-- Ograniczenia dla tabeli `hotel`
--
ALTER TABLE `hotel`
  ADD CONSTRAINT `hotel_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`);

--
-- Ograniczenia dla tabeli `hotel_service`
--
ALTER TABLE `hotel_service`
  ADD CONSTRAINT `hotel_service_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`),
  ADD CONSTRAINT `hotel_service_ibfk_2` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`),
  ADD CONSTRAINT `hotel_service_ibfk_3` FOREIGN KEY (`room_type_id`) REFERENCES `room_type` (`id`);

--
-- Ograniczenia dla tabeli `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `location_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`);

--
-- Ograniczenia dla tabeli `offer`
--
ALTER TABLE `offer`
  ADD CONSTRAINT `offer_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`),
  ADD CONSTRAINT `offer_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`);

--
-- Ograniczenia dla tabeli `transport_service`
--
ALTER TABLE `transport_service`
  ADD CONSTRAINT `transport_service_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
