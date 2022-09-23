<?php 

    include('connectDB.php');
 

	
	$fullname = $_POST['fullname'];
	$username = $_POST['username'];
	$password = $_POST['password'];
	

	$con->query("delete from users  WHERE username = '".$username."'");


?>