-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 17 nov. 2022 à 15:35
-- Version du serveur : 10.4.24-MariaDB
-- Version de PHP : 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Base de données : `leila`
--
CREATE DATABASE IF NOT EXISTS `leila` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `leila`;

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id` tinyint(4) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `type` enum('plat','vin') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id`, `nom`, `type`) VALUES
(5, 'Desserts', 'plat'),
(1, 'Entrées', 'plat'),
(4, 'Fromages', 'plat'),
(2, 'Poissons', 'plat'),
(3, 'Viandes', 'plat'),
(7, 'Vins blancs', 'vin'),
(6, 'Vins effervescents', 'vin'),
(8, 'Vins rouges', 'vin');

-- --------------------------------------------------------

--
-- Structure de la table `plat`
--

CREATE TABLE `plat` (
  `id` smallint(6) NOT NULL,
  `nom` varchar(150) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `portion` tinyint(4) NOT NULL DEFAULT 1,
  `prix` decimal(5,2) NOT NULL,
  `categorie_id` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `plat`
--

INSERT INTO `plat` (`id`, `nom`, `description`, `portion`, `prix`, `categorie_id`) VALUES
(1, 'Escargots à la crème d\'ail', '', 1, '31.00', 1),
(2, 'Foie gras d\'canard poêlé aux coings', 'gâteau et infusion de coing à la verveine', 2, '34.00', 1),
(3, 'Jardin de champignons d\'automne', 'crème de cèpes, émulsion au thé noir', 1, '33.00', 1),
(4, 'Sandre à la peau croustillante', 'fondue d\'échalotes, sauce au vin rouge', 1, '42.00', 2),
(5, 'Saint-pierre rôti aux olives taggiasche', 'mousseline d\'artichaut, fumet de poisson au citron kalamansi', 1, '49.00', 2),
(6, 'Bar cuit à la vapeur et criste marine', 'déclinaison de riz et coquillages, jus au curcuma', 2, '58.00', 2),
(7, 'Côte de porcelet et poitrine de cochon du Cantal croustillant', 'légumes de saison et crémeux de céleri-rave', 1, '42.00', 3),
(8, 'Filet de canette rôti sur la peau, jus au porto infusé à l\'hibiscus', 'tartelette de figues et cuisse confite, petite chartreuse de figues', 1, '44.00', 3),
(9, 'Ris de veau doré au sautoir et cèpes', 'mousseline de cèpes, jus de veau à la cazette du Morvan', 1, '63.00', 3),
(10, 'Chariot de fromages affinés de nos régions', '', 1, '12.00', 4),
(11, 'Poire Louise Bonne pochée au citron doux', 'parfait glacé à la Nepeta, crumble de petit épeautre', 1, '13.00', 5),
(12, 'Fleur de cassis de Bourgogne', 'chiboust à la vanille et chocolat grand cru de Madagascar', 1, '13.00', 5),
(13, 'Tarte fine aux pommes de Bernard Loiseau', 'sorbet pomme verte', 1, '12.00', 5);

-- --------------------------------------------------------

--
-- Structure de la table `vin`
--

CREATE TABLE `vin` (
  `id` smallint(6) NOT NULL,
  `nom` varchar(150) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `provenance` varchar(50) NOT NULL,
  `prix` decimal(6,2) NOT NULL,
  `categorie_id` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `vin`
--

INSERT INTO `vin` (`id`, `nom`, `description`, `provenance`, `prix`, `categorie_id`) VALUES
(1, 'Cidre Fermier Biologique', 'Des Bulles, Genre, Clos Saragnat', 'Québec', '38.00', 6),
(2, 'Cidre Mousseux', 'Récolte 2012, Michel Jodoin', 'Québec', '45.00', 6),
(3, 'Cava Brut', '1312, Mestres', 'Espagne', '50.00', 6),
(4, 'Savoie', 'Ayse Brut, Dominique Belluard', 'France', '72.00', 6),
(5, 'Champagne Brut Nature', '1er Cru Vertus, Blanc de Blancs, Pascal Doquet', 'France', '115.00', 6),
(6, 'Champagne Extra Brut', 'Fleury 2000', 'France', '150.00', 6),
(7, 'Champagne Extra Brut', 'Saignée de Sorbée, Vouette & Sorbée', 'France', '160.00', 6),
(8, 'Champagne Extra Brut, Les Béguines, La Closerie', '', 'France', '180.00', 6),
(9, 'Cavalier du Versant', 'Domaine Gélinas 2011', 'Québec', '42.00', 7),
(10, 'Mantinia, Moschofilero', 'Tselepos Classique 2013', 'Grèce', '46.00', 7),
(11, 'Côtes de Duras, Nadia', 'Nadia Lusseau 2013', 'France', '48.00', 7),
(12, 'Muscadet Sèvre et Maine', 'Vincent Caillé 2013', 'France', '50.00', 7),
(13, 'Saint-Foy Bordeaux Blanc', 'Château les Mangons 2012', 'France', '54.00', 7),
(14, 'Burgenland, Grüner Veltliner', 'Meinklang 2013', 'Autriche', '55.00', 7),
(15, 'Vin de France ( Bergerac, Sud-Ouest)', 'Les Abeilles de Collinettes, Lestignac 2012', 'France', '57.00', 7),
(16, 'Les Rosiers', 'Les Pervenches 2013', 'Québec', '62.00', 7),
(17, 'Vin de Table (Roussillon), Juste Ciel !', 'La Petite Baigneuse 2012', 'France', '62.00', 7),
(18, 'Vin de France (Beaujolais), Escapade', 'France Gonzalvez 2012', 'France', '63.00', 7),
(19, 'Badisher Landwein, Viviser', 'Ziereisen 2011', 'Allemagne', '65.00', 7),
(20, 'Südtirol-Alto Aldige', 'Chardonnay, Hartman Donà 2012', 'Italie', '67.00', 7),
(21, 'Nahe, WeisserBurgunder Troken Gäseritsch', 'Weingut Hahnmühle 2012', 'Allemagne', '70.00', 7),
(22, 'Hawke\'s Bay Sauvignon Blanc', 'The Supernatural 2013', 'Nouvelle-Zélande', '70.00', 7),
(23, 'Priorat, Clos Martina 2011', 'Mas den Blei 2011', 'Espagne', '72.00', 7),
(24, 'Vino Bianco (Piémont)', 'Ezio Trinchero', 'Italie', '75.00', 7),
(25, 'Côtes du Jura, Naturé', 'Domaine Berthet Bondet 2012', 'France', '78.00', 7),
(26, 'Venezia Giulia, Ribolla Gialla', 'Paraschos 2009', 'Italie', '82.00', 7),
(27, 'Vin de Savoie, Le Feu', 'Dominique Belluard 2011', 'France', '86.00', 7),
(28, 'Somlo, Juhfark', 'Meinklang 2010', 'Hongrie', '87.00', 7),
(29, 'Anjou, Victoire', 'Nicolas Reau 2012', 'France', '89.00', 7),
(30, 'Vacqueyras, Minéral', 'Montirius 2011', 'France', '89.00', 7),
(31, 'Vin de France (Loire), Vino Bianco', 'Marie Thibault 2011', 'France', '92.00', 7),
(32, 'Saint-Véran, La Goutte du Charme', 'Domaine Combier 2011', 'France', '96.00', 7),
(33, 'Bourgogne, Le Petit Têtu', ' Jean-Marie Berrux 2012', 'France', '99.00', 7),
(34, 'Beaune 1er Cru Les Coucherias', 'J.Claude Rateau 2002', 'France', '102.00', 7),
(35, 'Sancerre, Monts Damnés', 'Gérard Boulay 2011', 'France', '110.00', 7),
(36, 'Côtes du Jura', 'Savagnin Les Chalasses Marnes Bleues 2011', 'France', '130.00', 7),
(37, 'Meursault', 'Jean Philippe Fichet 2011', 'France', '155.00', 7),
(38, 'Hermitage, Prisme', 'Julien Pilon 2012', 'France', '175.00', 7),
(39, 'Chablis 1er Cru Forêt', 'Domaine François Raveneau 2011', 'France', '180.00', 7),
(40, 'Côtes du Rhône Signargues', 'Domain de la Coudette 2012', 'France', '43.00', 8),
(41, 'Marcillac, Cuvée Laïris', 'Jean-Luc Matha 2010', 'France', '44.00', 8),
(42, 'Montsant', 'Joan D\'Anguera 2013', 'Espagne', '45.00', 8),
(43, 'Rioja', 'Vina Ilusion 2013', 'Espagne', '48.00', 8),
(44, 'Côtes du Rhône, Cuvée Tradition', 'Domaine les Hautes Cances 2011', 'France', '50.00', 8),
(45, 'Vin de France (Ardèche), Vin Nu', 'Les Deux Terres 2013', 'France', '50.00', 8),
(46, 'BO2 (Andalousie)', 'Barranco Oscuro', 'Espagne', '52.00', 8),
(47, 'Vin de France (Beaujolais), Raisins Gaulois', 'M. Lapierre 2013', 'France', '53.00', 8),
(48, 'Vin de Pays de l\'Aveyron, Les Anciens', 'Rols 2011', 'France', '55.00', 8),
(49, 'Bourgueil, Avis de Vin Fort', 'Domaine Breton 2013', 'France', '57.00', 8),
(50, 'Mas P\'aca (Andalousie)', 'Naranjuez 2011', 'Espagne', '58.00', 8),
(51, 'Saumur Champigny, Ruben', 'Domaine Bobinet 2013', 'France', '61.00', 8),
(52, 'Montsant, Finca L\'Argatà', 'Joan D\'Anguera 2011', 'Espagne', '64.00', 8),
(53, 'Burgenland, Blaufränkish', 'Moric 2012', 'Autriche', '66.00', 8),
(54, 'Vino Rosso (Sicile), Palmento', 'Vino di Anna 2012', 'Italie', '68.00', 8),
(55, 'Sainte-Foy Bordeaux', 'Château les Mangons 2003', 'France', '70.00', 8),
(56, 'Régnié', 'G. Descombes 2011', 'France', '75.00', 8),
(57, 'Arbois Pupillin, La Chamade', 'Philippe Bornard 2010', 'France', '78.00', 8),
(58, 'Rheingau, Spätburguner Rotwein Trocken', 'Peter Jakob Kühn 2012', 'Allemagne', '80.00', 8),
(59, 'Monferrato Dolcetto, Le Taragne', 'Ezio Trinchero 2006', 'Italie', '82.00', 8),
(60, 'Campania Aglianico, Drogone', 'Cantina Giardino 2008', 'Italie', '85.00', 8),
(61, 'Anjou, L\'Enfant Terrible', 'Nicolas Reau 2010', 'France', '89.00', 8),
(62, 'Vin de France (Jura)', 'Jean-François Ganevat', 'France', '90.00', 8),
(63, 'Rosso Veneto, Verdugo', 'Masiero Gianfranco 2010', 'Italie', '96.00', 8),
(64, 'Rioja, Vina Tondonia', 'R. Lopez de Heredia 2002', 'Espagne', '99.00', 8),
(65, 'Pic Saint-Loup (Languedoc), Fleuve Amour', 'Zélige-Caravent 2010', 'France', '105.00', 8),
(66, 'Auxey-Duresses', 'Alain Gras 2012', 'France', '108.00', 8),
(67, 'Macon, La Maison Romane', 'Château de Berzé 2011', 'France', '112.00', 8),
(68, 'Barolo', 'Josetta Saffirio 2009', 'Italie', '125.00', 8),
(69, 'Marsannay, Trois Terres', 'Domaine Jean Fournier 2011', 'France', '130.00', 8),
(70, 'Barbaresco (Piémont), Montestefano', 'Rivella Serafino 2009', 'Italie', '131.00', 8),
(71, 'Cornas, Chaillot', 'Thierry Allemand 2009', 'France', '175.00', 8),
(72, 'Nuits Saint Georges, Les Damodes', 'Domaine Ballorin 2010', 'France', '190.00', 8);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nom` (`nom`,`type`);

--
-- Index pour la table `plat`
--
ALTER TABLE `plat`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nom` (`nom`,`categorie_id`),
  ADD KEY `categorie_id` (`categorie_id`);

--
-- Index pour la table `vin`
--
ALTER TABLE `vin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nom` (`nom`,`description`,`categorie_id`),
  ADD KEY `categorie_id` (`categorie_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `plat`
--
ALTER TABLE `plat`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `vin`
--
ALTER TABLE `vin`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `plat`
--
ALTER TABLE `plat`
  ADD CONSTRAINT `plat_ibfk_1` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`);

--
-- Contraintes pour la table `vin`
--
ALTER TABLE `vin`
  ADD CONSTRAINT `vin_ibfk_1` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`);
COMMIT;
