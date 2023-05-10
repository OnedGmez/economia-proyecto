<template>
    <div class="d-flex opciones-sesion">
        <div v-if="existeToken == true" class="opcion nombre">
            <span>{{ username }}</span>
        </div>
        <div v-if="existeToken == false" @click="desplegarModal('Registrarse')" class="opcion">
            <span>Regístrate</span>
        </div>
        <span v-if="existeToken == false" class="separador"></span>
        <div v-if="existeToken == false" @click="desplegarModal('Iniciar Sesion')" class="opcion">
            <span>Iniciar Sesión</span>
        </div>
        <span v-if="existeToken == true" class="separador"></span>
        <div v-if="existeToken == true" @click="irViajes" class="opcion">
            <span>Reservas</span>
        </div>
        <span v-if="existeToken == true" class="separador"></span>
        <div v-if="existeToken == true" @click="cerrarSesión" class="opcion">
            <span>Cerrar Sesión</span>
        </div>
    </div>
</template>

<script setup>
import router from '@/router';
import { ref } from 'vue';

const emisiones = defineEmits(['desplegar-modal'])

const desplegarModal = (nombreModal) =>{
    emisiones('desplegar-modal', nombreModal)
}

const existeToken = ref(false)
const username = ref('')
if(JSON.parse(localStorage.getItem('usuario-data')) != null){
    username.value = (JSON.parse(localStorage.getItem('usuario-data')))[0]['usuario']
}

if(sessionStorage.getItem('token') != null){
    existeToken.value = true
}else{
    existeToken.value = false
}

const irViajes = () => {
    router.push('/reservas')
}

const cerrarSesión = () => {
    sessionStorage.removeItem('token')
    existeToken.value = false
    localStorage.removeItem('usuario-data')
    router.go()
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
    margin: 5px 0 5px 0;
}

.opciones-sesion .opcion:hover{
    cursor: pointer;
}

.nombre{
    font-size: calc(.75em + .85vw);
    font-weight: 600;
    color: #ff475e;
}
</style>