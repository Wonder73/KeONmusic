<template lang="html">
  <transition name="slide">
    <div class="menu">
    <ul class="menu_top">
      <li><span>首页</span></li>
      <li>分区</li>
      <li>歌单</li>
      <li>MV</li>
      <li>排行榜</li>
      <li>音乐人</li>
    </ul><!--menu_top 菜单-->
    <ul class="menu_upload">
      <li>发布</li>
    </ul><!--menu_upload 菜单-->
    <ul class="menu_live">
      <li>社区</li>
      <li>直播</li>
      <li>电台</li>
    </ul><!--menu_live 菜单-->
  </div>
  </transition>
</template>

<script>
export default {
}
</script>

<style lang="scss" scoped>
.menu{
  position:fixed;
  top:0;
  right:0;
  display:flex;
  flex-flow:column;
  width:90px;
  height:100%;
  background:rgba(0,0,0,.6);
  z-index:98;
  ul{
    display:flex;
    flex-flow:column;
    &:nth-child(1){
      margin-top:75px;
      flex:2;
    }/*第一个ul*/
    &:nth-child(2){
      flex:1;
    }/*第二个ul*/
    &:nth-child(3){
      flex:1;
    }/*第三格ul*/
    li{
      flex:1;
      display:flex;
      flex-flow:column;
      justify-content: center;
      align-items: center;
      font-size:1.6rem;
      color:#eee;
      cursor:pointer;
      transition:background-color 0.2s linear;
      &:hover{
          background-color:rgba(0,0,0,.2);
      }
    }
  }/*ul*/
}/*.menu*/

//动画效果
.slide-enter-active,.slide-leave-active{
  transition:all .5s linear;
}
.slide-enter,.slide-leave-to{
  transform:translateY(-100%);
  opacity:0;
}
.slide-leave,.slide-enter-to{
  transform:translateY('0');
  opacity:1;
}
</style>
