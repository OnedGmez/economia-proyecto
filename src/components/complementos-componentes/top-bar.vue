<template>
    <div v-if="vista !== 'Llevame'" class="estatica-top">
        <div class="cabecera">
            <div v-if="mostrarMenuCel == false" class="logo">
                <div class="img">
                    <img class="img-fluid" src="../../assets/img/logo.png" alt="Logo RentAway">
                </div>
            </div>
            <div class="busqueda">
                <barraBusqueda :vista="vista" @buscar="(valorBuscar) => buscar(valorBuscar)" />
                <div v-if="mostrarMenuCel == true" @click="desplegarOtrosFiltros" class="filtro-btn">
                    <div class="icono-boton">
                        <span class="icono"> <font-awesome-icon icon="sliders" /> </span>
                    </div>
                </div>
            </div>
            <menuCelular @abrir-sesion="(accion) => desplegarSubModal(accion)" :celular="mostrarMenuCel"
                @desplegar-modal-sesion="() => desplegarModalSesion()" />
        </div>
        <div class="d-flex zona-filtros">
            <zonaFiltros :data="data" @filtrar="(valorFiltro) => emitirFiltro(valorFiltro)" />
            <button v-if="mostrarMenuCel == false" @click="desplegarOtrosFiltros" class="d-flex btn">
                <div class="icono-boton">
                    <span> <font-awesome-icon icon="sliders" /> </span>
                </div>
                <div class="texto-boton">
                    <span>Filtros</span>
                </div>
            </button>
        </div>
        <div v-if="existeToken == true && rol == 'Administrador'" @click="desplegarModalNuevo" class="button">
            <span v-if="vista == 'Home'">Nueva casa</span>
            <span v-if="vista == 'RentaCar'">Nuevo vehículo</span>
        </div>
    </div>
    <div v-if="vista == 'Llevame'" class="zona-busqueda">
        <div class="inputs">
            <span @click="navegar" class="back"> <font-awesome-icon icon="arrow-left" /> </span>
            <input type="text" @keyup="buscarOrigen" class="form-control" v-model="valorBuscadoOrigen" id="origen"
                placeholder="Indicanos tu punto de partida">
            <input type="text" @keyup="buscarDestino" class="form-control" v-model="valorBuscadoDestino" id="Destino"
                placeholder="¿Cúal es tu destino?">
        </div>

        <div v-if="origenSelect == false" class="lista-resultados-origen">
            <div v-for="origen in origenes" :key="origen['context'][0]['id']" @click="seleccionarOrigen(origen)"
                class="elemento">
                <span class="nombre-elemento"> {{ origen['place_name'] }}</span>
            </div>
        </div>

        <div v-if="destinoSelect == false" class="lista-resultados-destino">
            <div v-for="destino in destinos" :key="destino['context'][0]['id']" @click="seleccionarDestino(destino)"
                class="elemento">
                <span class="nombre-elemento"> {{ destino['place_name'] }}</span>
            </div>
        </div>

        <!--Uber cerca-->
        <div class="uber-cerca">
            <div class="titulo">
                <span>Vehículos cerca</span>
            </div>
            <div class="container">
                <div class="row">
                    <div v-for="uber in ubers" class="col-6 col-lg-12 tarjeta-vehiculo-cerca">
                        <div @click="Solicitar(uber['coords'])" class="card">
                            <div class="d-flex detalles">
                                <div class="d-flex card-img">
                                    <img class="img-fluid" :src="uber['urlphoto']" alt="Vehículo">
                                </div>
                                <div class="contenido-card-vehiculo">
                                    <div class="marca-vehiculo">
                                        <span class="marca"> {{ uber['brand'] }} <span class="modelo"> Verssa </span>
                                        </span>
                                    </div>
                                    <div class="color">
                                        <span class="etiqueta">Color: <span class="espacio-color"
                                                style="background-color = {{uber['color']}}"></span></span>
                                    </div>
                                    <div class="placa-vehiculo">
                                        <span class="etiqueta">Placa: <span class="numero"> {{ uber['platecode'] }}</span>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div v-if="destinoSelect == true" class="d-flex reservar">
                                <span class="pago">L. {{ (uber['baserentalprice'] * distancia).toFixed(2) +
                                    uber['cancellationprotection'] }} <span class="moneda">HNL</span></span>
                                <button
                                    @click="reservar(uber['cabcode'], ((uber['baserentalprice'] * distancia).toFixed(0) + uber['cancellationprotection']))">¡Ven
                                    por mí!</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <accionesSesion v-if="mostrandoModalAccionesSesion == true"
        @desplegar-modal="(nombreModal) => { desplegarSubModal(nombreModal), desplegarModalSesion() }" />
    <modalSesion v-if="mostrandoModalSesion == true" :accion="accionModal" @cerrar-modal="() => cerrarSubModal()" />
    <modalOtrosFiltros v-if="mostrandoModalFiltros == true" @cerrar-modal="() => desplegarOtrosFiltros()" :vista="vista"
        :data="dataServices" />
    <modalNuevo v-if="mostrandoModalNuevo == true" :vista="vista" @cerrar-nuevo="() => desplegarModalNuevo()" />
    <alerta v-if="mostrandoAlerta == true" :mensaje="mensaje" :error="err" />
</template>

<style scoped>
.uber-cerca {
    position: relative;
    margin-top: 15px;
    height: 440px;
    overflow-y: scroll;
}

.uber-cerca .titulo {
    font-size: calc(.65em + .75vw);
    font-weight: 500;
}

.uber-cerca .tarjeta-vehiculo-cerca {
    padding: 0 5px;
    margin: 10px 0 0 0;
}

.uber-cerca .tarjeta-vehiculo-cerca .card .detalles {
    flex-direction: row;
}

.uber-cerca .tarjeta-vehiculo-cerca .card {
    padding: 7px 0px 7px 0;
}

.uber-cerca .tarjeta-vehiculo-cerca .card:hover {
    cursor: pointer;
}

.card .detalles .card-img {
    width: 120px;
    padding: 0 8px;
}

.card .detalles .contenido-card-vehiculo {
    margin-left: 12px;
    text-align: start;
}

.contenido-card-vehiculo .marca-vehiculo {
    font-size: calc(.5em + .7vw);
    font-weight: 600;
}

.contenido-card-vehiculo .placa-vehiculo,
.color {
    font-size: calc(.5em + .55vw);
    font-weight: 500;
}

.contenido-card-vehiculo .etiqueta {
    font-weight: 400;
}

.contenido-card-vehiculo .etiqueta .numero {
    font-weight: 500;
}

.tarjeta-vehiculo-cerca .card .reservar {
    padding: 0 10px;
    justify-content: space-between;
    align-items: center;
}

.card .reservar .pago {
    font-weight: 500;
    font-size: calc(.65em + .45vw);
}

.pago .moneda {
    font-weight: 400;
}

.card .reservar button {
    border: 1px #ff475e solid;
    background-color: #fff;
    color: #ff475e;
    padding: 3px 10px;
    border-radius: 7px;
    transition: all 180ms ease-in-out;
    font-weight: 600;
    font-size: calc(.5em + .45vw);
}

button:hover {
    background-color: #ff475e !important;
    color: #fff !important;
}

.back {
    text-align: start;
    margin: 0px 0 8px 12px;
    display: flex;
}

.zona-busqueda {
    position: relative;
    top: 0;
    z-index: 1;
    width: 25%;
    margin: 0;
    background-color: #fff;
    font-size: calc(.5em + .45vw);
    height: 100vh;
}

.zona-busqueda .inputs {
    box-shadow: 0px 5px 10px #8d8d8d8a;
    top: 0;
    position: relative;
    width: 100%;
    padding: 9px 0;
}

.form-control {
    font-size: calc(.5em + .45vw);
    margin-left: 30px;
    margin-top: 15px;
    width: 75%;
}

.form-control:focus {
    box-shadow: none;
    border: #ff475e solid 0.5px;
    border-bottom: #6907f2 solid 0.5px;
}

.lista-resultados-origen,
.lista-resultados-destino {
    position: relative;
    width: 100%;
    background-color: #fff;
    box-shadow: 0px 25px 25px #8d8d8d8a;
}

.lista-resultados-origen .elemento,
.lista-resultados-destino .elemento {
    padding: 0 8px;
    width: 100%;
    display: flex;
    margin-bottom: 5px;
    cursor: pointer;
}

.lista-resultados-origen .elemento:hover,
.lista-resultados-destino .elemento:hover {
    background-color: #8e8e8e1e;
}

.lista-resultados-origen .nombre-elemento,
.lista-resultados-destino .nombre-elemento {
    display: -webkit-box;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 1;
    line-clamp: 1;
    overflow: hidden;
    text-align: start;
    margin: 10px 0;
}

.estatica-top {
    position: sticky;
    top: 0;
    z-index: 1;
    background-color: #fff;
}

.estatica-top .cabecera {
    height: 60px;
    width: 100%;
    padding: 0 35px;
    align-items: center;
    display: inline-flex;
    position: relative;
    box-shadow: 0px 1px 10px #8d8d8d52;
    margin-inline: auto;
    z-index: 2;
}

.estatica-top .cabecera .logo .img {
    position: relative;
    width: fit-content;
}

.estatica-top .cabecera .logo img {
    width: 135px;
}

.estatica-top .cabecera .busqueda {
    position: relative;
    flex: 1;
    margin: 0 20px;
}

.estatica-top .cabecera .inicio-sesion {
    position: relative;
    justify-content: end;
}

.estatica-top .cabecera .inicio-sesion .inicio-sesion-nombre {
    justify-content: flex-end;
    align-items: center;
}

.estatica-top .cabecera .inicio-sesion .inicio-sesion-nombre .nombre-usuario {
    margin: 0 20px 0 0;
    font-weight: 600;
    font-size: calc(.5em + .6vw);
}

.form-control:focus-visible {
    outline: none !important;
}

.estatica-top .cabecera .inicio-sesion .inicio-sesion-nombre .avatar {
    border-radius: 50%;
    background-color: #8e8e8e;
    color: #fff;
    font-size: calc(.5em + .75vw);
    padding: 4px 10px;
    box-shadow: 0px 5px 10px #8d8d8d8a;
}

.zona-filtros {
    position: relative;
    width: 100%;
    padding: 0 35px;
    z-index: -1;
    align-items: center;
    justify-content: space-between;
}

.estatica-top .zona-filtros .btn {
    border: 1px solid #969696;
    border-radius: 10px;
    color: #000000;
    justify-content: center;
    align-items: center;
    transition: all 200ms ease-in-out;
}

.estatica-top .zona-filtros .icono-boton {
    font-size: 1rem;
}

.estatica-top .zona-filtros .texto-boton {
    margin-left: 10px;
    font-size: calc(.5em + .45vw);
    font-weight: 600;
}

.button {
    background: linear-gradient(90deg, #ff475e, #6907f2);
    width: 14%;
    border-radius: calc(1em + 0.1vw);
    color: #fff;
    font-weight: 600;
    font-size: calc(.5em + .65vw);
    text-align: center;
    font-family: 'fredoka-family';
    transition: all 300ms ease-in;
    margin-top: 10px;
    margin-left: 35px;
}

.button:hover {
    cursor: pointer;
    background: linear-gradient(90deg, #ff475e, #ff475e);
    transition: all 300ms ease-out;
}

/*
    * Configuramos el media query para dispositivo celulares 
   */
@media (max-width: 991.5px) {

    .zona-busqueda {
        width: 100%;
        height: auto;
    }

    .zona-busqueda .inputs {
        display: flex;
        padding: 10px 20px 9px 0
    }

    .form-control {
        font-size: calc(.75em + .85vw);
        margin-left: 15px;
        margin-top: 15px;
        width: 50%;
    }

    .lista-resultados-origen,
    .lista-resultados-destino {
        position: relative;
        width: 100%;
        background-color: #fff;
        box-shadow: 0px 25px 25px #8d8d8d8a;
    }

    .lista-resultados-origen .elemento,
    .lista-resultados-destino .elemento {
        padding: 0 8px;
        width: 100%;
        display: flex;
        margin-bottom: 5px;
    }

    .lista-resultados-origen .elemento:hover,
    .lista-resultados-destino .elemento:hover {
        background-color: #8e8e8e1e;
    }

    .lista-resultados-origen .nombre-elemento,
    .lista-resultados-destino .nombre-elemento {
        display: -webkit-box;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 1;
        line-clamp: 1;
        overflow: hidden;
        text-align: start;
        margin: 10px 0;
    }

    .estatica-top .zona-filtros {
        padding: 0 !important;
        box-shadow: 0px 3px 5px #82828252;
    }

    .estatica-top .cabecera {
        box-shadow: none;
        height: 55px !important;
        padding: 0 25px !important;
    }

    .estatica-top .cabecera .busqueda {
        margin: 0;
        display: flex;
    }

    .estatica-top .cabecera .busqueda .filtro-btn {
        margin: auto 0 auto 15px;
    }

    .estatica-top .cabecera .busqueda .filtro-btn .icono-boton {
        font-size: calc(1em + .65vw) !important;
        color: #6907f2 !important;
    }

    .button {
        width: 30%;
        font-size: calc(.65em + 1vw);
        margin-left: 25px;
    }

    .uber-cerca {
        position: fixed;
        bottom: 0%;
        background-color: #fff;
        height: 230px;
        overflow-y: scroll;
    }

    .back {
        font-size: calc(1em + 1.8vw);
    }

    .card .reservar button {
        font-size: calc(.6em + .8vw);
    }

    .card .detalles .card-img {
        width: 100px;
    }

    .contenido-card-vehiculo .marca-vehiculo {
        font-size: calc(1em + .85vw);
    }

    .contenido-card-vehiculo .placa-vehiculo,
    .color {
        font-size: calc(.75em + .6vw);
    }
}
</style>

<script setup>
import { ref } from 'vue';
import { generalStore } from '@/store/index.js'
import { supabase } from '@/lib/supabaseClient';

import alerta from '@/components/complementos-componentes/alerta.vue';
import barraBusqueda from '@/components/barra-busqueda.vue'
import accionesSesion from '@/components/modal-acciones-sesion.vue'
import modalSesion from '@/components/modal-sesion.vue'
import zonaFiltros from '@/components/carrusel-filtro.vue';
import modalOtrosFiltros from '@/components/modal-otros-filtros.vue'
import menuCelular from '@/components/complementos-componentes/menu.vue';
import modalNuevo from '../modal-nuevo.vue';
import axios from 'axios';
import router from '@/router';

const propsBar = defineProps([
    'vista',
    'ubicacion',
    'data'
])

const emisiones = defineEmits([
    'filtrar',
    'buscar'
])

const ubers = ref('')
const rol = ref('')
const accionModal = ref('')
const origenes = ref('')
const destinos = ref('')
const valorBuscadoDestino = ref('')
const ubiDestino = ref('')
const store = generalStore()
const destinoSelect = ref(false)
const origenSelect = ref(false)
const valorBuscadoOrigen = ref(propsBar.ubicacion)
const ubiOrigen = ref(propsBar.ubicacion)
const dataServices = ref('')
const distancia = ref(0)
const clientcode = ref('')
const bincar = ref('')
const balance = ref(0)

const mensaje = ref('')
const err = ref('')

const mostrandoModalAccionesSesion = ref(false)
const mostrandoModalSesion = ref(false)
const mostrandoModalFiltros = ref(false)
const mostrandoModalNuevo = ref(false)
const mostrandoAlerta = ref('')

const mostrarMenuCel = ref(false)
const date = new Date();

const existeToken = ref(false)
if (JSON.parse(localStorage.getItem('usuario-data')) != null) {
    rol.value = store.desencriptar(((JSON.parse(localStorage.getItem('usuario-data')))[0]['rol']), 'rol')
    balance.value = JSON.parse(localStorage.getItem('usuario-data'))[0]['balance']
    bincar.value = JSON.parse(localStorage.getItem('usuario-data'))[0]['bincard']
    clientcode.value = ((JSON.parse(localStorage.getItem('usuario-data')))[0]['clientcode'])
}

if (sessionStorage.getItem('token') != null) {
    existeToken.value = true
} else {
    existeToken.value = false
}

const cargarUbers = async () => {
    try {
        let { data, error } = await supabase
            .rpc('cargarubers')

        if (error) {
            mensaje.value = error
            err.value = 'true'
            usarAlerta()
        } else {
            ubers.value = data
        }
    } catch (error) {
        mensaje.value = error
        err.value = 'true'
        usarAlerta()
    }
}
cargarUbers()

/**
 * dev: Oned Gómez
 * Función que sirve para abrir/cerrar el modal que contiene las acciones que se pueden realizar en la sesión (iniciar, registrarse, cerrar sesión)
 */
const desplegarModalSesion = () => {
    mostrandoModalAccionesSesion.value = !mostrandoModalAccionesSesion.value
}

/**
 * dev: Oned Gómez
 * Función que sirve para abrir el modal que contiene los formularios de registro e inicio de sesión
 * @param {*} nombreModal: Hace referencia a la opción seleccionada del mini menú desplegable que se seleccionó
 */
const desplegarSubModal = (nombreModal) => {
    mostrandoModalSesion.value = !mostrandoModalSesion.value
    accionModal.value = nombreModal
}

/**
 * dev: Oned Gómez
 * Función que ayuda a marcar la ruta con el tercer punto en el mapa que sería la ubicación del conductor
 * @param {*} coordenadasVehiculo: contendrá las coordenadas del vehículo en tiempo real 
 */
const Solicitar = (coordenadasVehiculo) => {
    coordenadasVehiculo = coordenadasVehiculo.split(',')
    if (ubiDestino.value == '') {
        mensaje.value = 'Indica tu destino'
        err.value = 'true'
        usarAlerta()
        //cambiar
    } else {
        const coordenadasNuevas = [coordenadasVehiculo, ubiOrigen.value, ubiDestino.value]
        store.generarRuta(coordenadasNuevas)
    }
}

const reservar = async (cabcode, total) => {
    try {
        if (ubiDestino.value !== '' && ubiOrigen.value !== '') {
            const reservationcode = (store.encriptar((ubiOrigen.value + ubiDestino.value + '-.-.' + ' ' + clientcode.value + (String(date.getFullYear()) + '-' + String(date.getMonth() + 1).padStart(2, '0') + '-' + String(date.getDate()).padStart(2, '0') + '-.-.' + String(date.getTime()))), 'llave')).substring(15, 25)
            if (+total <= +balance.value) {
                const { data, error } = await supabase
                    .from('cabsreservation')
                    .insert([
                        {
                            cabreservationcode: reservationcode,
                            cabcode: cabcode,
                            reservatedby: clientcode.value,
                            origintravel: ubiOrigen.value[0] + ',' + ubiOrigen.value[1],
                            traveldestination: ubiDestino.value[0] + ',' + ubiDestino.value[1],
                            kilometersaway: distancia.value
                        },
                    ])
                if (error) {
                    mensaje.value = error
                    err.value = 'true'
                    usarAlerta()
                } else {
                    actualizarBalance(total)
                }
            } else {
                mensaje.value = 'El saldo en tu tarjeta es insuficiente'
                err.value = 'true'
                usarAlerta()
            }
        } else {
            mensaje.value = 'Selecciona tu Origen y destino'
            err.value = 'true'
            usarAlerta()
        }
    } catch (error) {
        mensaje.value = error
        err.value = 'true'
        usarAlerta()
    }
}

const actualizarBalance = async (total) => {
    try {
        let nuevoBalance = (balance.value) - (total)
        const { data, error } = await supabase
            .from('cards')
            .update({ balance: nuevoBalance })
            .eq('bincard', bincar.value)
            console.log(bincar.value)
        if (error) {
            mensaje.value = error
            err.value = 'true'
            usarAlerta()
        } else {
            const dataTMP = JSON.parse(localStorage.getItem('usuario-data'))[0]
            dataTMP['balance'] = nuevoBalance
            localStorage.setItem('usuario-data', JSON.stringify([dataTMP]))
            mensaje.value = 'Reserva realizada éxitosamente'
            err.value = 'false'
            usarAlerta()
            setTimeout(() => { router.go() }, 1900);
        }
    } catch (error) {
        console.log(error)
        mensaje.value = error
        err.value = 'true'
        usarAlerta()
    }
}

/**
 * dev: Oned Gómez
 * Función que sirve para cerrar el modal que contiene los formularios de registro e inicio de sesión
 */
const cerrarSubModal = () => {
    mostrandoModalSesion.value = !mostrandoModalSesion.value
}

/**
 * dev: Oned Gómez
 * Función que sirve para abrir/cerrar el modal que contendrá el resto de filtros
 */
const desplegarOtrosFiltros = () => {
    mostrandoModalFiltros.value = !mostrandoModalFiltros.value
}

const desplegarModalNuevo = () => {
    mostrandoModalNuevo.value = !mostrandoModalNuevo.value
}

/**
 * dev: Oned Gómez
 * Función para buscar y marcar el punto de origen del viaje
 */
const buscarOrigen = () => {
    if (valorBuscadoOrigen.value !== '') {
        origenSelect.value = false
        origenes.value = ''
        const parametros = {
            'limit': 7,
            'proximity': propsBar.ubicacion[0] + ',' + propsBar.ubicacion[1],
            'access_token': store.apikey,
            'language': 'es',
            'country': 'hn'
        }
        setTimeout(() => {
            axios.get('https://api.mapbox.com/geocoding/v5/mapbox.places/' + valorBuscadoOrigen.value + '.json', {
                params: parametros
            }
            ).then(respuesta => {
                origenes.value = respuesta['data']['features']
            }).catch(error => {
                console.log(error)
            })
        }, 1300)
    } else {
        origenes.value = ''
    }
}

/**
 * dev: Oned Gómez
 * Función para proporcionar las coordenadas y el nombre del lugar del punto de origen
 */
const seleccionarOrigen = (data) => {
    if (valorBuscadoDestino.value !== '') {
        const ubicaciones = [data['center'], ubiDestino.value]
        store.generarRuta(ubicaciones)
        ubiOrigen.value = data['center']
        valorBuscadoOrigen.value = data['place_name']
    } else {
        store.crearMarker([data['center']], 'Origen')
        ubiOrigen.value = data['center']
        valorBuscadoOrigen.value = data['place_name']
    }
    origenSelect.value = true
}

/**
 * dev: Oned Gómez
 * Función para proporcionar las coordenadas y el nombre del lugar del punto de destino
 */
const seleccionarDestino = (data) => {
    if (valorBuscadoOrigen !== '') {
        const ubicaciones = [ubiOrigen.value, data['center']]
        store.generarRuta(ubicaciones)
        ubiDestino.value = data['center']
        valorBuscadoDestino.value = data['place_name']
    }
    destinoSelect.value = true
    if (localStorage.getItem('distancia') !== null) {
        distancia.value = localStorage.getItem('distancia')
        distancia.value = store.desencriptar(distancia.value, 'distancia')
    }
}

const navegar = () => {
    router.push('/')
    localStorage.removeItem('distancia')
    localStorage.removeItem('duracion')
}

/**
 * dev: Oned Gómez
 * Función para buscar y marcar el punto de destino del viaje
 */
const buscarDestino = () => {
    if (valorBuscadoDestino !== '') {
        destinoSelect.value = false
        destinos.value = ''
        const parametros = {
            'limit': 3,
            'proximity': propsBar.ubicacion[0] + ',' + propsBar.ubicacion[1],
            'access_token': store.apikey,
            'language': 'es',
            'country': 'hn'
        }
        setTimeout(() => {
            axios.get('https://api.mapbox.com/geocoding/v5/mapbox.places/' + valorBuscadoDestino.value + '.json', {
                params: parametros
            }
            ).then(respuesta => {
                destinos.value = respuesta['data']['features']
            }).catch(error => {
                console.log(error)
            })
        }, 1300)
    } else {
        destinos.value = ''
    }
}


/**
* dev: Oned Gómez
* Función para arrastrar todas los servicios de la base de datos
*/
const cargarServices = async () => {
    try {
        let { data, error } = await supabase
            .rpc('seleccionarservices')

        if (error) {
            console.error(error)
        }
        else {
            dataServices.value = data
        }
    } catch (error) {
        console.log(error)
    }
}
cargarServices()

const usarAlerta = () => {
    mostrandoAlerta.value = !mostrandoAlerta.value
    setTimeout(() => { mostrandoAlerta.value = !mostrandoAlerta.value; }, 1900);
}

const emitirFiltro = (valorFiltro) => {
    emisiones('filtrar', valorFiltro)
}

const buscar = (valorBuscar) => {
    emisiones('buscar', valorBuscar)
}

if (screen.width <= 768) {
    mostrarMenuCel.value = true
} else {
    mostrarMenuCel.value = false
}
</script>