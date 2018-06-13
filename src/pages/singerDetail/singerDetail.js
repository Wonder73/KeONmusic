import Vue from 'vue'
import singerDetail from './singerDetail.vue'
import router from './router';
import store from '@/store/index.js'
import "../../../static/css/reset.css"
import "font-awesome/css/font-awesome.css"
import $ from 'jquery'

new Vue({
  el:'#singerDetail',
  store,
  router,
  render:h=>h(singerDetail)
});
