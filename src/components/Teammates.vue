<template>
    <div class="team-member">
      <div class="avatar">
        <img :src="member.avatar" alt="Avatar">
      </div>
      <div class="info">
        <h3>{{ member.name }}</h3>
        <p>{{ member.profession }}</p>
      </div>
    </div>
</template>
  
<script setup>
  const props = {
    member: {
      type: Object,
      required: true,
    },
  }
</script>
  
<style scoped>
  .team-member {
    border-radius: 10px;
    overflow: hidden;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
    padding: 20px;
  }
  
  .avatar {
    width: 80px;
    height: 80px;
    border-radius: 50%;
    overflow: hidden;
    margin-bottom: 10px;
  }
  
  .avatar img {
    width: 100%;
    height: 100%;
    object-fit: cover;
  }
  
  h3 {
    margin: 0;
  }
  
  p {
    margin: 5px 0;
    color: #666;
  }
</style>
  