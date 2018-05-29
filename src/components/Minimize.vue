<template lang="html">
  <transition name="slide">
    <div class="minimize" v-show="showMinimize">
      <div class="close_maximization-btn">
        <div class="close_btn" @click="setShowMinimize"></div>
        <div class="maximization_btn" @click="setMenuShow"></div>
      </div>
      <div class="topImg">
        <div class="img"></div>
        <h2>KeON ID</h2>
        <h1>Wonder</h1>
      </div><!--topImg-->
      <ul class="operation">
        <li v-for="(value,index) of menuInfo" :key="index"><i :class="['fa',value.icon]"></i><i class="fa fa-angle-right" v-if="value.name !='设置'"></i></li>
      </ul>
      <p class="quit">退出</p>
    </div>
  </transition>
</template>

<script>
import {mapGetters} from 'vuex'
export default {
  data(){
    return {
    }
  },
  computed:{
    ...mapGetters(['showMinimize']),
    menuInfo:{     //菜单内容
      get(){
        return this.$store.state.menuInfo;
      },
      set(value){
        this.$store.commit('updateMenuInfo',value);
      }
    }
  },
  methods:{
    setShowMinimize(){
      this.$store.dispatch('setShowMinimize',false);
    },
    setMenuShow(){
      this.$store.dispatch('setShowMinimize',false);
      setTimeout(()=>{
        this.$store.dispatch('setMenuShow',true);
      },200);
    }
  }
}
</script>

<style lang="scss" scoped>
.minimize{
  display:flex;
  flex-flow:column;
  justify-content:center;
  position:fixed;
  top:0;left:0;
  width:90px;
  height:100%;
  color:#f5f6fa;
  background:rgba(0,0,0,.6);
  z-index:100;
  //头像
  .topImg{
    flex-shrink: 0;
    .img{
      overflow:hidden;
      margin:0 auto;
      width:70px;
      height:70px;
      border-radius:70px;
      box-shadow:1px 1px 10px #333;
      background:#f5f6fa;
    }
    h2{
      margin:20px 0 8px 0;
      font-size:1.2rem;
      text-align:center;
    }
    h1{
      font-size:2rem;
      color:#fff;
      text-align:center;
    }
  }/*topImg*/
  .info{
    margin:20px 0;
    text-align:center;
    line-height:1.5;
  }/*info*/
  ul.operation{
    overflow:auto;
    overflow-x:hidden;
    flex:1;
    width:100%;
    margin-top:10px;
    li{
      position:relative;
      display:flex;
      justify-content: center;
      padding:14px 0;
      font-size:2.6rem;
      cursor:pointer;
      i.fa-angle-right{
        visibility:hidden;
        position:absolute;
        top:11.1px;
        right:12px;
        font-size:3rem;
      }
      &:hover{
        background-color:rgba(0,0,0,.2);
      }
      &:hover i.fa-angle-right{
        visibility:visible;
      }
    }/*li*/
  }/*ul*/
  p.quit{
    display:block;
    margin-top:10px;
    padding:20px 0;
    width:100%;
    font-size:1.6rem;
    text-align:center;
    line-height:0;
    border-top:1px solid;
  }

  //关闭和最小化按钮
  .close_maximization-btn{
    display:flex;
    flex-flow:column;
    justify-content:center;
    align-items: center;
    margin:20px 0;
    .close_btn{
      width:20px;
      height:20px;
      border-radius:20px;
      background:#ff0000;
      cursor:pointer;
    }
    .maximization_btn{
      position:relative;
      margin-top:10px;
      width:20px;
      height:20px;
      border-radius:20px;
      border:4px solid #f9e74c;
      box-sizing:border-box;
      cursor:pointer;
      &:hover:after{
        border-width:4px;
      }
      &:after{
        content:'';
        position:absolute;
        left:-4px;top:-4px;
        display:block;
        width:20px;
        height:20px;
        border-radius:20px;
        border:10px solid #f9e74c;
        box-sizing:border-box;
        transition:border-width 0.1s linear;
      }
    }/*maximization_btn*/
  }/*close_maximization-btn*/

  &:after{
    content:'';
    position:absolute;
    display:block;
    width:100%;
    height:100%;
    background:rgba(0,0,0,.6);
    z-index:-1;
  }
  &:before{
    content:'';
    position:absolute;
    display:block;
    // margin-left:-10px;
    width:100%;
    height:100%;
    z-index:-2;
    background: url(../assets/right-top_background.png) no-repeat top right/100% fixed,
                url(../assets/left-bottom_background.png) no-repeat bottom left/100% fixed,
                radial-gradient(#fafafa, #eeeeee) no-repeat center center/100% fixed;
    filter:blur(6px);
  }

}/*Minimize*/

//动画效果
.slide-enter-active,.slide-leave-active{
  transition:transform 0.2s linear;
}
.slide-enter,.slide-leave-to{
  transform:translateX(-100%);
}
.slide-leave,.slide-enter-to{
  transform:translateX(0);
}
</style>
