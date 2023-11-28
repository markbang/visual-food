import { createApp } from 'vue'
import App from './App.vue'

import ECharts from 'vue-echarts'
import 'echarts'


createApp(App)
              .component('v-chart', ECharts)
              .mount('#app')
