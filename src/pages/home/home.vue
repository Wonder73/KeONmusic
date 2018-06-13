<template lang="html">
  <div class="home">
    <div class="top_info">
      <div class="shadow"></div>
      <div class="user_info">
        <div class="user_info-img">
          <img src="../../assets/topImg.jpg">
          <div class="edit_topImg">
            <svg t="1527305626076" class="icon" style="" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="3234" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20"><path d="M806 911H218c-57.9 0-105-47.1-105-105V218c0-57.9 47.1-105 105-105h349.4c11.6 0 21 9.4 21 21s-9.4 21-21 21H218c-34.7 0-63 28.3-63 63v588c0 34.7 28.3 63 63 63h588c34.7 0 63-28.3 63-63V457c0-11.6 9.4-21 21-21s21 9.4 21 21v349c0 57.9-47.1 105-105 105z" p-id="3235" fill="#efefef"></path><path fill="#efefef" d="M896.6 129c8.2 8.2 8.2 21.5 0 29.7L525.3 529.9c-8.2 8.2-21.5 8.2-29.7 0s-8.2-21.5 0-29.7L866.9 129c8.1-8.2 21.5-8.2 29.7 0z" p-id="3236"></path></svg>更换头像
          </div><!--edit_topImg-->
        </div><!--user_info-img-->
        <div class="user_info-content">
          <div class="user_info-content-name">
            <p>Inriye<svg t="1527305626076" class="icon" style="" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="3234" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20"><path d="M806 911H218c-57.9 0-105-47.1-105-105V218c0-57.9 47.1-105 105-105h349.4c11.6 0 21 9.4 21 21s-9.4 21-21 21H218c-34.7 0-63 28.3-63 63v588c0 34.7 28.3 63 63 63h588c34.7 0 63-28.3 63-63V457c0-11.6 9.4-21 21-21s21 9.4 21 21v349c0 57.9-47.1 105-105 105z" p-id="3235" fill="#efefef"></path><path fill="#efefef" d="M896.6 129c8.2 8.2 8.2 21.5 0 29.7L525.3 529.9c-8.2 8.2-21.5 8.2-29.7 0s-8.2-21.5 0-29.7L866.9 129c8.1-8.2 21.5-8.2 29.7 0z" p-id="3236"></path></svg></p>
            <p>关注<span>20</span>粉丝<span>999万</span>人气<span>9999万</span></p>
            <span><i class="fa fa-cog"></i>账号设置</span>
          </div><!--user_info-content-name-->
          <div class="user_info-content-info">
            <div class="prove">
              <p><span></span><span>已认证</span></p>
              <p><span></span><span>音乐人</span></p>
            </div><!--prove-->
            <div class="info">
              <div class="data">
                <p>男</p>
                <p>广东省</p>
                <p>KeON ID：Inriye</p>
              </div>
              <p>注册日期：1234-56-78</p>
            </div><!--info-->
            <div class="autograph">
              <p>这个人很懒，什么都没有留下。</p>
              <svg t="1527305626076" class="icon" style="" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="3234" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20"><path d="M806 911H218c-57.9 0-105-47.1-105-105V218c0-57.9 47.1-105 105-105h349.4c11.6 0 21 9.4 21 21s-9.4 21-21 21H218c-34.7 0-63 28.3-63 63v588c0 34.7 28.3 63 63 63h588c34.7 0 63-28.3 63-63V457c0-11.6 9.4-21 21-21s21 9.4 21 21v349c0 57.9-47.1 105-105 105z" p-id="3235" fill="#efefef"></path><path fill="#efefef" d="M896.6 129c8.2 8.2 8.2 21.5 0 29.7L525.3 529.9c-8.2 8.2-21.5 8.2-29.7 0s-8.2-21.5 0-29.7L866.9 129c8.1-8.2 21.5-8.2 29.7 0z" p-id="3236"></path></svg>
            </div><!--autograph-->
          </div><!--user_info-content-info-->
        </div><!--user_info-content-->
      </div><!--user_info-->
    </div><!--top_info-->
    <div class="main">
      <div class="main_left">
        <ul class="main_left-nav">
          <li :class="{active:mainLeftShow}" @click="mainLeftShow = true">简介</li>
          <li :class="{active:!mainLeftShow}" @click="mainLeftShow = false">荣誉</li>
        </ul>
        <Synopsis v-show="mainLeftShow"></Synopsis>
        <Glory v-show="!mainLeftShow"></Glory>
      </div><!--main_left-->
      <div class="main_right">
        <ul class="main_right-nav">
          <li :class="{active:rightIndex == 1}" @click="rightIndex = 1">单曲</li>
          <li :class="{active:rightIndex == 2}" @click="rightIndex = 2">歌单</li>
          <li :class="{active:rightIndex == 3}" @click="rightIndex = 3">收藏</li>
          <li :class="{active:rightIndex == 4}" @click="rightIndex = 4">动态</li>
          <li>社区</li>
        </ul><!--main_right-nav-->
        <Single v-if="rightIndex == 1"></Single>
        <Album v-if="rightIndex == 2"></Album>
        <Collection v-if="rightIndex == 3"></Collection>
        <Dynamic v-if="rightIndex == 4"></Dynamic>
      </div><!--main_right-->
    </div><!--main-->
    <div class="message_title">
      <h1>留言板</h1>
      <h2>leave a message</h2>
    </div>
    <div class="message">
      <div class="message_left">
        <p>给 Inriye 留言</p>
        <div class="message_input">
          <div class="style"></div><!--style-->
          <textarea placeholder="再次输入留言——"></textarea>
        </div><!--message_input-->
        <button type="button">发表留言</button>
      </div><!--message_left-->
      <div class="message_right">
        <div class="message_content">
          <div class="order_jump">
            <div class="order">
              <router-link to="/Comment/Asc" tag="p">顺序</router-link>|
              <router-link to="/Comment/Desc" tag="p">倒序</router-link>
            </div>
            <div class="go_jump">
              直达
              <input type="text" name="" value="">
              楼
            </div>
          </div><!--order_jump-->
          <ul class="message_container">
            <li>
              <div class="message_container-date">
                <h3>2018/5/30</h3>
                <h3>14:15</h3>
              </div>
              <div class="message_container-img">
                <div class="img"></div>
                <p>Inriye</p>
              </div>
              <div class="message_container-content">
                <p>嗯？不好吧</p>
              </div>
            </li>
            <li>
              <div class="message_container-date">
                <h3>2018/5/30</h3>
                <h3>14:15</h3>
              </div>
              <div class="message_container-img">
                <div class="img"></div>
                <p>Inriye</p>
              </div>
              <div class="message_container-content">
                <p>嗯？不好吧</p>
              </div>
            </li>
            <li>
              <div class="message_container-date">
                <h3>2018/5/30</h3>
                <h3>14:15</h3>
              </div>
              <div class="message_container-img">
                <div class="img"></div>
                <p>Inriye</p>
              </div>
              <div class="message_container-content">
                <p>嗯？不好吧</p>
              </div>
            </li>
            <li>
              <div class="message_container-date">
                <h3>2018/5/30</h3>
                <h3>14:15</h3>
              </div>
              <div class="message_container-img">
                <div class="img"></div>
                <p>Inriye</p>
              </div>
              <div class="message_container-content">
                <p>嗯？不好吧</p>
              </div>
            </li>
          </ul><!--li-->
        </div><!--message_content-->
      </div><!--message_right-->
    </div><!--message-->
    <Header :fixed="true"></Header>
		<InfoMenu></InfoMenu><!--左边用户信息栏-->
    <Minimize></Minimize>
		<router-view></router-view>
  </div><!--home-->
</template>

<script>
import InfoMenu from '@/components/InfoMenu'
import Minimize from '@/components/Minimize'
import Header from '@/components/Header'
import Synopsis from '@/components/home/mainLeft/Synopsis'
import Glory from '@/components/home/mainLeft/Glory'
import Single from '@/components/home/mainRight/Single'
import Album from '@/components/home/mainRight/Album'
import Collection from '@/components/home/mainRight/Collection'
import Dynamic from '@/components/home/mainRight/Dynamic'
export default {
  name:'home',
  mounted(){
    var width = document.documentElement.clientWidth;
    var height = document.documentElement.clientHeight;
    document.getElementsByClassName('message')[0].style.height=height+'px';
  },
  data(){
    return {
      mainLeftShow:true,    //主体左边的显示
      rightIndex:1
    }
  },
  components:{
    InfoMenu,
    Minimize,
    Header,
    //mainLeft
    Synopsis,
    Glory,
    //mainRight
    Single,
    Album,
    Collection,
    Dynamic,
  }
}
</script>

<style lang="scss" scoped>
.home{
  position:relative;
  padding-top:60px;
  .top_info{
    display:flex;
    justify-content:center;
    align-items:flex-end;
    position:relative;
    width:100%;
    height:340px;
    background:#000 url(../../assets/topBg.jpg) no-repeat center/cover;
    .shadow{
      position:absolute;
      left:0;
      bottom:0;
      width:100%;
      height:33%;
      background:rgba(0,0,0,0.6);
    }/*shadow*/
    .user_info{
      display:flex;
      margin-bottom:12px;
      width:1200px;
      height:180px;
      .user_info-img{
        overflow:hidden;
        position:relative;
        margin-right:30px;
        width:180px;
        height:100%;
        border-radius:100%;
        background:#00DBD6;
        cursor:pointer;
        img{
          width:100%;
          height:auto;
        }
        .edit_topImg{
          display:flex;
          justify-content:center;
          align-items: center;
          position:absolute;
          bottom:0;
          left:0;
          width:100%;
          height:30%;
          font-size:1.4rem;
          color:#efefef;
          letter-spacing:1px;
          background:rgba(0,0,0,0.6);
          transform:translateY(100%);
          opacity:0;
          transition:all .3s linear;
          svg{
            margin:0 4px;
          }
        }/*edit_topImg*/
        &:hover .edit_topImg{
          opacity:1;
          transform:translateY(0);
        }
      }/*user_info-img*/
      .user_info-content{
        flex:1;
        display:flex;
        flex-flow:column;
        justify-content:space-between;
        z-index:1;
        .user_info-content-name{
          display:flex;
          padding:30px 0 0 0;
          p{
            flex-shrink:0;
            font-size:4rem;
            font-weight:400;
            color:#fff;
            svg{
              margin:0 10px;
            }
          }/*p*/
          p:nth-child(2){
            display:flex;
            align-items:center;
            flex:1;
            font-size:1.8rem;
            font-weight:400;
            color:#ccc;
            span{
              margin:0 20px 0 10px;
              font-size:2.4rem;
              font-weight:400px;
              color:#fff;
            }
          }
          &>span{
            flex-shrink:0;
            width:120px;
            height:40px;
            font-size:1.8rem;
            font-weight:400;
            color:#fff;
            text-align:center;
            line-height:40px;
            border:1px solid #ccc;
            border-radius:4px;
            i{
              margin:0 10px 0 0;
            }
          }/*span*/
        }/*user_info-content-name*/
        .user_info-content-info{
          &>div{
            display:flex;
            &.prove{
              align-items:center;
              p{
                display:flex;
                align-items:center;
                span:last-child{
                  margin-right:30px;
                  font-size:1.8rem;
                  font-weight:400;
                  color:#ee2859;
                }
                span:first-child{
                  display:inline-block;
                  margin-right:4px;
                  width:20px;
                  height:20px;
                  background:#00dbd6;
                }
              }/*p*/
            }/*div.prove*/
            &.info{
              justify-content:space-between;
              margin:16px 0;
              p{
                font-size:1.8rem;
                font-weight:400;
                color:#ccc;
              }
              div.data{
                display:flex;
                p:nth-child(2){
                  margin:0 30px;
                }
              }
            }/*div.info*/
            &.autograph{
              display:flex;
              align-items:center;
              p{
                font-size:1.8rem;
                font-weight:400;
                color:#ccc;
              }
            }
          }/*div*/
        }/*user_info-content-info*/
      }/*user_info-content*/
    }/*user_info*/
  }/*top_info*/
  .main{
    display:flex;
    justify-content:space-between;
    align-items:stretch;
    margin:0 auto;
    width:1200px;
    min-height:100px;
    .main_left{
      display:flex;
      flex-flow:column;
      width:250px;
      .main_left-nav{
        display:flex;
        height:40px;
        li{
          flex:1;
          position:relative;
          height:100%;
          font-size:1.8rem;
          font-weight:400;
          text-align:center;
          line-height:40px;
          border-bottom:1px solid #ccc;
          border-left:1px solid rgba(0,0,0,0);
          border-right:1px solid rgba(0,0,0,0);
          cursor:pointer;
          &:hover{
            color:#ee2859;
          }
          &.active{
            border-left:1px solid #ccc;
            border-right:1px solid #ccc;
            border-bottom:1px solid rgba(0,0,0,0);
            background:#fff;
            &:before{
              position:absolute;
              top:0;
              left:0;
              display:block;
              content:'';
              width:100%;
              height:3px;
              background:#ee2859;
            }
          }/*acitve*/
        }/*li*/
      }/*main_left-nav*/
    }/*main_left*/
    .main_right{
      display:flex;
      flex-flow:column;
      width:900px;
      .main_right-nav{
        display:flex;
        height:40px;
        li{
          flex:1;
          position:relative;
          height:100%;
          font-size:1.8rem;
          font-weight:400;
          text-align:center;
          line-height:40px;
          border-bottom:1px solid #ccc;
          border-left:1px solid rgba(0,0,0,0);
          border-right:1px solid rgba(0,0,0,0);
          cursor:pointer;
          &:hover{
            color:#00dbd6;
          }
          &.active{
            border-left:1px solid #ccc;
            border-right:1px solid #ccc;
            border-bottom:1px solid rgba(0,0,0,0);
            &:before{
              position:absolute;
              top:0;
              left:0;
              display:block;
              content:'';
              width:100%;
              height:3px;
              background:#00dbd6;
            }
          }
        }
      }/*main_right-nav*/
    }/*main_right*/
  }/*main*/
  .message_title{
    padding:30px 0 20px 0;
    margin:20px auto 0 auto;
    width:1200px;
    border-top:1px solid #ccc;
    h1{
      font-size:3rem;
      font-weight:400;
      color:#333;
      line-height:1.5;
      text-align:center;
    }
    h2{
      font-size:2rem;
      font-weight:400;
      color:#999;
      text-align:center;
    }
  }
  .message{
    box-sizing:border-box;
    display:flex;
    padding:60px 0 0 0;
    width:100%;
    height:100%;
    background:url(../../assets/messageBg.jpg) no-repeat center bottom/cover;
    &>div{
      display:flex;
      flex-flow:column;
      justify-content:center;
      &.message_left{
        flex-shrink:0;
        padding:0 30px;
        height:100%;
        background:rgba(0,0,0,0.3);
        p{
          margin-bottom:15px;
          font-size:1.8rem;
          font-weight:400;
          color:#efefef;
        }/*p*/
        &>div.message_input{
          overflow:hidden;
          display:flex;
          flex-flow:column;
          width:300px;
          height:230px;
          background:rgba(0,0,0,0.5);
          border-radius:5px;
          div.style{
            width:100%;
            height:40px;
            background:rgba(0,0,0,0.5);
          }/*style*/
          textarea{
            flex:1;
            box-sizing:border-box;
            padding:5px;
            width:100% !important;
            font-size:2rem;
            font-weight:400;
            color:#666;
            resize:none;
            background:none;
            border:none;
            &:focus{
              outline:none;
            }
          }/*textarea*/
        }/*div.message_input*/
        &>button{
          align-self:center;
          margin-top:20px;
          width:150px;
          height:40px;
          font-size:1.6rem;
          font-weight:400;
          color:#efefef;
          border-radius:5px;
          background:rgba(0,0,0,0.5);
          border:none;
          cursor:pointer;
          &:focus{
            outline:none;
          }
        }/*button*/
      }/*message_left*/
      &.message_right{
        display:flex;
        justify-content:center;
        align-items:center;
        flex:1;
        div.message_content{
          display:flex;
          flex-flow:column;
          padding:20px;
          width:700px;
          height:470px;
          background:rgba(255,255,255,0.14);
          .order_jump{
            display:flex;
            justify-content:space-between;
            align-items: center;
            width:100%;
            background:rgba(102, 102, 112, 0.85);
            border-radius:5px;
            .order{
              flex-shrink:0;
              display:flex;
              align-items: center;
              p{
                padding:10px;
                font-size:1.8rem;
                font-weight:400;
                color:#35383e;
                cursor:pointer;
                &:hover{
                  color:#ccc;
                }
                &.active{
                  color:#ccc;
                }
              }
            }/*order*/
            .go_jump{
              padding:10px;
              border:1px sodli;
              color:#ccc;
              input{
                width:30px;
                color:#333;
                text-align:center;
                border-radius:5px;
                background:#35383e;
                &:focus{
                  outline:none;
                }
              }
            }/*go_jump*/
          }/*order_jump*/
          ul.message_container{
            overflow:hidden;
            flex:1;
            margin-top:10px;
            padding:0 20px;
            width:100%;
            background:rgba(250, 250, 250, 0.898039215686275);
            border-radius:5px;
            box-sizing:border-box;
            &>li{
              display:flex;
              align-items:center;
              padding:10px 0;
              border-bottom:1px solid #ccc;
              div{
                &.message_container-date{
                  flex-shrink:0;
                  color:#333;
                  font-weight:400;
                  line-height:1.5;
                  text-align:center;
                  h3{
                    font-size:1.6rem;
                  }
                }/*message_container-date*/
                &.message_container-img{
                  flex-shrink:0;
                  margin:0 15px;
                  border:1px solid #efefef;
                  .img{
                    width:50px;
                    height:50px;
                    border-radius:60px;
                    background:#00dbd6;
                  }
                  p{
                    margin-top:5px;
                    font-size:1.8rem;
                    font-weight:400;
                    color:#333;
                    text-align:center;
                  }
                }/*_container-img*/
                &.message_container-content{
                  display:flex;
                  flex:1;
                  padding:10px;
                  height:100px;
                  background:rgba(255, 255, 255, 0.6);
                  border:1px solid #efefef;
                  border-radius:10px;
                  box-sizing:border-box;
                  p{
                    font-size:1.8rem;
                    font-weight:400;
                    color:#333;
                  }/*p*/
                  .album-img{
                    margin-right:10px;
                    width:80px;
                    height:80px;
                    border:1px solid #efefef;
                    background:#00dbd6;
                  }/*album-img*/
                }/*message_container-content*/
              }/*div*/
            }/*li*/
          }/*ul._container*/
        }/*message_content*/
      }/*message_right*/
    }/*div*/
  }/*message*/
}
</style>

<style lang="scss">
html{
    font-size:52.5% !important;
}
body {
  position:relative;
    background: radial-gradient(#fafafa, #eeeeee) no-repeat center center/100% fixed;
}
</style>
