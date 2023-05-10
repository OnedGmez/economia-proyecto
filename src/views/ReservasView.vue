<template>
  <div class="reservas">
    <div class="pagina">
      <topBar vista="Reservas" />
      <div class="main container">
        <div class="row">
          <tarjetaViaje @abrir-detalles="() => abrirModalDetalles('')" vista="Reservas" />
        </div>
      </div>
    </div>
  </div>
</template>
  
<script setup>
import { ref } from 'vue';
import { generalStore } from '@/store';

import tarjetaViaje from '@/components/tarjeta-informacion.vue';
import modalDetallesViaje from '@/components/modal-detalles.vue';
import topBar from '@/components/complementos-componentes/top-bar.vue';

const mostrarDetallesCasa = ref(false)
const informacionDetalleCasa = ref([{}])

const store = generalStore()


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
  margin-top: 15px;
}
</style>
  