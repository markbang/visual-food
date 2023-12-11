<template>
    <v-example id="geo" title="上海市餐馆地图" desc="(详细数据)">
      <v-chart class="chart" :option="option" autoresize />
      <template #extra>
        <p class="actions">
          <button @click="loade">加载</button>
        </p>
      </template>
    </v-example>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import VExample from './Example.vue';
import * as echarts from 'echarts';
import { registerMap } from 'echarts/core'
import geo_data from '@/assets/shanghai.json';
import ad_data from '@/assets/经纬.json';
registerMap('shanghai', geo_data)
const option = ref({})
const goption = ref({
    tooltip: {
      show: true,
      enterable: true,
      formatter: function (params) {
        return `${params.name}<br/>
                星级：${params.value[2].星级}<br/>
                口味：${params.value[2].口味}<br/>
                服务：${params.value[2].服务}<br/>
                环境：${params.value[2].环境}`;
      },
      trigger: 'item'
    },
    geo: {
      map: 'shanghai',
      roam: true,
      zoom: 1.2,
      label: {
        show: true,
        color: '#fff',
        fontSize: 10
      },
      itemStyle: {
        areaColor: '#323c48',
        borderColor: '#111'
      },
      emphasis: {
        label: {
          show: true,
          color: '#fff',
          fontSize: 10
        },
        itemStyle: {
          areaColor: '#2a333d'
        }
      }
    },
    series: [
      {
        name: '餐馆点',
        type: 'scatter',
        coordinateSystem: 'geo',
        symbol: 'pin', // 标记的图形
        symbolSize: 5,
        label: {
          normal: {
            show: false,
            textStyle: {
              color: '#fff',
              fontSize: 12
            }
          }
        },
        itemStyle: {
          normal: {
            color: '#F62157' // 标记的颜色
          }
        },
        data: ad_data.map(item => ({
          name: item.店名,
          value: [parseFloat(item.lng), parseFloat(item.lat), item],
        }))
      }
    ]
})
const loade = () => {
    option.value = goption.value
}
</script>

<style scoped>
.chart {
  height: 400px;
}
</style>