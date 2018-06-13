<template lang="html">
  <div class="right">
    <p>荣誉：KeON音乐扛把子，上得了厅堂下得了厨房、战斗力爆表的发际线战士。</p>
    <br>
    <p>对我有意者可以：</p>
    <br>
    <p>加我QQ，帮我种菜</p>
    <br>
    <p>QQ：1234567890</p>
    <br>
    <p>关注微博，了解最新发际线动态</p>
    <br>
    <p>1234567890@sina.com</p>
    <br>
    <p>加我微信，给我发红包！</p>
    <br>
    <p>微信号：1234567890</p>
    <br>
    <p>关注贴吧，节操丢掉丢掉</p>
    <br>
    <p>贴吧ID：1234567890</p>
    <br>
    <p>喜欢我的歌嘛?按#号键可以设置为手机铃声噢~开玩笑开玩笑</p>
    <br>
    <div class="authentication">
      <p>KeON扛把子认证</p>
      <br>
      <p>破喉咙认证</p>
      <br>
      <p>广东理土职业学院社区创始人</p>
      <br>
    </div><!--authentication-->
    <svg t="1527305626076" class="icon" style="" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="3234" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20"><path d="M806 911H218c-57.9 0-105-47.1-105-105V218c0-57.9 47.1-105 105-105h349.4c11.6 0 21 9.4 21 21s-9.4 21-21 21H218c-34.7 0-63 28.3-63 63v588c0 34.7 28.3 63 63 63h588c34.7 0 63-28.3 63-63V457c0-11.6 9.4-21 21-21s21 9.4 21 21v349c0 57.9-47.1 105-105 105z" p-id="3235" fill="#333"></path><path fill="#333" d="M896.6 129c8.2 8.2 8.2 21.5 0 29.7L525.3 529.9c-8.2 8.2-21.5 8.2-29.7 0s-8.2-21.5 0-29.7L866.9 129c8.1-8.2 21.5-8.2 29.7 0z" p-id="3236"></path></svg>
  </div><!--left-->
</template>

<script>
export default {
}
</script>

<style lang="scss" scoped>
.right{
  flex:1;
  position:relative;
  margin-top:1px;
  padding:20px;
  background:#fff;
  border:1px solid #ccc;
  border-top:none;
  &>p{
    font-size:1.6rem;
    font-weight:400;
    color:#999;
    line-height:20px;
    &:first-child{
      text-indent: 2.6rem;
    }
  }/*p*/
  .authentication{
    margin:10px 0;
    padding:20px 0;
    border-top:1px solid #ccc;
    p{
      font-size:1.6rem;
      font-weight:400;
      color:#ee2859;
      line-height:20px;
    }
  }/*authentication*/
  .icon{
    position:absolute;
    bottom:20px;
    right:20px;
    cursor:pointer;
  }
}/*left*/
</style>
