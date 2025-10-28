-- Script pour m'ajouter moi en tant qu'élève:
INSERT INTO eleves (nom_eleve, prenom_eleve) VALUES
('Sandoz', 'Florian');
-- Enregistrement de l'id_eleve dans une variable.
SELECT id_eleve
INTO @id_eleve
FROM eleves
WHERE nom_eleve = 'Sandoz' AND prenom_eleve = 'Florian'
LIMIT 1;

-- Récupération de la formation
SELECT id_formation
INTO @id_formation
FROM formations
WHERE nom_formation = 'Titre professionnel Développeur web et web mobile'
LIMIT 1;

-- liaison élève avec la formation
INSERT INTO eleves_formations (id_eleve, id_formation, date_deb_formation, date_fin_formation) VALUES
(@id_eleve, @id_formation, '2023-09-07', '2026-09-08');

-- liaison de la formation avec la matière selon mon cas (Dev_web_mobile avec Gérer une base de données)
-- Récupération de la matière
SELECT id_matiere
INTO @id_matiere
FROM matieres
WHERE nom_matiere = 'Gérer une base de données'
LIMIT 1;

INSERT INTO formations_matieres (id_formation, id_matiere, date_deb, date_fin ) VALUES
(@id_formation, @id_matiere, '2025-10-01', '2025-12-01');

-- Ajout du devoir et insertion en varible de celui-ci (Fonctionne quand on veut bien le dernier devoir créé.) 
-- Sinon on peut aussi l'enregistrer en variable (comme avec @id_eleve par exemple) mais je voulais essayer autrement.
INSERT INTO devoirs (nom_devoir, num_devoir, desc_devoir, id_cours) VALUES
('Data', '8', "Élaborer des scripts d'alimentation de la base de test", '23');
SET @id_devoir := LAST_INSERT_ID();

-- Création de la Table relationnel eleves_devoirs
CREATE TABLE IF NOT EXISTS eleves_devoirs (
  id_eleves_devoir INT NOT NULL AUTO_INCREMENT,
  id_eleve  INT NOT NULL,
  id_devoir INT NOT NULL,
  date_deb  DATE NOT NULL,
  date_fin  DATE NOT NULL,
  PRIMARY KEY (id_eleves_devoir),
  UNIQUE KEY unique_eleve_devoir (id_devoir, id_eleve),
  KEY idx_ed_eleve (id_eleve),
  CONSTRAINT fk_ed_eleve  FOREIGN KEY (id_eleve)  REFERENCES eleves(id_eleve)  ON DELETE CASCADE,
  CONSTRAINT fk_ed_devoir FOREIGN KEY (id_devoir) REFERENCES devoirs(id_devoir) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- 0) Élève : réutiliser si déjà présent, sinon créer
SELECT id_eleve INTO @eleve_id
FROM eleves
WHERE nom_eleve='Sandoz' AND prenom_eleve='Florian'
LIMIT 1;

INSERT INTO eleves (nom_eleve, prenom_eleve)
SELECT 'Sandoz','Florian'
WHERE @eleve_id IS NULL;

SET @eleve_id := COALESCE(@eleve_id, LAST_INSERT_ID());

-- 1) Récupérer formation & matière par leurs noms
SELECT id_formation INTO @id_formation
FROM formations
WHERE nom_formation='Titre professionnel Développeur web et web mobile'
LIMIT 1;

SELECT id_matiere INTO @id_matiere
FROM matieres
WHERE nom_matiere='Gérer une base de données'
LIMIT 1;

-- 2) Lier élève -> formation (évite doublon)
INSERT INTO eleves_formations (id_eleve, id_formation, date_deb_formation, date_fin_formation)
SELECT @eleve_id, @id_formation, '2023-09-07', '2026-09-08'
WHERE @id_formation IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM eleves_formations
    WHERE id_eleve=@eleve_id AND id_formation=@id_formation
  );

-- 3) Lier formation -> matière (évite doublon)
INSERT INTO formations_matieres (id_formation, id_matiere, date_deb, date_fin)
SELECT @id_formation, @id_matiere, '2025-10-01', '2025-12-01'
WHERE @id_formation IS NOT NULL AND @id_matiere IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM formations_matieres
    WHERE id_formation=@id_formation AND id_matiere=@id_matiere
  );

-- 4) Devoir "Data" n°8 : réutiliser ou créer
SELECT id_devoir INTO @id_devoir
FROM devoirs
WHERE nom_devoir='Data' AND num_devoir=4
LIMIT 1;

INSERT INTO devoirs (nom_devoir, num_devoir, desc_devoir, id_cours)
SELECT 'Data', 4, 'Élaborer des scripts d''alimentation de la base de test', 23
WHERE @id_devoir IS NULL;

SET @id_devoir := COALESCE(@id_devoir, LAST_INSERT_ID());

-- 5) Création de la Table relationnel eleves_devoirs
CREATE TABLE IF NOT EXISTS eleves_devoirs (
  id_eleves_devoir INT NOT NULL AUTO_INCREMENT,
  id_eleve  INT NOT NULL,
  id_devoir INT NOT NULL,
  date_deb  DATE NOT NULL,
  date_fin  DATE NOT NULL,
  PRIMARY KEY (id_eleves_devoir),
  UNIQUE KEY unique_eleve_devoir (id_devoir, id_eleve),
  KEY idx_ed_eleve (id_eleve),
  CONSTRAINT fk_ed_eleve  FOREIGN KEY (id_eleve)  REFERENCES eleves(id_eleve)  ON DELETE CASCADE,
  CONSTRAINT fk_ed_devoir FOREIGN KEY (id_devoir) REFERENCES devoirs(id_devoir) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 6) Élève -> devoir (évite doublon via UNIQUE(id_devoir,id_eleve))
INSERT INTO eleves_devoirs (id_eleve, id_devoir, date_deb, date_fin)
SELECT @eleve_id, @id_devoir, '2025-10-28', '2025-10-28'
WHERE NOT EXISTS (
  SELECT 1 FROM eleves_devoirs
  WHERE id_eleve=@eleve_id AND id_devoir=@id_devoir
);

COMMIT;
