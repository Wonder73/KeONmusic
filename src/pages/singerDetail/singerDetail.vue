<template lang="html">
  <div class="singerDetail">
    <div class="detail_single">
      <p class="nav"><a href="#">搜索<span> “告白气球”</span></a> > <a href="#">音乐人</a> > 告白气球</p>

      <div class="detail_single-main">
        <div class="img" @click="DetailInfo"></div>
        <div class="detail_single-main_info">
          <div class="title">
            <h1>Inriye</h1>
            <div class="prove">
              <div class="prove_img"></div><span>已认证</span>|
              <div class="prove_img"></div><span>音乐人</span>
            </div>
          </div><!--title-->
          <div class="introduce">
            <div><p>风格：<span>国语</span><span>流行</span></p><p>自定义个性签名</p></div>
          </div>
        </div><!--introduce-->
        <div class="detail_single-main_opeartion">
          <p>关注<span>20</span>粉丝<span>999万</span>人气<span>9999万</span></p>
          <div class="attention">
            <div class="share"><i class="fa fa-user"></i><span>个人主页</span></div><!--share-->
            <div class="list"><i class="fa fa-heart"></i><span>关注</span></div><!--list-->
          </div>
        </div><!--detail_single-main_opeartion-->
      </div><!--detail_single-main-->
      <div style="clear:both;"></div>
    </div><!--detail_single-->

    <div class="hr"></div>

    <div class="detail_comment">
      <ul class="detail_comment-comment">
        <router-link to="/Album" tag="li"  style="border-left:none;">原创</router-link>
        <router-link to="/Inspiration" tag="li">翻唱</router-link>
        <router-link to="/Comment" tag="li" style="border-right:none;">伴奏</router-link>
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
  name:'singerDetail',
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
.singerDetail{
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
        border:1px solid #888;
        border-radius:100%;
      }
      &>div:not(.img){
        float:right;
        width:900px;
        div.title{
          display:flex;
          flex-flow:column;
          justify-content:space-between;
          padding:5px 0;
          border-bottom:1px solid #efefef;
          h1{
            font-size:3rem;
            font-weight:400;
            color:#333;
          }
          .prove{
            display:flex;
            align-items:center;
            margin:10px 0;
            .prove_img{
              width:20px;
              height:20px;
              background:#00DBD6;
              &:nth-last-child(2){
                margin:0 10px;
              }
            }/*prove_img*/
            span{
              font-size:1.6rem;
              color:#EE2859;
              &:nth-child(2){
                margin:0 10px;
              }
            }/*span*/
          }/*prove*/
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
                  padding:4px 10px;
                  margin:0 5px;
                  border:1px solid #ccc;
                  border-radius:5px;
              }
            }
          }
        }/*introduce*/
        @media only screen and(max-width:1120px){
          width:78%;
        }
        @media only screen and(max-width:1000px){
          width:75%;
        }
        @media only screen and(max-width:900px){
          width:73%;
        }
        @media only screen and(max-width:800px){
          width:70%;
        }
        @media only screen and(max-width:730px){
          width:68%;
        }
        @media only screen and(max-width:700px){
          width:66%;
        }

      }/*div:not(.img)*/
    }/*detail_single-main*/
    .detail_single-main_opeartion{
      display:flex;
      justify-content:space-between;
      align-items:center;
      p{
        font-size:1.8rem;
        color:#999;
        span{
          margin:0 20px 0 5px;
          font-size:2.4rem;
        }
        @media only screen and(max-width:770px){
          font-size:1.6rem;
          span{
            margin:0 15px 0 5px;
            font-size:2.2rem;
            &:last-child{
              margin-right:0;
            }
          }
        }
      }
      div.attention{
        flex:1;
        display:flex;
        justify-content:flex-end;
        &>div{
          display:flex;
          justify-content:center;
          align-items:center;
          margin:0 20px 0 0;
          width:100px;
          height:36px;
          border: 1px solid rgba(204, 204, 204, 1);
          border-radius: 8px;
          cursor:pointer;
          i{
            margin:0 5px;
            font-size:2rem;
            color:#ccc;
          }
          span{
            margin:0 5px;
            font-size:1.6rem;
            color:#333;
            @media only screen and(max-width:770px){
              display:none;
            }
          }
          &:last-child{
            margin:0;
            background:rgba(238, 40, 89, 1);
            border-color:rgba(238, 40, 89, 1);
            i{
              color:#fff;
            }
            span{
              color:#fff;
            }
          }/*div:first-child*/
          @media only screen and(max-width:900px){
            height:36px;
          }
          @media only screen and(max-width:770px){
            width:50px;
          }
        }/*div*/
      }/*div.attention*/
    }/*.detail_single-main_opeartion 操作按钮*/

    @media only screen and(max-width:1120px){
      width:95%;
    }

    //手机排版
    @media only screen and(max-width:631px){
      .detail_single-main{
        display:flex;
        flex-flow:column;
        justify-content:center;
        align-items:center;
        margin-bottom:0 !important;
        .img{
          width:150px !important;
          height:150px !important;
          @media only screen and(max-width:450px){
            width:120px !important;
            height:120px !important;
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
            div.prove{
              display:flex;
              justify-content:center;
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
          flex-flow:column;
          align-items:center;
          width:100% !important;
          .attention{
            margin:10px 0 0 0;
            div{
              width:100px;
              span{
                display:inline-block;
              }
            }
          }
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
