<template>
    <v-example id="pies" title="评分比例">
      <v-chart class="chart" :option="option" autoresize />
    </v-example>
</template>

<script setup>
import { ref } from "vue";
import VExample from "./Example.vue";
const option = ref({
  tooltip: {
    trigger: 'item',
    formatter: '{b} : {c} ({d}%)'
  },
  legend: {
    bottom: 10,
    left: 'center',
    data: ['0-3', '3-3.5', '3.5-4', '4-4.5', '4.5-5']
  },
  toolbox: {
    show: true,
    feature: {
      mark: { show: true },
      dataView: { show: true, readOnly: false },
      restore: { show: true },
      saveAsImage: { show: true }
    }
  },
  series: [
    {
      type: 'pie',
      radius: '65%',
      center: ['50%', '50%'],
      selectedMode: 'single',
      data: [
        { value: 8477, name: '4.5-5',},
        { value: 19214, name: '4-4.5' },
        { value: 48741, name: '3.5-4' },
        { value: 11582, name: '3-3.5' },
        { value: 116, name: '0-3' }
      ],
      emphasis: {
        itemStyle: {
          shadowBlur: 10,
          shadowOffsetX: 0,
          shadowColor: 'rgba(0, 0, 0, 0.5)'
        }
      }
    }
  ]
});
</script>

<style scoped>
.chart {
height: 400px;
}
</style>