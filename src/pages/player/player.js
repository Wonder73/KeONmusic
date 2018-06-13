import Vue from 'vue'
import player from './player.vue'
import router from './router'
import store from '@/store/index'
import "../../../static/css/reset.css"
import '../../../static/js/artyom.window.min.js'
import "font-awesome/css/font-awesome.css"
import $ from 'jquery'

Vue.config.productionTip = false

new Vue({
  el:'#player',
  router,
  store,
  render:h=>h(player),
})
