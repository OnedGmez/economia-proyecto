<template>
    <div class="llevame">
        <div class="pagina">
            <topBar vista="Llevame" :ubicacion="ubicacionActual"/>
            <div ref="mapa" id="mapa-rentame" class="map-container"></div>
        </div>
    </div>
    <alerta v-if="mostrandoAlerta == true" :mensaje="mensaje" :error="err" />
</template>

<script setup>
import topBar from '@/components/complementos-componentes/top-bar.vue';
import { generalStore } from '@/store/index.js'
import alerta from '@/components/complementos-componentes/alerta.vue';
import { onMounted, ref, watch, watchEffect } from 'vue';

const mapa = ref()
const ubicacionActual = ref([])
const store = generalStore()
const mensaje = ref('')
const mostrandoAlerta = ref(false)
const err = ref('false')

mensaje.value = 'Estamos obteniendo tu ubicación actual'

if ("geolocation" in navigator) {
    /**CODIGO SI EL NAVEGADOR PERMITE LA UBICACION */
    navigator.geolocation.getCurrentPosition(ubicacionOK => {
        /**CODIGO FUNCION SI HAY ERRORES EN LA OBTENCIÓN DE LA UBICACION */
        ubicacionActual.value.push(ubicacionOK.coords.longitude)
        ubicacionActual.value.push(ubicacionOK.coords.latitude)
        store.cargarMapa(mapa.value, ubicacionActual.value, 16, '')
    }, () => {
        /**CODIGO FUNCION SI HAY ERRORES EN LA OBTENCIÓN DE LA UBICACION */
        /**Si no obtenemos la ubicación, mandamos una ubicación generica, para no quitar la posibilidad de usar el servicio */
        store.cargarMapa(mapa.value, [-87.1999111, 14.1110500], 15, '')
    },
        {
            /**Indicamos alta precisión en la obtención de la ubicación */
            enableHighAccuracy: true,
            timeout: 5000,
            maximumAge: 30000
        })
} else {
    mensaje.value = 'Indica tu ubicación y tu destino'
    err.value = 'true'
    usarAlerta()
}

const usarAlerta = () => {
    mostrandoAlerta.value = !mostrandoAlerta.value
    setTimeout(() => { mostrandoAlerta.value = !mostrandoAlerta.value; }, 1900);
}
usarAlerta()
</script>

<style scoped>
.pagina {
    display: flex;
}

.map-container {
    height: 100vh;
    /**Especificar tamaño del mapa */
    width: 100%;
}

a.mapboxgl-ctrl-logo {
    background-image: url('../assets/img/logo.png') !important;
}

.mapboxgl-ctrl-bottom-right {
    display: none !important;
}

@media (max-width: 991.5px) {
    .pagina {
        flex-direction: column;
    }

    .map-container {
        height: 90vh;
    }
}
</style>