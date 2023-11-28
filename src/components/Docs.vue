<template>
    <div class="gitbook-container">
      <iframe :src="gitBookUrl" scrolling="false"></iframe>
    </div>
  </template>
  
  <script>
  export default {
    props: {
      gitBookUrl: {
        type: String,
        required: true,
      },
    },
  };
  </script>
  
  <style scoped>
  .gitbook-container {
    width: 75%;
    height: 100%;
    margin: 0 auto;
  }
  
  iframe {
    width: 100%;
    height: 100%;
    border: 1px solid #ddd; 
    border-radius: 25px; 
  }
  </style>
  