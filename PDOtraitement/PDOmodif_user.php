<?php
include('PDOconnect.php');
session_start();
$reponse=$bdd->query('SELECT id FROM informations WHERE id = \''.$_SESSION['id'].'\' ');

if($donnee=$reponse->fetch())
{


$n=$reponseEtudiant=$bdd->prepare('UPDATE informations SET  nom = :Nom, prenom = :Prenom, date_naissance = :Date_naissance, adresse = :Adresse,
                      mail = :Mail, telephone = :Telephone, password = :Password WHERE id = \''.$_SESSION['id'].'\' ');

$reponseEtudiant->execute(array(
                  'Nom' => $_POST['mod_nom'],
                  'Prenom' => $_POST['mod_prenom'] ,
                  'Date_naissance' => $_POST['mod_nais_date'] ,
                  'Adresse' => $_POST['mod_adresse'] ,
                  'Mail' => $_POST['mod_mail'],
                  'Telephone' => $_POST['mod_num_tel'],
                  'Password' => $_POST['mod_password']));

header("location: ../Espace_membre.php");

$reponseEtudiant->closeCursor();

}
?>
