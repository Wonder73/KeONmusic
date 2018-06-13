<template lang="html">
  <div class="dynamic">
    <ul class="dynamic_container">
      <li>
        <div class="dynamic_container-date">
          <h1>5月29日</h1>
          <h2>星期二</h2>
          <h3>17:42</h3>
        </div>
        <div class="dynamic_container-img">

        </div>
        <div class="dynamic_container-content">
          <p>嗯？不好吧</p>
        </div>
      </li>
      <li>
        <div class="dynamic_container-date">
          <h3>17:42</h3>
        </div>
        <div class="dynamic_container-img">

        </div>
        <div class="dynamic_container-content">
          <p>嗯？不好吧</p>
        </div>
      </li>
      <li>
        <div class="dynamic_container-date">
          <h1>5月29日</h1>
          <h2>星期二</h2>
          <h3>17:42</h3>
        </div>
        <div class="dynamic_container-img">

        </div>
        <div class="dynamic_container-content">
          <p><div class="album-img"></div><p>我发布了新歌“告白气球”，快来听吧！</p>
        </div>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
}
</script>

<style lang="scss" scoped>
.dynamic{
  display:flex;
  flex-flow:column;
  flex:1;
  margin-top:1px;
  border:1px solid #ccc;
  border-top:none;
  ul.dynamic_container{
    flex:1;
    padding:20px 40px;
    width:100%;
    background:#fff;
    box-sizing:border-box;
    &>li{
      display:flex;
      align-items:center;
      margin:20px 0;
      div{
        &.dynamic_container-date{
          flex-shrink:0;
          width:106px;
          color:#333;
          font-weight:400;
          line-height:1.5;
          text-align:center;
          h1{
            font-size:3rem;
            font-weight:bold;
          }
          h2{
            font-size:2rem;
          }
          h3{
            font-size:1.6rem;
          }
        }/*dynamic_container-date*/
        &.dynamic_container-img{
          flex-shrink:0;
          margin:0 20px;
          width:60px;
          height:60px;
          border-radius:60px;
          border:1px solid #efefef;
          background:#00dbd6;
        }/*dynamic_container-img*/
        &.dynamic_container-content{
          display:flex;
          flex:1;
          padding:20px;
          height:120px;
          border:1px solid #efefef;
          border-radius:20px;
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
        }/*dynamic_container-content*/
      }/*div*/
    }/*li*/
  }/*ul.dynamic_container*/
}/*dynamic*/
</style>
