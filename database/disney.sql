-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         5.7.33 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para disney
CREATE DATABASE IF NOT EXISTS `disney` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `disney`;

-- Volcando estructura para tabla disney.characters
CREATE TABLE IF NOT EXISTS `characters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `age` varchar(50) DEFAULT NULL,
  `weight` varchar(50) DEFAULT NULL,
  `history` varchar(50) DEFAULT NULL,
  `movie_id` int(11) DEFAULT NULL,
  `image` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_characters_movies` (`movie_id`) USING BTREE,
  CONSTRAINT `FK_characters_movies` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla disney.characters: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
INSERT INTO `characters` (`id`, `name`, `age`, `weight`, `history`, `movie_id`, `image`) VALUES
	(1, 'Elsa', '21', NULL, 'Reina de Arendelle', 1, 'https://upload.wikimedia.org/wikipedia/en/5/5e/Elsa_from_Disney%27s_Frozen.png'),
	(2, 'Elsa', '24', NULL, 'Reina de Arendelle', 2, 'https://upload.wikimedia.org/wikipedia/en/5/5e/Elsa_from_Disney%27s_Frozen.png'),
	(3, 'Kristoff', NULL, NULL, 'Hombre de la montaña', 1, 'https://upload.wikimedia.org/wikipedia/en/2/2e/Kristoff_Bjorgman.png');
/*!40000 ALTER TABLE `characters` ENABLE KEYS */;

-- Volcando estructura para tabla disney.genere
CREATE TABLE IF NOT EXISTS `genere` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `movie` int(11) DEFAULT NULL,
  `image` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_genere_movies` (`movie`) USING BTREE,
  CONSTRAINT `FK_genere_movies` FOREIGN KEY (`movie`) REFERENCES `movies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla disney.genere: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `genere` DISABLE KEYS */;
INSERT INTO `genere` (`id`, `name`, `movie`, `image`) VALUES
	(1, 'Animation', 1, 'https://en.wikipedia.org/wiki/Walt_Disney#/media/File:Walt_Disney_1946.JPG'),
	(2, 'Animation', 2, 'https://en.wikipedia.org/wiki/Walt_Disney#/media/File:Walt_Disney_1946.JPG');
/*!40000 ALTER TABLE `genere` ENABLE KEYS */;

-- Volcando estructura para tabla disney.movies
CREATE TABLE IF NOT EXISTS `movies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `created` varchar(50) DEFAULT NULL,
  `rating` int(1) DEFAULT NULL,
  `character_id` int(11) DEFAULT NULL,
  `image` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_movies_characters` (`character_id`) USING BTREE,
  CONSTRAINT `FK_movies_characters` FOREIGN KEY (`character_id`) REFERENCES `characters` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla disney.movies: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` (`id`, `title`, `created`, `rating`, `character_id`, `image`) VALUES
	(1, 'Frozen', '2013', 4, 1, 'https://en.wikipedia.org/wiki/Frozen_(2013_film)#/media/File:Frozen_(2013_film)_poster.jpg'),
	(2, 'Frozen 2', '2019', 4, 1, 'https://en.wikipedia.org/wiki/Frozen_II#/media/File:Frozen_2_poster.jpg'),
	(3, 'Frozen', '2013', 4, 3, 'https://en.wikipedia.org/wiki/Frozen_(2013_film)#/media/File:Frozen_(2013_film)_poster.jpg');
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;

-- Volcando estructura para tabla disney.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(64) NOT NULL,
  `createdAt` timestamp NOT NULL,
  `updatedAt` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla disney.users: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `username`, `password`, `createdAt`, `updatedAt`) VALUES
	(1, 'user1', '$2b$10$G5RVHb122gszOgRR0pP71u.hi2rF1BGXnYXXPs7qE7jMtcSGxDWbG', '2021-10-16 12:12:44', '2021-10-16 12:12:44');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
