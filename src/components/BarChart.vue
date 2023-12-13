<template>
  <v-example id="bardrill" title="各地区人均价格均值" desc="(每个菜系)">
    <v-chart class="chart" :option="option" autoresize />
  </v-example>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import VExample from './Example.vue';
import * as echarts from 'echarts';
import num_data from '@/assets/均价.json';
const uniqueCategories = Array.from(new Set(num_data.不同地区各类均价.map(item => item.分类)));
const xAxisData = Array.from(new Set(num_data.不同地区各类均价.map(item => item.area)));
function getXValuesForCategory(category) {
  return xAxisData.map(area => {
    const item = num_data.不同地区各类均价.find(data => data.分类 === category && data.area === area);
    return item ? item.均价 : 0;
  });
}
const seriesData = uniqueCategories.map(category => {
    return {
      name: category,
      type: 'line',
      stack: 'Total',
      smooth: true,
      lineStyle: {
        width: 0
      },
      showSymbol: false,
      label: {
        show: true,
        position: 'top'
      },
      areaStyle:{
        opacity: 0.8
      },
      emphasis: {
        focus: 'series'
      },
      data: getXValuesForCategory(category)
    };
  });
const option = ref({
  color: ['#80FFA5', '#00DDFF', '#37A2FF', '#FF0087', '#FFBF00', '#5c2223', '#ee3f4d', '#e3b4b8', '#d11a2d', '#ef475d', '#621624', '#ec2c64', '#33141e', '#b598a1', '#381924', '#e0c8d1', '#36292f', '#411c35', '#8b2671', '#1c0d1a', '#ccccd6', '#22202e', '#5e616d', '#0f1423', '#8fb2c9', '#1177b0', '#ffa60f', '#12aa9c', '#c0c4c3', '#223e36', '#5bae23', '#f0f5e5', '#f8d86a', '#5c3719'],
  title: {
    text: ''
  },
  tooltip: {
    trigger: 'item',
    axisPointer: {
      type: 'cross',
      label: {
        backgroundColor: '#6a7985'
      }
    }
  },
  legend: {
    data: uniqueCategories
  },
  toolbox: {
    feature: {
      saveAsImage: {}
    }
  },
  grid: {
    left: '3%',
    right: '4%',
    bottom: '3%',
    containLabel: true
  },
  xAxis: [
    {
      type: 'category',
      boundaryGap: false,
      data: xAxisData,
    }
  ],
  yAxis: [
    {
      type: 'value'
    }
  ],
  series: seriesData
  });

</script>

<style scoped>
.chart {
  height: 400px;
}
</style>