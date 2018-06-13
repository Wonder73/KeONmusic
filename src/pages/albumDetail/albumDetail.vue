<template lang="html">
  <div class="detail">
    <div class="detail_single">
      <p class="nav"><a href="#">搜索<span> “告白气球”</span></a> > <a href="#">歌单</a> > 告白气球</p>

      <div class="detail_single-main">
        <div class="img" @click="DetailInfo"></div>
        <div class="detail_single-main_info">
          <div class="title"><h1>告白气球<span>原创</span></h1><p>播放量：123456</p></div><!--title-->
          <div class="introduce">
            <div><p>创建人：<span>Inriye</span></p><p>标签：<span>国语</span><span>流行</span></p><p>创建时间：2016-06-24  13:24:35</p></div>
            <div><p>收藏量：123456</p></div>
          </div>
        </div><!--introduce-->
        <div class="detail_single-main_opeartion">
          <div class="play">
            <svg t="1527306872593" class="icon" style="" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2436" xmlns:xlink="http://www.w3.org/1999/xlink" width="200">
              <!-- <defs><style type="text/css"></style></defs> -->
              <path d="M512 896C299.922286 896 128 724.077714 128 512S299.922286 128 512 128 896 299.922286 896 512 724.077714 896 512 896z m0-36.571429a347.428571 347.428571 0 1 0 0-694.857142 347.428571 347.428571 0 0 0 0 694.857142z m155.428571-331.593142l-219.428571 126.683428a18.285714 18.285714 0 0 1-27.428571-15.835428v-253.366858a18.285714 18.285714 0 0 1 27.428571-15.835428l219.428571 126.683428a18.285714 18.285714 0 0 1 0 31.670858z" p-id="2437"></path>
            </svg>
            <span>播放</span>
          </div><!--play-->
          <div class="headphones">
            <i class="fa fa-headphones"></i>
            <span>收藏</span>
          </div>
          <div class="download">
            <i class="fa fa-download"></i>
            <span>下载</span>
          </div><!--download-->
          <div class="commenting">
            <i class="fa fa-commenting"></i>
            <span>评论</span>
          </div><!--commenting-->
          <div class="share">
            <i class="fa fa-share-alt"></i>
            <span>分享</span>
          </div><!--share-->
          <div class="list">
            <img src="../../assets/list.png" alt="">
            <span>队列</span>
          </div><!--list-->
        </div><!--detail_single-main_opeartion-->
      </div><!--detail_single-main-->
      <div style="clear:both;"></div>
    </div><!--detail_single-->

    <div class="hr"></div>

    <div class="detail_comment">
      <ul class="detail_comment-comment">
        <router-link to="/Album" tag="li"  style="border-left:none;">收录歌曲(999+)</router-link>
        <router-link to="/Inspiration" tag="li">简介</router-link>
        <router-link to="/Comment" tag="li" style="border-right:none;">评论(1234567)</router-link>
      </ul>
      <ul class="detail_comment-thumbsUp">
        <li><i class="fa fa-thumbs-up"></i>123456</li>
        <li><i class="fa fa-eye"></i>123456</li>
      </ul>
    </div>

    <Header :fixed="true"></Header>
    <InfoMenu></InfoMenu><!--左边用户信息栏-->
    <Minimize></Minimize>
    <DetailInfo v-show="DetailInfoShow" @DetailInfo="DetailInfo"></DetailInfo><!--手机的信息-->
		<router-view></router-view>
  </div><!--detail-->
</template>

<script>
import InfoMenu from '@/components/InfoMenu'
import Minimize from '@/components/Minimize'
import Header from '@/components/Header'
import DetailInfo from '@/components/detail/DetailInfo'
export default {
  name:'detail',
  data(){
    return {
      DetailInfoShow:false
    }
  },
  components:{
    InfoMenu,
    Minimize,
    Header,
    DetailInfo
  },
  methods:{
    DetailInfo(){
      var screenWidth = document.documentElement.clientWidth;
      if(screenWidth <= 631){
        this.DetailInfoShow = !this.DetailInfoShow;
      }
    }
  }
}
</script>

<style lang="scss" scoped>
.detail{
  margin-top:70px;
  min-height:100px;
  .detail_single{
    margin:0 auto;
    width:1120px;
    p.nav{
      margin:5px 0;
      font-size:1.6rem;
      font-weight:400;
      color:#333;
      a{
        color:#333;
        span{
          color:#00DBD6;
        }
      }
    }/*p.nav*/

    div.detail_single-main{
      margin:20px 0;
      width:100%;
      div.img{
        float:left;
        width:200px;
        height:200px;
        background:#00DBD6;
      }
      &>div:not(.img){
        float:right;
        width:900px;
        div.title{
          display:flex;
          justify-content:space-between;
          padding:5px 0;
          border-bottom:1px solid #efefef;
          h1{
            font-size:3rem;
            font-weight:400;
            color:#333;
            span{
              margin:0 10px;
              font-size:1.4rem;
              font-weight:400;
              color:#999;
            }
          }
          p{
            align-self:flex-end;
            color:#999;
          }
        }/*title*/
        .introduce{
          display:flex;
          div{
            flex-shrink:0;
            padding:5px 0;
            p{
              margin:15px 0;
              font-size:1.6rem;
              font-weight:400;
              color:#999;
              span{
                color:#333;
              }
              &:nth-child(2){
                span{
                  padding:4px 10px;
                  margin:0 5px;
                  border:1px solid #ccc;
                  border-radius:5px;
                }
              }
            }
            &:last-child{
              flex:6 1;
              p:first-child{
                margin:0;
                margin-bottom:30px;
                font-size:1.4rem;
                color:#999;
                text-align:right;
              }
            }
          }
        }/*introduce*/
        @media only screen and(max-width:1120px){
          width:78%;
          // border:1px solid;
        }
        @media only screen and(max-width:1000px){
          width:75%;
        }
        @media only screen and(max-width:900px){
          width:73%;
        }
        @media only screen and(max-width:800px){
          width:71%;
        }
        @media only screen and(max-width:730px){
          width:69%;
        }
        @media only screen and(max-width:700px){
          width:66%;
        }

      }/*div:not(.img)*/
    }/*detail_single-main*/
    .detail_single-main_opeartion{
      display:flex;
      align-items:center;
      height:56px;
      &>div{
        flex:1;
        display:flex;
        justify-content:center;
        align-items:center;
        margin:0 20px 0 0;
        height:40px;
        border: 1px solid rgba(204, 204, 204, 1);
        border-radius: 5px;
        cursor:pointer;
        svg,i,img{
          margin:0 5px;
        }
        svg{
          width:25px;
          height:25px;
          fill:#ccc;
        }
        i{
          font-size:2rem;
          color:#ccc;
        }
        img{
          width:20px;
          height:20px;
        }
        span{
          margin:0 5px;
          font-size:1.6rem;
          color:#333;
          @media only screen and(max-width:820px){
            display:none;
          }
        }
        &:first-child{
          background:#00DBD6;
          border-color:#00DBD6;
          svg{
            fill:#fff;
          }
          span{
            color:#fff;
          }
        }/*div:first-child*/
        &:hover{
          background:#00DBD6;
          border-color:#00DBD6;
          i{
            color:#fff;
          }
          span{
            color:#fff;
          }
        }/*hover*/
        @media only screen and(max-width:900px){
          height:36px;
        }
      }/*div*/
    }/*.detail_single-main_opeartion 操作按钮*/

    @media only screen and(max-width:1120px){
      width:95%;
    }

    //手机排版
    @media only screen and(max-width:631px){
      .detail_single-main{
        display:flex;
        flex-wrap: wrap;
        margin-bottom:0 !important;
        .img{
          flex-shrink:0;
          @media only screen and(max-width:450px){
            width:150px !important;
            height:150px !important;
          }
        }
        .detail_single-main_info{
          flex:1;
          align-self:center;
          clear:both;
          .title{
            border:none !important;
            h1{
              margin:0 auto;
            }
            p{
              display:none;
            }
          }
          .introduce{
            display:none !important;
          }
        }/*detail_single-main_info*/
        .detail_single-main_opeartion{
          clear:both;
          width:100% !important;
        }
      }/*detail_single-main*/
    }
  }/*detail_single*/

  div.hr{
    clear:botn;
    margin:20px 0;
    width:100%;
    border-bottom:1px solid #efefef;
  }/*hr*/

  .detail_comment{
    display:flex;
    justify-content:space-between;
    margin:0 auto;
    width:1120px;
    ul{
      display:flex;
      &:first-child{
        li{
          padding:10px 0;
          width:140px;
          font-size:1.8rem;
          color:#333;
          text-align:center;
          border-bottom:1px solid #ccc;
          cursor:pointer;
          &:hover{
            color:#00DBD6;
          }
          &.active{
            border:1px solid #ccc;
            border-top:2px solid #00dbd6;
            border-bottom:none;
          }
        }
      }/*ul:first-child*/
      &:last-child{
        li{
          padding:10px 0;
          padding-left:10px;
          font-size:1.6rem;
          color:#999;
          i{
            padding:0 5px;
          }
          &:first-child{
            color:#EE2859;
          }
        }/*li*/
      }/*ul:last-child*/
    }/*ul*/
    @media only screen and(max-width:1120px){
      width:95%;
    }
    @media only screen and(max-width:631px){
      ul.detail_comment-comment{
        flex:1;
        li{
          flex:1 !important;
          width:0;
        }
      }
      ul.detail_comment-thumbsUp{
        display:none;
      }
    }
  }/*detail_comment*/

}/*detail*/
</style>
<style lang="scss">
html{
    font-size:52.5% !important;
}
body {
    background: radial-gradient(#fafafa, #eeeeee) no-repeat center center/100% fixed;
}
</style>
