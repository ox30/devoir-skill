-- code SQL générer depuis le fichier Excel pour matieres
INSERT INTO matieres (id_matiere, nom_matiere, desc_matiere) VALUES
('1','PHP initiation',''),
('2','PHP intermédiaire',''),
('3','Gérer une base de données','');
COMMIT;


-- code SQL générer depuis le fichier Excel pour cours
INSERT INTO cours (id_cours, nom_cours, desc_cours, id_matiere) VALUES
('1',"Installation et fonctionnement",'','1'),
('2',"Bien démarrer en PHP",'','1'),
('3',"Les variables et constantes",'','1'),
('4',"Les conditions, les opérateurs et les boucles",'','1'),
('5',"tableaux de données",'','1'),
('6',"Variables prédéfinies et variables externes",'','1'),
('7',"PHP et les formulaires",'','1'),
('8',"Qu’est-ce qu’une base de données",'','2'),
('9',"MySQL",'','2'),
('10',"Premier script PHP-MySQL",'','2'),
('11',"Les requêtes MySQL",'','2'),
('12',"Les types de données MySQL",'','2'),
('13',"Réalisation d’un site de contenu en base de données",'','2'),
('14',"Les sessions",'','2'),
('15',"Les cookies",'','2'),
('16',"Recenser les informations du domaine étudié",'','3'),
('17',"Organiser les données",'','3'),
('18',"Construire l'organisation physique des données",'','3'),
('19',"Mettre en oeuvre les instructions de création, de modification et de suppression de base de données",'','3'),
('20',"Mettre en oeuvre les instructions pour implémenter les contraintes et l'optimisation des accès",'','3'),
('21',"Ecrire et exécuter un script de création de base de données à l'aide de l'environnement intégré de développement",'','3'),
('22',"Générer un script de création de la base de données à l'aide de l'outil de modélisation",'','3'),
('23',"Elaborer des scripts d'alimentation de la base de test",'','3'),
('24',"Les avantages et inconvénients du relationnel et du non-relationnel",'','3'),
('25',"Le langage de requête pour la base de données",'','3'),
('26',"Outil de sauvegarde de base de données",'','3');
COMMIT;
