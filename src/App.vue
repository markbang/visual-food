<template>
    <a href="https://www.heywhale.com/org/hsb/competition/area/6539eff4e621c857923f596e/content">
      <img src="./assets/logo.png" alt="一只瓜头鲸" height="110" width="110" >
    </a>
  <br>
  <Teammates text="陈浩楠" link="https://www.heywhale.com/home/user/profile/655710d2b4dec7c8eb23da3b/overview" /> | 
  <Teammates text="龚天阳" link="https://example.com" /> | 
  <Teammates text="刘畅" link="https://example.com" /> | 
  <Teammates text="王棒棒" link="https://www.heywhale.com/home/user/profile/64859c80f7b6f2558a1196c1/overview" />
  <br>
  <br>
    <div class="rounded-swiper">
      <swiper
        :cssMode="true"
        :navigation="true"
        :pagination="true"
        :mousewheel="true"
        :keyboard="true"
        :modules="modules"
        :touchStartPreventDefault="false" 
        class="mySwiper"
      > // 添加touchStartPreventDefault属性 不阻止事件 解决点击无效bug
        <swiper-slide><div><PieSimple /></div></swiper-slide>
        <swiper-slide><div><BarChart /></div></swiper-slide>
        <swiper-slide>Slide 2</swiper-slide>
      </swiper>
    </div>
    <BarChart />
    <PieSimple />
    <p>Hello world!</p>
</template>

<script setup>
import { ref, provide } from 'vue'
import PieSimple from './components/PieSimple.vue'
import { Swiper, SwiperSlide } from 'swiper/vue';
import 'swiper/css';

import 'swiper/css/navigation';
import 'swiper/css/pagination';

import './style.css';
import Teammates from './components/Teammates.vue';

import BarChart from './components/BarChart.vue' // 确保你有这个文件
import myEchartStyle from "@/assets/myEchartStyle.json"
import { THEME_KEY } from "vue-echarts"

import { Navigation, Pagination, Mousewheel, Keyboard } from 'swiper/modules';
const modules = [Navigation, Pagination, Mousewheel, Keyboard];
provide(THEME_KEY, myEchartStyle)
</script>

<style lang="scss">
*,
*::before,
*::after {
  box-sizing: border-box;
}

html {
  scroll-behavior: smooth;
}

body {
  margin: 0;
  padding: 3em 0 0;
  font-family: Inter, "Helvetica Neue", Arial, sans-serif;
  font-weight: 300;
  color: #666;
  text-align: center;
}

a {
  color: inherit;
  text-decoration: none;
}

h1 {
  margin-bottom: 1em;
  font-family: Inter, "Helvetica Neue", Arial, sans-serif;
}

h1,
h2 {
  color: #2c3e50;
  font-weight: 400;
}

h2 {
  margin-top: 2em;
  padding-top: 1em;
  font-size: 1.2em;

  small {
    font-weight: 300;
    opacity: 0.7;
  }

  button {
    margin-left: 1em;
    vertical-align: middle;
  }
}
.desc {
  margin-bottom: 3em;
  color: #7f8c8d;

  a {
    color: #42b983;
  }
}
.mySwiper {
  width: 68%;
  height: 100%;
  border: 4px solid rgb(99, 7, 22); /* 设置边框样式和颜色 */
  border-radius: 30px; /* 设置圆角半径 */
}
.swiper-pagination-bullet-active {
        background-color: #4d0707
}
.swiper-button-prev, .swiper-button-next {
        color: #2f0101
}
p small {
  font-size: 0.8em;
  color: #7f8c8d;
}

p {
  line-height: 1.5;

  button + button,
  button + select,
  select + button,
  select + select {
    margin-left: 0.5em;
  }
}

pre {
  display: inline-block;
  padding: 0.8em;
  background-color: #f9f9f9;
  box-shadow: 0 1px 2px rgba(0, 0, 0, 0.125);
  text-align: left;
}
pre,
code,
textarea {
  font-family: ui-monospace, SFMono-Regular, "SF Mono", Menlo, Consolas,
    "Liberation Mono", monospace;
}

footer {
  margin: 5em 0 3em;
  font-size: 0.5em;
  vertical-align: middle;

  a {
    display: inline-block;
    margin: 0 5px;
    padding: 3px 0 6px;
    color: #7f8c8d;
    font-size: 2em;
    text-decoration: none;
  }

  a:hover {
    padding-bottom: 3px;
    border-bottom: 3px solid #42b983;
  }
}

button,
select,
input {
  border: 1px solid #4fc08d;
  border-radius: 0.5em;
  background-color: #fff;
  color: #42b983;
  cursor: pointer;
  font: inherit;
  padding: 0 0.5em;
  transition: all 0.2s;

  &:focus {
    outline: none;
  }

  &:focus-visible {
    box-shadow: 0 0 1px #4fc08d;
  }

  &:active {
    background: rgba(79, 192, 141, 0.2);
  }

  &[disabled] {
    opacity: 0.5;
    cursor: not-allowed;
  }
}

label {
  display: flex;
  align-items: center;
  justify-content: center;
}

button,
input,
label,
select {
  font-size: 0.75em;
  height: 2em;
}

#logo {
  display: inline-block;
  width: 128px;
  height: 128px;
  pointer-events: none;
}

.modal {
  display: none;
  position: fixed;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  background-color: rgba(0, 0, 0, 0.2);
  z-index: 2147483646;

  &.open {
    display: flex;
    align-items: center;
    justify-content: center;
  }

  img {
    position: absolute;
    background-color: #404a59;
    max-width: 80vw;
    border: 2px solid #fff;
    border-radius: 3px;
    box-shadow: 0 0 30px rgba(0, 0, 0, 0.2);
  }
}

@media (max-width: 980px) {
  p {
    select {
      text-indent: calc(50% - 1em);
    }

    select,
    label {
      border: 1px solid #4fc08d;
      border-radius: 2em;
      background-color: #fff;
      color: #42b983;
      cursor: pointer;
      transition: opacity 0.3s;
    }

    button,
    input,
    select,
    label {
      flex: 1 0;
      margin: 0 0.5em;
      padding: 0;
      line-height: 2em;
      max-width: 40vw;
      border-radius: 0.5em;
      font-size: 0.8em;
    }

    input[type="checkbox"] {
      display: none;

      &:checked + label {
        background: #42b983;
        color: #fff;
      }
    }
  }

  .actions {
    display: flex;
    justify-content: center;
  }
}

.renderer,
.codegen {
  button {
    position: relative;
    border-color: #36485e;
    color: rgba(54, 72, 94, 0.8);
    font-weight: 500;

    &:focus-visible {
      box-shadow: 0 0 1px #36485e;
    }

    &:active {
      background: rgba(54, 72, 94, 0.2);
    }
  }
}

.renderer {
  position: fixed;
  top: 10px;
  left: 10px;
  font-size: 16px;

  button {
    width: 64px;

    &.active {
      z-index: 1;
      background-color: #36485e;
      color: #fff;
    }

    &:first-child {
      border-top-right-radius: 0;
      border-bottom-right-radius: 0;
    }

    &:last-child {
      left: -1px;
      border-top-left-radius: 0;
      border-bottom-left-radius: 0;
    }
  }
}

.codegen {
  display: flex;
  position: fixed;
  top: 10px;
  left: 146px;

  button {
    display: flex;
    align-items: center;
    padding: 0 4px;
    gap: 4px;

    .badge {
      display: block;
      padding: 2px 3px;
      font-size: 10px;
      background: #36485e54;
      color: #fff;
      border-radius: 4px;
    }
  }
}

@media (max-width: 480px) {
  .codegen {
    display: none;
  }
}
</style>