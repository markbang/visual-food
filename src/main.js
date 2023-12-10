import { createApp } from 'vue'
import App from './App.vue'

import ECharts from 'vue-echarts'
import * as echarts from "echarts";
createApp(App)
              .provide('$echarts', echarts)
              .component('v-chart', ECharts)
              .mount('#app')
