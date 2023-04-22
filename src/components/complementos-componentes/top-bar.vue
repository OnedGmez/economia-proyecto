<template>
    <div class="estatica-top">
        <div class="cabecera">
            <div v-if="mostrarMenuCel == false" class="logo">
                <div class="img">
                    <img class="img-fluid" src="../../assets/img/logo.png" alt="Logo RentAway">
                </div>
            </div>
            <div class="busqueda">
                <barraBusqueda :vista="vista"/>
                <div v-if="mostrarMenuCel == true" @click="desplegarOtrosFiltros" class="filtro-btn">
                    <div class="icono-boton">
                        <span class="icono"> <font-awesome-icon icon="sliders" /> </span>
                    </div>
                </div>
            </div>
            <menuCelular @abrir-sesion="(accion) => desplegarSubModal(accion)" :celular="mostrarMenuCel" @desplegar-modal-sesion="()=>desplegarModalSesion()" />
        </div>
        <div class="d-flex zona-filtros">
            <zonaFiltros />
            <button v-if="mostrarMenuCel == false" @click="desplegarOtrosFiltros" class="d-flex btn">
                <div class="icono-boton">
                    <span> <font-awesome-icon icon="sliders" /> </span>
                </div>
                <div class="texto-boton">
                    <span>Filtros</span>
                </div>
            </button>
        </div>
    </div>
    <accionesSesion v-if="mostrandoModalAccionesSesion == true"
        @desplegar-modal="(nombreModal) => { desplegarSubModal(nombreModal), desplegarModalSesion() }" />
    <modalSesion v-if="mostrandoModalSesion == true" :accion="accionModal" @cerrar-modal="() => cerrarSubModal()" />
    <modalOtrosFiltros v-if="mostrandoModalFiltros == true" @cerrar-modal="() => desplegarOtrosFiltros()" :vista=vista />
</template>

<style scoped>
.estatica-top {
    position: sticky;
    top: 0;
    z-index: 1;
    background-color: #fff;
}

.estatica-top .cabecera {
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

.estatica-top .cabecera .logo .img {
    position: relative;
    width: fit-content;
}

.estatica-top .cabecera .logo img {
    width: 135px;
}

.estatica-top .cabecera .busqueda {
    position: relative;
    flex: 1;
    margin: 0 20px;
}

.estatica-top .cabecera .inicio-sesion {
    position: relative;
    justify-content: end;
}

.estatica-top .cabecera .inicio-sesion .inicio-sesion-nombre {
    justify-content: flex-end;
    align-items: center;
}

.estatica-top .cabecera .inicio-sesion .inicio-sesion-nombre .nombre-usuario {
    margin: 0 20px 0 0;
    font-weight: 600;
    font-size: calc(.5em + .6vw);
}

.estatica-top .cabecera .inicio-sesion .inicio-sesion-nombre .avatar {
    border-radius: 50%;
    background-color: #8e8e8e;
    color: #fff;
    font-size: calc(.5em + .75vw);
    padding: 4px 10px;
    box-shadow: 0px 5px 10px #8d8d8d8a;
}

.zona-filtros {
    position: relative;
    width: 100%;
    padding: 0 35px;
    z-index: -1;
    align-items: center;
    justify-content: space-between;
}

.estatica-top .zona-filtros .btn {
    border: 1px solid #969696;
    border-radius: 10px;
    color: #000000;
    justify-content: center;
    align-items: center;
    transition: all 200ms ease-in-out;
}

.estatica-top .zona-filtros .icono-boton {
    font-size: 1rem;
}

.estatica-top .zona-filtros .texto-boton {
    margin-left: 10px;
    font-size: calc(.5em + .45vw);
    font-weight: 600;
}

/*
    * Configuramos el media query para dispositivo celulares 
   */
   @media (max-width: 991.5px) {
    .estatica-top .zona-filtros {
        padding: 0 !important;
        box-shadow: 0px 3px 5px #82828252;
    }

    .estatica-top .cabecera {
        box-shadow: none;
        height: 55px !important;
        padding: 0 25px !important;
    }

    .estatica-top .cabecera .busqueda {
        margin: 0;
        display: flex;
    }

    .estatica-top .cabecera .busqueda .filtro-btn {
        margin: auto 0 auto 15px;
    }

    .estatica-top .cabecera .busqueda .filtro-btn .icono-boton {
        font-size: calc(1em + .65vw) !important;
        color: #6907f2 !important;
    }
}
</style>

<script setup>
import { ref } from 'vue';

import barraBusqueda from '@/components/barra-busqueda.vue'
import accionesSesion from '@/components/modal-acciones-sesion.vue'
import modalSesion from '@/components/modal-sesion.vue'
import zonaFiltros from '@/components/carrusel-filtro.vue';
import modalOtrosFiltros from '@/components/modal-otros-filtros.vue'
import menuCelular from '@/components/complementos-componentes/menu.vue';

const propsBar = defineProps([
    'vista'
])

const accionModal = ref('')

const mostrandoModalAccionesSesion = ref(false)
const mostrandoModalSesion = ref(false)
const mostrandoModalFiltros = ref(false)

const mostrarMenuCel = ref(false)

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

if (screen.width <= 768) {
    mostrarMenuCel.value = true
} else {
    mostrarMenuCel.value = false
}
</script>