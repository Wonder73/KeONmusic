import Vue from 'vue'
import Home from './home.vue'
import router from './router'
import store from '@/store/index'
import "../../../static/css/reset.css"
import "font-awesome/css/font-awesome.css"
import $ from 'jquery'

Vue.config.productionTip = false

new Vue({
  el:'#home',
  router,
  store,
  render:h=>h(Home)
});
