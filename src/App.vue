<template>
  <router-view />
</template>

<script>

</script>

<style>
@font-face {
  font-family: 'fredoka-family';
  src: url("assets/fonts/Fredoka-VariableFont_wdth\,wght.ttf");
}

body {
  padding: 0;
}

#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  height: 100%;
  width: auto;
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

.separador {
  width: 90%;
  height: 1px;
  display: block;
  margin: 0 auto 10px auto;
  background-color: #8e8e8e;
}

.etiqueta-contenido {
  font-size: calc(.5em + .45vw);
  font-weight: 600;
}

a{
  font-size: calc(.5em + .45vw);
  color: #8e8e8e!important;
  text-decoration: none !important;
  text-align: start;
}

/*
  * Configuramos el media query para dispositivo celulares 
*/
@media (max-width: 768px) {

  .etiqueta-contenido {
    font-size: calc(.65em + .45vw);
  }

}
</style>
