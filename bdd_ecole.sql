-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 28 oct. 2025 à 17:20
-- Version du serveur : 9.1.0
-- Version de PHP : 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bdd_ecole`
--

-- --------------------------------------------------------

--
-- Structure de la table `cours`
--

DROP TABLE IF EXISTS `cours`;
CREATE TABLE IF NOT EXISTS `cours` (
  `id_cours` int NOT NULL AUTO_INCREMENT,
  `nom_cours` varchar(255) NOT NULL,
  `desc_cours` text NOT NULL,
  `id_matiere` int NOT NULL,
  PRIMARY KEY (`id_cours`),
  KEY `id_matiere` (`id_matiere`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `cours`
--

INSERT INTO `cours` (`id_cours`, `nom_cours`, `desc_cours`, `id_matiere`) VALUES
(1, 'Installation et fonctionnement', '', 1),
(2, 'Bien démarrer en PHP', '', 1),
(3, 'Les variables et constantes', '', 1),
(4, 'Les conditions, les opérateurs et les boucles', '', 1),
(5, 'tableaux de données', '', 1),
(6, 'Variables prédéfinies et variables externes', '', 1),
(7, 'PHP et les formulaires', '', 1),
(8, 'Qu’est-ce qu’une base de données', '', 2),
(9, 'MySQL', '', 2),
(10, 'Premier script PHP-MySQL', '', 2),
(11, 'Les requêtes MySQL', '', 2),
(12, 'Les types de données MySQL', '', 2),
(13, 'Réalisation d’un site de contenu en base de données', '', 2),
(14, 'Les sessions', '', 2),
(15, 'Les cookies', '', 2),
(16, 'Recenser les informations du domaine étudié', '', 3),
(17, 'Organiser les données', '', 3),
(18, 'Construire l\'organisation physique des données', '', 3),
(19, 'Mettre en oeuvre les instructions de création, de modification et de suppression de base de données', '', 3),
(20, 'Mettre en oeuvre les instructions pour implémenter les contraintes et l\'optimisation des accès', '', 3),
(21, 'Ecrire et exécuter un script de création de base de données à l\'aide de l\'environnement intégré de développement', '', 3),
(22, 'Générer un script de création de la base de données à l\'aide de l\'outil de modélisation', '', 3),
(23, 'Elaborer des scripts d\'alimentation de la base de test', '', 3),
(24, 'Les avantages et inconvénients du relationnel et du non-relationnel', '', 3),
(25, 'Le langage de requête pour la base de données', '', 3),
(26, 'Outil de sauvegarde de base de données', '', 3);

-- --------------------------------------------------------

--
-- Structure de la table `devoirs`
--

DROP TABLE IF EXISTS `devoirs`;
CREATE TABLE IF NOT EXISTS `devoirs` (
  `id_devoir` int NOT NULL AUTO_INCREMENT,
  `nom_devoir` varchar(255) NOT NULL,
  `num_devoir` int NOT NULL,
  `desc_devoir` text NOT NULL,
  `id_cours` int NOT NULL,
  PRIMARY KEY (`id_devoir`),
  KEY `id_cours` (`id_cours`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `devoirs`
--

INSERT INTO `devoirs` (`id_devoir`, `nom_devoir`, `num_devoir`, `desc_devoir`, `id_cours`) VALUES
(1, 'Data', 4, 'Élaborer des scripts d\'alimentation de la base de test', 23);

-- --------------------------------------------------------

--
-- Structure de la table `eleves`
--

DROP TABLE IF EXISTS `eleves`;
CREATE TABLE IF NOT EXISTS `eleves` (
  `id_eleve` int NOT NULL AUTO_INCREMENT,
  `nom_eleve` varchar(45) DEFAULT NULL,
  `prenom_eleve` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_eleve`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `eleves`
--

INSERT INTO `eleves` (`id_eleve`, `nom_eleve`, `prenom_eleve`) VALUES
(1, 'Le Bon', 'Jean'),
(2, 'le Bref', 'Pépin'),
(3, 'Magne', 'Charles'),
(4, 'le Chauve', 'Charles'),
(5, 'Auguste', 'Philippe'),
(6, 'le Gros', 'Charles'),
(7, 'le Fainéant', 'Louis '),
(8, 'Capet', 'Hugues '),
(9, 'le Bel', 'Philippe '),
(10, 'le Grand', 'Henri '),
(19, 'Sandoz', 'Florian');

-- --------------------------------------------------------

--
-- Structure de la table `eleves_devoirs`
--

DROP TABLE IF EXISTS `eleves_devoirs`;
CREATE TABLE IF NOT EXISTS `eleves_devoirs` (
  `id_eleves_devoir` int NOT NULL AUTO_INCREMENT,
  `id_eleve` int NOT NULL,
  `id_devoir` int NOT NULL,
  `date_deb` date NOT NULL,
  `date_fin` date NOT NULL,
  PRIMARY KEY (`id_eleves_devoir`),
  UNIQUE KEY `unique_eleve_devoir` (`id_devoir`,`id_eleve`),
  KEY `id_eleve` (`id_eleve`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `eleves_devoirs`
--

INSERT INTO `eleves_devoirs` (`id_eleves_devoir`, `id_eleve`, `id_devoir`, `date_deb`, `date_fin`) VALUES
(1, 19, 1, '2025-10-28', '2025-10-28');

-- --------------------------------------------------------

--
-- Structure de la table `eleves_formations`
--

DROP TABLE IF EXISTS `eleves_formations`;
CREATE TABLE IF NOT EXISTS `eleves_formations` (
  `id_eleve_formation` int NOT NULL AUTO_INCREMENT,
  `id_eleve` int NOT NULL,
  `id_formation` int NOT NULL,
  `date_deb_formation` date DEFAULT NULL,
  `date_fin_formation` date DEFAULT NULL,
  PRIMARY KEY (`id_eleve_formation`),
  KEY `id_eleve` (`id_eleve`),
  KEY `id_formation` (`id_formation`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `eleves_formations`
--

INSERT INTO `eleves_formations` (`id_eleve_formation`, `id_eleve`, `id_formation`, `date_deb_formation`, `date_fin_formation`) VALUES
(1, 19, 1, '2023-09-07', '2026-09-08');

-- --------------------------------------------------------

--
-- Structure de la table `formations`
--

DROP TABLE IF EXISTS `formations`;
CREATE TABLE IF NOT EXISTS `formations` (
  `id_formation` int NOT NULL AUTO_INCREMENT,
  `nom_formation` varchar(150) NOT NULL,
  `desc_formation` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_formation`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `formations`
--

INSERT INTO `formations` (`id_formation`, `nom_formation`, `desc_formation`) VALUES
(1, 'Titre professionnel Développeur web et web mobile', 'description de la formation de développeur web et web mobile'),
(2, 'Webdesigner', 'description de la formation de webdesigner'),
(3, 'Integrateur-developpeur', 'description de la formation de integrateur-developpeur');

-- --------------------------------------------------------

--
-- Structure de la table `formations_matieres`
--

DROP TABLE IF EXISTS `formations_matieres`;
CREATE TABLE IF NOT EXISTS `formations_matieres` (
  `id_formation_matiere` int NOT NULL AUTO_INCREMENT,
  `id_formation` int NOT NULL,
  `id_matiere` int NOT NULL,
  `date_deb` date NOT NULL,
  `date_fin` date NOT NULL,
  PRIMARY KEY (`id_formation_matiere`),
  KEY `id_formation` (`id_formation`),
  KEY `id_matiere` (`id_matiere`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `formations_matieres`
--

INSERT INTO `formations_matieres` (`id_formation_matiere`, `id_formation`, `id_matiere`, `date_deb`, `date_fin`) VALUES
(1, 1, 3, '2025-10-01', '2025-12-01');

-- --------------------------------------------------------

--
-- Structure de la table `import_file`
--

DROP TABLE IF EXISTS `import_file`;
CREATE TABLE IF NOT EXISTS `import_file` (
  `COL 1` int DEFAULT NULL,
  `COL 2` varchar(49) DEFAULT NULL,
  `COL 3` varchar(61) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `import_file`
--

INSERT INTO `import_file` (`COL 1`, `COL 2`, `COL 3`) VALUES
(1, 'Titre professionnel Développeur web et web mobile', 'description de la formation de développeur web et web mobile'),
(2, 'Webdesigner', 'description de la formation de webdesigner'),
(3, 'Integrateur-developpeur', 'description de la formation de integrateur-developpeur');

-- --------------------------------------------------------

--
-- Structure de la table `matieres`
--

DROP TABLE IF EXISTS `matieres`;
CREATE TABLE IF NOT EXISTS `matieres` (
  `id_matiere` int NOT NULL AUTO_INCREMENT,
  `nom_matiere` varchar(155) NOT NULL,
  `desc_matiere` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_matiere`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `matieres`
--

INSERT INTO `matieres` (`id_matiere`, `nom_matiere`, `desc_matiere`) VALUES
(1, 'PHP initiation', ''),
(2, 'PHP intermédiaire', ''),
(3, 'Gérer une base de données', '');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `cours`
--
ALTER TABLE `cours`
  ADD CONSTRAINT `cours_ibfk_1` FOREIGN KEY (`id_matiere`) REFERENCES `matieres` (`id_matiere`);

--
-- Contraintes pour la table `devoirs`
--
ALTER TABLE `devoirs`
  ADD CONSTRAINT `devoirs_ibfk_1` FOREIGN KEY (`id_cours`) REFERENCES `cours` (`id_cours`);

--
-- Contraintes pour la table `eleves_devoirs`
--
ALTER TABLE `eleves_devoirs`
  ADD CONSTRAINT `eleves_devoirs_ibfk_1` FOREIGN KEY (`id_eleve`) REFERENCES `eleves` (`id_eleve`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `eleves_devoirs_ibfk_2` FOREIGN KEY (`id_devoir`) REFERENCES `devoirs` (`id_devoir`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `eleves_formations`
--
ALTER TABLE `eleves_formations`
  ADD CONSTRAINT `eleves_formations_ibfk_1` FOREIGN KEY (`id_eleve`) REFERENCES `eleves` (`id_eleve`),
  ADD CONSTRAINT `eleves_formations_ibfk_2` FOREIGN KEY (`id_formation`) REFERENCES `formations` (`id_formation`);

--
-- Contraintes pour la table `formations_matieres`
--
ALTER TABLE `formations_matieres`
  ADD CONSTRAINT `formations_matieres_ibfk_1` FOREIGN KEY (`id_formation`) REFERENCES `formations` (`id_formation`),
  ADD CONSTRAINT `formations_matieres_ibfk_2` FOREIGN KEY (`id_matiere`) REFERENCES `matieres` (`id_matiere`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
