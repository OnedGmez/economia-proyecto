<template>
    <div @scroll="scrollOn" class="rentacar">
        <div class="pagina">
            <topBar vista="RentaCar" />
            <div class="main container">
                <div class="row">
                    <tarjetaCasas v-for="info in dataPrueba" :data="info" :key="info.idHome"
                        @abrir-detalles="(detalle) => abrirModalDetalles(detalle)" />
                </div>
            </div>
        </div>
    </div>
</template>
  
<script setup>
import tarjetaCasas from '@/components/tarjeta-casa.vue'
import topBar from '@/components/complementos-componentes/top-bar.vue';


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
}
</style>
  