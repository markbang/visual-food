<template>
    <v-example id="timeline" title="营业时间" desc="(每个时间段)">
      <v-chart class="chart" :option="option" autoresize />
    </v-example>
</template>

<script setup>
import { ref } from "vue";
import VExample from "./Example.vue";
import time_data from "@/assets/营业时间.json"
const option = ref({
  xAxis: {
    type: 'category',
    data: time_data.map(item => item.time)
  },
  yAxis: {
    type: 'value'
  },
  series: [
    {
      data: time_data.map(item => item.value),
      type: 'line',
      smooth: true
    }
  ],
  tooltip: {
    trigger: 'axis',
    formatter: function(params) {
      // params 是一个数组，包含鼠标悬浮的所有数据
      const time = params[0].axisValue; // x 轴的时间
      const value = params[0].data; // 对应时间点的值

      // 返回自定义的提示框内容
      return `${time}: ${value}个`;
    }
  }
});

</script>

<style scoped>
.chart {
height: 400px;
}
</style>