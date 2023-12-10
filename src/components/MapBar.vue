<template>
  <v-example id="mapbar" title="消费中位数" desc="(每个区的平均人均价格的中位数)">
    <v-chart class="chart" :option="mapOption" autoresize />
  </v-example>
</template>
<script setup>
import { registerMap } from 'echarts/core'
import { reactive } from 'vue'
import avg_data from '@/assets/Avg_data.json'
import geojson from '@/assets/shanghai.json'
import VExample from './Example.vue'

registerMap('shanghai', geojson)

const data = avg_data.areas.map(item => ({
  name: item.area.split('区')[0],
  value: item.mid_人均
}))

data.sort(function (a, b) {
  return a.value - b.value
})

const mapOption = reactive({
  visualMap: {
    left: 'right',
    min: 20,
    max: 80,
    inRange: {
      color: [
        '#313695',
        '#4575b4',
        '#74add1',
        '#abd9e9',
        '#e0f3f8',
        '#ffffbf',
        '#fee090',
        '#fdae61',
        '#f46d43',
        '#d73027',
        '#a50026'
      ]
    },
    text: ['High', 'Low'],
    calculable: true
  },
  series: [
    {
      id: 'population',
      type: 'map',
      roam: true,
      map: 'shanghai',
      animationDurationUpdate: 1000,
      universalTransition: true,
      data: data
    }
  ]
})

</script>
<style scoped>
.chart {
  height: 400px;
}
</style>
