<template lang="html">
  <div class="lyric">
    <p v-for="(value,index) of lyric" :key="index" :if="value.str">{{value.str}}</p>
  </div>
</template>

<script>
export default {
  computed:{
    lyric(){
      // var data = this.audioInfo[this.musicIndex].lyric;
     var data = `[ti:等你下课] [ar:陆瑾年] [al:等你下课] [by:] [offset:0] [00:00.28]等你下课 - 陆瑾年 [00:02.00]词：陆瑾年 [00:03.26]曲：陆瑾年 [00:04.27] [00:32.72]不经意又再一次想起了从前 [00:38.05] [00:38.73]仿佛我们拥抱 在昨天 [00:43.92] [00:46.09]温暖的情节 你清秀的脸 [00:52.44] [00:53.26]回不去多美满的画面 [00:58.39] [01:01.40]不知道我的眼泪可能有点咸 [01:06.67] [01:07.55]喜欢雨天 让自己清醒一点 [01:12.46] [01:14.37]又来到夏天 心却在下着雪 [01:20.98] [01:21.89]看着许下的诺言 被时间搁浅 [01:28.04] [01:29.46]回不去的那年 [01:32.13] [01:32.74]我们说了再见 [01:35.66] [01:36.22]再也不见 偶尔想念 [01:39.78]分手划下了句点 [01:42.56] [01:43.44]回不去的那天 [01:46.15] [01:46.96]你靠在我的肩 [01:50.56]跟我说永远 到底有多远 [01:53.99] [01:54.60]却不能兑现 说了再见 [01:59.90] [02:16.58]不知道我的眼泪可能有点咸 [02:21.89] [02:22.85]喜欢雨天 让自己清醒一点 [02:28.31] [02:29.63]又来到夏天 心却在下着雪 [02:37.04]看着许下的诺言 被时间搁浅 [02:42.99] [02:44.35]回不去的那年 [02:47.03] [02:47.88]我们说了再见 [02:50.68] [02:51.49]再也不见 偶尔想念 [02:55.08]分手划下了句点 [02:57.79] [02:58.67]回不去的那天 [03:01.35] [03:02.30]你靠在我的肩 [03:05.31] [03:05.81]跟我说永远 到底有多远 [03:09.05] [03:09.82]却不能兑现 说了再见`;
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
  @media only screen and(max-width:1120px){
    width:95%;
  }
}
</style>
