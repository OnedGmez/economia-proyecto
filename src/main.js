import { createApp } from 'vue'
import { createPinia } from 'pinia'
import App from './App.vue'
import router from './router'
import { library } from '@fortawesome/fontawesome-svg-core'
import { fas } from '@fortawesome/free-solid-svg-icons'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
library.add(fas);

import 'bootstrap/dist/css/bootstrap.css'
import bootstrap from 'bootstrap/dist/js/bootstrap.bundle.js'
import axios from 'axios'

const pinia = createPinia()
const app = createApp(App).use(router).use(bootstrap)
app.config.globalProperties.axios=axios
app.use(pinia)
app.component('font-awesome-icon',FontAwesomeIcon)
app.mount('#app')
