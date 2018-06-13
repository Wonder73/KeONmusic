<template lang="html">
  <div class="comment">
    <div class="comment_input">
      <div class="top_img">
        <div class="img"></div>
        <p>Inriye</p>
      </div>
      <textarea name="name" rows="4" cols="80" placeholder="点击此处进行评论——" v-model="content"></textarea>
      <button type="button" name="button" @click="publish" v-show="!publishHide">发表评论</button>
      <i class="fa fa-spinner fa-pulse fa-2x" style="color:#00dbd6" v-show="publishHide"></i>
    </div><!--comment_input-->

    <div class="order_jump">
      <div class="order">
          <router-link to="/Comment/Asc" tag="p">顺序</router-link>|
          <router-link to="/Comment/Desc" tag="p">倒序</router-link>|
          <router-link to="/Comment/Hot" tag="p">热度</router-link>
      </div>
      <div class="go_jump">
        直达
        <input type="text" name="" value="">
        楼
      </div>
    </div><!--order_jump-->

    <router-view></router-view>
  </div><!--comment-->
</template>

<script>
import {mapGetters} from 'vuex'
import axios from 'axios'
import qs from 'qs'
export default {
  mounted(){
    this.$store.commit('checkLogin');
  },
  data(){
    return {
      content:'',     //内容
      publishHide:false,    //发表时禁用发表按钮，防止疯狂点击
    }
  },
  computed:{
    ...mapGetters(['checkLogin']),
  },
  methods:{
    publish(){
      if(this.checkLogin){
        if(this.content){
          this.publishHide = true;
          var mid = window.location.search.slice(1).split('=')[1];
          var userId = localStorage.getItem('userId');
          axios({
            method:'post',
            url:'./static/php/index.php?p=comment&c=comment&a=writeBigComment',
            data:qs.stringify({
              'mid':mid,
              'userId':userId,
              'content':this.content,
              'type':'single'
            }),
            header:{'Content-Type':'application/x-www-form-urlencoded'}
          }).then((res)=>{
            if(+res.data === 1){
              this.publishHide = false;
              this.content = '';
            }
          })
        }else{
          console.log('空');
        }
      }else{
        this.$router.push({name:'Login'});
      }
    }
  }
}
</script>

<style lang="scss" scoped>
.comment{
  margin:0 auto;
  width:1120px;
  font-size:1.6rem;


  @media only screen and(max-width:1120px){
    width:95%;
  }
  .comment_input{
    display:flex;
    justify-content:center;
    align-items:center;
    width:100%;
    height:160px;
    border:1px solid #ccc;
    border-top:none;
    background:#fff;
    .top_img{
      display:flex;
      flex-flow:column;
      justify-content:center;
      align-items:center;
      margin:0 20px 0 5px;
      .img{
        width:60px;
        height:60px;
        border-radius:64px;
        border:1px solid #ccc;
        background:#00DBD6;
        img{
          width:100%;
          height:auto;
        }
      }/*img*/
      p{
        margin:10px auto;
        font-size:1.6rem;
        font-weight:400px;
        color:#666;
        text-align:center;
      }
      @media only screen and (max-width:500px){
        margin-right:10px;
        .img{
          width:50px;
          height:50px;
        }
      }
    }/*top_img*/
    textarea{
      resize:none;
      padding:10px;
      height:100px;
      font-size:1.6rem;
      color: #666;
      border-radius:10px;
      border:1px solid #f1f1f1;
      background:#fefefe;
      &:focus{
        outline:none;
      }
    }/*textarea*/
    button{
      flex-shrink:0;
      margin:0 5px 0 20px;
      padding:10px 20px ;
      font-size:1.6rem;
      font-weight:400;
      color:#fff;
      background:#00DBD6;
      border:none;
      border-radius:5px;
      cursor:pointer;
      &:focus{
        outline:none;
      }
      @media only screen and (max-width:500px){
        width:34px;
        margin-left:10px;
        padding:10px 10px;
      }
    }
    i{
      margin:0 5px 0 20px;
    }
  }/*comment_input*/
  .order_jump{
    display:flex;
    justify-content:space-between;
    align-items: center;
    margin:20px 0 10px 0;
    width:100%;
    border:1px solid;
    background:#fff;
    border:1px solid #ccc;
    .order{
      display:flex;
      align-items: center;
      p{
        padding:10px;
        font-size:1.8rem;
        font-weight:400;
        color:#333;
        cursor:pointer;
        &:hover{
          color:#00DBD6;
        }
        &.active{
          color:#00DBD6;
        }
      }
    }/*order*/
    .go_jump{
      padding:10px;
      border:1px sodli;
      color:#333;
      input{
        width:30px;
        color:#333;
        text-align:center;
        border-radius:5px;
        background:#00DBD6;
        &:focus{
          outline:none;
        }
      }
    }
  }/*order_jump*/
}/*comment*/
</style>
