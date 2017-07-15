import Vue from 'vue'
import Router from 'vue-router'
import Hello from '../components/Hello'
import User from '../components/User'
import UserFollowing from '../components/UserFollowing'
import Memos from '../components/Memos'

//console.log("userid")
Vue.use(Router)

export default new Router({
  mode: "history",
  routes: [
    {
      path: '/',
      name: 'hello',
      component: Hello
    },
    {
      path: '/memos',
      name: 'memos',
      component: Memos
    },
    {
      path: '/:user',
      name: 'user',
      component: User,
      children: [
        {
          path: 'following',
          name: 'user-following',
          component: UserFollowing,
          meta: { test: true }
        },

      ]
    },
  ]
})
