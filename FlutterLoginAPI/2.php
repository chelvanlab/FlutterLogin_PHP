<?php
 
 //Define your Server host name here.
 $HostName = "localhost";
 
 //Define your MySQL Database Name here.
 $DatabaseName = "flutterLogin";
 
 //Define your Database User Name here.
 $HostUser = "root";
 
 //Define your Database Password here.
 $HostPass = "123"; 

 $con = mysqli_connect($HostName,$HostUser,$HostPass,$DatabaseName);

 $loginQuery = "select * from user_registration where email = 'chselvan' and password = '12345' "; 

 $check = mysqli_fetch_array(mysqli_query($con,$loginQuery));

 if(isset($check)){
     echo "ok";
 }
else{
    echo "not";
}

 ?>