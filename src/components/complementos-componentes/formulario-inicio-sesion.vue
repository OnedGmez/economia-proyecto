<template>
    <div id="space-form" class="d-flex justify-content-center align-content-center flex-wrap">
        <div class="avatar d-flex align-content-center justify-content-center">
            <img class="img-fluid" src="../../assets/img/Icono.png" alt="Icono">
        </div>
        <div class="form d-flex">
            <div class="input-group">
                <span class="input-group-text" id="usuario-input"></span>
                <input type="text" v-model="usuario" class="form-control" autofocus required placeholder="Usuario"
                    aria-label="Usuario" aria-describedby="usuario-input">
            </div>
            <div class="input-group">
                <span class="input-group-text" id="contra-input"></span>
                <input type="password" v-model="contrasenia" class="form-control" required placeholder="Contraseña"
                    aria-label="Contrasenia" aria-describedby="contra-input">
            </div>
        </div>
        <div @click="validarUsuario" class="button">
            Iniciar Sesión
        </div>
    </div>
    <alerta v-if="mostrandoAlerta == true" :mensaje="mensajeAlerta" error="true" />
</template>

<script setup>
import { generalStore } from '@/store'
import { usuarioStore } from '@/store/user'
import { supabase } from '@/lib/supabaseClient'
import { ref } from 'vue'
import alerta from '@/components/complementos-componentes/alerta.vue'
import { SHA256 } from 'crypto-js'
import router from '@/router'

const usuario = ref('')
const contrasenia = ref('')
const mensajeAlerta = ref('')
const mostrandoAlerta = ref(false)
const store = generalStore()
const storeUsuario = usuarioStore()
let date = new Date();

const emisiones = defineEmits([
    'cerrarModal'
])

/**
 * dev: Oned Gómez
 * Función para validar las credenciales del usuario
 */
const validarUsuario = async () => {
  const fechaActual = String(date.getFullYear()) + '-' + String(date.getMonth() + 1).padStart(2, '0') + '-' + String(date.getDate()).padStart(2, '0');
  console.log((SHA256(contrasenia.value)).toString())
    if (usuario.value !== '' && contrasenia.value !== '') {
        try {
            let { data, error } = await supabase
                .rpc('validarusuario', {
                    password: (SHA256(contrasenia.value)).toString(),
                    username: usuario.value
                })

            if (error) {
                mensajeAlerta.value = error
                usarAlerta()
            }

            if (data != '') {
                const clientcode = data[0]['clientcode']
                const usuario = data[0]['username']
                const rol = store.encriptar(data[0]['rol'], 'rol')
                const urlphoto = data[0]['urlphoto']
                const dni = store.encriptar(data[0]['dni'], 'dni')
                const bincard = data[0]['bincard'].toString()
                const balance = data[0]['balance'].toString()

                const dataToken = [{
                    clientcode,
                    usuario,
                    rol,
                    fechaActual
                }]

                const dataProcesos = [{
                    clientcode,
                    usuario,
                    rol,
                    urlphoto,
                    dni,
                    bincard,
                    balance
                }]

                storeUsuario.crearToken(JSON.stringify(dataToken))
                document.cookie = "usuario" + "=" + store.encriptar(usuario, 'usuario') + ";path=/;"
                document.cookie = "rol" + "=" + store.encriptar(rol, 'rol') + ";path=/;"
                document.cookie = "clientcode" + "=" + store.encriptar(clientcode, 'clientcode') + ";path=/;"
                document.cookie = "dni" + "=" + store.encriptar(dni, 'dni') + ";path=/;"
                localStorage.setItem('usuario-data', JSON.stringify(dataProcesos))
                router.go()
            } else {
                mensajeAlerta.value = 'Usuario y/o contraseña incorrectas'
                usarAlerta()
            }
        } catch (error) {
            mensajeAlerta.value = error
            usarAlerta()
        }
    } else {
        mensajeAlerta.value = 'Debe proporcionar la información solicitada'
        usarAlerta()
    }
}

const usarAlerta = () => {
    mostrandoAlerta.value = !mostrandoAlerta.value
    setTimeout(() => { mostrandoAlerta.value = !mostrandoAlerta.value; }, 1900);
}
</script>

<style scoped>
#space-form {
    padding: 0 !important;
}

.input-group-text {
    background-color: #ff475e;
    padding: 0.375rem 0.95rem;
    border: none;
    border-radius: 0;
}

a:hover {
    color: #ff475e !important;
    cursor: pointer;
}

.form-control {
    border-radius: 0 25px 24px 0;
    border: none;
    border-bottom: #ff475e solid 2px;
    filter: none;
    font-size: calc(.5em + .45vw) !important;
    font-family: 'fredoka-family';
}

.form-control:focus {
    box-shadow: none;
    border-bottom: #6907f2 solid 2px;
}

.input-group {
    margin: 0 0 20px 0;
}


/*Estilos CSS creados*/
.form {
    justify-content: center;
    flex-direction: column;
    width: 100%;
    margin: 0 15px;
    background-color: #6907f20a;
    padding: calc(1em + 3.7vw) 20px 10px 20px;
    border-radius: 35px 0 35px 0;
}

.avatar {
    flex-wrap: wrap;
    width: calc(1em + 3vw);
    height: calc(1em + 3vw);
    border-radius: calc(1em);
    font-size: calc(1em + 3vw);
    background-color: #fff;
    /* vertical-align: middle; */
    color: #6907f2;
    position: relative;
    top: calc(1em - 0.99vw);
}

.button {
    background: linear-gradient(90deg, #ff475e, #6907f2);
    width: 70%;
    border-radius: 0 0 calc(1em + 0.1vw) calc(1em + 0.1vw);
    color: #fff;
    font-weight: 600;
    font-size: calc(.5em + .8vw);
    text-align: center;
    font-family: 'fredoka-family';
    transition: all 300ms ease-in;
}

.button:hover {
    cursor: pointer;
    background: linear-gradient(90deg, #ff475e, #ff475e);
    transition: all 300ms ease-out;
}

/*
  * Configuramos el media query para dispositivo celulares 
 */
@media (max-width: 768px) {

    .form-control,
    a {
        font-size: calc(.7em + .45vw) !important;
    }

    .button {
        font-size: calc(.85em + .85vw);
    }
}
</style>