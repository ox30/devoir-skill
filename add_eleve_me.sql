-- Script pour m'ajouter moi en tant qu'élèves dans mon cas je suis le 19ème de ma bdd:
INSERT INTO eleves (nom_eleve, prenom_eleve) VALUES
('Sandoz', 'Florian');
SELECT id_eleve
INTO @eleve_id
FROM eleves
WHERE nom_eleve = 'Sandoz' AND prenom_eleve = 'Florian'
LIMIT 1;

-- liaison avec la formation
INSERT INTO eleves_formations (id_eleve, id_formation, date_deb_formation, date_fin_formation) VALUES
(@eleve_id, '1', '2023-09-07', '2026-09-08');

-- liaison de la formation avec la matière selon mon cas (Dev_web_mobile avec Gérer une base de données)
SELECT id_formation
INTO @formation_id
FROM formations
WHERE nom_formation = 'Titre professionnel Développeur web et web mobile'
LIMIT 1;

SELECT id_matiere
INTO @matiere_id
FROM matieres
WHERE nom_matiere = 'Gérer une base de données'
LIMIT 1;


INSERT INTO formations_matieres (id_formation, id_matiere, date_deb, date_fin ) VALUES
(@formation_id, @matiere_id, '2025-10-01', '2025-12-01');

-- Ajout du devoir
INSERT INTO devoirs (nom_devoir, num_devoir, desc_devoir, id_cours) VALUES
('Data', '8', "Élaborer des scripts d'alimentation de la base de test", '23');
SET @devoir_id := LAST_INSERT_ID();

-- Création de la Table relationnel eleves_devoirs
CREATE TABLE IF NOT EXISTS `bdd_ecole`.`eleves_devoirs` (
  `id_eleves_devoir` int NOT NULL AUTO_INCREMENT,
  `id_eleve` int NOT NULL,
  `id_devoir` int NOT NULL,
  `date_deb` date NOT NULL,
  `date_fin` date NOT NULL,
  PRIMARY KEY (`id_eleves_devoir`),
  UNIQUE KEY `unique_eleve_devoir` (`id_devoir`,`id_eleve`),
  KEY `id_eleve` (`id_eleve`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;;

-- Insértion de mon couple élèves_devoir
INSERT INTO eleves_devoirs (id_eleve, id_devoir, date_deb, date_fin) VALUES
(@eleve_id, @devoir_id, '2025-10-28', '2025-10-28');