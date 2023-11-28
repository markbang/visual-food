
<template>
  <div class="hover-link" @mouseover="startHoverAnimation" @mouseout="stopHoverAnimation">
    <a :href="link" class="link-text">{{ text }}</a>
  </div>
</template>

<script>
export default {
  props: {
    text: String, 
    link: String, 
  },
  data() {
    return {
      isHovered: false,
    };
  },
  methods: {
    startHoverAnimation() {
      this.isHovered = true;
    },
    stopHoverAnimation() {
      this.isHovered = false;
    },
  },
};
</script>

<style scoped>
.hover-link {
  display: inline-block;
  position: relative;
}

.link-text {
  font-size: 18px; 
  text-decoration: none;
  color: #333;
}

.hover-link:hover .link-text {
  color: rgb(63, 4, 4);
  transition: color 0.3s ease;
}
.hover-link:hover {
  box-shadow: 0 0 10px rgba(76, 2, 11, 0.8);
  transition: box-shadow 0.3s ease;
}

.hover-link:hover::before {
  content: "";
  position: absolute;
  width: 100%;
  height: 2px;
  background-color: rgb(63, 4, 4);
  bottom: 0;
  left: 0;
  transform: scaleX(0);
  transform-origin: bottom right;
  transition: transform 0.3s ease;
}

.hover-link:hover::before {
  transform: scaleX(1);
  transform-origin: bottom left;
}
</style>