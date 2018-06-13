<?php
  class commentController{
    //插入大评论
    public function writeBigCommentAction(){
      $commentModel = new commentModel();
      $mid = isset($_POST['mid'])?trim($_POST['mid']):'';
      $userId = isset($_POST['userId'])?trim($_POST['userId']):'';
      $content = isset($_POST['content'])?trim($_POST['content']):'';
      $type = isset($_POST['type'])?trim($_POST['type']):'';
      $arr = array($mid,$userId,$content,$type);
      echo $commentModel->insertBigComment($arr);
    }
    //插入小评论
    public function writeSmallCommentAction(){
      $commentModel = new commentModel();
      $bigId = isset($_POST['bigId'])?trim($_POST['bigId']):'';
      $userId = isset($_POST['userId'])?trim($_POST['userId']):'';
      $content = isset($_POST['content'])?trim($_POST['content']):'';
      $arr = array($bigId,$userId,$content);
      echo $commentModel->insertSmallComment($arr);
    }
    //获取大评论
    public function getBigCommentAction(){
      $commentModel = new commentModel();
      $mid = isset($_POST['mid'])?trim($_POST['mid']):'';
      $type = isset($_POST['type'])?trim($_POST['type']):'';
      $order = isset($_POST['order'])?trim($_POST['order']):'';
      $limit = isset($_POST['limit'])?trim($_POST['limit']):'';
      $arr = array($mid,$type,$order,$limit);
      echo $commentModel -> getBigComment($arr);
    }
    //获取小评论
    public function getSmallCommentAction(){
      $commentModel = new commentModel();
      $bigId = isset($_POST['bigId'])?trim($_POST['bigId']):'';
      $arr = array($bigId);
      echo $commentModel -> getSmallComment($arr);
    }
  }
?>
