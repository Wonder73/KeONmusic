<template lang="html">
  <div class="single">
    <div class="search">
      <div class="category">
        <i class="fa fa-play fa-rotate-90"></i>
        <span>全部</span>
      </div><!--category-->
      <div class="search_input">
        <i class="microphone fa fa-microphone fa-2x"></i>
        <input type="text" name="search" placeholder="搜索内容" autocomplete="off" v-model="search" @focus="searchFocus = true" @blur="searchFocus = false"  @keydown.enter="jumpSearch">
        <span class="search_btn"><a :href="href">搜索</a></span>
      </div><!-- search 搜索栏 -->
    </div><!--search-->
    <ul class="container">
      <li class="top">
        <ul>
          <li>　歌曲</li>
          <li>原唱<i class="fa fa-play fa-rotate-90"></i></li>
          <li>播放量<i class="fa fa-play fa-rotate-90"></i></li>
          <li>收藏量<i class="fa fa-play fa-rotate-90"></i></li>
          <li>类别<i class="fa fa-play fa-rotate-90"></i></li>
          <li>状态<i class="fa fa-play fa-rotate-90"></i></li>
          <li>操作<i class="fa fa-play fa-rotate-90"></i></li>
        </ul>
      </li>
      <li>
        <ul>
          <li><div class="img_name"><div class="img"></div><p>告白气球</p></a></div><div class="operation"><i class="fa fa-play"></i><i class="fa fa-star"></i><i class="fa fa-upload"></i><i class="fa fa-share-alt"></i></div></li>
          <li>周杰伦</li>
          <li>1,234万次</li>
          <li>123,456</li>
          <li>原唱</li>
          <li>
            <div :class="{'switch':true,'off_on':open}">
              <p>隐藏</p>
              <p>公开</p>
              <div class="switch_btn" @click="open = !open"></div>
            </div>
          </li>
          <li><span>编辑</span><span>删除</span></li>
        </ul>
      </li>
      <li>
        <ul>
          <li><div class="img_name"><div class="img"></div><p>告白气球</p></a></div><div class="operation"><i class="fa fa-play"></i><i class="fa fa-star"></i><i class="fa fa-upload"></i><i class="fa fa-share-alt"></i></div></li>
          <li>周杰伦</li>
          <li>1,234万次</li>
          <li>123,456</li>
          <li>原唱</li>
          <li>
            <div :class="{'switch':true,'off_on':open}">
              <p>隐藏</p>
              <p>公开</p>
              <div class="switch_btn" @click="open = !open"></div>
            </div>
          </li>
          <li><span>编辑</span><span>删除</span></li>
        </ul>
      </li>
    </ul>
  </div><!--single-->
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
.single{
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
    .category{
      display:flex;
      justify-content:center;
      align-items:center;
      margin:0 20px;
      width:100px;
      height:30px;
      font-size:1.8rem;
      font-weight:400;
      color:#fff;
      background:#00dbd6;
      border-radius:30px;
      cursor:pointer;
      i{
        margin-right:5px;
      }
    }/*category*/
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

  ul.container{
    flex:1;
    width:100%;
    background:#fff;
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
            div.img_name{
              display:flex;
              align-items:center;
              .img{
                flex-shrink: 0;
                margin:0 5px;
                width:45px;
                height:45px;
                background:#00dbd6;
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
          &:nth-last-child(3){
            flex:2;
          }
          &:nth-last-child(2){
            display:flex;
            justify-content:center;
            align-items:center;
            text-align:center;
            div.switch{
              position:relative;
              display:flex;
              justify-content:flex-start;
              align-items:center;
              width:60px;
              height:24px;
              border-radius:24px;
              border:1px solid #ccc;
              background:rgba(0,219,214,0);
              transition:background .3s linear;

              .switch_btn{
                position:absolute;
                margin:0 3px 0 5px;
                width:18px;
                height:18px;
                border-radius:18px;
                border:1px solid #ccc;
                transition:all .2s linear;
                cursor:pointer;
              }/*switch_btn*/
              p{
                position:absolute;
                font-size:1.6rem;
                color:#ccc;
                line-height:1.5;
                transition:opacity .3s linear;
                &:first-child{
                  right:5px;
                }
                &:nth-child(2){
                  left:5px;
                  color:#fff;
                  opacity:0;
                }
              }/*p*/
              &.off_on{
                background:rgba(0,219,214,1);
                border:1px solid rgba(0,219,214,1);
                .switch_btn{
                  background:#fff;
                  transform:translateX(150%);
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
          }/*nth-last-child(2)*/
          &:last-child{
            text-align:center;
            span{
              padding:0 8px;
              cursor:pointer;
              &:first-child{
                border-right:1px solid #ccc;
              }
              &:hover{
                color:#ee2859;
              }
            }/*span*/
          }/*last-child*/
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
  }/*containter最外层的ul*/

}/*single*/
</style>
