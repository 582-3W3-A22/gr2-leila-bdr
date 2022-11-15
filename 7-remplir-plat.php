<?php
// Script à exécuter une seule fois pour remplir la table 'plat' de la BD 'leila'

// Connexion & sélection de BD
$cnx = mysqli_connect('127.0.0.1', 'root', '', 'leila');
// Encodage de caractères
mysqli_set_charset($cnx, 'utf8');

// Lire le contenu du menu dans le fichier JSON
$platsJson = file_get_contents('data-json/menu-fr.json');
// Obtenir un tableau PHP
$platsTab = json_decode($platsJson, true);
// print_r($platsTab);

foreach ($platsTab as $idCat => $plats) {
    foreach ($plats as $plat) {
        $nom = mysqli_escape_string($cnx, $plat['nom']);
        $desc = mysqli_escape_string($cnx, $plat['desc']);
        $portion = $plat['portion'];
        $prix = $plat['prix'];
        mysqli_query($cnx, "INSERT INTO plat VALUES (0, '$nom', '$desc', $portion, $prix, $idCat)");
    }
}
?>
