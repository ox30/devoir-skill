-- Script de création de table import_file générer par MySQL avec l'outil d'import
CREATE TABLE IF NOT EXISTS `bdd_ecole`.`import_file` 
(`COL 1` int(1), `COL 2` varchar(49), `COL 3` varchar(61))
DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;;


-- Script d'alimentation générer par l'outil d'import MySQL
INSERT INTO `bdd_ecole`.`import_file` (`COL 1`, `COL 2`, `COL 3`) 
VALUES (1, 'Titre professionnel Développeur web et web mobile', 'description de la formation de développeur web et web mobile '), 
(2, 'Webdesigner', 'description de la formation de webdesigner '), 
(3, 'Integrateur-developpeur', ' description de la formation de integrateur-developpeur ');;

