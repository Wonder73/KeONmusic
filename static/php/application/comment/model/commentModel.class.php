<?php
  class commentModel extends model{
    //插入大评论
    public function insertBigComment($arr){
      $sql = "insert into bigComment(mid,user_id,content,type) values(?,?,?,?)";
      $this -> db -> execute($sql,$arr,$flag);
      echo $flag;
    }
    //插入小评论
    public function insertSmallComment($arr){
      $sql = "insert into smallComment(big_id,user_id,content) values(?,?,?)";
      $this -> db -> execute("update bigcomment set smallcount = smallcount+1 where id=?",array($arr[0]));
      $this -> db -> execute($sql,$arr,$flag);
      echo $flag;
    }
    //获取大评论
    public function getBigComment($arr){
      if($arr[2] == 'asc'){
        $order = "order by id asc";
      }else if($arr[2] == 'desc'){
        $order = "order by id desc";
      }else if($arr[2] == 'hot'){
        $order = "order by smallcount desc";
      }
      $sql = "select bigcomment.id,user_id,content,(select count(*) from bigcomment where mid='{$arr[0]}' and type='{$arr[1]}') as bigcount,smallcount,bigcomment.date,username from bigcomment,user where bigcomment.user_id=user.id and mid='{$arr[0]}' and type='{$arr[1]}' {$order} limit {$arr[3]},5";
      $content = $this -> db -> fetchAll($sql);
      foreach($content as $key=>$value){
        foreach($value as $k=>$v){
          $content[$key][$k] = urlencode($v);
        }
      }
      return urldecode(json_encode($content));
    }
    //获取小评论
    public function getSmallComment($arr){
      $sql = "select smallcomment.id,user_id,content,smallcomment.date,username from smallcomment,user where smallcomment.user_id=user.id and big_id='{$arr[0]}' order by date";
      $content = $this -> db -> fetchAll($sql);
      foreach($content as $key=>$value){
        foreach($value as $k=>$v){
          $content[$key][$k] = urlencode($v);
        }
      }
      return urldecode(json_encode($content));
    }
  }
?>
