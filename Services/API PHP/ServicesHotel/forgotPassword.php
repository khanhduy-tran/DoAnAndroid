<?php
require('dbConnect.php');

use PHPMailer\PHPMailer\PHPMailer;                                    
use PHPMailer\PHPMailer\Exception;

 $email = $_POST['emailAccount'];

$selectUser = "SELECT * FROM user ";

$response = array();

function randomPassword() {
    $alphabet = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
    $pass = array(); //remember to declare $pass as an array
    $alphaLength = strlen($alphabet) - 1; //put the length -1 in cache
    for ($i = 0; $i < 8; $i++) {
        $n = rand(0, $alphaLength);
        $pass[] = $alphabet[$n];
    }
    return implode($pass); //turn the array into a string
}
   $query = mysqli_query($connect,$selectUser);

   $row = mysqli_fetch_assoc($query);

   if($row['email'] == $email){
 	               $newPassword = randomPassword();
 	               $updatePassword = "update user set password = '$newPassword' where email = '$email'";
 	               $result1 = mysqli_query($connect,$updatePassword);

 	               if($result1){
 	               include 'public/libs/vendor/library.php';

 	               include 'public/libs/vendor/autoload.php';


                     $mail = new PHPMailer(true);                              // Passing `true` enables exceptions
                     try {
                    //Server settings
                    //Server settings
                    $mail->CharSet = "UTF-8";
                    $mail->SMTPDebug = 0;                                 // Enable verbose debug output
                    $mail->isSMTP();                                      // Set mailer to use SMTP
                    $mail->Host = SMTP_HOST;  // Specify main and backup SMTP servers
                    $mail->SMTPAuth = true;                               // Enable SMTP authentication
                    $mail->Username = SMTP_UNAME;                 // SMTP username
                    $mail->Password = SMTP_PWORD;                           // SMTP password
                    $mail->SMTPSecure = 'ssl';                            // Enable TLS encryption, `ssl` also accepted
                    $mail->Port = SMTP_PORT;                                    // TCP port to connect to
                    //Recipients
                    $mail->setFrom(SMTP_UNAME, "H??? th???ng ???? N???ng Hotel");
                    $mail->addAddress($_POST['emailAccount'], 'T??n ng?????i nh???n');     // Add a recipient | name is option
                    $mail->addReplyTo(SMTP_UNAME, 'T??n ng?????i tr??? l???i');
//                    $mail->addCC('CCemail@gmail.com');
//                    $mail->addBCC('BCCemail@gmail.com');
                    $mail->isHTML(true);                                  // Set email format to HTML
                    $mail->Subject = "Thay ?????i m???t kh???u";

                    $mail->Body ="M???t kh???u c???a b???n ???? ???????c thay ?????i m???i : ". $newPassword;
                    $mail->AltBody =" M???t kh???u c???a b???n ???? ???????c thay ?????i m???i : ". $newPassword;  //None HTML
                    $result = $mail->send();

                    if ($result) {
                    	$response['success'] = 1;
                    	$response['message'] = "M???t kh???u c???a b???n ???? ???????c thay ?????i vui l??ng ki???m tra email";
                    }else{
                    	$response['success'] = 0;
                    	$response['message'] = "C?? l???i x???y ra trong qu?? tr??nh g???i mail";
                    }

                } catch (Exception $e) {

                $response['success'] = 0;
                $response['message'] = "L???i h??? th???ng";
                } 
            }else{
            	$response['success'] = 0;
            	$response['message'] = "L???i h??? th???ng";
            }

 }else{
 	$response['success'] = 0;
 	$response['message'] = "?????a ch??? email kh??ng t???n t???i";
 } 
   echo json_encode($response);
 ?>