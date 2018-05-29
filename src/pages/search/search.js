import Vue from 'vue'
import search from './search.vue'
import router from './router'
import store from '@/store/index'
import "../../../static/css/reset.css"
import "font-awesome/css/font-awesome.css"
import $ from 'jquery'

new Vue({
	el:'#search',
	store,
	router,
	render:h=>h(search)
})
