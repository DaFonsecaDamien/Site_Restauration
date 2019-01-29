-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mer. 12 déc. 2018 à 16:23
-- Version du serveur :  5.7.23
-- Version de PHP :  7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `restauration`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Tous les Menus'),
(2, 'Menus Salades'),
(3, 'Menus burgers'),
(4, 'Menus Pizza'),
(5, 'Menus Authentiques');

-- --------------------------------------------------------

--
-- Structure de la table `contact`
--

DROP TABLE IF EXISTS `contact`;
CREATE TABLE IF NOT EXISTS `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(25) COLLATE utf8_bin NOT NULL,
  `email` varchar(30) COLLATE utf8_bin NOT NULL,
  `num_telephone` int(10) NOT NULL,
  `message` text COLLATE utf8_bin NOT NULL,
  `date_contact` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `contact`
--

INSERT INTO `contact` (`id`, `nom`, `email`, `num_telephone`, `message`, `date_contact`) VALUES
(1, 'SALUT', 'qzd@qzd.com', 10101010, 'qzdqzdqz', '2018-12-12'),
(2, 'qzd', 'qzd@qzd.qzd', 1100101, 'qzdqzd', '2018-12-12');

-- --------------------------------------------------------

--
-- Structure de la table `informations`
--

DROP TABLE IF EXISTS `informations`;
CREATE TABLE IF NOT EXISTS `informations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom` varchar(20) COLLATE utf8_bin NOT NULL,
  `prenom` varchar(20) COLLATE utf8_bin NOT NULL,
  `date_naissance` date NOT NULL,
  `adresse` varchar(40) COLLATE utf8_bin NOT NULL,
  `mail` varchar(20) COLLATE utf8_bin NOT NULL,
  `telephone` varchar(10) COLLATE utf8_bin NOT NULL,
  `password` varchar(20) COLLATE utf8_bin NOT NULL,
  `permissions` varchar(5) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `informations`
--

INSERT INTO `informations` (`id`, `nom`, `prenom`, `date_naissance`, `adresse`, `mail`, `telephone`, `password`, `permissions`) VALUES
(1, 'Admin', 'Admin', '2018-12-10', '44 rue de l', 'admin@admin', '0101010101', 'admin', 'ADMIN'),
(2, 'Mohamed', 'Cmoio', '2018-12-10', '12 rue des potiers', 'Hello@Cmoi', '0201040506', 'Momo123', 'GUEST'),
(3, 'Yo', 'Yoyo', '2018-12-13', '74 rue du YO', 'Yo@hotmail.com', '0654847121', 'Yo123', 'GUEST');

-- --------------------------------------------------------

--
-- Structure de la table `items`
--

DROP TABLE IF EXISTS `items`;
CREATE TABLE IF NOT EXISTS `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `image` varchar(255) NOT NULL,
  `category` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category` (`category`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `items`
--

INSERT INTO `items` (`id`, `name`, `description`, `price`, `image`, `category`) VALUES
(1, 'Menu Classic', 'Sandwich: Burger, Salade, Tomate, Cornichon + Frites + Boisson', 8.9, 'm1.png', 1),
(7, 'Classic', 'Sandwich: Burger, Salade, Tomate, Cornichon', 5.9, 'b1.png', 2),
(13, 'Frites', 'Pommes de terre frites', 3.9, 's1.png', 3),
(18, 'CÃ©sar Poulet PanÃ©', 'Poulet PanÃ©, Salade, Tomate et la fameuse sauce CÃ©sar', 8.9, 'sa1.png', 1),
(26, 'Fanta', 'Au choix: Petit, Moyen ou Grand', 1.9, 'bo4.png', 5),
(36, 'Faaaaa', 'Bonjour', 5, '', 2);

-- --------------------------------------------------------

--
-- Structure de la table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
CREATE TABLE IF NOT EXISTS `reservations` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom` varchar(25) COLLATE utf8_bin NOT NULL,
  `mail` varchar(30) COLLATE utf8_bin NOT NULL,
  `personne` int(2) NOT NULL,
  `date_res` date NOT NULL,
  `menu_id` varchar(25) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`category`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
