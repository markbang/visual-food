<template>
  <div v-if="show">
    <div class="mask_loading"><img src="@/assets/phone/loading.gif" alt="" class="loading"></div>
</div>
</template>

<script>
export default {
name: "loading",
data(){
    return{
    }

},
props: {
    show: Boolean
},
}
</script>
<style scoped lang="scss">
.loading{
width: 100px;
height: 80px;
position: absolute;
left: 50%;
top: 50%;
margin-left: -50px;
margin-top: -40px;
z-index: 13;
}
.mask_loading{
width: 100%;
height: 100%;
background:rgba(255,255,255,0);
position: fixed;
top: 0;
z-index: 99999;
}
</style>