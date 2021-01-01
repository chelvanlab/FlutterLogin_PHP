<?php
 
 //Define your Server host name here.
 $HostName = "localhost";
 
 //Define your MySQL Database Name here.
 $DatabaseName = "flutterLogin";
 
 //Define your Database User Name here.
 $HostUser = "root";
 
 //Define your Database Password here.
 $HostPass = "123"; 
 
 // Creating MySQL Connection.
 $con = mysqli_connect($HostName,$HostUser,$HostPass,$DatabaseName);
 
 // Getting the received JSON into $json variable.
 $json = file_get_contents('php://input');
 
 // Decoding the received JSON and store into $obj variable.
 $obj = json_decode($json,true);
 
 // Getting User email from JSON $obj array and store into $email.
 $email = $obj['email'];
 
 // Getting Password from JSON $obj array and store into $password.
 $password = $obj['password'];
 
 //Applying User Login query with email and password.
//  $loginQuery = "select * from user_registration where email = '$email' and password = '$password' ";

$SignupQuery =  "insert into user_registration values('$email','$password')";
 
 // Executing SQL Query.
 $check = mysqli_fetch_array(mysqli_query($con,$SignupQuery));
 
	if($check){
		
		 // Successfully Login Message.
		 $onLoginSuccess = 'New record created successfully';
		 
		 // Converting the message into JSON format.
		 $SuccessMSG = json_encode($onLoginSuccess);
		 
		 // Echo the message.
		 echo $SuccessMSG ; 
	 
	 }
	 
	 else{
	 
		 // If Email and Password did not Matched.
		$InvalidMSG = 'You have already registered' ;
		 
		// Converting the message into JSON format.
		$InvalidMSGJSon = json_encode($InvalidMSG);
		 
		// Echo the message.
		 echo $InvalidMSGJSon ;
	 
	 }
 
 mysqli_close($con);
?>