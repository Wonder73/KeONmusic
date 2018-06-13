import Vue from 'vue'
import Router from 'vue-router'
import Login from '@/components/Login'
import Reg from '@/components/Reg'
import Inspiration from './Inspiration'
import Lyric from './Lyric'
import Comment from './Comment/Comment'
import Asc from './Comment/Asc'
import Desc from './Comment/Desc'
import Hot from './Comment/Hot'

Vue.use(Router)

export default new Router({
  routes:[
    {
      path: '/Login',
      name: 'Login',
      component: Login
    },
    {
      path:'/*/Login/Reg',
      name:'Reg',
      component:Reg
    },
    {
      path:'/Inspiration',
      name:'Inspiration',
      component:Inspiration
    },
    {
      path:'/Lyric',
      name:'Lyric',
      component:Lyric
    },
    {
      path:'/Comment',
      name:'Comment',
      component:Comment,
      children:[
        {path:'/Comment/Asc',name:'Asc',component:Asc},
        {path:'/Comment/Desc',name:'Desc',component:Desc},
        {path:'/Comment/Hot',name:'Hot',component:Hot},
        {path:'/',name:'Asc2',component:Asc}
      ]
    },
    {
      path:'*',
      redirect:'/Inspiration'
    }
  ],
  linkActiveClass:"active"
})
