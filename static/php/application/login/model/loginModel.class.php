<?php
    class loginModel extends model{
      //检查有没有该邮件的用户
      public function checkMail($mail){
        $sql = "select COUNT(*) as count from user where mail='{$mail}'";
        
        return $this->db->fetchRow($sql)['count'];
      }
      //检查有没有改用户名的用户
      public function checkUsername($username){
        $sql = "select COUNT(*) as count from user where username='{$username}'";

        return $this->db->fetchRow($sql)['count'];
      }
      //插入用户信息
      public function insertInfo($mail,$phone,$username,$password){
        $sql = "insert into user(username,password,mail,phone) values(?,?,?,?)";
        $array = array($username,md5($password),$mail,$phone);
        $this->db->execute($sql,$array,$flag);
        echo $flag;
      }
      //获取用户信息
      public function getUserInfo($username){
        $sql = "select username,password from user where username='{$username}'";
        return $this->db->fetchRow($sql);
      }

    }
