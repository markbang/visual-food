<template>
    <v-example id="welcome" title="Welocme！" desc="(2022大众点评上海餐饮店铺数据可视化)">
      <v-chart class="chart" :option="option" autoresize />
    </v-example>
</template>
<script setup>
import { ref } from 'vue'
import VExample from './Example.vue'
const option = ref({
  graphic: {
    elements: [
      {
        type: 'text',
        left: 'center',
        top: 'center',
        style: {
          text: '瓜头鲸 🐋 Visual',
          fontSize: 80,
          fontWeight: 'bold',
          lineDash: [0, 200],
          lineDashOffset: 0,
          fill: 'transparent',
          stroke: '#000',
          lineWidth: 1
        },
        keyframeAnimation: {
          duration: 3000,
          loop: true,
          keyframes: [
            {
              percent: 0.7,
              style: {
                fill: 'transparent',
                lineDashOffset: 200,
                lineDash: [200, 0]
              }
            },
            {
              // Stop for a while.
              percent: 0.8,
              style: {
                fill: 'transparent'
              }
            },
            {
              percent: 1,
              style: {
                fill: 'pink'
              }
            }
          ]
        }
      }
    ]
  }
})

</script>
<style scoped>
.chart {
height: 400px;
}
</style>
