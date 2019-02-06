<template lang="html">
  <transition name="fade">
    <div class="detail_info">
      <div class="background" :style="{background:'#333 url('+obj.img+') no-repeat fixed center center/cover','backgroundSize':'cover'}"></div>
      <img :src="obj.img" alt="">
      <p>演唱：{{obj.name}}</p>
      <p>原唱：{{obj.name}}</p>
      <p>作词：{{obj.ci}}</p>
      <p>作曲：{{obj.qu}}</p>
      <p>编曲：{{obj.bqu}}</p>
      <p>编曲：{{obj.bqu}}12333</p>
      <p>语种：{{obj.lan}}</p>
      <p>曲风：{{obj.genre}}</p>
      <p>发布时间：{{obj.aDate}}</p>
      <p>播放量：123456</p>
      <p>收藏量：123456</p>
      <p><i class="fa fa-thumbs-up"></i>123456</p>
      <p><i class="fa fa-eye"></i>123456</p>
      <div class="close" @click="close"></div>
    </div>
  </transition>
</template>

<script>
export default {
  props:['obj'],
  methods:{
    close(){
      this.$emit('DetailInfo');
    }
  }
}
</script>

<style lang="scss" scoped>
.detail_info{
  position:fixed;
  top:0;
  left:0;
  width:100%;
  height:100%;
  overflow:hidden;
  z-index:200;
  .background{
    position:absolute;
    top:0;left:0;
    width:100%;
    height:100%;
    // background:url(https://y.gtimg.cn/music/photo_new/T002R300x300M000003bSL0v4bpKAx.jpg?max_age=2592000) no-repeat;
    background-size:cover;
    filter:blur(25px);
    transform:scale(1.2);
    z-index:-1;
  }
  img{
    display:block;
    margin:20px auto;
    width:150px;
    height:150px;
  }
  p{
    font-size:1.6rem;
    line-height:2;
    text-align:center;
    color:#fbfbfb;
    i{
      margin:0 5px;
    }
    &:nth-last-child(3){
      color:#EE2859;
    }
  }
  .close{
    position:absolute;
    top:8px;
    right:8px;
    width:20px;
    height:20px;
    border-radius:20px;
    background:#ff0000;
    cursor:pointer;
  }
}/*detail_info*/
.fade-enter-active,.fade-leave-active{
  transition:opacity .3s linear;
}
.fade-enter,.fade-leave-to{
  opacity:0;
}
.fade-leave,.fade-enter-to{
  opacity:1;
}
</style>
