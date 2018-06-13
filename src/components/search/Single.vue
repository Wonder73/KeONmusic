<template lang="html">
  <div class="single">
    <p>搜索 <span>“{{search}}”</span> ，找到 <span>{{totalnum}}</span> 首相关单曲</p>
    <ul class="container">
      <li class="top">
        <ul>
          <li>歌曲</li>
          <li>演唱<i class="fa fa-play fa-rotate-90"></i></li>
          <li>原唱</li>
          <li>播放量<i class="fa fa-play fa-rotate-90"></i></li>
          <li>收藏量<i class="fa fa-play fa-rotate-90"></i></li>
          <li>类别<i class="fa fa-play fa-rotate-90"></i></li>
        </ul>
      </li>
      <li v-for="(value,index) of searchData" :key="index">
        <ul>
          <li><div class="img_name"><a :href="'./detail.html?singleMid='+value.singleMid " target="_black"><div class="img"><img :src="value.img"></div><p>{{value.single}}<span style="color:#999;">{{value.subtitle}}</span></p></a></div><div class="operation"><i class="fa fa-play" @click="play(index)"></i><i class="fa fa-star"></i><i class="fa fa-upload"></i><i class="fa fa-share-alt"></i></div></li>
          <li>{{value.singer}}</li>
          <li>{{value.singer}}</li>
          <li>1,234万次</li>
          <li>123,456</li>
          <li>原唱</li>
        </ul>
      </li>
    </ul>
    <ul class="list">
      <li @click="page-1<=0?'':page--"><i class="fa fa-play fa-rotate-180"></i></li>
      <li @click="page = 1" :class="{active:page == 1}">1</li>
      <li v-if="page-1>2">...</li>
      <li v-for="(value,index) of list" :class="{active:page == value}" @click="page = value">{{value}}</li>
      <li v-if="page+1 < totalpage-1">...</li>
      <li @click="page = totalpage" :class="{active:page == totalpage}">{{totalpage}}</li>
      <li><input type="text" @focus="jump = true" @blur="jump = false" v-model="jumpValue"></li>
      <li><i class="fa fa-play" @click="page+1>totalpage?'':page++"></i> <transition name="slide"><p  v-show="jump" @click="page = +jumpValue">跳转</p></transition></li>
    </ul>
    <div class="goTop" @click="gotTop"><i class="fa fa-angle-up"></i></div>
  </div>
</template>

<script>
export default {
  mounted(){
    this.getSearchData();
    if(this.screenWidth <= 800){
      this.page++;
      window.addEventListener('scroll',(e)=>{
        var scrollTop = document.documentElement.scrollTop;
        var clientHeight = document.documentElement.clientHeight;
        var scrollHeight = document.documentElement.scrollHeight;
        if((scrollTop+clientHeight)>=scrollHeight){
          this.page++;
        }
      },false);
    }
  },
  data(){
    return {
      totalnum:0, //搜索总数
      totalpage:0, //总页数
      page:1,     //第几页
      num:8,     //一页几个
      searchData:[],
      list:[2,3,4],  //跳转页面
      jump:false,  //跳转的显示
      jumpValue:''
    }
  },
  computed:{
    search(){   //搜索传过来的值
      return decodeURIComponent(location.search.slice(1).split('=')[1]);
    },
    screenWidth(){          //屏幕的宽度
      //console.log(document.documentElement.clientWidth);
      return document.documentElement.clientWidth;
    }
  },
  watch:{
    page(val){
      if(this.screenWidth >= 800){
        this.searchData = [];
      }
      this.getSearchData();
      this.list = [];

      var len = this.page+1
      for(let i=this.page-1;i<=len&&i<this.totalpage;i++){
        if(i>1){
          this.list.push(i);
        }
      }
      if(this.page == 1){
        this.list.push(this.page+2);
      }else if(this.page == this.totalpage){
        this.list.unshift(this.page-2);
      }
    }

  },
  methods:{
    getSearchData(){   //获取搜索的数据
      $.ajax({
        async: true,
        url: "https://c.y.qq.com/soso/fcgi-bin/client_search_cp?ct=24&qqmusic_ver=1298&new_json=1&remoteplace=txt.yqq.song&searchid=65160662597205926&t=0&aggr=1&cr=1&catZhida=1&lossless=0&flag_qc=0&g_tk=5381&loginUin=0&hostUin=0&format=jsonp&inCharset=utf8&outCharset=utf-8&notice=0&platform=yqq&needNewCode=0",
        type: "GET",
        dataType: 'jsonp',
        jsonp: 'jsonpCallback',
        data: {
          'w': this.search,
          p:this.page,
          n:this.num,
          'jsonpCallback':'MusicJsonCallback3258380231719933'
        },
        timeout: 5000,
        success: (json) => {
          var song = json.data.song;
          this.totalnum = song.totalnum;
          this.totalpage = Math.ceil(song.totalnum/this.num);
          var list = song.list;
  				list.forEach((value,index)=>{
            this.searchData.push({
              'img':'https://y.gtimg.cn/music/photo_new/T002R300x300M000'+value.album.mid+'.jpg?max_age=2592000',
              'single':value.name,
              'subtitle':value.subtitle,
              'singer':value.singer[0].name,
              'singerMid':value.singer[0].mid,
              'singleMid':value.mid,
              'meidaMid':value.file.media_mid,
            })
          })
          // console.log(list);
          // console.table(this.searchData);
  			},
        error: function (xhr) {
        }
      });
    },
    play(index){
      this.$store.commit('getMusicUrl',this.searchData[index]);
    },
    gotTop(){
      var i = 1;
      var timer = setInterval(()=>{
        var scrollTop = document.documentElement.scrollTop;
        document.documentElement.scrollTop = scrollTop - i++;
        if(scrollTop-i <= 0){
          clearInterval(timer);
        }
      },10)
    }
  }
}
</script>

<style lang="scss" scoped>
.single{
  margin:0 auto;
  width:1200px;
  ul.container{
    margin:20px 0;
    width:100%;
    &>li{
      width:100%;
      height:50px;
      line-height:50px;
      &>ul{
        display:flex;
        flex-flow:row;
        height:100%;
        &>li{
          flex:3;
          font-size:1.6rem;
          font-weight:400;
          color:#666;
          cursor:pointer;
          &:first-child{
            flex:10;
            display:flex;
            justify-content:space-between;
            align-items:center;
            div.img_name a{
              display:flex;
              align-items:center;
              .img{
                flex-shrink: 0;
                margin:0 5px;
                width:45px;
                height:45px;
                background:#fff;
                img{
                  max-width:100%;
                  height:auto;
                }
              }
              p{
                line-height:1.5;
              }
            }/*img_name*/
            div.operation{
              display:none;
              margin-right:10px;
              line-height:1.5;
              i{
                margin:0 10px;
                font-size:1.9rem;
                color:#ccc;
                cursor:pointer;
                &:hover{
                  color:#00bcd4;
                }
              }
            }/*operation 操作图标*/
            &:hover{
              .img_name{p{color:#00bcd4;}}
              .operation{display:block;}
            }
          }/*first-child*/
          &:last-child{
            flex:2;
          }
          i{
            display:inline-block;
            margin:0 5px;
            width:10px;
            color:#ccc;
            &:hover{
              color:#00bcd4;
            }
          }
        }/*li*/
      }/*每个li里面的ul*/
      &:nth-child(2n-1){
        background:rgba(239, 239, 239, 1);
      }
      &[class=top]{
        height:40px;
        line-height:40px;
      }
    }/*li*/
    @media only screen and (max-width:800px){
      li{
        &>ul{
          &>li{
            &:first-child{
              border:1px soild red;
              .operation{
                display:block !important;
                i:nth-child(2){display:none;}
                i:nth-child(3){display:none;}
                i:nth-child(4){display:none;}
              }
            }
            &:last-child{
              display:none;
            }
            &:nth-last-child(1){
              display:none;
            }
            &:nth-last-child(2){
              display:none;
            }
            &:nth-last-child(3){
              display:none;
            }
            &:nth-last-child(4){
              display:none;
            }
          }
        }
      }
    }
  }/*containter最外层的ul*/
  ul.list{
    display:flex;
    justify-content:center;
    li{
      margin:0 4px;
      width:44px;
      height:44px;
      color:#666;
      text-align:center;
      line-height:44px;
      border-radius:2px;
      cursor:pointer;
      &:hover{
        color:#fff;
        background:#00bcd4;
      }
      &:nth-last-child(2){
        input{
          width:60%;
          height:20px;
          background:none;
          border-bottom:2px solid #ccc;
          &:focus{
            outline:none;
          }
        }
        &:hover{
          background:none;
        }
      }
      &:last-child{
        position:relative;
        overflow:hidden;
        i{
          display:block;
          width:100%;
          height:100%;
          line-height:44px;
        }
        p{
          position:absolute;
          top:0;
          display:block;
          margin:0;
          width:100%;
          height:100%;
          color:#fff;
          line-height:44px;
          background:#00bcd4;
          cursor:pointer;
        }
      }
      &.active{
        color:#fff;
        background:#00bcd4;
      }
    }/*li*/
  }/*ul*/
  .goTop{
    position:fixed;
    right:5%;
    bottom:10%;
    display:none;
    justify-content:center;
    align-items:center;
    width:40px;
    height:40px;
    border:1px solid red;
    border-radius:5px;
    cursor:pointer;
    i{
      font-size:2rem;
    }
    @media only screen and (max-width:800px){
      display:flex;
    }
  }
  p{
    margin:20px 0;
    font-size:1.8rem;
    color:#333;
    text-align:center;
    span{
      color:#00bcd4;
    }
  }
  @media only screen and (max-width:1200px){
    width:95%;
  }
  //手机端的显示界面
  @media only screen and (max-width:800px){
    ul.containter{
      display:none;
      li{
        display:none;
      }
    }
    ul.list{
      display:none;
    }
  }
}/*search*/
//跳转的动画
.slide-enter-active,.slide-leave-active{
  transition:transform .3s linear;
}
.slide-enter,.slide-leave-to{
  transform:translateX(-100%);
}
.slide-leave,.slide-enter-to{
  transform:translateX(0);
}
</style>
