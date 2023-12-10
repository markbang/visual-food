<template>
  <v-example id="treemap" title="各地区餐馆数量" desc="(按照餐馆类型分类)">
    <v-chart class="chart" :option="option" autoresize />
  </v-example>
</template>
  
<script setup>
import { ref } from "vue";
import VExample from "./Example.vue";
import * as echarts from 'echarts';
const formatUtil = echarts.format;
import num_data from "@/assets/数量.json"
const data = num_data
function getLevelOption() {
    return [
      {
        itemStyle: {
          borderWidth: 0,
          gapWidth: 5
        }
      },
      {
        itemStyle: {
          gapWidth: 1
        }
      },
      {
        colorSaturation: [0.35, 0.5],
        itemStyle: {
          gapWidth: 1,
          borderColorSaturation: 0.6
        }
      }
    ];
  }
const option = ref({
      title: {
        text: '餐馆数量',
        left: 'center'
      },
      tooltip: {
        formatter: function (info) {
          var value = info.value;
          var treePathInfo = info.treePathInfo;
          var treePath = [];
          for (var i = 1; i < treePathInfo.length; i++) {
            treePath.push(treePathInfo[i].name);
          }
          return [
            '<div class="tooltip-title">' +
              formatUtil.encodeHTML(treePath.join('/')) +
              '</div>',
            '数量: ' + formatUtil.addCommas(value) + ' 个'
          ].join('');
        }
      },
      series: [
        {
          name: '餐馆数量',
          type: 'treemap',
          visibleMin: 300,
          label: {
            show: true,
            formatter: '{b}'
          },
          itemStyle: {
            borderColor: '#fff'
          },
          levels: getLevelOption(),
          data: data
        }
      ]
    });
</script>

<style scoped>
.chart {
  height: 400px;
}
</style>