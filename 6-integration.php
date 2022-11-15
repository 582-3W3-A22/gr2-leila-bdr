<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Première intégration PHP/MySQL</title>
</head>
<body>
    <h1>Liste des noms des catégories de la BD 'leila'</h1>
    <?php
        // Étape 1 : se connecter au serveur MySQL
        $cnx = mysqli_connect('localhost', 'root', '');
        // Étape 1 (bis) : spécifier l'encodage de caractères
        mysqli_set_charset($cnx, 'utf8');
        
        // Étape 2 : sélectionner la BD 'leila' (USE)
        mysqli_select_db($cnx, 'leila');

        // Étape 3 : écrire une requête SQL appropriée
        $sql = "SELECT * FROM categorie";

        // Étape 4 : exécuter la requête
        // On obtient un résultat sous la forme d'un "JEU D'ENREGISTREMENT" (pour
        // la commande SELECT, et une valeur BOOLÉENNE pour INSERT, UPDATE, DELETE)
        $resultat = mysqli_query($cnx, $sql);

        // Étape 5 : afficher le résultat sous la forme appropriée
        // print_r($resultat);
        echo "<ul>";
        while ($enregistrement = mysqli_fetch_assoc($resultat)) {
            echo "<li>".$enregistrement['nom']."</li>";
        }
        echo "</ul>";
    ?>
</body>
</html>