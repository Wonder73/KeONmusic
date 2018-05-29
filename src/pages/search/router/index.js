import Vue from 'vue'
import Router from 'vue-router'
import Login from '@/components/Login'
import Reg from '@/components/Reg'
import Single from '@/components/search/Single';
import Lyric from '@/components/search/Lyric';

Vue.use(Router)

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
    {
      path:'/Single',
      name:'Single',
      component:Single
    },
    {
      path:'/Lyric',
      name:'Lyric',
      component:Lyric
    },
    {
      path:'*',
      redirect:'/Single'
    },
  ],
  linkActiveClass:"active"
})
