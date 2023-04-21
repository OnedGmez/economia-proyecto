<template>
    <div :class="[scrolleando == true ? 'oculto' : '']" class="d-flex estatica-mobile-bottom">
        <div @click="irPrincipal" class="seleccionado item-menu home-btn">
            <div class="icono-home">
                <span class="icono"><font-awesome-icon icon="house" /> </span>
            </div>
            <div class="text-btn">
                <span>Home</span>
            </div>
        </div>
        <div @click="" class="item-menu rentacar-btn">
            <div class="icono-rentAcar">
                <span class="icono"><font-awesome-icon icon="car" /> </span>
            </div>
            <div class="text-btn">
                <span>RentAcar</span>
            </div>
        </div>
        <div @click="" class="item-menu taxi-btn">
            <div class="icono-taxi">
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
  }

  .estatica-mobile-bottom .icono {
    font-size: calc(1em + .65vw);
  }

  .estatica-mobile-bottom .text-btn {
    font-weight: 500;
    font-size: calc(.7em + .45vw);
  }

  .estatica-mobile-bottom {
    display: flex;
    position: fixed;
    bottom: 0;
    z-index: 1;
    background-color: #fff;
    height: 60px;
    right: 0;
    left: 0;
    transition: -ms-transform 0.25s cubic-bezier(0.455, 0.03, 0.515, 0.955) 0s, -webkit-transform 0.25s cubic-bezier(0.455, 0.03, 0.515, 0.955) 0s, transform 0.25s cubic-bezier(0.455, 0.03, 0.515, 0.955) 0s, visibility 0.25s ease 0s !important;
  }

  .oculto {
    transform: translateY(100%);
    visibility: hidden;
  }
</style>

<script setup>
import { ref } from 'vue';
import router from '@/router';

const scrolleando = ref(false)
const lastScroll = ref(0);
/**
 * dev: Oned Gómez 
 * Función que está bindeada al botón home en la vista de celular, redireccionará a la página principal o hará la recarga de la página
 */
 const irPrincipal = () => {
  router.go()
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
</script>