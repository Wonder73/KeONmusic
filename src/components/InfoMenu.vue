<template lang="html">
  <div :class="{menu:true,menu_hover:!isPhone()}" :style="menuStyle" v-show="!showMinimize">
    <div class="topImg">
      <div class="img"><img src="../assets/topImg.jpg"></div>
      <h2>KeON ID</h2>
      <h1><a href="./home.html">Inriye</a></h1>
    </div><!--topImg-->
    <div class="info">
      <p>发布了136首音乐</p>
      <p>关注了136人</p>
      <p>136个粉丝</p>
    </div><!--info-->
      <ul class="operation">
        <draggable v-model="menuInfo" :options="{animation:150,ghostClass:'ghost',disabled:dragDisabled}" @end="dragDisabled = true">
        <transition-group>
          <li v-for="(value,index) of menuInfo" :key="index" @touchstart="dragDisabled = false"><div class="sort" @mouseover="dragDisabled = false"></div><i :class="['fa',value.icon]"></i><span>{{value.name}}</span><span>{{value.count}}</span><i :class="{'fa':true,'fa-angle-right':(value.name != '设置')}" v-if=""></i></li>
        </transition-group>
      </draggable>
      </ul>
    <p class="quit">退出</p>
    <div class="show_btn">
      <div :class="{sector_btn:true,'sector_btn-hover':(!isPhone() && menuShow)}" @click="setMenuShow"><i :class="{fa:true,'fa-angle-right':!menuShow,'fa-angle-left':menuShow}"></i></div>
    </div>
    <div class="close_minimize-btn">
      <div class="close_btn" @click="setMenuShow"></div>
      <div class="minimize_btn" @click="setShowMinimize"></div>
    </div>
  </div><!--menu-->
</template>

<script>
import draggable from 'vuedraggable'
import {mapGetters} from 'vuex'
export default {
  data(){
    return {
      dragDisabled:true,   //拖拽排序的调用
    }
  },
  computed:{
    menuStyle(){
      if(this.menuShow){
        return {
          transform:'translateX(0)',
        }
      }
    },
    ...mapGetters(['showMinimize','menuShow']),           //迷你菜单显示，我就隐藏，反之相反
    menuInfo:{
      get(){
        return this.$store.state.menuInfo;
      },
      set(value){
        this.$store.commit('updateMenuInfo',value);
      }
    }
  },
  components:{
    draggable
  },
  watch:{
    menuInfo(val){
      localStorage.setItem('menuInfo',JSON.stringify(val));
    }
  },
  methods:{
    isPhone(){
      if (/(iPhone|iPad|iPod|iOS|Android|Windows Phone|SymbianOS|Mobile)/i.test(navigator.userAgent)) { //移动端
          return true;
      }
      return false;
    },
    setMenuShow(){
      this.$store.dispatch('setMenuShow',!this.menuShow)
    },
    setShowMinimize(){
      this.$store.dispatch('setMenuShow',false);
      setTimeout(()=>{
        this.$store.dispatch('setShowMinimize',true);
      },300);
    }
  }
}
</script>

<style lang="scss" scoped>
.menu{
  transform:translateX(-100%);
  display:flex;
  flex-flow:column;
  align-items:center;
  position:fixed;
  top:0;
  left:0;
  width:280px;
  height:100%;
  color:#f5f6fa;
  z-index:100;
  transition:transform 0.3s ease-out;
  //头像
  .topImg{
    flex-shrink: 0;
    margin-top:20px;
    .img{
      overflow:hidden;
      width:90px;
      height:90px;
      border-radius:100px;
      box-shadow:1px 1px 10px #333;
      background:#f5f6fa;
      img{
        width:100%;
        height:auto;
      }
    }
    h2{
      margin:20px 0 8px 0;
      font-size:1.6rem;
      text-align:center;
    }
    h1{
      font-size:2.6rem;
      color:#fff;
      text-align:center;
      a{
        color:#fff;
      }
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
    li{
      position:relative;
      display:flex;
      padding:14px 0;
      font-size:1.6rem;
      //排列
      div.sort{
        visibility:hidden;
        position:relative;
        margin-left:20px;
        width:20px;
        height:12px;
        cursor:pointer;
        &:before{
          content:"";
          display:block;
          position:absolute;
          top:0;
          left:0;
          width:100%;
          height:4px;
          background:#333;
        }
        &:after{
          content:"";
          display:block;
          position:absolute;
          bottom:0;
          left:0;
          width:100%;
          height:4px;
          background:#333;
        }
      }/*sort*/
      i:nth-child(2){
        margin:0 20px;
        font-size:2rem;
      }
      span:nth-last-child(2){
        margin:0 35px;
      }
      i:last-child{
        visibility:hidden;
        position:absolute;
        right:20px;
        font-size:2rem;
      }
      &:hover{
        background-color:rgba(0,0,0,.2);
      }
      &:hover div.sort,&:hover i:last-child{
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

  //显示和隐藏按钮
  .show_btn{
    overflow:hidden;
    display:flex;
    align-items: center;
    position:absolute;
    top:50%;
    right:-70px;
    margin-top:-35px;
    width:70px;
    height:70px;
    .sector_btn{
      display:flex;
      justify-content: flex-end;
      align-items:center;
      width:90%;
      height:90%;
      border-radius:100%;
      background:rgba(0, 219, 214, 1);
      box-shadow:1px 1px 5px #999;
      transform:translateX(-50%);
      cursor:pointer;
      i{
        margin-right:12px;
        font-size:4rem;
        color:#fff;
        &.fa-angle-left{
          margin-right:13px;
          margin-top:-2px;
        }
      }
    }/*sector_btn*/
    //只有电脑才有效果
    .sector_btn-hover{
      transform:translateX(-100%);
      transition:transform 0.2s linear;
      i{
        opacity:0;
        transition:opacity 0.3s linear;
      }
    }/*sector_btn-hover*/
  }/*show_btn*/

  //关闭和最小化按钮
  .close_minimize-btn{
    position:absolute;
    top:20px;right:20px;
    .close_btn{
      width:20px;
      height:20px;
      border-radius:20px;
      background:#ff0000;
      cursor:pointer;
    }
    .minimize_btn{
      position:relative;
      margin-top:10px;
      width:20px;
      height:20px;
      border-radius:20px;
      border:4px solid #f9e74c;
      box-sizing:border-box;
      cursor:pointer;
      &:hover:after{
        border-width:10px;
      }
      &:after{
        content:'';
        position:absolute;
        top:-4px;left:-4px;
        display:block;
        width:20px;
        height:20px;
        border-radius:20px;
        border:4px solid #f9e74c;
        box-sizing:border-box;
        transition:border-width 0.1s linear;
      }
    }
  }
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
    width:100%;
    height:100%;
    z-index:-2;
    background: url(../assets/right-top_background.png) no-repeat top right/100% fixed,
                url(../assets/left-bottom_background.png) no-repeat bottom left/100% fixed,
                radial-gradient(#fafafa, #eeeeee) no-repeat center center/100% fixed;
    filter:blur(5px);
  }
}/*menu*/
.ghost{
  opacity:0;
}
//区分手机和电脑的经过面板时显示动画
.menu_hover:hover .show_btn .sector_btn-hover{
  transform:translateX(-50%);
}
.menu_hover:hover .show_btn .sector_btn-hover i{
  opacity:1;
}
</style>
