<?php 
    require('connect.php');

    $firstName = $_POST["firstName"];
    $lastName = $_POST["lastName"];
    $email = $_POST["email"];
    $pass = md5($_POST["pass"]);

    $sql = "INSERT INTO user_register (firstName, lastName, email, pass) VALUES ('$firstName', '$lastName', '$email', '$pass')";

    if ($mydb->query($sql) === TRUE) {
        echo "Registration successful";
    } else {
        echo "Error: " . $sql . "<br>" . $mydb->error;
    }
    
    $mydb->close();
?>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>Hello World</h1>
</body>
</html>