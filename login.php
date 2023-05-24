<?php 
    require('connect.php');

    $email = $_POST["email"];
    $pass = $_POST["pass"];

    $sql = "SELECT * FROM user_register WHERE email='$email' AND pass='$pass'";

    $result = $mydb->query($sql);

    if ($result -> num_rows > 0) {
        // login successful
        echo "Login successful";
    } else {
        // Login failed
        echo "Invalid email or password";
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
    <h1>Hello</h1>
</body>
</html>
