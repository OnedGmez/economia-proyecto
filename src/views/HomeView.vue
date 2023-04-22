<template>
  <div @scroll="scrollOn" class="home">
    <div class="pagina">
      <topBar vista="Home" />
      <div class="main container">
        <div class="row">
          <tarjetaCasas v-for="info in dataPrueba" :data="info" :key="info.idHome"
            @abrir-detalles="() => abrirModalDetalles(info)" />
        </div>
      </div>
    </div>
    <modalDetallesCasa v-if="mostrarDetallesCasa == true" :data="informacionDetalleCasa"
      @cerrar-detalles="() => cerrarModalDetalles()" vista="Home"/>
  </div>
</template>

<script setup>
import { ref } from 'vue';

import tarjetaCasas from '@/components/tarjeta-casa.vue'
import modalDetallesCasa from '@/components/modal-detalles.vue';
import topBar from '@/components/complementos-componentes/top-bar.vue';

const mostrarDetallesCasa = ref(false)
const informacionDetalleCasa = ref([{}])


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

const abrirModalDetalles = (data) => {
  mostrarDetallesCasa.value = !mostrarDetallesCasa.value
  informacionDetalleCasa.value = data
}

const cerrarModalDetalles = () => {
  mostrarDetallesCasa.value = false
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

.pagina .main {
  position: relative;
}

</style>
