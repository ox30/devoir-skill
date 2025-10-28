-- nettoyage des champs
UPDATE import_file
SET 
  `COL 1` = TRIM(`COL 1`),
  `COL 2` = TRIM(`COL 2`),
  `COL 3` = TRIM(`COL 3`);


-- Créer la table formations si  n'existe pas
CREATE TABLE IF NOT EXISTS formations (
  id_formation INT PRIMARY KEY,
  nom_formation VARCHAR(255) NOT NULL,
  desc_formation TEXT NOT NULL
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;


-- transfère des données dans la table formation
INSERT INTO formations (id_formation, nom_formation, desc_formation)
SELECT 
  `COL 1` AS id_formation,
  `COL 2` AS nom_formation,
  `COL 3` AS desc_formation
FROM import_file
WHERE TRIM(`COL 1`) <> ''
ON DUPLICATE KEY UPDATE
  nom_formation = VALUES(nom_formation),
  desc_formation = VALUES(desc_formation);


-- Vérifier doublons ou anomalies
SELECT `COL 1`, COUNT(*) AS doublons
FROM import_file
GROUP BY `COL 1`
HAVING doublons > 1;


-- Suppression de la table import_file
DROP TABLE import_file;