import Vue from 'vue'
import albumDetail from './albumDetail.vue'
import router from './router';
import store from '@/store/index.js'
import "../../../static/css/reset.css"
import "font-awesome/css/font-awesome.css"
import $ from 'jquery'

new Vue({
  el:'#albumDetail',
  store,
  router,
  render:h=>h(albumDetail)
});
