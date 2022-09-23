<?php 

    include('connectDB.php');
 

	
	$fullname = $_POST['fullname'];
	$username = $_POST['username'];
	$password = $_POST['password'];
	

	$con->query("UPDATE users SET fullname = '".$fullname."',password = '".$password."' WHERE username = '".$username."'");


?>