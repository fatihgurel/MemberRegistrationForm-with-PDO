-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Anamakine: localhost
-- Üretim Zamanı: 28 Nis 2021, 21:58:55
-- Sunucu sürümü: 10.4.17-MariaDB
-- PHP Sürümü: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `memberRegistration`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `members`
--

CREATE TABLE `members` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_turkish_ci DEFAULT NULL,
  `ogrencino` int(11) DEFAULT NULL,
  `fakulte` varchar(255) COLLATE utf8mb4_turkish_ci DEFAULT NULL,
  `bolum` varchar(255) COLLATE utf8mb4_turkish_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_turkish_ci DEFAULT NULL,
  `telefon` varchar(20) COLLATE utf8mb4_turkish_ci DEFAULT NULL,
  `sinif` varchar(255) COLLATE utf8mb4_turkish_ci DEFAULT NULL,
  `komite` varchar(255) COLLATE utf8mb4_turkish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `members`
--

INSERT INTO `members` (`id`, `name`, `ogrencino`, `fakulte`, `bolum`, `email`, `telefon`, `sinif`, `komite`) VALUES
(1, 'Fatih Gürel', 123456789, 'Mühendislik Fakültesi', 'Bilgisayar Mühendisliği', 'example@gmail.com', '5112223344', '3.SINIF', 'O1'),
(2, 'Seyit Erdemir', 987654321, 'Mühendislik Fakültesi', 'Bilgisayar Mühendisliği', 'example1@gmail.com', '5221113344', '4.SINIF', 'O2');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `members`
--
ALTER TABLE `members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
