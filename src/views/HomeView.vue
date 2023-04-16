<template>
  <div @scroll="scrollOn" class="home">
    <div class="pagina">
      <div class="estatica-top">
        <div class="cabecera">
          <div class="logo">
            <div class="img">
              <img class="img-fluid" src="../assets/img/logo.png" alt="Logo RentAway">
            </div>
          </div>
          <div class="busqueda">
            <barraBusqueda />
          </div>
          <div class="inicio-sesion">
            <div class="d-flex inicio-sesion-nombre">
              <div class="nombre-usuario">
                <span>Invitado</span>
              </div>
              <div @click="desplegarModalSesion" class="avatar">
                <span><font-awesome-icon icon="user-tie" /></span>
              </div>
            </div>
          </div>
        </div>
        <div class="d-flex zona-filtros">
          <zonaFiltros />
          <button @click="desplegarOtrosFiltros" class="d-flex btn">
            <div class="icono-boton">
              <span> <font-awesome-icon icon="sliders" /> </span>
            </div>
            <div class="texto-boton">
              <span>Filtros</span>
            </div>
          </button>
        </div>
      </div>
      <div class="main container">
        <div class="row">
          <tarjetaCasas v-for="info in dataPrueba" :data="info" :key="info.idHome"
            @abrir-detalles="(detalle) => abrirModalDetalles(detalle)" />
        </div>
      </div>
      <div v-if="mostrarMenuCel == true" :class="[scrolleando == true ? 'oculto' : '']"
        class="d-flex estatica-mobile-bottom">
        <div @click="irPrincipal" class="item-menu home-btn">
          <div class="icono-home">
            <span class="icono"><font-awesome-icon icon="house" /> </span>
          </div>
          <div class="text-btn">
            <span>Home</span>
          </div>
        </div>
        <div @click="desplegarOtrosFiltros" class="item-menu filtro-btn">
          <div class="icono-boton">
            <span class="icono"> <font-awesome-icon icon="sliders" /> </span>
          </div>
          <div class="text-btn">
            <span>Filtros</span>
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
    </div>
    <accionesSesion v-if="mostrandoModalAccionesSesion == true"
      @desplegar-modal="(nombreModal) => { desplegarSubModal(nombreModal), desplegarModalSesion() }" />
    <modalSesion v-if="mostrandoModalSesion == true" :accion="accionModal" @cerrar-modal="() => cerrarSubModal()" />
    <modalOtrosFiltros v-if="mostrandoModalFiltros == true" @cerrar-modal="() => desplegarOtrosFiltros()" />
    <modalDetallesCasa v-if="mostrarDetallesCasa == true" :data="informacionDetalleCasa" @cerrar-detalles="() => cerrarModalDetalles()"/>
  </div>
</template>

<script setup>
import { ref } from 'vue';

import barraBusqueda from '@/components/barra-busqueda.vue'
import accionesSesion from '@/components/modal-acciones-sesion.vue'
import modalSesion from '@/components/modal-sesion.vue'
import tarjetaCasas from '@/components/tarjeta-casa.vue'
import zonaFiltros from '@/components/carrusel-filtro.vue';
import modalOtrosFiltros from '@/components/modal-otros-filtros.vue'
import modalDetallesCasa from '@/components/modal-detalles-casa.vue';
import router from '@/router';

const accionModal = ref('')

const mostrandoModalAccionesSesion = ref(false)
const mostrandoModalSesion = ref(false)
const mostrandoModalFiltros = ref(false)
const scrolleando = ref(false)
const mostrarMenuCel = ref(false)
const mostrarDetallesCasa = ref(false)
const informacionDetalleCasa = ref([{}])
const lastScroll = ref(0);


const dataPrueba = [
  {
    idHome: 'h1-123sdad',
    urlphoto: 'casashn9.png',
    precio: '15000.00',
    departamento: 'La Paz',
    colonia: 'Prada'
  },
  {
    idHome: 'h1-123sdaasdad',
    urlphoto: 'casashn9.png',
    precio: '15000.00',
    departamento: 'La Paz',
    colonia: 'Prada'
  },
  {
    idHome: 'h1-123sdad',
    urlphoto: 'casashn9.png',
    precio: '15000.00',
    departamento: 'La Paz',
    colonia: 'Prada'
  },
  {
    idHome: 'h1-123sdad',
    urlphoto: 'casashn9.png',
    precio: '15000.00',
    departamento: 'La Paz',
    colonia: 'Prada'
  }
]

/**
 * dev: Oned Gómez
 * Función que sirve para abrir/cerrar el modal que contiene las acciones que se pueden realizar en la sesión (iniciar, registrarse, cerrar sesión)
 */
const desplegarModalSesion = () => {
  mostrandoModalAccionesSesion.value = !mostrandoModalAccionesSesion.value
}

/**
 * dev: Oned Gómez
 * Función que sirve para abrir el modal que contiene los formularios de registro e inicio de sesión
 * @param {*} nombreModal: Hace referencia a la opción seleccionada del mini menú desplegable que se seleccionó
 */
const desplegarSubModal = (nombreModal) => {
  mostrandoModalSesion.value = !mostrandoModalSesion.value
  accionModal.value = nombreModal
}

/**
 * dev: Oned Gómez
 * Función que sirve para cerrar el modal que contiene los formularios de registro e inicio de sesión
 */
const cerrarSubModal = () => {
  mostrandoModalSesion.value = !mostrandoModalSesion.value
}

/**
 * dev: Oned Gómez
 * Función que sirve para abrir/cerrar el modal que contendrá el resto de filtros
 */
const desplegarOtrosFiltros = () => {
  mostrandoModalFiltros.value = !mostrandoModalFiltros.value
}

const abrirModalDetalles = (data) => {
  mostrarDetallesCasa.value = !mostrarDetallesCasa.value
  informacionDetalleCasa.value = data
}

const cerrarModalDetalles = () =>{
  mostrarDetallesCasa.value = false
}

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

if (screen.width <= 768) {
  mostrarMenuCel.value = true
} else {
  mostrarMenuCel.value = false
}

</script>

<style scoped>
.home {
  height: 100%;
}

.home .pagina {
  height: 100%;
  position: relative;
}


.pagina .estatica-top {
  position: sticky;
  top: 0;
  z-index: 1;
  background-color: #fff;
}

.pagina .estatica-top .cabecera {
  height: 60px;
  width: 100%;
  padding: 0 35px;
  align-items: center;
  display: inline-flex;
  position: relative;
  box-shadow: 0px 1px 10px #8d8d8d52;
  margin-inline: auto;
  z-index: 2;
}

.pagina .estatica-top .cabecera .logo .img {
  position: relative;
  width: fit-content;
}

.pagina .estatica-top .cabecera .logo img {
  width: 160px;
}

.pagina .estatica-top .cabecera .busqueda {
  position: relative;
  flex: 1;
  margin: 0 20px;
}

.pagina .estatica-top .cabecera .inicio-sesion {
  position: relative;
  justify-content: end;
}

.pagina .estatica-top .cabecera .inicio-sesion .inicio-sesion-nombre {
  justify-content: flex-end;
  align-items: center;
}

.pagina .estatica-top .cabecera .inicio-sesion .inicio-sesion-nombre .nombre-usuario {
  margin: 0 20px 0 0;
  font-weight: 600;
  font-size: calc(.5em + .6vw);
}

.pagina .estatica-top .cabecera .inicio-sesion .inicio-sesion-nombre .avatar {
  border-radius: 50%;
  background-color: #8e8e8e;
  color: #fff;
  font-size: calc(.5em + .75vw);
  padding: 4px 10px;
  box-shadow: 0px 5px 10px #8d8d8d8a;
}

.pagina .zona-filtros {
  position: relative;
  width: 100%;
  padding: 0 35px;
  z-index: -1;
  align-items: center;
  justify-content: space-between;
}

.pagina .estatica-top .zona-filtros .btn {
  border: 1px solid #969696;
  border-radius: 10px;
  color: #000000;
  justify-content: center;
  align-items: center;
  transition: all 200ms ease-in-out;
}

.pagina .estatica-top .zona-filtros .icono-boton {
  font-size: 1rem;
}

.pagina .estatica-top .zona-filtros .texto-boton {
  margin-left: 10px;
  font-size: calc(.5em + .45vw);
  font-weight: 600;
}

.pagina .main {
  position: relative;
}

/*
  * CSS barra inferior para dispositivos celulares
 */
.pagina .estatica-mobile-bottom {
  display: none;
  justify-content: space-evenly;
  padding: 10px 0;
  color: #000000;
}

.pagina .estatica-mobile-bottom .item-menu {
  color: #8e8e8e;
}

.pagina .estatica-mobile-bottom .item-menu:hover {
  color: #ff475e;
}

.pagina .estatica-mobile-bottom .icono {
  font-size: calc(1em + .75vw);
}

.pagina .estatica-mobile-bottom .text-btn {
  font-weight: 600;
  font-size: calc(.8em + .45vw);
}

/*
  * Configuramos el media query para dispositivo celulares 
 */
@media (max-width: 768px) {
  .pagina .estatica-top .zona-filtros {
    padding: 0 !important;
    box-shadow: 0px 3px 5px #82828252;
    margin-bottom: 15px;
  }

  .pagina .estatica-top .cabecera .logo,
  .pagina .estatica-top .cabecera .inicio-sesion,
  .pagina .estatica-top .zona-filtros .btn {
    display: none !important;
  }

  .pagina .estatica-top .cabecera {
    box-shadow: none;
    height: 55px !important;
    padding: 0 25px !important;
  }

  .pagina .estatica-top .cabecera .busqueda {
    margin: 0;
  }

  .pagina .estatica-mobile-bottom {
    display: flex;
    position: fixed;
    bottom: 0;
    z-index: 1;
    background-color: #fff;
    height: 65px;
    right: 0;
    left: 0;
    transition: -ms-transform 0.25s cubic-bezier(0.455, 0.03, 0.515, 0.955) 0s, -webkit-transform 0.25s cubic-bezier(0.455, 0.03, 0.515, 0.955) 0s, transform 0.25s cubic-bezier(0.455, 0.03, 0.515, 0.955) 0s, visibility 0.25s ease 0s !important;
  }

  .pagina .oculto {
    transform: translateY(100%);
    visibility: hidden;
  }
}
</style>
