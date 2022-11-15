<?php
// Script à exécuter une seule fois pour remplir la table 'vin' de la BD 'leila'

// Connexion & sélection de BD
$cnx = mysqli_connect('127.0.0.1', 'root', '', 'leila');
// Encodage de caractères
mysqli_set_charset($cnx, 'utf8');

// Lire le contenu de la carte des vins dans le fichier JSON
$vinsJson = file_get_contents('data-json/vins-fr.json');
// Obtenir un tableau PHP
$vinsTab = json_decode($vinsJson, true);
// print_r($vinsTab);

foreach ($vinsTab as $idCat => $vins) {
    foreach ($vins as $vin) {
        // Prévenir les injections SQL
        $nom = mysqli_escape_string($cnx, $vin['nom']);
        $desc = mysqli_escape_string($cnx, $vin['description']);
        $provenance = mysqli_escape_string($cnx, $vin['provenance']);
        $prix = $vin['prix'];
        mysqli_query($cnx, "INSERT INTO vin VALUES (0, '$nom', '$desc', '$provenance', $prix, $idCat)");
    }
}
?>
