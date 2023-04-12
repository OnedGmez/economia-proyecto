<template>
    <!--MEJOR IDEA: Dejar una barra de búsqueda con un input normal y los demás filtros colocarlos debajo (misma idea que las tags pero incluyendo todos los filtros excepto el lugar)-->
    <div class="d-flex barra-busqueda">
        <div class="icono-barra">
            <span id="busqueda-input"><font-awesome-icon icon="magnifying-glass" /></span>
        </div>
        <span class="separador"></span>
        <input type="text" name="barra" id="input-barra">
    </div>
</template>

<style scoped>
.barra-busqueda {
    border-radius: 40px;
    align-items: center;
    border: 1px solid #6907f2;
    max-width: 100%;
    width: auto;
    box-shadow: 0 2px 4px #6907f251;
    transition: box-shadow 0.2s ease;
}

.barra-busqueda .icono-barra:hover {
    background-color:#6907f2;
}

.barra-busqueda .icono-barra{
    background-color: #fe4b56;
    border-radius: 50%;
    padding: 4px 8px;
    margin: 5px 8px;
    color: #fff;
    transition: all 190ms ease-in-out;
}

.barra-busqueda #input-barra{
    width: 100%;
    border-radius: 40px;
    border: none;
    height: 40px;
}

.barra-busqueda #input-barra:focus-visible{
    outline: none !important;
}
</style>

<script setup>
import { ref } from 'vue';

const valorBuscar = ref('')
const propsBusqueda = defineProps([
    'vista'
])
</script>