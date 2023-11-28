<template>
  <v-example id="bar" title="Bar chart" desc="(with action dispatch)">
    <v-chart class="chart" :option="option" autoresize />
  </v-example>
</template>
  
<script setup lang="ts">
import { ref } from "vue";
import VExample from "./Example.vue";
const option = ref({
       title: { text: "Column Chart" },
       tooltip: {},
       xAxis: {
         data: ["衬衫", "羊毛衫", "雪纺衫", "裤子", "高跟鞋", "袜子"],
       },
       yAxis: {},
       series: [
         {
           name: "销量",
           type: "bar",
           data: [5, 20, 36, 10, 10, 20],
         },
       ],
     },);
</script>

<style scoped>
.chart {
  height: 400px;
}
</style>