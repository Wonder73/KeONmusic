<template lang="html">
  <div class="lyric">
    <p v-for="(value,index) of lyric" :key="index" :if="value.str">{{value.str}}</p>
  </div>
</template>

<script>
export default {
  computed:{
    lyric(){
     var data = this.$route.params.str;
      data = data.replace(/\s\[/g,'*[').split('*').slice(5);
      data = data.map((value)=>{
        var str = value.slice(value.indexOf(']')+1);
        var date = value.slice(1,value.indexOf(']')-1).split(':');
        var time = parseInt(date[0])*60+parseFloat(date[1]);
        return {time:time,str:str};
      })
      return [{time:'',str:''},{time:'',str:''},{time:'',str:''}].concat(data);
    },
  }
}
</script>

<style lang="scss" scoped>
.lyric{
  padding:10px;
  margin:10px auto;
  width:1120px;
  font-size:1.6rem;
  text-indent:3.2rem;
  line-height:2;
  background:#f2f2f2;
  p{
    color:#333;
  }
  @media only screen and(max-width:1120px){
    width:95%;
  }
}
</style>
