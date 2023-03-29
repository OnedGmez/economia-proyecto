<template>
    <div class="d-flex barra-busqueda">
        <button class="boton-barra">
            <div class="texto-boton">
                ¿Cúal es tu destino favorito?
            </div>
        </button>
        <span class="separador"></span>
        <button class="boton-barra">
            <div class="texto-boton">
                Servicios deseados
            </div>
        </button>
        <span class="separador"></span>
        <button class="d-flex boton-barra">
            <div class="texto-boton">
                ¿Qué categoría prefieres?
            </div>
            <div class="icono-barra">
                <span id="busqueda-input"><font-awesome-icon icon="magnifying-glass" /></span>
            </div>
        </button>
    </div>
</template>

<style scoped>
.barra-busqueda {
    display: inline-block;
    border-radius: 40px;
    align-items: center;
    border: 1px solid #6907f2;
    max-width: 100%;
    box-shadow: 0 2px 4px #6907f251;
    transition: box-shadow 0.2s ease;
}

.barra-busqueda:hover{
   box-shadow: 0 1px 2px #6907f242, 0 4px 12px #6907f235;
}

.barra-busqueda .boton-barra {
    padding: 0;
    border: none;
    height: 48px;
    background-color: transparent;
    color:inherit;
    min-width: 0;
    position: relative;
    margin: -1px;
    border: 1px solid transparent;
    flex: 0 1 auto;
    z-index: 0;
}

.barra-busqueda .boton-barra:first-of-type {
    padding-left: 10px;
    border-top-left-radius: inherit;
    border-bottom-left-radius: inherit;
}

.separador{
    flex: 0 0 1px;
    height: 24px;
    width: 1px;
    background-color: #6907F2;
    text-align: left;
}

.barra-busqueda .boton-barra .texto-boton {
    padding: 0 15px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}

.barra-busqueda .boton-barra:last-of-type {
    padding-right: 10px;
    align-items: center;
    border-top-right-radius: inherit;
    border-bottom-right-radius: inherit;
}

.barra-busqueda .boton-barra:last-of-type .icono-barra{
    margin: 7px 7px 7px 0;
    padding: 5px 4px;
    border-radius: 50%;
    background-color: #fb5153;
    color: #fff;
    font-weight: bolder;
    z-index: 1;
}

.barra-busqueda .boton-barra:last-of-type .icono-barra:hover{
    box-shadow: 0 1px 2px #fb515491, 0 4px 12px #fb5154b0;
}

.barra-busqueda .boton-barra:last-of-type .icono-barra > *{
    padding: 0 4px;
}

</style>

<script setup>
import { ref } from 'vue';

const valorBuscar = ref('')
const propsBusqueda = defineProps([
    'vista'
])
</script>