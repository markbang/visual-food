<template>
    <v-example id="timeline" title="营业餐馆数量" desc="(每个时间段)">
      <v-chart class="chart" :option="option" autoresize />
    </v-example>
</template>

<script setup>
import { ref } from "vue";
import VExample from "./Example.vue";
import multipliedData from "@/assets/营业时间.json"
function getRandomColor() {
  const letters = '0123456789ABCDEF';
  let color = '#';
  for (let i = 0; i < 6; i++) {
    color += letters[Math.floor(Math.random() * 16)];
  }
  return color;
}
const xAxisData = multipliedData[0][Object.keys(multipliedData[0])[0]].map(item => item.time);
const seriesData = multipliedData.map(district => {
  const districtName = Object.keys(district)[0];
  const districtValues = district[districtName].map(item => item.value);

  return {
    name: districtName,
    type: 'line',
    smooth: true,
    data: districtValues,
    lineStyle: {
        color: getRandomColor()
      }
  };
});
const legendData = multipliedData.map(district => {
  const districtName = Object.keys(district)[0];
  return [districtName];
});
const option = ref({
  xAxis: {
    type: 'category',
    data: xAxisData
  },
  yAxis: {
    type: 'value'
  },
  series: seriesData,
  legend: legendData,
  tooltip: {
    trigger: 'item',
    axisPointer: {
      type: 'cross',
      label: {
        backgroundColor: '#6a7985'
      }
    }
  }
});

</script>

<style scoped>
.chart {
height: 400px;
}
</style>