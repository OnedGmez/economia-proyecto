<template>
    <VueHorizontal :class="[ubicacion == 'Modal' ? 'widthModal' : '']" responsive class="lista-filtros">
        <div class="item-filtro" v-for="filtro in data" @click="filtrar(filtro['name'])">
            <div class="icono-filtro">
                <img class="img-fluid" :src="filtro['icono']" alt="Icono">
            </div>
            <div class="nombre-filtro">
                <span>{{ filtro['name'] }}</span>
            </div>
        </div>
    </VueHorizontal>
</template>

<style scoped>
.lista-filtros {
    max-width: 86%;
    margin: 0 15px 0 0;
    flex-direction: column;
}

.widthModal {
    max-width: 100% !important;
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
    color: #848484;
    justify-content: space-between;
    align-items: center;
}

.lista-filtros .item-filtro::after {
    content: ' ';
    width: 100%;
    height: 1px;
}

.lista-filtros .item-filtro:hover {
    border-bottom: 1px solid #848484;
    cursor: pointer;
}

.lista-filtros .activo {
    border-bottom: 1px solid #000000;
}

.lista-filtros .item-filtro .icono-filtro {
    width: 32px;
    opacity: 0.5155;
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
    height: 65px;
    margin-left: 10px !important;
    scroll-padding-left: 16px;
    scroll-padding-right: 16px;
    align-items: center;
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
    left: 15px !important;
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
        height: 5px;
    }

    .lista-filtros {
        max-width: 100%;
        margin: 0 !important;
    }

    .lista-filtros .item-filtro {
        color: #000;
        font-size: calc(.5em + .5vw);
    }

    .lista-filtros .item-filtro:hover {
        border-bottom: none;
    }

    .lista-filtros>>>.v-hl-btn svg {
        display: none !important;
    }

    .lista-filtros>>>.v-hl-container {
        margin-left: 0 !important;
        height: 55px !important;
    }
}
</style>

<script setup>

import { ref } from "vue";
import { generalStore } from '@/store/index.js';
import VueHorizontal from "vue-horizontal";
import { supabase } from "@/lib/supabaseClient";

const store = generalStore()
const emisiones = defineEmits([
    'filtrar'
])
const IDSeleccionada = ref(false)
const dataFiltro = ref([{}])

const filtrar = (filtro) => {
    emisiones('filtrar', filtro)
}

const seleccionado = ref(false)

const propsCarrusel = defineProps([
    'data',
    'ubicacion'
])

</script>