<template>
    <VueHorizontal responsive class="lista-filtros">
        <div v-for="servicio of data" class="item-filtro">
            <div class="icono-filtro">
                <img class="img-fluid" :src="servicio['icono']" alt="Icono">
            </div>
            <div class="nombre-filtro">
                <span>{{ servicio['servicename'] }}</span>
            </div>
        </div>
    </VueHorizontal>
</template>

<style scoped>
.lista-filtros {
    max-width: 100%;
    margin: 0 15px 0 0;
    flex-direction: column;
}

.lista-filtros::before {
    content: ' ';
    width: 100%;
    height: 15px;
    background-color: #fff;
    z-index: -1;
}

.lista-filtros::-webkit-scrollbar {
    display: none;
}

.lista-filtros .item-filtro {
    margin: 0 15px 0 0px;
    display: flex;
    flex-direction: column;
    font-size: calc(.5em + .25vw);
    color: #000;
    justify-content: space-between;
    align-items: center;
}

.lista-filtros .item-filtro::after {
    content: ' ';
    width: 100%;
    height: 1px;
}

.lista-filtros .item-filtro .icono-filtro {
    width: 32px;
    transition: opacity 180ms ease-in-out;
}

.lista-filtros .item-filtro .nombre-filtro {
    width: max-content;
    transition: color 184ms ease-in-out;
}

.lista-filtros .item-filtro:hover>>>div {
    color: #000;
    opacity: 100%;
}

.lista-filtros>>>.v-hl-container {
    height: 70px;
    margin-left: 10px !important;
    scroll-padding-left: 16px;
    scroll-padding-right: 16px;
}

.lista-filtros>>>.v-hl-btn svg {
    border-radius: 0;
    padding: 2px;
    width: 24px !important;
    height: 24px !important;
    margin: 0;
}

.lista-filtros>>>.v-hl-btn-prev {
    background: linear-gradient(to left, #ffffff00 0, #fff 25%, #fff 50%, #fff);
    left: 7px !important;
}

.lista-filtros>>>.v-hl-btn-next {
    background: linear-gradient(to right, #ffffff00 0, #fff 25%, #fff 50%, #fff);
    right: 7px !important;
}

/*
  * Configuramos el media query para dispositivo celulares 
*/
@media (max-width: 768px) {
    .lista-filtros::before {
        height: 10px;
    }

    .lista-filtros {
        max-width: 100%;
        margin: 0 !important;
    }

    .lista-filtros .item-filtro {
        color: #000;
        font-size: calc(.5em + .65vw);
    }

    .lista-filtros .item-filtro .icono-filtro {
        width: 35px;
    }

    .lista-filtros .item-filtro:hover {
        border-bottom: none;
    }

    .lista-filtros>>>.v-hl-btn svg {
        display: none !important;
    }

    .lista-filtros>>>.v-hl-container {
        margin-left: 0 !important;
        height: 55px!important;
    }
}
</style>

<script setup>
import { ref } from "vue";
import { generalStore } from '@/store/index.js';
import VueHorizontal from "vue-horizontal";

const store = generalStore()
const rutaServicios = store.pathServicios

const seleccionado = ref(false)

const propsCarrusel = defineProps([
    'data'
])
</script>