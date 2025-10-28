**C. Question 1:**



**1)** **À partir de ce fichier, expliquez les étapes pour alimenter la table formations:**

Ici j'ai travaillé en deux parties: Partie 1 import avec l'outil MySQL, Partie 2 avec commande SQL:



**Partie 1**

 	- Il faut importe les données dans une nouvelle table.

 	- J'ai utilisé l'outil d'importation de MySQL sur la bdd "bdd\_ecole".

 	- J'ai pris le format CSV

 	- J'ai mis comme délimitateur de colonne la virgule ","

 	- J'ai n'ai rien mis comme délimitateur de colonne entouré et échappées

 	car le fichier n'est pas bien construit. (pas régulier, présence d'espace

 	mais pas systématique, cela sera nettoyé lors de l'import dans la table formation)

 	- J'ai mis comme délimitateur de ligne le point-virgule ";"

 	- J'ai crée une nouvelle table "import\_file".

 	- Les Codes générer par MySQL sont disponible en fichier "Data45\_Import\_text\_file.sql"

 	- J'ai copié les codes générer par l'outil d'import de MySQL mais je suis conscient qu'une commande LOAD DATA INFILE aurait aussi été possible si MySQL est configuré pour l'import de fichier locaux.



**Partie 2:**

//Les commandes suivantes peuvent être passé dans l'outil de commande de MySQL et les codes sont dans le fichier "import\_text\_file.sql":



 	- Une fois la nouvelle table créée je la nettoie des espaces indésirable.



 	- Une fois la table nettoyé on importe les données dans la table formations ou on la crée si elle n'existe pas.



 	- Une fois les données importées on vérifie les doublons ou anomalies.



 	- Et on termine par supprimer la table import\_file.



**2) À partir de ce fichier, alimentez les tables de la base de données:**

On procède différemment avec le tableur. On prépare la requête SQL dans le tableur sous forme de formule. Et ensuite on les exécutes dans MySQL. J'ai donc modifier le tableur Data45.xlsx et les deux codes SQL se trouvent dans le fichier import\_cvs.sql

A noter l'utilisation des " autour des texte comprenant des ' dans le texte. Ce qui casse le code SQL.





