import { createApp } from 'vue'
import App from './App.vue'

createApp(App).mount('#app')

function createAppp(el, data) {
    return createApp(App, {...data}).mount(el)
}


export default createAppp;
