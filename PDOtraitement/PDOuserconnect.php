<?php
include('PDOconnect.php');

//  Récupération de l'utilisateur et de son pass hashé
$req = $bdd->prepare('SELECT id, password, mail, prenom, nom, date_naissance, adresse, telephone, permissions FROM informations WHERE mail = :Mail AND password = :Pass');
$req->execute(array(
    'Mail' => $_POST['log_email'],
    'Pass' => $_POST['log_pass']));
$resultat = $req->fetch();


// Comparaison du pass envoyé via le formulaire avec la base
$isPasswordCorrect = password_verify($_POST['log_pass'], $resultat['Pass']);

if (!$resultat)
{
    header("location: ../index.php");
}
else
{
    if ($resultat) {

      if($resultat['permissions'] == 'GUEST')
      {
        session_start();
        $_SESSION['id'] = $resultat['id'];
        header("location: ../index.php");
      }
      elseif($resultat['permissions'] == 'ADMIN')
      {
        session_start();
        $_SESSION['id'] = $resultat['id'];
        header("location: ../admin/main.php");
      }
    }
    else {

        header("location: ../index.php");
    }
}
