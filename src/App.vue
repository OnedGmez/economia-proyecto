<template>
  <router-view/>
</template>

<style>
@font-face {
    font-family: 'lobster';
    src: url("assets/fonts/Lobster-Regular.ttf");
}

@font-face {
    font-family: 'fredoka';
    src: url("assets/fonts/Fredoka-VariableFont_wdth\,wght.ttf");
}

#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

nav {
  padding: 30px;
}

nav a {
  font-weight: bold;
  color: #2c3e50;
}

nav a.router-link-exact-active {
  color: #42b983;
}
</style>
