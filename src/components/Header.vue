<template lang="html">
  <div id="header">
    <div class="musicShow_btn"><img src="../assets/smallLogo.gif" v-show="!play_pause" @click="player = !player"><img src="../assets/smallLogo.png" v-show="play_pause" @click="player = !player"></div>
    <div class="logo"><img src="../assets/logo.png" alt=""></div>
    <transition name="slide">
      <div class="player" v-show="player || screenWidth >= 800 ">
        <div class="music_info">
          <div class="img"><a href="./index.html"><img :src="(audioInfo[musicIndex].img?audioInfo[musicIndex].img:'static/img/logo.aea432e.gif')"></a></div>
          <div class="info">
            <p>{{audioInfo[musicIndex].name?audioInfo[musicIndex].name:'轻音音乐'}}-{{audioInfo[musicIndex].singer?audioInfo[musicIndex].singer:'轻音音乐'}}</p>
            <div class="list_time">
              <img src="../assets/list.png" alt="">
              <div class="time"><span>{{time}}</span>|<span>{{totalTime}}</span></div><!-- time -->
              <img src="../assets/order.svg" alt="" v-show="playStyle%3==1" @click="playStyle++">
              <img src="../assets/loop.svg" alt="" v-show="playStyle%3==2" @click="playStyle++">
              <img src="../assets/random.svg" alt="" v-show="playStyle%3==0" @click="playStyle++">
            </div><!--list_time-->
          </div><!--info-->
        </div><!--music_info-->

        <div class="operation">
          <div class="player_btn">
              <i class="fa fa-step-backward" @click="prevMusic"></i>
              <div class="play_btn">
                <i class="fa fa-play play_btn" v-show="play_pause" @click="play"></i>
                <i class="fa fa-pause pause_btn" v-show="!play_pause" @click="pause" ></i>
              </div>
              <i class="fa fa-step-forward" @click="nextMusic"></i>
              <div class="volume"  @touchstart="Dragvolume" @mousedown="Dragvolume">
                <div class="progress" :style="{width:volume+'%'}"></div>
                <div class="dot" :style="{left:(volume-2)+'%'}"></div>
              </div><!-- volume -->
          </div><!-- play_btn 播放器按钮-->

          <div class="progress_bar" @mousedown="Dragprogress" @touchstart="Dragprogress">
              <div class="progress" :style="{width:progressStyle+'%'}"></div>
              <div class="dot" :style="{left:(progressStyle-2)+'%'}"></div>
          </div><!-- progress_bar 进度条 -->

        </div><!--operation 如进度条、上下曲-->
      </div><!--player-->
    </transition>

    <div class="search_vest"  @mouseover="searchDowm=true" @mouseout="searchDowm = false">
      <div class="search">
        <i class="microphone fa fa-microphone fa-2x"></i>
        <input type="text" name="search" placeholder="搜索内容" autocomplete="off" v-model="search">
        <span class="search_btn"><a :href="href">搜索</a></span>
      </div><!-- search 搜索栏 -->
      <div class="search_down" v-show="search && searchDowm">
        <ul class="category">
          <li v-for="(value,index) in searchData">

              <div class="cate_left" v-if="value.name != '歌手'">
                <p>{{value.name}}</p>
              </div>
              <ul class="content_right" v-if="value.name != '歌手'">
                <li v-for="(value,index) of value.itemlist"><p>{{value.name}}-{{value.singer}}</p><div class="operation"><img src="../assets/list.png"><i class="fa fa-play" @click="getMusic(value.albummid,value.mid)"></i></div></li>
              </ul>

              <div class="cate_left" v-if="value.name == '歌手'">
                <p>用户</p>
              </div>
              <ul class="content_right" v-if="value.name == '歌手'">
                <li v-for="(value,index) of value.itemlist"><p>{{value.singer}}</p><div class="operation"><i class="fa fa-heart"></i></div></li>
              </ul>
          </li>
        </ul>
      </div><!--serach_down-->
    </div><!--search_vest是搜索栏的马甲-->

    <div class="login_reg">
        <router-link to="/Login" tag="p" class="login_btn">登录</router-link>
        <div class="menu_btn" @click="menu = !menu"><span></span><span></span></div>
    </div><!-- login_reg -->
    <Menu v-show="menu"></Menu>
    <audio id="audio" :src="audioInfo[musicIndex].src" @ended="nextMusic" @canplay="canplay"></audio>
  </div>
</template>

<script>
import Menu from './Menu.vue';
import {mapGetters} from 'vuex';
export default {
  mounted(){
    var audio = document.getElementById('audio')
    audio.volume=0.5;
    audio.addEventListener('timeupdate',this.current);

    this.$store.commit('localAudio');
  },
  data(){
    return {
      search:'',              //搜索内容的双向绑定
      searchDowm:false,      // 搜索内容的显示
      searchData:{},          //后台获取的搜索数据
      menu:false,
      play_pause:true,        //播放或暂停按钮的显示
      player:false,           //播放器的显示
      playStyle:1,             //播放发送默认顺序播放
      duration:0,             //歌曲总长的时间戳
      currentTime:0,          //歌曲播放位置的时间戳
      volume:50,         //音量
      musicIndex:0,      //播放哪一首
      href:''
    }
  },
  computed:{
    ...mapGetters(['audioMid','audioInfo','musicIndex2']),//保存音乐的id //播放列表
    totalTime(){           //格式化时间戳
      if(this.duration == this.duration && this.duration){
        var minute = Math.floor(this.duration/60);
        var second = Math.floor(this.duration%60);
        return (minute<10?'0'+minute:minute)+':'+(second<10?'0'+second:second);
      }else{
        return "00:00"
      }
    },
    time(){         //格式化播放位置
      if(this.currentTime){
        var minute = Math.floor(this.currentTime/60);
        var second = Math.floor(this.currentTime%60);
        return (minute<10?'0'+minute:minute)+':'+(second<10?'0'+second:second);
      }else{
        return "00:00"
      }
    },
    progressStyle(){           //进度条效果
      return (this.currentTime/this.duration)*100
    },
    computerOrPhone(){
      console.log(navigator.userAgent);
      if (/(iPhone|iPad|iPod|iOS|Android|Windows Phone|SymbianOS|Mobile)/i.test(navigator.userAgent)) { //移动端
          return 'phone';
      }
      return 'computer';
    },
    screenWidth(){          //屏幕的宽度
      //console.log(document.documentElement.clientWidth);
      return document.documentElement.clientWidth;
    }
  },
  watch:{
    volume:(newValue,oldValue)=>{
      document.getElementById('audio').volume=newValue/100;
    },
    search(newV,oldV){
      this.href='./search.html?search='+newV;
      if(newV){
        $.ajax({
          async: true,
          url: "https://c.y.qq.com/splcloud/fcgi-bin/smartbox_new.fcg?is_xml=0&format=jsonp&g_tk=5381&loginUin=0&hostUin=0&format=jsonp&inCharset=utf8&outCharset=utf-8&notice=0&platform=yqq&needNewCode=0",
          type: "GET",
          dataType: 'jsonp',
          jsonp: 'jsonpCallback',
          data: {
            'key':newV,
          },
          timeout: 5000,
          success: (json) => {
            this.searchData = json.data;
            // console.log(this.searchData);
          }
        });
      }
    },
    musicIndex2(newV,oldV){
      this.musicIndex = newV;
      if(this.musicIndex != 0){
        this.play();
      }
    }
  },
  components:{
    Menu
  },
  methods:{
    play(){      //播放
      this.play_pause=false;
      document.getElementById('audio').play();
    },
    pause(){       //暂停
      this.play_pause=true;
      document.getElementById('audio').pause();
    },
    current(e){        //获取播放位置
      this.currentTime = document.getElementById('audio').currentTime;
    },
    //播放位置
    Dragprogress(e){
      e.preventDefault();
      var audio = document.getElementById('audio');   //获取audio对象

      audio.removeEventListener('timeupdate',this.current);    //移除timeupdate事件

      var node = e.target;          //获取点击时的节点
      var _this = this;            //修改this

      if(e.target.className !== 'progress_bar'){   //判断是点击已加载还是未加载
        node = node.parentNode;
      }

      var width = node.offsetWidth;            //进度条宽度
      var left = node.offsetLeft;              //进度条距离浏览器的左边距离
      var mouseLeft =(e.type == 'mousedown')? e.clientX:e.touches[0].clientX;                //鼠标距离浏览器的左边距离

      //计算要加载多少，(mouseLeft-left)/width)比值 鼠标点击的位置占多少
      this.currentTime = (this.duration * ((mouseLeft-left)/width));

      //让this.currentTime在一定范围内
      if(this.currentTime < 0){
        this.currentTime = 0;
      }else if(this.currentTime > this.duration){
        this.currentTime = this.duration;
      }
      audio.currentTime = _this.currentTime;       //改变播放位置
      if(this.computerOrPhone == 'computer'){    //电脑或手机
        window.addEventListener('mousemove',mouseover);
        window.addEventListener('mouseup',mouseup);
      }else{
        window.addEventListener('touchmove',mouseover);
        window.addEventListener('touchend',mouseup);
      }


      //鼠标移动
      function mouseover(e){
        var mouseLeft =(_this.computerOrPhone == 'computer')? e.clientX:e.touches[0].clientX;
        _this.currentTime = (_this.duration * ((mouseLeft-left)/width));
        if(_this.currentTime<0){
          _this.currentTime = 0;
        }else if(_this.currentTime>_this.duration){
          _this.currentTime = _this.duration;
        }
      }

      //鼠标弹起
      function mouseup(e){
        audio.currentTime = _this.currentTime;
        audio.addEventListener('timeupdate',_this.current);    //在一起启用timeupdate

        if(_this.computerOrPhone == 'computer'){
          window.removeEventListener('mousemove',mouseover);
          window.removeEventListener('mouseup',mouseup);
        }else{
          window.removeEventListener('touchmove',mouseover);
          window.removeEventListener('touchend',mouseup);
        }
      }
    },
    //调节音量
    Dragvolume(e){
      var node = e.target;
      var _this = this;

      if(e.target.className !== 'volume'){
        node = node.parentNode;
      }

      var width = node.offsetWidth;
      var left = node.offsetLeft;
      var mouseLeft =(e.type == 'mousedown')? e.clientX:e.touches[0].clientX;

      this.volume = ((mouseLeft-left)/width)*100;

      if(this.volume < 0){
        this.volume = 0;
      }else if(this.volume > 100){
        this.volume = 100;
      }
      if(this.computerOrPhone == 'computer'){
        window.addEventListener('mousemove',mouseover);
        window.addEventListener('mouseup',mouseup);
      }else{
        window.addEventListener('touchmove',mouseover);
        window.addEventListener('touchend',mouseup);
      }


      function mouseover(e){
        var mouseLeft =(_this.computerOrPhone == 'computer')? e.clientX:e.touches[0].clientX;
        _this.volume = ((mouseLeft-left)/width)*100;

        if(_this.volume < 0){
          _this.volume = 0;
        }else if(_this.volume > 100){
          _this.volume = 100;
        }

      }

      function mouseup(){
        if(_this.computerOrPhone == 'computer'){
          window.removeEventListener('mousemove',mouseover);
          window.removeEventListener('mouseup',mouseup);
        }else{
          window.removeEventListener('touchmove',mouseover);
          window.removeEventListener('touchend',mouseup);
        }
      }
    },
    //音乐下一曲
    nextMusic(e){
      //单曲循环
      if(this.playStyle%3 == 2){
        document.getElementById('audio').currentTime = 0;
        return;
      }
      //随机播放
      if(this.playStyle%3 == 0){
        while(true){
          let random = Math.floor(Math.random()*(0+this.audioInfo.length))
          if(random != this.musicIndex){
            this.musicIndex = random;
            document.getElementById('audio').currentTime = 0;
            return;
          }
        }
      }
      if(e.type == 'ended'){
        setTimeout(()=>{
          if(++this.musicIndex>=this.audioInfo.length){
            this.musicIndex = 0;
            document.getElementById('audio').currentTime = 0;
          }
        },1000);
      }else{
        if(++this.musicIndex>=this.audioInfo.length){
          this.musicIndex = 0;
          document.getElementById('audio').currentTime = 0;
        }
      }

    },
    //音乐上一曲
    prevMusic(){
      //单曲循环
      if(this.playStyle%3 == 2){
        document.getElementById('audio').currentTime = 0;
        return;
      }
      //随机播放
      if(this.playStyle%3 == 0){
        while(true){
          let random = Math.floor(Math.random()*(0+this.audioInfo.length))
          if(random != this.musicIndex){
            this.musicIndex = random;
            document.getElementById('audio').currentTime = 0;
            return;
          }
        }
      }
      if(--this.musicIndex < 0){
        this.musicIndex = this.audioInfo.length-1;
      }
    },
    //当音乐可以播放时
    canplay(){
      this.duration = Math.floor(document.getElementById('audio').duration);
      if(!this.play_pause){
        document.getElementById('audio').play();
      }
    },
    //查找播放源
    getMusic(albummid,mid){
      //判断有没有重复
      //console.log(this.audioMid.indexOf(mid));
      if(this.audioMid.indexOf(mid) >= 0){
        this.musicIndex = this.audioMid.indexOf(mid);
        this.play();
        return;
      }

      $.ajax({
        async:true,
        url:'https://c.y.qq.com/v8/fcg-bin/fcg_play_single_song.fcg?tpl=yqq_song_detail&format=jsonp&g_tk=5381&jsonpCallback=getOneSongInfoCallback&loginUin=0&hostUin=0&format=jsonp&inCharset=utf8&outCharset=utf-8&notice=0&platform=yqq&needNewCode=0',
        type:'GET',
        dataType:'jsonp',
        jsonp:'callback',
        data:{
          'songmid':mid,
        },
        timeout:5000,
        success:(json)=>{
          var data = json.data[0];
          // console.log(data);
          this.$store.commit('getMusicUrl',{
            img:'https://y.gtimg.cn/music/photo_new/T002R300x300M000'+data.album.mid+'.jpg?max_age=2592000',
            'single':data.name,
            'subtitle':data.subtitle,
            'singer':data.singer[0].name,
            'singerMid':data.singer[0].mid,
            'singleMid':data.mid,
            'meidaMid':data.file.media_mid
          });
        }
      });
    },

    //迷你菜单的数据双向绑定
    setShowMinimize(val){
      // console.log(val);
      this.showMinimize = val;
    }
  }
}
</script>

<style lang="scss" scoped>
#header{
  display:flex;
  flex-flow:row;
  position:fixed;
  top:0;
  left:0;
  width:100%;
  height:60px;
  background:url(../assets/right-top_background.png) no-repeat top right/100% fixed,
              radial-gradient(#fafafa, #eeeeee) no-repeat center center/100% fixed;
  box-shadow:0  2px 7px rgba(0,0,0,0.3);
  /* logo */
  .logo {
      flex:1 0;
      align-self: flex-end;
      text-align: center;
      img {
          width:auto;
          max-height: 45px;
      }
      @media only screen and(max-width:1000px){
        display:none;
      }
  }/*logo*/
  /* 播放器 */
  .player {
      display:flex;
      flex-flow:row;
      flex:2 0;
      .music_info{
        display:flex;
        .img{
            flex-shrink:0;
            width:60px;
            height:60px;
            img{
              display:block;
              margin:0 auto;
              width:auto;
              max-height:100%;
            }
        }/*img*/
        .info{
            display:flex;
            flex-flow:column;
            justify-content:space-around;
            margin:0 5px;
            width:180px;
            height:60px;
            text-align:center;
            p{
                overflow:hidden;
                display:block;
                width:100%;
                font-size:1.6rem;
                font-weight:400;
                color:#333;
                letter-spacing:1px;
                white-space:nowrap;
                text-overflow:ellipsis;
            }
            //时间和列表
            div.list_time{
              display:flex;
              justify-content:center;
              align-items:center;
              font-size:1.6rem;
              color:#333;
              img{
                width:16px;
                height:16px;
                cursor:pointer;
              }
              i{
                font-size:1.6rem;
                cursor:pointer;
              }
              div.time{
                display:flex;
                flex-flow:row;
                margin:0 10px;
                font-size:1.6rem;
                span{
                    padding:0 5px;
                    margin-top:1px;
                }
              }
            }/*list_time*/
        }/*info*/
      }/*music_info*/
      .operation{
        flex:1;
        display:flex;
        flex-flow:column;
        justify-content:space-around;
        align-content:center;
        .player_btn{
            display:flex;
            flex-flow:row;
            justify-content:center;
            align-items:center;
            i{
                margin:0 20px;
                font-size:2rem;
                color:#333;
                cursor:pointer;
            }
            div.play_btn{
                display:flex;
                justify-content:center;
                align-items:center;
                cursor:pointer;
            }/*play_btn*/
            /* 音量 */
            .volume{
                width:120px;
                position:relative;
                margin-left:10px;
                height:5px;
                background:#00bcd4;
                border-radius:5px;
                cursor:pointer;
                .progress{
                    width:50%;
                    height:100%;
                    background:rgb(238, 40, 89);
                    border-radius:5px;
                }
                .dot{
                    position:absolute;
                    top:-7.5px;
                    left:0%;
                    width:20px;
                    height:20px;
                    border-radius:20px;
                    background:#fff;
                    box-shadow:0 0 3px #ccc inset;
                    cursor:pointer;
                }
                .dot:hover{
                    box-shadow:0 0 3px #ccc inset,0 0 4px #ccc;
                }
            }/*volume*/
        }/*player_btn*/

        /* 进度条 */
        .progress_bar{
            position:relative;
            margin: 0 auto;
            width:95%;
            height:5px;
            background:#00bcd4;
            border-radius:5px;
            cursor:pointer;
            .progress{
                width:0;
                height:100%;
                background:rgb(238, 40, 89);
                border-radius:5px;
            }
            .dot{
                position:absolute;
                top:-7.5px;
                left:0%;
                width:20px;
                height:20px;
                border-radius:20px;
                background:#fff;
                box-shadow:0 0 3px #ccc inset;
                cursor:pointer;
            }
            .dot:hover{
                box-shadow:0 0 3px #ccc inset,0 0 4px #ccc;
            }
            @media only screen and (max-width:520px){
              width:90%;
            }
        }/*progress_bar*/
      }
  }/*player*/


  .search_vest{
    flex-shrink:0;
    position:relative;
    margin:0 20px;
    width:20%;
    /* 搜索框 */
    .search{
        overflow:hidden;
        position:absolute;
        right:0;
        top:17px;
        display:flex;
        flex-flow:row;
        width:200px;
        height:26px;
        background:#fff;
        border-radius:34px;
        transition:width .3s linear;
        i.microphone{
            flex:0.3;
            color:#ccc;
            text-align:center;
            line-height:26px;
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
            position:absolute;
            right:0;
            top:0;
            width:80px;
            font-size:1.4rem;
            font-weight:400;
            color:#F5F6FA;
            text-align:center;
            line-height:26px;
            letter-spacing:1px;
            border-radius:34px;
            background:#00bcd4;
            cursor:pointer;
            a{
              color:#F5F6FA;
            }

        }/*search_btn*/

        @media only screen and (min-width:1400px){
          left:0;right:0;
          margin:0 auto;
          width:300px;
        }
        @media only screen and (max-width:1400px){
          margin:0 auto;
          width:100%;
        }
        z-index:91;
    }/*search*/
    //搜索的下拉
    .search_down{
      overflow:hidden;
      position:absolute;
      top:50%;
      right:0;
      padding-top:17px;
      width:100%;
      background:rgba(247, 247, 247, 1);
      border-radius:0 0 20px 20px;
      box-shadow:0 2px 10px #ccc;
      z-index:90;
      ul{
        li{
          display:flex;
          flex-flow:row;
          font-size:1.6rem;
          color:#666;
          border-bottom:2px solid rgb(239, 239, 239);
          &:last-child{border:none;}
          .cate_left{
            display:flex;
            justify-content:center;
            align-items:center;
            flex:1;
            border-right:2px solid rgb(239, 239, 239);
          }
          .content_right{
            flex:5;
            li{
              display:flex;
              justify-content:space-between;
              align-items: center;
              padding:10px 0;
              border-bottom:1px solid rgb(239, 239, 239);
              cursor:pointer;
              transition:background .1s linear;
              &:last-child{border:none;}
              &:hover{background:#fff;}
              &:hover .operation{visibility:visible;}
              p{
                margin-left:10px;
              }
              .operation{
                display:flex;
                visibility:hidden;
                align-items:center;
                img{
                  margin:0 20px;
                  width:18px;
                  height:18px;
                }
                i{
                  margin-right:20px;
                  font-size:1.8rem;
                  color:#ccc;
                }
              }/*operation*/
            }/*li*/
          }/*content_right*/
        }/*li*/
      }/*ul*/
      @media only screen and (min-width:1400px){
        left:0;right:0;
        margin:0 auto;
        width:300px;
      }
      @media only screen and (max-width:1100px){
        right:0;
        width:300px;
      }
    }/*serach_down*/
    @media only screen and (max-width:1100px){
      width:80px;
      .search{
        right:0;
        width:80px;
        &:hover{
          width:300px;
        }
      }
    }
  }/*search_vest*/

  /* 登录和注册 */
  .login_reg {
      display: flex;
      flex-flow: row;
      justify-content: flex-end;
      align-items: center;
      flex-shrink:0;
      //登录
      p.login_btn{
        width:60px;
        height:20px;
        font-size:1.6rem;
        font-weight:400;
        color:#eee;
        text-align:center;
        line-height:20px;
        border:2px solid #eee;
        border-radius:32px;
        box-shadow:1px 1px 1px #999,1px 1px 1px #999 inset;
        cursor:pointer;
        @media only screen and(max-width:800px){
          display:none;
        }
      }/*p*/
      //菜单按钮
      .menu_btn{
        position:relative;
        margin:0 29px;
        width:32px;
        height:32px;
        border:2px solid #eee;
        border-radius:32px;
        box-shadow:1px 1px 1px #999,1px 1px 1px #999 inset;
        cursor:pointer;
        z-index:99;
        background:none;
        span{
          display:block;
          position:absolute;
          left:0;right:0;
          margin:0 auto;
          &:first-child{
            top:14px;
            width:18px;
            height:2px;
            background:#eee;
          }
          &:last-child{
            top:7px;
            width:2px;
            height:18px;
            background:#eee;
          }
        }
        @media only screen and (max-width:400px){
          margin:0 20px;
          width:30px;
          height:30px;
        }
      }
  }/*login_reg*/

  //手机端的播放器显示按钮
  .musicShow_btn{
    margin:0 29px;
    display:none;
    align-items:center;
    height:60px;
    img{
      width:40px;
      height:40px;
      line-height: 60px;
      @media only screen and (max-width:400px){
        width:35px;
        height:35px;
      }
    }
    @media only screen and (max-width:400px){
      margin:0 10px;
    }
  }
  //手机的播放器
  @media only screen and (max-width:800px){
    justify-content:space-between;
    .musicShow_btn{
      display:flex;
    }
    .search_vest{
      flex:1;
      margin:0;
      .search{
        width:100%;
        &:hover{
          width:100%;
        }
      }
      .search_down{
        width:100%;
      }
    }
    .player{
      position:absolute;
      top:100%;
      width:100%;
      background:url(../assets/right-top_background.png) no-repeat top right/100% fixed,
      radial-gradient(#fafafa, #eeeeee) no-repeat center center/100% fixed;
      box-shadow:0  2px 7px rgba(0,0,0,0.3);
      z-index:-1;
      @media only screen and (max-width:550px){
        .progress_bar{
          display:none;
        }
        .player_btn{
          .volume{
            display:none;
          }
        }
      }
      @media only screen and (max-width:400px){
        display:flex;
        .player_btn{
          justify-content:space-around !important;
          i{
            margin:0 0 !important;
          }
        }
      }
    }/*.player*/
  }
  // position:absolute;
}/*header*/
.slide-enter-active,.slide-leave-active{
  transition:all .3s linear;
}
.slide-enter,.slide-leave-to{
  transform:translateY(-100%);
  opacity:0;
}
.slide-leave,.slide-enter-to{
  transform:translateY(0);
  opacity:1;
}
//搜索框的下拉
.searchSlide-enter-active,.searchSlide-leave-active{
  transition:transform .3s linear;
  transform-origin: top;
}
.searchSlide-enter,.searchSlide-leave-to{
  transform:scaleY(0);
}
.searchSlide-leave,.searchSlide-enter-to{
  transform:scaleY(1);
}
</style>
