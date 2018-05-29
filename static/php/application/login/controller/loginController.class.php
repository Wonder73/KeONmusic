<?php
require './PHPMailer/Exception.php';
require './PHPMailer/PHPMailer.php';
require './PHPMailer/SMTP.php';
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;
use PHPMailer\PHPMailer\SMTP;
    class loginController extends platformController{
        //登陆方法
        public function loginAction(){
          $username = isset($_POST['username'])?$_POST['username']:'';
          $password = isset($_POST['password'])?$_POST['password']:'';
          $loginModel = new loginModel();
          $userInfo = $loginModel->getUserInfo($username);
          if($username != $userInfo['username']){
            echo 1;
          }else if(md5($password) != $userInfo['password']){
            echo 2;
          }else if($username == $userInfo['username'] && md5($password) == $userInfo['password']){
            echo json_encode($userInfo);
          }
        }
        //注册方法
        public function regAction(){
          $mail = isset($_POST['mail'])?$_POST['mail']:'';
          $loginModel = new loginModel();
          if($loginModel->checkMail($mail) == '0'){
            $temp = $this->mailAction($mail);
            if(strlen($temp)<=6){
              echo $temp;
            }else{
              echo '1';
            }
          }else{
            echo '2';
          }
        }

        //写信息
        public function regInfoAction(){
          $mail = isset($_POST['mail'])?$_POST['mail']:'';
          $phone = isset($_POST['phone'])?$_POST['phone']:'';
          $username = isset($_POST['username'])?$_POST['username']:'';
          $password = isset($_POST['password'])?$_POST['password']:'';
          $loginModel = new loginModel();
          if($loginModel->checkUsername($username) == '0'){
            $loginModel->insertInfo($mail,$phone,$username,$password);
          }else{
            echo 'false';
          }
        }

        //发邮件方法
        public function mailAction($email){
          $code = '';
          $str = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
          for($i=0;$i<6;$i++){
            $code .= $str[rand(0,strlen($str)-1)];
          }
          $mail = new PHPMailer(true);                              // Passing `true` enables exceptions
          try {                             // Enable verbose debug output
              $mail->isSMTP();                                      // Set mailer to use SMTP
              $mail->Host = 'smtp.qq.com';  // Specify main and backup SMTP servers
              $mail->SMTPAuth = true;                               // Enable SMTP authentication
              $mail->Username = '3566409483@qq.com';                 // SMTP username
              $mail->Password = 'riiyjbngojtrdbab';                           // SMTP password
              $mail->SMTPSecure = 'tls';                            // Enable TLS encryption, `ssl` also accepted
              $mail->Port = 587;                                    // TCP port to connect to
              $mail->CharSet = 'UTF-8';

              //Recipients
              $mail->setFrom('3566409483@qq.com', '嘻嘻');
              $mail->addAddress($email, '神奇的用户');
              //Content
              $mail->isHTML(true);                                  // Set email format to HTML
              $mail->Subject = '来自轻音的一封信';
              $mail->Body    = $code;
              $mail->AltBody = 'This is the body in plain text for non-HTML mail clients';

              $mail->send();
              return $code;
          } catch (Exception $e) {
              return 'Message could not be sent. Mailer Error: '.$mail->ErrorInfo;
          }
        }
    }
