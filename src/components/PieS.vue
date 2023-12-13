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
    formatter: '{a} <br/>{b} : {c} ({d}%)'
  },
  legend: {
    bottom: 10,
    left: 'center',
    data: ['2-3', '3-4', '4-5']
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
        {
          value: 56101,
          name: '3-4',
        },
        { value: 26732, name: '4-5' },
        { value: 114, name: '2-3' }
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