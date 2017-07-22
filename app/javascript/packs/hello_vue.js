/* eslint no-console: 0 */
// Run this example by adding <%= javascript_pack_tag 'hello_vue' %> and
// <%= stylesheet_pack_tag 'hello_vue' %> to the head of your layout file,
// like app/views/layouts/application.html.erb.
// All it does is render <div>Hello Vue</div> at the bottom of the page.

import Vue from 'vue'
import App from './app.vue'
import router from './router'
import store from './store'
import axios from 'axios'
import vmodal from 'vue-js-modal'

Vue.use(vmodal)

//want to move
//https://stephenhowells.net/rails-5-user-registration-with-devise-vue-js-and-axios/
let token = document.getElementsByName('csrf-token')[0].getAttribute('content')
axios.defaults.headers.common['X-CSRF-Token'] = token
axios.defaults.headers.common['Accept'] = 'application/json'

document.addEventListener('DOMContentLoaded', () => {
  document.body.appendChild(document.createElement('hello'))

  // const app = new Vue(App).$mount('hello')
  /* eslint-disable no-new */
  const app = new Vue({
    el: '#app',
    router,
    store,
    template: '<App/>',
    components: { App }
  })

  

  //console.log(app)
})


