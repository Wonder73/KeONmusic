<template lang="html">
  <div class="inspiration">
    <p v-html="str"></p>
  </div>
</template>

<script>
import {mapGetters} from 'vuex'
export default {
  mounted(){
    if(this.$route.params.str)
      this.str = this.$route.params.str.replace(/\s{2}/g,'</p><p>');
  },
  data(){
    return {
      str:''
    }
  },
  computed:mapGetters(['singleInfo'])
}
</script>

<style lang="scss" scoped>
.inspiration{
  padding:10px;
  margin:10px auto;
  width:1120px;
  background:#f2f2f2;
  p{
    font-size:1.8rem;
    color:#333;
    text-indent:3rem;
    line-height:2;
  }
  @media only screen and(max-width:1120px){
    width:95%;
  }
}
</style>
