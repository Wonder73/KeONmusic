import Vue from 'vue'
import Router from 'vue-router'
import Login from '@/components/Login'
import Reg from '@/components/Reg'
import Inspiration from './Inspiration'
import Album from './Album'
import Comment from './Comment'

Vue.use(Router)

export default new Router({
  routes:[
    {
      path: '/Login',
      name: 'Login',
      component: Login
    },
    {
      path:'/Login/Reg',
      name:'Reg',
      component:Reg
    },
    {
      path:'/Inspiration',
      name:'Inspiration',
      component:Inspiration
    },
    {
      path:'/Album',
      name:'Album',
      component:Album
    },
    {
      path:'/Comment',
      name:'Comment',
      component:Comment
    },
    {
      path:'*',
      redirect:'/Album'
    }
  ],
  linkActiveClass:"active"
})
