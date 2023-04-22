<template>
    <div class="d-flex opciones-sesion">
        <div @click="desplegarModal('Registrarse')" class="opcion">
            <span>Regístrate</span>
        </div>
        <span class="separador"></span>
        <div @click="desplegarModal('Iniciar Sesion')" class="opcion">
            <span>Iniciar Sesión</span>
        </div>
        <span class="separador"></span>
        <div @click="irViajes" class="opcion">
            <span>Reservas</span>
        </div>
        <span class="separador"></span>
        <div class="opcion">
            <span>Cerrar Sesión</span>
        </div>
    </div>
</template>

<script setup>
import router from '@/router';

const emisiones = defineEmits(['desplegar-modal'])

const desplegarModal = (nombreModal) =>{
    emisiones('desplegar-modal', nombreModal)
}

const irViajes = () => {
    router.push('/reservas')
}
</script>

<style scoped>
.opciones-sesion{
    width: calc(110px + 10%);
    position: fixed;
    right: 10px;
    top: 61px;
    margin: 0;
    flex-direction: column;
    align-items: center;
    border-radius: 15px;
    background-color: #FFF;
    filter: drop-shadow(1px 1px 4px #6907f234);
    z-index: 1;
    font-size: calc(.5em + .65vw);
}

.opciones-sesion .opcion{
    margin: 0px 0 10px 0;
}

.opciones-sesion .opcion:first-child{
    margin: 10px 0 10px 0;
}

.opciones-sesion .opcion:hover{
    cursor: pointer;
}
</style>