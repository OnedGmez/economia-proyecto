<template>
    <!--MEJOR IDEA: Dejar una barra de búsqueda con un input normal y los demás filtros colocarlos debajo (misma idea que las tags pero incluyendo todos los filtros excepto el lugar)-->
    <div class="d-flex barra-busqueda">
        <div class="icono-barra">
            <span id="busqueda-input"><font-awesome-icon icon="magnifying-glass" /></span>
        </div>
        <input type="text" name="barra" placeholder="¿Que ciudad deseas visitar?" id="input-barra">
    </div>
</template>

<style scoped>
.barra-busqueda {
    border-radius: 40px;
    align-items: center;
    border: 1px solid #6907f23f;
    max-width: 100%;
    width: auto;
    flex: 1;
    transition: box-shadow 0.2s ease;
}

.barra-busqueda .icono-barra:hover {
    box-shadow: 1px 2px 5px #6907f2;
}

.barra-busqueda .icono-barra {
    background-color: #6907f2;
    border-radius: 50%;
    padding: 4px 8px;
    margin: 3px 4px;
    color: #fff;
    transition: all 140ms ease-in-out;
}

.barra-busqueda #input-barra {
    width: 100%;
    border-radius: 40px;
    border: none;
    height: 35px;
    margin-left: 3px;
    font-size: calc(.5em + .45vw);
}

.barra-busqueda #input-barra:focus-visible {
    outline: none !important;
}

/*
  * Configuramos el media query para dispositivo celulares 
*/
@media (max-width: 768px) {
    .barra-busqueda #input-barra {
        font-size: calc(.65em + .45vw);
    }

    .barra-busqueda .icono-barra {
        padding: 3px 7px;
    }
}
</style>

<script setup>
import { ref } from 'vue';

const valorBuscar = ref('')
const propsBusqueda = defineProps([
    'vista'
])
</script>