<template>
  <header>
    <nav>
      <RouterLink to="/">Home</RouterLink>
      <RouterLink to="/albums">Albums</RouterLink>
    </nav>
  </header>
</template>

<script>
export default {
};
</script>

<style>
    nav {
      display: flex;
      justify-content: space-around;
      padding: 40px 0px;
      
    }
    a {
      text-decoration: none;
    }   
</style>