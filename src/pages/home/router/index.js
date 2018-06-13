import Vue from 'vue'
import Router from 'vue-router'
import Login from '@/components/Login'
import Reg from '@/components/Reg'

Vue.use(Router);

export default new Router({
  routes:[
    {
      path:'/Login',
      name:'Login',
      component:Login
    },
    {
      path:'/Login/Reg',
      name:'Reg',
      component:Reg
    },
  ],
  linkActiveClass:'active'
})
