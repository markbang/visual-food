<template>
    <v-example id="geo" title="上海市餐馆地图" desc="(详细数据)">
      <v-chart class="chart" :option="option" autoresize />
      <template #extra>
        <p class="actions">
          <button @click="loade1">加载</button>
        </p>
      </template>
    </v-example>
</template>

<script setup>
import { ref, onMounted, reactive } from 'vue';
import VExample from './Example.vue';
import * as echarts from 'echarts';
import { registerMap } from 'echarts/core'
import geo_data from '@/assets/shanghai.json';
import ad_data1 from '@/assets/经纬1.json';
import ad_data2 from '@/assets/经纬2.json';
registerMap('shanghai', geo_data)
const option = ref({})
const goption2 = ref({
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
    series: [{
        name: '餐馆点',
        type: 'scatter',
        coordinateSystem: 'geo',
        symbol: 'arrow', // 标记的图形
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
        data: ad_data2.map(item => ({
          name: item.店名,
          value: [parseFloat(item.lng), parseFloat(item.lat), item],
        }))
      }]
})
const goption1 = ref({
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
    series: [{
        name: '餐馆点',
        type: 'scatter',
        coordinateSystem: 'geo',
        symbol: 'arrow', // 标记的图形
        symbolSize: 6,
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
            color: '#63bbd0' // 标记的颜色
          }
        },
        data: ad_data1.map(item => ({
          name: item.店名,
          value: [parseFloat(item.lng), parseFloat(item.lat), item],
        }))
      }]
})
const mergedOption = reactive({
  ...goption1.value, // 这会复制goption1的所有属性
  series: [...goption1.value.series, ...goption2.value.series] // 这会合并两个option的series数组
});
const loade1 = () => {
    option.value = mergedOption;
}
</script>

<style scoped>
.chart {
  height: 500px;
}
</style>