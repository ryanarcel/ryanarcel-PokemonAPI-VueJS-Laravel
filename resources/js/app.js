require('./bootstrap');

import { createApp } from 'vue'
import App from './App.vue'
import { library } from '@fortawesome/fontawesome-svg-core'
import { faThumbsUp } from '@fortawesome/free-solid-svg-icons'
import { faThumbsDown } from '@fortawesome/free-solid-svg-icons'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'

import router from './router'

library.add( faThumbsUp, faThumbsDown)

createApp(App)
.use(router)
.component('font-awesome-icon', FontAwesomeIcon)
.mount('#app')

