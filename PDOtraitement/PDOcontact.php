<?php
include('PDOconnect.php');

$contact=$bdd->prepare('INSERT INTO contact (nom, email, num_telephone, message, date_contact) VALUES(:Nom ,:Email,:Num_telephone,:Message,:Date_contact)');

$contact->execute(array(
                'Nom' => $_POST['nom_contact'],
                'Email' => $_POST['email_contact'] ,
                'Num_telephone' => $_POST['phone_contact'] ,
                'Message' => $_POST['message_contact'],
                'Date_contact' => date("Y/m/d H:i:s")));

echo '<a href="../main.php"> Retour </a>';
header("location: ../index.php");

$contact->closeCursor();


 ?>
