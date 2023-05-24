<?php
    $server="localhost";
    $username="root";
    $password="";
    $db="semester-6-be";

    $mydb = new mysqli($server,$username,$password,$db);
    if($mydb->connect_error){
        die("Connection failed: " . $mydb->connect_error);
    }
?>