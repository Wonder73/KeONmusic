<template lang="html">
  <div class="Collection">
    <div class="search">
      <div :class="{'switch':true,'off_on':open}">
        <p>歌单</p>
        <p>单曲</p>
        <div class="switch_btn" @click="open = !open"></div>
      </div>
      <div class="search_input">
        <i class="microphone fa fa-microphone fa-2x"></i>
        <input type="text" name="search" placeholder="搜索内容" autocomplete="off" v-model="search" @focus="searchFocus = true" @blur="searchFocus = false"  @keydown.enter="jumpSearch">
        <span class="search_btn"><a :href="href">搜索</a></span>
      </div><!-- search 搜索栏 -->
    </div><!--search-->
  </div>
</template>

<script>
export default {
  data(){
    return {
      open:false
    }
  }
}
</script>

<style lang="scss" scoped>
.Collection{
  display:flex;
  flex-flow:column;
  flex:1;
  margin-top:1px;
  border:1px solid #ccc;
  border-top:none;
  .search{
    display:flex;
    padding:16px 0;
    width:100%;
    div.switch{
      position:relative;
      display:flex;
      justify-content:flex-start;
      align-items:center;
      margin:0 20px;
      width:70px;
      height:30px;
      border-radius:24px;
      border:1px solid #ccc;
      background:rgba(0,219,214,0);
      transition:background .3s linear;

      .switch_btn{
        position:absolute;
        margin:0 3px 0 5px;
        width:24px;
        height:24px;
        border-radius:18px;
        border:1px solid #ccc;
        transition:all .2s linear;
        cursor:pointer;
      }/*switch_btn*/
      p{
        position:absolute;
        font-size:1.8rem;
        color:#ccc;
        line-height:1.5;
        transition:opacity .3s linear;
        &:first-child{
          right:6px;
        }
        &:nth-child(2){
          left:8px;
          color:#fff;
          opacity:0;
        }
      }/*p*/
      &.off_on{
        background:rgba(0,219,214,1);
        border:1px solid rgba(0,219,214,1);
        .switch_btn{
          background:#fff;
          transform:translateX(140%);
        }
        p{
          &:first-child{
            opacity:0;
          }
          &:nth-child(2){
            opacity:1;
          }
        }
      }/*off_on*/
    }/*switch*/
    .search_input{
      position:relative;
      display:flex;
      flex-flow:row;
      width:350px;
      height:30px;
      background:#fff;
      border-radius:34px;
      border:1px solid #00dbd6;
      i.microphone{
        flex:0.3;
        color:#ccc;
        text-align:center;
        line-height:30px;
        cursor:pointer;
        &:hover{
            color:#333;
        }
      }

      input{
        flex:2;
        font-size:1.4rem;
        color:#999;
        letter-spacing:2px;
        text-indent:0.5rem;
        &:focus{
            outline:none;
        }
      }

      .search_btn{
        flex-shrink: 0;
        width:100px;
        height:100%;
        font-size:1.8rem;
        font-weight:400;
        color:#F5F6FA;
        text-align:center;
        line-height:30px;
        letter-spacing:1px;
        border-radius:34px;
        background:#00dbd6;
        cursor:pointer;
        a{
          color:#F5F6FA;
        }
      }/*search_btn*/
    }/*search_input*/
  }/*search*/
}
</style>
