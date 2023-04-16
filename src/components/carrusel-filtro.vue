<template>
    <VueHorizontal :class="[ubicacion == 'Modal' ? 'widthModal' : '']" responsive class="lista-filtros">
        <div class="item-filtro">
            <div class="icono-filtro">
                <img class="img-fluid" src="../assets/icons/categories/cabania.svg" alt="Icono">
            </div>
            <div class="nombre-filtro">
                <span>Nombre filtro 1</span>
            </div>
        </div>
        <div class="item-filtro">
            <div class="icono-filtro">
                <img class="img-fluid" src="https://rentaway-file-serve.s3.amazonaws.com/rentaway/services/breakfast.svg" alt="Icono">
            </div>
            <div class="nombre-filtro">
                <span>Nombre filtro 2</span>
            </div>
        </div>
        <div class="item-filtro">
            <div class="icono-filtro">
                <img class="img-fluid" src="../assets/icons/categories/cabania.svg" alt="Icono">
            </div>
            <div class="nombre-filtro">
                <span>Nombre filtro 3</span>
            </div>
        </div>
        <div class="item-filtro">
            <div class="icono-filtro">
                <img class="img-fluid" src="../assets/icons/categories/cabania.svg" alt="Icono">
            </div>
            <div class="nombre-filtro">
                <span>Nombre filtro 4</span>
            </div>
        </div>
        <div class="item-filtro">
            <div class="icono-filtro">
                <img class="img-fluid" src="../assets/icons/categories/cabania.svg" alt="Icono">
            </div>
            <div class="nombre-filtro">
                <span>Nombre filtro 5</span>
            </div>
        </div>
        <div class="item-filtro">
            <div class="icono-filtro">
                <img class="img-fluid" src="../assets/icons/categories/en-playa.svg" alt="Icono">
            </div>
            <div class="nombre-filtro">
                <span>Nombre filtro 6</span>
            </div>
        </div>
        <div class="item-filtro">
            <div class="icono-filtro">
                <img class="img-fluid" src="../assets/icons/categories/cabania.svg" alt="Icono">
            </div>
            <div class="nombre-filtro">
                <span>Nombre filtro 7</span>
            </div>
        </div>
        <div class="item-filtro">
            <div class="icono-filtro">
                <img class="img-fluid" src="../assets/icons/categories/cabania.svg" alt="Icono">
            </div>
            <div class="nombre-filtro">
                <span>Nombre filtro 8</span>
            </div>
        </div>
        <div class="item-filtro">
            <div class="icono-filtro">
                <img class="img-fluid" src="../assets/icons/categories/fte_rio.svg" alt="Icono">
            </div>
            <div class="nombre-filtro">
                <span>Nombre filtro 9</span>
            </div>
        </div>
        <div class="item-filtro">
            <div class="icono-filtro">
                <img class="img-fluid" src="../assets/icons/categories/cabania.svg" alt="Icono">
            </div>
            <div class="nombre-filtro">
                <span>Nombre filtro 10</span>
            </div>
        </div>
        <div class="item-filtro">
            <div class="icono-filtro">
                <img class="img-fluid" src="../assets/icons/categories/cabania.svg" alt="Icono">
            </div>
            <div class="nombre-filtro">
                <span>Nombre filtro 11</span>
            </div>
        </div>
        <div class="item-filtro">
            <div class="icono-filtro">
                <img class="img-fluid" src="../assets/icons/categories/cabania.svg" alt="Icono">
            </div>
            <div class="nombre-filtro">
                <span>Nombre filtro 12</span>
            </div>
        </div>
        <div class="item-filtro">
            <div class="icono-filtro">
                <img class="img-fluid" src="../assets/icons/categories/cabania.svg" alt="Icono">
            </div>
            <div class="nombre-filtro">
                <span>Nombre filtro 13</span>
            </div>
        </div>
        <div class="item-filtro">
            <div class="icono-filtro">
                <img class="img-fluid" src="../assets/icons/categories/cabania.svg" alt="Icono">
            </div>
            <div class="nombre-filtro">
                <span>Nombre filtro 14</span>
            </div>
        </div>
        <div class="item-filtro">
            <div class="icono-filtro">
                <img class="img-fluid" src="../assets/icons/categories/cabania.svg" alt="Icono">
            </div>
            <div class="nombre-filtro">
                <span>Nombre filtro 15</span>
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

.widthModal{
    max-width: 100%!important;
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
    width: 32%;
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
        width: 35%;
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
import VueHorizontal from "vue-horizontal";

const seleccionado = ref(false)

const propsCarrusel = defineProps([
    'data',
    'ubicacion'
])
</script>