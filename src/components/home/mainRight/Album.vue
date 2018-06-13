<template lang="html">
  <div class="album">
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
      <li>
        <div class="img">
          <div class="opeartion">
            <p>888首</p>
            <div class="opeartion_btn"><i class="fa fa-star"></i><i class="fa fa-play"></i></div>
          </div>
        </div>
        <p>周杰伦的床边故事</p>
      </li>
      <li>
        <div class="img">
          <div class="opeartion">
            <p>888首</p>
            <div class="opeartion_btn"><i class="fa fa-star"></i><i class="fa fa-play"></i></div>
          </div>
        </div>
        <p>周杰伦的床边故事</p>
      </li>
      <li>
        <div class="img">
          <div class="opeartion">
            <p>888首</p>
            <div class="opeartion_btn"><i class="fa fa-star"></i><i class="fa fa-play"></i></div>
          </div>
        </div>
        <p>周杰伦的床边故事</p>
      </li>
      <li>
        <div class="img">
          <div class="opeartion">
            <p>888首</p>
            <div class="opeartion_btn"><i class="fa fa-star"></i><i class="fa fa-play"></i></div>
          </div>
        </div>
        <p>周杰伦的床边故事</p>
      </li>
      <li>
        <div class="img">
          <div class="opeartion">
            <p>888首</p>
            <div class="opeartion_btn"><i class="fa fa-star"></i><i class="fa fa-play"></i></div>
          </div>
        </div>
        <p>周杰伦的床边故事</p>
      </li>
      <li>
        <div class="img">
          <div class="opeartion">
            <p>888首</p>
            <div class="opeartion_btn"><i class="fa fa-star"></i><i class="fa fa-play"></i></div>
          </div>
        </div>
        <p>周杰伦的床边故事</p>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
}
</script>

<style lang="scss" scoped>
.album{
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
    display:flex;
    justify-content:center;
    flex-wrap: wrap;
    flex:1;
    padding:20px;
    width:100%;
    background:#fff;
    border-top:1px solid #ccc;
    box-sizing:border-box;
    &>li{
      width:250px;
      height:255px;
      border-bottom:1px solid #efefef;
      .img{
        overflow:hidden;
        position:relative;
        margin:10px auto;
        width:200px;
        height:200px;
        border:1px solid #efefef;
        background:#00dbd6;
        div.opeartion{
          position:absolute;
          left:0;bottom:0;
          display:flex;
          justify-content:space-around;
          align-items:center;
          width:100%;
          height:58px;
          font-size:1.8rem;
          font-weight:400;
          color:#fff;
          background:rgba(0,0,0,0.6);
          transform:translateY(100%);
          transition:transform .3s cubic-bezier(0.39, 0.58, 0.57, 1);
          div.opeartion_btn{
            i{
              font-size:2.4rem;
              cursor:pointer;
              &:first-child{
                margin-right:10px;
                color:#00dbd6;
              }
              &:last-child{
                margin-left:10px;
              }
            }/*i*/
          }/*opeartion_btn*/
        }/*div.opeartion*/
        &:hover div.opeartion{
          transform:translateY(0);
        }
      }/*img*/
      &>p{
        margin:10px 0 0 0;
        font-size:1.8rem;
        font-weight:400px;
        color:#666;
        text-align:center;
      }
    }/*li*/
  }/*ul.container*/
}
</style>
