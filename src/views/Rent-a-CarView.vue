<template>
    <div class="rentacar">
        <div class="pagina">
            <topBar vista="RentaCar" :data="dataServices"/>
            <div class="main container">
                <div class="row">
                    <tarjetaRentACar vista="Rentacar" data="" @abrir-detalles="() => abrirModalDetalles('Pasar la data que se le pasa a la tarjeta')"/>
                </div>
            </div>
        </div>
    </div>
    <modalDetallesCarro v-if="mostrarDetallesCarro == true" :data="informacionDetalleCarro"
      @cerrar-detalles="() => cerrarModalDetalles()" vista="RentaCar"/>
</template>
  
<script setup>
import { ref } from 'vue';
import { supabase } from '@/lib/supabaseClient';

import topBar from '@/components/complementos-componentes/top-bar.vue';
import tarjetaRentACar from '@/components/tarjeta-informacion.vue';
import modalDetallesCarro from '@/components/modal-detalles.vue';

const informacionDetalleCarro = ref('')
const mostrarDetallesCarro = ref(false)
const dataTags = ref('')
const dataServices = ref('')

const abrirModalDetalles = (data) => {
  mostrarDetallesCarro.value = !mostrarDetallesCarro.value
  informacionDetalleCarro.value = data
}

const cerrarModalDetalles = () => {
    mostrarDetallesCarro.value = false
}

/**
* dev: Oned Gómez
* Función para arrastrar todas los servicios de la base de datos
*/
const cargarServices = async () => {
    try {
        let { data, error } = await supabase
            .rpc('seleccionarservices')

        if (error){
            console.error(error)
        }
        else{
            dataServices.value = data
            dataServices.value = (dataServices.value).filter(service => service.itemname == "Vehiculo")
        }
    } catch (error) {
        console.log(error)
    }
}
cargarServices()
</script>
  
<style scoped>
.rentacar {
    height: 100%;
}

.rentacar .pagina {
    height: 100%;
    position: relative;
}

.pagina .main {
    position: relative;
    margin-top: 15px;
}
</style>
  