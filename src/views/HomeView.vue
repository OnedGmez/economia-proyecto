<template>
  <div class="home">
    <div class="pagina">
      <topBar vista="Home" :data="dataTags" @filtrar="(filtro) => filtrarData(filtro)"
        @buscar="(valorBuscado) => filtrarBarra(valorBuscado)" />
      <div class="main container">
        <div class="row">
          <tarjetaCasas v-for="info in dataCasas" :data="info" @abrir-detalles="(data) => abrirModalDetalles(data)"
            vista="Home" />
        </div>
      </div>
    </div>
    <modalDetallesCasa v-if="mostrarDetallesCasa == true" :data="informacionDetalleCasa"
      @cerrar-detalles="() => cerrarModalDetalles()" vista='Home' />
  </div>
</template>

<script setup>
import { ref, watch } from 'vue';
import { generalStore } from '@/store';
import { supabase } from '@/lib/supabaseClient';

import tarjetaCasas from '@/components/tarjeta-informacion.vue'
import modalDetallesCasa from '@/components/modal-detalles.vue';
import topBar from '@/components/complementos-componentes/top-bar.vue';
import axios from 'axios';

const mostrarDetallesCasa = ref(false)
const informacionDetalleCasa = ref([{}])
const serviciosCasa = ref([])

const dataCasas = ref('')
const dataTags = ref('')

const store = generalStore()

/**
 * dev: Oned Gómez
 * Función para subir los archivos al servidor de archivos
 * @param {*} event 
 */
const subirArchivo = async (event) => {
  const nombre = event.target.files[0].name
  const file = event.target.files[0]
  const carpeta = 'icons/categories'
  const ruta = await store.subirArchivo(nombre, carpeta, file)
  console.log(ruta)
}

const abrirModalDetalles = (data) => {
  mostrarDetallesCasa.value = !mostrarDetallesCasa.value
  informacionDetalleCasa.value = data
}

const cerrarModalDetalles = () => {
  mostrarDetallesCasa.value = false
}

const cargarCasas = async () => {
  try {
    let { data, error } = await supabase
      .rpc('cargarcasas')

    if (error) {
      console.error(error)
    } else {
      store.dataNoFiltradaCasas = data
      dataCasas.value = data
    }
  } catch (error) {
    console.error(error)
  }
}
cargarCasas()

/**
* dev: Oned Gómez
* Función para arrastrar todas las tags de la base de datos
*/
const cargarTags = async () => {
  try {
    let { data, error } = await supabase
      .rpc('seleccionartags')

    if (error) {
      console.error(error)
    }
    else {
      dataTags.value = data
    }
  } catch (error) {
    console.log(error)
  }
}
cargarTags()

const filtrarData = (filtro) => {
  dataCasas.value = (store.dataNoFiltradaCasas).filter(casa => casa.tagname == filtro)
}

const filtrarBarra = (valorBuscado) => {
  dataCasas.value = (store.dataNoFiltradaCasas).filter(casa => {
    return ((casa.location).toLowerCase()).match((valorBuscado).toLowerCase())
  })
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
