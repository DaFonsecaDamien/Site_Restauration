<?php
include('PDOconnect.php');

$contact=$bdd->prepare('INSERT INTO reservations (nom, mail, personne, date_res, menu) VALUES(:Nom ,:Email,:Personne,:Date_res,:Menu)');
var_dump($_POST);
$contact->execute(array(
                'Nom' => $_POST['name'],
                'Email' => $_POST['email'] ,
                'Personne' => $_POST['number'] ,
                'Menu' => $_POST['menu_res'],
                'Date_res' => $_POST['date']));

echo '<a href="../main.php"> Retour </a>';
header("location: ../index.php");

$contact->closeCursor();


 ?>
