<template lang="html">
  <ul class="comment_content">
    <li v-for="(value,index) of asc" :key="index">
      <p>{{(index==0?"沙发":(index==1?"板凳":(index==2?"地板":(index+1)+'楼')))}}</p>
      <div class="main">
        <div class="top_img">
          <div class="img"></div>
          <p>{{value.username}}</p>
        </div>
        <div class="content">
          <p>{{value.content}}</p>
          <div class="date_comment"><p class="date">{{value.date.replace(/-/g,'/').slice(0,value.date.lastIndexOf(':'))}}</p><p class="small_comment" v-show="smallComment != +value.id" style="cursor:pointer;" @click="showSmallComment(value.id)"><i class="fa fa-play fa-rotate-90"></i>评论({{value.smallcount}})</p><p class="small_comment" v-show="smallComment == +value.id" @click="smallComment = -1" style="color:#999;"><i class="fa fa-play fa-rotate-270"></i>隐藏({{value.smallcount}})</p></div>
          <transition name="commentSlide">
            <ul v-show="smallComment == +value.id">
              <li v-for="(v,i) of smallComments" v-key="i"><span>{{v.username}}</span> <span>—</span> <p>{{v.content}}</p></li>
              <li><input type="text" placeholder="再次输入回复内容" v-model="content"><button @click="reply(value.id)" v-show="!replyHide">回复</button><div><i class="fa fa-spinner fa-pulse fa-2x" style="color:#00dbd6" v-show="replyHide"></i></div></li>
            </ul>
          </transition>
        </div>
      </div><!--main-->
    </li>
  </ul>
</template>

<script>
import {mapGetters} from 'vuex';
import axios from 'axios'
import qs from 'qs'
export default {
  mounted(){
    this.mid = window.location.search.slice(1).split('=')[1];
    this.userId = localStorage.getItem('userId');
    this.$store.commit('getBigComment',{mid:this.mid,type:'single',order:'asc',cache:false});
    $(window).off('scroll');
    $(window).on('scroll',(e)=>{
      var scrollTop = document.documentElement.scrollTop;
      var clientHeight = document.documentElement.clientHeight;
      var scrollHeight = document.documentElement.scrollHeight;
      if((scrollTop+clientHeight)>=scrollHeight){
        setTimeout(()=>{
          this.$store.commit('getBigComment',{mid:this.mid,type:'single',order:'asc',cache:true});
        },100);
      }
    });
  },
  data(){
    return {
      smallComment:-1,
      mid:'',
      userId:0,
      content:'',    //回复的内容
      replyHide:false,
    }
  },
  computed:{
    ...mapGetters(['checkLogin','asc','smallComments']),
  },
  watch:{
    asc(value){
      this.$store.commit('bigCount',value[0].bigcount);
    }
  },
  methods:{
    //回复
    reply(id){
      if(this.checkLogin){
        if(this.content){
          this.replyHide = true;
          axios({
            method:'post',
            url:'./static/php/index.php?p=comment&c=comment&a=writeSmallComment',
            data:qs.stringify({
              'bigId':id,
              'userId':this.userId,
              'content':this.content
            }),
            header:{'Content-Type':'application/x-www-form-urlencoded'}
          }).then((res) => {
            console.log(res);
            if(+res.data === 1){
              this.replyHide = false;
              this.$store.commit('getSmallComment',id);
              this.content = '';
            }
          });
        }else{
          console.log('空');
        }
      }else{
        this.$router.push({name:'Login'});
      }
    },
    showSmallComment(bigId){
      this.smallComment = +bigId;
      this.$store.commit('getSmallComment',bigId);
    }
  }
}
</script>

<style lang="scss" scoped>
ul.comment_content{
  margin-bottom:20px;
  width:100%;
  background:#fff;
  border:1px solid #ccc;
  border-radius:5px;
  &>li{
    display:flex;
    align-items:center;
    flex-wrap: wrap;
    margin-bottom:10px;
    border-bottom:1px solid #ccc;
    border-top:1px solid #ccc;
    &:last-child{
      border-bottom:none;
      margin-bottom:0
    }
    &:first-child{
      border-top:none;
    }
    &>p{
      align-self:flex-start;
      margin:20px;
      font-size:1.4rem;
      font-weight:400;
      color:#ccc;
      @media only screen and(max-width:490px){
        margin:10px 20px;
      }
    }
    .main{
      display:flex;
      width:86%;
      background:#fefefe;
      @media only screen and(max-width:490px){
        width:100%;
      }
      .top_img{
        flex:1;
        display:flex;
        flex-flow:column;
        align-self:flex-start;
        justify-content:center;
        align-items:center;
        margin:10px 5px 10px 5px;
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
          margin:10px auto 0 auto;
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
      .content{
        display:flex;
        flex-flow:column;
        // justify-content:space-between;
        flex:8;
        &>p{
          padding-top:20px;
          padding-bottom:10px;
          min-height:80px;
          font-size:1.8rem;
          font-weight:400;
          color:#666;
          line-height:1.5rem;
          @media only screen and(max-width:490px){
            padding-top:0;
          }
        }
        div.date_comment{
          padding-bottom:10px;
          display:flex;
          justify-content:space-between;
          p{
            font-size:1.6rem;
            font-weight:400;
            color:#ccc;
            i{
              margin:0 5px;
              font-size:1.2rem;
            }
            &:last-child{
              margin-right:5px;
              cursor:pointer;
            }
          }/*p*/
        }/*date_comment*/
        ul{
          margin-bottom:10px;
          li{
            display:flex;
            padding:15px;
            font-size:1.6rem;
            color:#666;
            border-bottom:1px solid #ccc;
            span:first-child{
              flex-shrink: 0;
              width:60px;
              text-align:center;
            }
            p{
              line-height:1.5;
            }
            span:nth-child(2){margin:0 10px;}
            &:nth-last-child(2){
              border:none;
            }
            &:last-child{
              display:flex;
              padding:0;
              border:none;
              input{
                flex:1;
                padding:10px;
                font-size:1.6rem;
                font-weight:400;
                color:#333;
                border:1px solid #ccc;
                &:focus{
                  outline:none;
                }
              }/*input*/
              button{
                padding:10px 20px ;
                font-size:1.6rem;
                font-weight:400;
                color:#fff;
                background:#00DBD6;
                border:none;
                border-radius:0 5px 5px 0;
                cursor:pointer;
                &:focus{
                  outline:none;
                }
                @media only screen and(max-width:350px){
                  padding:10px;
                }
              }
              div{
                display:flex;
                justify-content: center;
                align-items:center;
                i{
                  margin:0 5px;
                }
              }
            }/*last-child*/
            @media only screen and(max-width:350px){
              padding:10px;
            }
          }/*li*/
          @media only screen and (max-width:490px){
            width:110%;
            margin-left:-10%;
          }
          @media only screen and (max-width:350px){
            width:128%;
            margin-left:-28%;
          }
        }/*ul*/
      }/*content*/
    }/*main*/
  }/*li*/
}/*comment_content*/
</style>
