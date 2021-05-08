<?php
require('dbConnect.php');
$user = $_POST['user'];
$pass = $_POST['pass'];
$query = "select * from user"; 
$data = mysqli_query($connect,$query);
      $arrayUser = array();
$row = mysqli_fetch_assoc($data);
 if($row['taikhoan'] == $user && $row['password'] == $pass){
 	$arrayUser['success'] = 1;
 	$arrayUser['message'] = "Đăng nhập thành công !";
 	$arrayUser['name'] = $row['name'];
 	$arrayUser['id'] = $row['id'];
 }else{
 	$arrayUser['success'] = 0;
 	$arrayUser['message'] = "Đăng nhập thất bại, kiểm tra lại tài khoản và mật khẩu !";
 }

	echo json_encode($arrayUser); 
 ?>
