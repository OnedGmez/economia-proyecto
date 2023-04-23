<template>
  <div v-if="celular == true" :class="[scrolleando == true ? 'oculto' : '']" class="d-flex estatica-mobile-bottom">
    <div :class="{ seleccionado: opSeleccionada == '/' }" @click="navegar('')" class="item-menu home-btn">
      <div class="icono-home">
        <span class="icono"><font-awesome-icon icon="house-chimney" /> </span>
      </div>
      <div class="text-btn">
        <span>Home</span>
      </div>
    </div>
    <div :class="{ seleccionado: opSeleccionada == '/rentacar' }" @click="navegar('rentacar')" class="item-menu rentacar-btn">
      <div class="icono-rentAcar">
        <span class="icono"><font-awesome-icon icon="car" /> </span>
      </div>
      <div class="text-btn">
        <span>RentAcar</span>
      </div>
    </div>
    <div :class="{ seleccionado: opSeleccionada == '/reservas' }" @click="navegar('reservas')" class="item-menu rentacar-btn">
      <div class="icono-rentAcar">
        <span class="icono"><font-awesome-icon icon="location-pin-lock" /> </span>
      </div>
      <div class="text-btn">
        <span>Reservas</span>
      </div>
    </div>
    <div  :class="{ seleccionado: opSeleccionada == '/llevame' }" @click="navegar('llevame')" class="item-menu taxi-btn">
      <div class="icono-taxi">
        <span class="icono-secundario"><font-awesome-icon icon="location-dot" /> </span>
        <span class="icono"><font-awesome-icon icon="taxi" /> </span>
      </div>
      <div class="text-btn">
        <span>¡Llevame!</span>
      </div>
    </div>
    <div class="inicio-sesion item-menu">
      <div class="inicio-sesion-nombre">
        <div @click="desplegarSubModal('Iniciar Sesion')" class="avatar">
          <span class="icono"><font-awesome-icon icon="user-tie" /></span>
        </div>
        <div class="text-btn">
          <span>Invitado</span>
        </div>
      </div>
    </div>
  </div>


  <div v-if="celular == false" class="d-flex estatica-lg-bottom">
    <div :class="{ seleccionado: opSeleccionada == '/' }" @click="navegar('')" class="item-menu home-btn">
      <div class="icono-home">
        <span class="icono"><font-awesome-icon icon="house-chimney" /> </span>
      </div>
    </div>
    <div :class="{ seleccionado: opSeleccionada == '/rentacar' }" @click="navegar('rentacar')" class="item-menu rentacar-btn">
      <div class="icono-rentAcar">
        <span class="icono"><font-awesome-icon icon="car" /> </span>
      </div>
    </div>
    <div @click="navegar('llevame')" class="item-menu taxi-btn">
      <div class="icono-taxi">
        <span class="icono-secundario"><font-awesome-icon icon="location-dot" /> </span>
        <span class="icono"><font-awesome-icon icon="taxi" /> </span>
      </div>
    </div>
    <div class="inicio-sesion">
      <div class="d-flex inicio-sesion-nombre">
        <div @click="desplegarModalSesion" class="avatar-lg">
          <span><font-awesome-icon icon="user-tie" /></span>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.estatica-mobile-bottom {
  justify-content: space-evenly;
  padding: 5px 0;
  color: #000000;
}

.estatica-mobile-bottom .item-menu {
  color: #8e8e8e;
}

.estatica-mobile-bottom .item-menu:hover,
.seleccionado {
  color: #ff475e !important;
  font-weight: 600 !important;
}

.estatica-mobile-bottom .icono {
  font-size: calc(1em + .65vw);
}

.estatica-mobile-bottom .text-btn {
  font-weight: 400;
  font-size: calc(.7em + .35vw);
}

.estatica-mobile-bottom {
  display: flex;
  position: fixed;
  bottom: 0;
  z-index: 1;
  background-color: #fff;
  height: 55px;
  left: 4.5%;
  width: 90%;
  box-shadow: 0px 1px 10px #8d8d8d52;
  border-radius: 30px;
  margin-bottom: 10px;
  transition: -ms-transform 0.25s cubic-bezier(0.455, 0.03, 0.515, 0.955) 0s, -webkit-transform 0.25s cubic-bezier(0.455, 0.03, 0.515, 0.955) 0s, transform 0.25s cubic-bezier(0.455, 0.03, 0.515, 0.955) 0s, visibility 0.25s ease 0s !important;
}

.oculto {
  transform: translateY(100%);
  visibility: hidden;
}

.icono-secundario {
  font-size: calc(.45em + .65vw);
  position: relative;
  bottom: 10px;
  left: 2px;
}

/*
* CSS para el menu que se mostrará en PC
 */
.estatica-lg-bottom {
  display: flex;
  position: relative;
  z-index: 1;
  background-color: #fff;
  left: 0;
  right: 0;
  transition: -ms-transform 0.25s cubic-bezier(0.455, 0.03, 0.515, 0.955) 0s, -webkit-transform 0.25s cubic-bezier(0.455, 0.03, 0.515, 0.955) 0s, transform 0.25s cubic-bezier(0.455, 0.03, 0.515, 0.955) 0s, visibility 0.25s ease 0s !important;
}

.estatica-lg-bottom .item-menu {
  color: #8e8e8e;
  margin-right: 25px;
}

.estatica-lg-bottom .item-menu:hover,
.seleccionado {
  color: #ff475e !important;
}

.estatica-lg-bottom .icono {
  font-size: calc(1em + .65vw);
}


.inicio-sesion .inicio-sesion-nombre .avatar-lg {
  border-radius: 50%;
  background-color: #8e8e8e;
  color: #fff;
  font-size: calc(.5em + .75vw);
  padding: 4px 10px;
  box-shadow: 0px 5px 10px #8d8d8d8a;
}

.inicio-sesion {
  position: relative;
  justify-content: end;
}

.inicio-sesion .inicio-sesion-nombre {
  justify-content: flex-end;
  align-items: center;
}
</style>

<script setup>
import { ref } from 'vue';
import router from '@/router';
import { useRoute } from "vue-router";

const routeParams = useRoute()

const emisiones = defineEmits([
  'abrirSesion',
  'desplegarModalSesion'
])

const propsMenu = defineProps([
  'celular'
])

const opSeleccionada = ref(routeParams.path)
const scrolleando = ref(false)
const lastScroll = ref(0);
/**
 * dev: Oned Gómez 
 * Función que está bindeada al botón home en la vista de celular, redireccionará a la página principal o hará la recarga de la página
 */
const navegar = (nombre) => {
  router.push('/' + nombre)
}

//Evento que sirve para escuchar el scroll de la página
window.addEventListener("scroll", () => {
  const currentScroll = window.pageYOffset;
  if (currentScroll == 0) {
    scrolleando.value = false
    return;
  }

  if (currentScroll > lastScroll.value) {
    // down 
    scrolleando.value = true
  } else if (currentScroll < lastScroll.value) {
    // up 
    scrolleando.value = false
  }
  lastScroll.value = currentScroll;
});


const desplegarSubModal = (accion) => {
  emisiones('abrirSesion', accion)
}

const desplegarModalSesion = () => {
  emisiones('desplegarModalSesion')
}
</script>
