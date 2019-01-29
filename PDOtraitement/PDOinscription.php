<?php
session_start();
include('PDOconnect.php');
$inscription=$bdd->prepare('INSERT INTO informations (nom, prenom, date_naissance, adresse, mail, telephone, password, permissions) VALUES(:Nom ,:Prenom,:Date_naissance,:Adresse,:Mail,:Telephone,:Password,\'GUEST\')');

$inscription->execute(array(
                'Nom' => $_POST['nom'],
                'Prenom' => $_POST['prenom'] ,
                'Date_naissance' => $_POST['nais_date'] ,
                'Adresse' => $_POST['adresse'] ,
                'Mail' => $_POST['mail'],
                'Telephone' => $_POST['num_tel'],
                'Password' => $_POST['ins_password']));

header("location: ../index.php");

$inscription->closeCursor();

?>
