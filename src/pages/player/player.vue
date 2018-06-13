<template>
  <div id="app">
    <header>
        <div class="logo"><img src="../../assets/logo.png" alt=""></div>
        <div class="player">
              <div class="img"><img :src="(audioInfo[musicIndex].img?audioInfo[musicIndex].img:'static/img/logo.aea432e.gif')"></div>
            <div class="info">
                <h1>{{audioInfo[musicIndex].name?audioInfo[musicIndex].name:'轻音音乐'}}</h1>
                <h2>{{audioInfo[musicIndex].singer?audioInfo[musicIndex].singer:'轻音音乐'}}</h2>
            </div><!-- info -->
        </div>
        <div class="login_reg">
            <router-link to="Login" tag="p" class="login_btn">登录</router-link>
            <div class="menu_btn" @click="menu = !menu"><span></span><span></span></div>
        </div><!-- login_reg -->
    </header>

    <div class="main">
        <div class="player_btn">
            <i class="fa fa-step-backward" @click="prevMusic(false)"></i>
            <div class="player_btn">
              <svg t="1527306872593" class="icon" style="" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2436" xmlns:xlink="http://www.w3.org/1999/xlink" width="200" @click="play">
                <!-- <defs><style type="text/css"></style></defs> -->
                <path d="M512 896C299.922286 896 128 724.077714 128 512S299.922286 128 512 128 896 299.922286 896 512 724.077714 896 512 896z m0-36.571429a347.428571 347.428571 0 1 0 0-694.857142 347.428571 347.428571 0 0 0 0 694.857142z m155.428571-331.593142l-219.428571 126.683428a18.285714 18.285714 0 0 1-27.428571-15.835428v-253.366858a18.285714 18.285714 0 0 1 27.428571-15.835428l219.428571 126.683428a18.285714 18.285714 0 0 1 0 31.670858z" p-id="2437" fill="#333" v-show="play_pause" ></path>
                <path d="M512 896C299.922286 896 128 724.077714 128 512S299.922286 128 512 128 896 299.922286 896 512 724.077714 896 512 896z m0-36.571429a347.428571 347.428571 0 1 0 0-694.857142 347.428571 347.428571 0 0 0 0 694.857142z m-109.714286-475.428571h73.142857a18.285714 18.285714 0 0 1 18.285715 18.285714v219.428572a18.285714 18.285714 0 0 1-18.285715 18.285714h-73.142857a18.285714 18.285714 0 0 1-18.285714-18.285714v-219.428572a18.285714 18.285714 0 0 1 18.285714-18.285714z m146.285715 0h73.142857a18.285714 18.285714 0 0 1 18.285714 18.285714v219.428572a18.285714 18.285714 0 0 1-18.285714 18.285714h-73.142857a18.285714 18.285714 0 0 1-18.285715-18.285714v-219.428572a18.285714 18.285714 0 0 1 18.285715-18.285714z" p-id="2566" fill="#333" v-show="!play_pause"></path>
              </svg>
            </div>
            <i class="fa fa-step-forward" @click="nextMusic"></i>
        </div><!-- play_btn 播放器按钮-->

        <div class="progress_bar" @mousedown="Dragprogress" @touchstart="Dragprogress">
            <div class="progress" :style="{width:progressStyle+'%'}"></div>
            <div class="dot" :style="{left:(progressStyle-2)+'%'}"></div>
        </div><!-- progress_bar 进度条 -->

        <div class="player_other">
          <div class="time"><span>{{time}}</span>|<span>{{totalTime}}</span></div><!-- time -->
          <img src="../../assets/list_black.png" alt="">
          <img src="../../assets/order.svg" alt="" v-show="playStyle%3==1" @click="playStyle++">
          <img src="../../assets/loop.svg" alt="" v-show="playStyle%3==2" @click="playStyle++">
          <img src="../../assets/random.svg" alt="" v-show="playStyle%3==0" @click="playStyle++">
          <div class="volume"  @touchstart="Dragvolume" @mousedown="Dragvolume">
            <div class="progress" :style="{width:volume+'%'}"></div>
            <div class="dot" :style="{left:(volume-2)+'%'}"></div>
          </div><!-- volume -->
        </div><!-- player_other 播放器的其他选项 时间、播放列表、播放方式、音量 -->

        <div class="search" @mouseover="searchDowm=true" @mouseout="searchDowm = false">
            <i class="microphone fa fa-microphone fa-2x"></i>
            <input type="text" name="search" placeholder="歌曲/歌手/歌单/KeON ID" autocomplete="off" v-model="search" @focus="searchFocus = true" @blur="searchFocus = false" @keydown.enter="jumpSearch">
            <span class="search_btn"><a :href="href">搜索</a></span>
            <transition name="slide">
              <div class="search_down" v-show="search && (searchDowm || searchFocus)">
              <ul class="category">
                <li v-for="(value,index) in searchData">

                    <div class="cate_left" v-if="value.name == '专辑'">
                      <p>{{value.name}}</p>
                    </div>
                    <ul class="content_right" v-if="value.name == '专辑'">
                      <li v-for="(v,index) of value.itemlist"><p>{{v.name}}-{{v.singer}}</p><div class="operation"><img src="../../assets/list.png"><i class="fa fa-play" @click="getMusic(v.albummid,v.mid)" v-if="value.name == '单曲'"></i></div></li>
                    </ul>
                    <div class="cate_left" v-if="value.name == 'MV'">
                      <p>{{value.name}}</p>
                    </div>
                    <ul class="content_right" v-if="value.name == 'MV'">
                      <li v-for="(v,index) of value.itemlist"><p>{{v.name}}-{{v.singer}}</p><div class="operation"><img src="../../assets/list.png"><i class="fa fa-play" @click="getMusic(v.albummid,v.mid)" v-if="value.name == '单曲'"></i></div></li>
                    </ul>
                    <div class="cate_left" v-if="value.name == '单曲'">
                      <p>{{value.name}}</p>
                    </div>
                    <ul class="content_right" v-if="value.name == '单曲'">
                      <li v-for="(v,index) of value.itemlist"><p><a :href="'./detail.html?singleMid='+v.mid " target="_black">{{v.name}}-{{v.singer}}</a></p><div class="operation"><img src="../../assets/list.png"><i class="fa fa-play" @click="getMusic(v.albummid,v.mid)" v-if="value.name == '单曲'"></i></div></li>
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
            </transition>
        </div><!-- search 搜索栏 -->

        <div class="lyric">
          <img src="../../assets/logo.gif" alt="" v-show="!play_pause"  style="cursor:pointer;" @click="lyricShow = true">
          <img src="../../assets/big_logo.png" alt="" v-show="play_pause">
          <transition name="fade">
            <div class="lyric_main" v-show="!play_pause && lyricShow">
            <div class="lyric_main-title" @click="lyricShow = false">
                <p>{{audioInfo[musicIndex].name}}</p>
                <p>歌手：{{audioInfo[musicIndex].singer}}</p>
            </div>
            <div class="lyric_main-content">
              <div class="content" @mousedown.stop="dragLyric($event)"  @touchstart="dragLyric" :style="{'top':top+'px'}">
                <p v-for="(v,i) of lyric" :class="{
                  'one':lyricIndex == i,
                  'two':lyricIndex+1 == i,
                  'three':lyricIndex+2 == i,
                  'four':lyricIndex+3 == i,
                  'five':lyricIndex+4 == i,
                  'six':lyricIndex+5 == i,
                  'seven':lyricIndex+6 == i,
                  'eight':lyricIndex+7 == i,
                  'nine':lyricIndex+8 == i}" :key="i" :time="v.time">{{v.str}}</p>
              </div><!--content-->
            </div><!--lyric_main-content-->
            <div class="play_position">
              <hr/>
              <i class="fa fa-play fa-rotate-180" :class="{active:simuLyricIndex}" @click="palyLriycPosition"></i>
            </div><!--play_position-->
          </div><!--lyric_main-->
          </transition>
        </div><!--lyric-->

    </div><!-- main -->
    <router-view></router-view>
    <Menu v-show="menu"></Menu><!--右边菜单栏-->
    <InfoMenu></InfoMenu><!--左边用户信息栏-->
    <Minimize></Minimize>
    <audio id="audio" :src="audioInfo[musicIndex].src" @ended="nextMusic" @canplay="canplay"></audio>
  </div>
</template>

<script>
import Menu from '@/components/Menu'
import InfoMenu from '@/components/InfoMenu'
import Minimize from '@/components/Minimize'
import {mapGetters} from 'vuex'
export default {
  name: 'App',
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
      searchFocus:false,
      searchData:{},          //后台获取的搜索数据
      menu:false,             //右边菜单栏的显示效果
      play_pause:true,        //播放或暂停按钮的显示
      playStyle:1,             //播放发送默认顺序播放
      duration:0,             //歌曲总长的时间戳
      currentTime:0,          //歌曲播放位置的时间戳
      volume:50,         //音量
      musicIndex:0,      //播放哪一首
      href:'',         //搜索跳转地址
      lyricShow:true, //歌词面版的显示
      lyricIndex:0,   //歌词的下标
      simuLyricIndex:0,  //模拟歌词的下标  可以用于点击播放
      top:0,        //歌词的滚动头部
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
    //歌词处理
    lyric(){
     var data = this.audioInfo[this.musicIndex].lyric;
     //var data = `[ti:等你下课] [ar:陆瑾年] [al:等你下课] [by:] [offset:0] [00:00.28]等你下课 - 陆瑾年 [00:02.00]词：陆瑾年 [00:03.26]曲：陆瑾年 [00:04.27] [00:32.72]不经意又再一次想起了从前 [00:38.05] [00:38.73]仿佛我们拥抱 在昨天 [00:43.92] [00:46.09]温暖的情节 你清秀的脸 [00:52.44] [00:53.26]回不去多美满的画面 [00:58.39] [01:01.40]不知道我的眼泪可能有点咸 [01:06.67] [01:07.55]喜欢雨天 让自己清醒一点 [01:12.46] [01:14.37]又来到夏天 心却在下着雪 [01:20.98] [01:21.89]看着许下的诺言 被时间搁浅 [01:28.04] [01:29.46]回不去的那年 [01:32.13] [01:32.74]我们说了再见 [01:35.66] [01:36.22]再也不见 偶尔想念 [01:39.78]分手划下了句点 [01:42.56] [01:43.44]回不去的那天 [01:46.15] [01:46.96]你靠在我的肩 [01:50.56]跟我说永远 到底有多远 [01:53.99] [01:54.60]却不能兑现 说了再见 [01:59.90] [02:16.58]不知道我的眼泪可能有点咸 [02:21.89] [02:22.85]喜欢雨天 让自己清醒一点 [02:28.31] [02:29.63]又来到夏天 心却在下着雪 [02:37.04]看着许下的诺言 被时间搁浅 [02:42.99] [02:44.35]回不去的那年 [02:47.03] [02:47.88]我们说了再见 [02:50.68] [02:51.49]再也不见 偶尔想念 [02:55.08]分手划下了句点 [02:57.79] [02:58.67]回不去的那天 [03:01.35] [03:02.30]你靠在我的肩 [03:05.31] [03:05.81]跟我说永远 到底有多远 [03:09.05] [03:09.82]却不能兑现 说了再见`;
      data = data.replace(/\s\[/g,'*[').slice(1).split('*').slice(5);
      data = data.map((value)=>{
        var str = value.slice(value.indexOf(']')+1);
        var date = value.slice(1,value.indexOf(']')-1).split(':');
        var time = parseInt(date[0])*60+parseFloat(date[1]);
        return {time:time,str:str};
      })
      return [{time:'',str:''},{time:'',str:''},{time:'',str:''}].concat(data);
    },
    //歌词每行的高度
    lyricRowHeight(){
      if(document.documentElement.clientWidth<=350){
        return 22;
      }
      return 32;
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
        this.lyricIndex = 0;   //歌词重新开始
        this.top = 0;   //歌词重新开始
        this.play(true);
      }
    },

  },
  components:{
    Menu,
    InfoMenu,
    Minimize
  },
  methods:{
    //跳转搜索链接
    jumpSearch(){
      window.open(this.href,'_black');
    },
    play(flag){      //播放

      if(this.play_pause || flag === true){
        this.play_pause=false;
        document.getElementById('audio').play();
      }else{
        this.play_pause=true;
        document.getElementById('audio').pause();
      }

    },
    pause(){       //暂停
      this.play_pause=true;
      document.getElementById('audio').pause();
    },
    current(e){        //获取播放位置
      this.currentTime = document.getElementById('audio').currentTime;
      var time = document.querySelector('.five')?document.querySelector('.five').attributes['time'].value:this.duration;
      if(+this.currentTime.toFixed(1) >= +time){
        this.lyricIndex++;
        this.top -= this.lyricRowHeight;
      }
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
      this.lyricIndex = 0;   //歌词重新开始
      this.top = 0;   //歌词重新开始

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
        //单曲循环
        if(this.playStyle%3 == 2){
          document.getElementById('audio').currentTime = 0;
          return;
        }
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
      this.lyricIndex = 0;
      this.top = 0;
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
        this.lyricIndex = 0;   //歌词重新开始
        this.top = 0;   //歌词重新开始
        this.play(true);
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
      console.log(val);
      this.showMinimize = val;
    },
    //拖放歌词
    dragLyric(e){
      e.preventDefault();
      clearTimeout(window.lyricScrollTimer);
      var node = e.currentTarget;          //获取点击时的节点
      var _this = this;            //修改this


      // var height = node.offsetHeight;            //歌词宽度
      var top = _this.top;              //歌词距离浏览器的头部距离
      var clickTop =(e.type == 'mousedown')? e.clientY:e.touches[0].clientY;                //鼠标距离浏览器的左边距离
      var height = clickTop - top;

      if(this.computerOrPhone == 'computer'){    //电脑或手机
        window.addEventListener('mousemove',mouseover);
        window.addEventListener('mouseup',mouseup);
      }else{
        window.addEventListener('touchmove',mouseover);
        window.addEventListener('touchend',mouseup);
      }


      //鼠标移动
      function mouseover(e){
        var mouseTop =(_this.computerOrPhone == 'computer')? e.clientY:e.touches[0].clientY;
        document.querySelector('.content').style.transition='none';
          var length = document.querySelectorAll('.lyric_main-content p').length;  //歌词的长度
          _this.top = mouseTop-(clickTop-top);
          _this.simuLyricIndex = Math.round((-_this.top)/_this.lyricRowHeight);
          if(_this.top > 0){
            _this.top = 0;
          }else if(_this.top < -(length-4)*_this.lyricRowHeight){
            _this.top = -(length-4)*_this.lyricRowHeight;
          }
      }

      //鼠标弹起
      function mouseup(e){
        document.querySelector('.content').style.transition='all .3s linear';
        window.lyricScrollTimer = setTimeout(()=>{
          _this.simuLyricIndex = 0;
          _this.lyricScroll();
        },2000);
        if(_this.computerOrPhone == 'computer'){
          window.removeEventListener('mousemove',mouseover);
          window.removeEventListener('mouseup',mouseup);
        }else{
          window.removeEventListener('touchmove',mouseover);
          window.removeEventListener('touchend',mouseup);
        }
      }
    },
    //歌词的上滚还是滚会原来位置
    lyricScroll(){
      var top = this.lyricRowHeight * this.lyricIndex;
      var temp;
      if(this.top < -top){
        temp = 1;
      }if(this.top > -top){
        temp = -1;
      }

      this.top = -(this.lyricRowHeight * this.lyricIndex);
    },
    //用歌词播放指定位置
    palyLriycPosition(){
      if(!this.simuLyricIndex) return;
      clearTimeout(window.lyricScrollTimer);
      this.lyricIndex = this.simuLyricIndex;
      this.simuLyricIndex = 0;
      // audio.removeEventListener('timeupdate',this.current);
      this.currentTime = +document.querySelectorAll('.lyric_main-content .content p')[this.lyricIndex+3].attributes['time'].value;
      document.getElementById('audio').currentTime = this.currentTime;
      this.play(true);
    }
  },

}
</script>

<style lang="scss" scoped>
#app {
  /* 头部开始 */
  header {
      display: flex;
      flex: column;
      width: 100%;
      height: 75px;
      &>div{
        // border:1px solid;
      }
      /* logo */
      .logo {
          flex: 1 1;
          align-self: flex-end;
          text-align: right;
          img {
              width:auto;
              max-height: 55px;
          }
          @media only screen and (max-width:530px){
            display:none;
          }
      }/*logo*/
      /* 播放器 */
      .player {
          display:flex;
          flex-flow:row;
          justify-content:center;
          flex: 3 3;
          .img{
              flex-shrink:0;
              width:75px;
              height:75px;
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
              justify-content:center;
              margin:0 5px;
              width:200px;
              height:75px;
              text-align:center;
              h1{
                  overflow:hidden;
                  display:block;
                  width:100%;
                  margin:8px 0;
                  font-size:1.6rem;
                  letter-spacing:1px;
                  white-space:nowrap;
                  text-overflow:ellipsis;
              }
              h2{
                  overflow:hidden;
                  display:block;
                  width:100%;
                  margin:8px 0;
                  font-size:1.4rem;
                  letter-spacing:1px;
                  white-space:nowrap;
                  text-overflow:ellipsis;
              }
              @media only screen and (max-width:600px){
                width:135px;
              }
              @media only screen and (max-width:530px){
                flex:1;
              }
          }/*info*/
          @media only screen and (max-width:530px){
            justify-content:flex-start;
          }
      }/*player*/

      /* 登录和注册 */
      .login_reg {
          display: flex;
          flex-flow: row;
          justify-content: flex-end;
          align-items: center;
          flex: 1 2;
          //登录
          p.login_btn{
            margin:0 29px;
            width:80px;
            height:26px;
            font-size:1.8rem;
            font-weight:400;
            color:#eee;
            text-align:center;
            line-height:26px;
            border:2px solid #eee;
            border-radius:32px;
            box-shadow:1px 1px 1px #999,1px 1px 1px #999 inset;
            cursor:pointer;
            @media only screen and (max-width:700px){
              margin:0 5px;
              width:60px;
            }
            @media only screen and (max-width:530px){
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
          }
      }/*login_reg*/
  }/*header*/



  /* 主体部分开始 */

  .main{
      width:100%;
      /* 播放器按钮 */
      .player_btn{
          display:flex;
          flex-flow:row;
          justify-content:space-around;
          align-items:center;
          margin:1.4rem auto;
          width:200px;
          i{
              font-size:2.3rem;
              color:#333;
              cursor:pointer;
          }
          .player_btn{
              display:flex;
              justify-content:center;
              align-items:center;
              width:4rem;
              height:4rem;
              border-radius:46px;
              cursor:pointer;
              svg{
                transform:scale(1.4);
                color:#333;
              }
              i{
                margin-top:-2px;
                &.play_btn{
                  margin-left:5px;
                }
                &.pause_btn{
                  margin-left:1px;
                  font-size:2.1rem;
                }
              }
          }
      }/*player_btn*/

      /* 进度条 */
      .progress_bar{
          position:relative;
          margin: 0 auto;
          width:460px;
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
              top:-10px;
              left:0%;
              width:25px;
              height:25px;
              border-radius:25px;
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

      /* 搜索框 */
      .search{
          // overflow:hidden;
          position:relative;
          display:flex;
          flex-flow:row;
          margin:0 auto;
          width:520px;
          height:34px;
          background:#fff;
          border-radius:34px;
          box-shadow:0 0 4px #ccc;
          z-index:1;
          i.microphone{
              flex:0.3;
              color:#ccc;
              text-align:center;
              line-height:34px;
              cursor:pointer;
              &:hover{
                  color:#333;
              }
          }

          input{
              flex:3;
              font-size:1.5rem;
              color:#999;
              letter-spacing:2px;
              text-indent:0.5rem;
              &:focus{
                  outline:none;
              }
          }

          .search_btn{
              flex:1;
              font-size:1.4rem;
              font-weight:400;
              color:#F5F6FA;
              text-align:center;
              line-height:34px;
              letter-spacing:1px;
              border-radius:34px;
              background:#00bcd4;
              cursor:pointer;
              a{
                color:#f5f6fa;
              }
          }/*search_btn*/

          @media only screen and (max-width:520px){
            width:90%;
          }
          //搜索的下拉
          .search_down{
            overflow:hidden;
            position:absolute;
            top:50%;
            left:0;
            padding-top:17px;
            width:100%;
            background:rgba(247, 247, 247, 1);
            border-radius:0 0 20px 20px;
            box-shadow:0 2px 10px #ccc;
            z-index:-1;
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
                      a{
                        color:#666;
                      }
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
                    }
                  }
                }
              }
            }
          }/*serach_down*/
      }/*search*/

      /* 播放器其他选项 */
      .player_other{
          display:flex;
          flex-flow:row;
          justify-content:space-around;
          align-items:center;
          margin:1.4rem auto;
          width:380px;
          font-size:2.3rem;
          color:#333;
          .time{
              display:flex;
              flex-flow:row;
              font-size:1.6rem;
              span{
                  padding:0 5px;
                  margin-top:2px;
              }
          }
          i{
              cursor:pointer;
          }
          img{
            width:23px;
            height:auto;
            cursor:pointer;
          }

          /* 音量 */
          .volume{
              position:relative;
              width:120px;
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
          }
          @media only screen and (max-width:520px){
            width:90%;
          }
      }/*player_other*/

      //歌词
      .lyric{
        overflow:hidden;
        position:relative;
        display:flex;
        justify-content:center;
        align-items:center;
        margin:20px auto;
        margin-bottom:0;
        width:350px;
        height:350px;
        border-radius:30px;
        box-shadow: 1px 2px 10px rgba(0, 0, 0, 0.3);
        background:rgba(247, 247, 247, 1);
        &>img{
          width:auto;
          max-height:80%;
        }
        .lyric_main{
          position:absolute;
          display:flex;
          flex-flow:column;
          align-items:center;
          width:100%;
          height:100%;
          background:rgba(247, 247, 247, 1);
          opacity:1;
          transition:opacity .3s linear;
          .lyric_main-title{
            margin-top:10px;
            padding:10px 5px;
            width:80%;
            font-size:2rem;
            color:#666;
            border-bottom:1px solid #efefef;
            p:first-child{
              margin-bottom:10px;
              font-weight:500;
            }
            p:last-child{
              margin-top:5px;
              font-size:1.8rem;
              font-weight:400;
            }
          }/*lyric_main-title*/
          .lyric_main-content{
            overflow:hidden;
            flex:1;
            position:relative;
            width:80%;
            .content{
              position:absolute;
              top:0;
              width:100%;
              transition:all .3s linear;
              p{
                height:32px;
                text-align:center;
                 -moz-user-select: none; -khtml-user-select: none; user-select: none;
                 transition:all .3s linear;
                &.one  {font-size:1.4rem;color:#ccc;}
                &.two  {font-size:1.6rem;color:#999;}
                &.three{font-size:1.8rem;color:#666;}
                &.four {font-size:2.0rem;color:#333;font-weight:bold;}
                &.five {font-size:2.0rem;color:#333;}
                &.six  {font-size:1.8rem;color:#666;}
                &.seven{font-size:1.6rem;color:#666;}
                &.eight{font-size:1.6rem;color:#999;}
                &.nine {font-size:1.4rem;color:#ccc;}
                @media only screen and (max-width:350px){
                  height:22px;
                  &.one  {font-size:1.2rem;}
                  &.two  {font-size:1.4rem;}
                  &.three{font-size:1.6rem;}
                  &.four {font-size:1.8rem;}
                  &.five {font-size:1.8rem;}
                  &.six  {font-size:1.6rem;}
                  &.seven{font-size:1.4rem;}
                  &.eight{font-size:1.4rem;}
                  &.nine {font-size:1.2rem;}
                }
              }
            }/*content*/
          }/*lyric_main-content*/
          .play_position{
            position:absolute;
            top:47.8%;
            display:flex;
            align-items: center;
            width:80%;
            opacity:0;
            transition:opacity .3s linear;
            hr{
              flex:1;
              color:#999;
            }
            i{
              margin:-1px 0 0 10px;
              font-size:2rem;
              color:#999;
              cursor:pointer;
              &.active{
                color:#00bcd4;
              }
            }
            @media only screen and (max-width:350px){
              top:51%;
            }
          }/*.play_position*/
          &:hover .play_position{
            // display:flex;
            opacity:1;
          }
        }/*lyric_main*/
        &:hover .lyric_main{
          opacity:1;
        }
        @media only screen and (max-width:350px){
          margin-top:10px;
          width:270px;
          height:270px;
        }
      }/*lyric*/
  }/*main*/
  /* 主体部分结束 */

}
.fade-enter-active,.fade-leave-active{
  transition:opacity .3s linear;
}
.fade-enter,.fade-leave-to{
  opacity:0;
}
.fade-leave,.fade-enter-to{
  opacity:1;
}
.slide-enter-active,.slide-leave-active{
  transition:transform .3s linear;
  transform-origin: top;
}
.slide-enter,.slide-leave-to{
  transform:scaleY(0);
}
.slide-leave,.slide-enter-to{
  transform:scaleY(1);
}
</style>

<style lang="scss">
html{
    font-size:52.5% !important;
}
body {
    background: url(../../assets/right-top_background.png) no-repeat top right/100% fixed,
                url(../../assets/left-bottom_background.png) no-repeat bottom left/100% fixed,
                radial-gradient(#fafafa, #eeeeee) no-repeat center center/100% fixed;
}
</style>
