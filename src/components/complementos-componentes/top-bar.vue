<template>
    <div v-if="vista !== 'Llevame'" class="estatica-top">
        <div class="cabecera">
            <div v-if="mostrarMenuCel == false" class="logo">
                <div class="img">
                    <img class="img-fluid" src="../../assets/img/logo.png" alt="Logo RentAway">
                </div>
            </div>
            <div class="busqueda">
                <barraBusqueda :vista="vista" />
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
            <zonaFiltros />
            <button v-if="mostrarMenuCel == false" @click="desplegarOtrosFiltros" class="d-flex btn">
                <div class="icono-boton">
                    <span> <font-awesome-icon icon="sliders" /> </span>
                </div>
                <div class="texto-boton">
                    <span>Filtros</span>
                </div>
            </button>
        </div>
        <div @click="desplegarModalNuevo" class="button">
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

        <div class="uber-cerca">
            <div class="titulo">
                <span>Vehículos cerca</span>
            </div>
            <div class="tarjeta-vehiculo-cerca">
                <div class="card">
                    <div class="d-flex detalles">
                        <div class="d-flex card-img">
                            <img class="img-fluid"
                                src="https://imrrsmkwbhsldwcxgoqv.supabase.co/storage/v1/object/public/digital-economy-file-server/photos/cars/carro_prueba.png"
                                alt="Vehículo">
                        </div>
                        <div class="contenido-card-vehiculo">
                            <div class="marca-vehiculo">
                                <span class="marca"> Nissan <span class="modelo"> Verssa </span> </span>
                            </div>
                            <div class="color">
                                <span class="etiqueta">Color: <span class="espacio-color"></span></span>
                            </div>
                            <div class="placa-vehiculo">
                                <span class="etiqueta">Placa: <span class="numero"> PCB 0028</span> </span>
                            </div>
                        </div>
                    </div>
                    <div class="d-flex reservar">
                        <span class="pago">L.1100 <span class="moneda">HNL</span></span>
                        <button @click="Solicitar([-87.2087552,14.09024])">¡Ven por mí!</button>
                    </div>
                </div>
            </div>
            <div class="tarjeta-vehiculo-cerca">
                <div class="card">
                    <div class="d-flex detalles">
                        <div class="d-flex card-img">
                            <img class="img-fluid"
                                src="https://imrrsmkwbhsldwcxgoqv.supabase.co/storage/v1/object/public/digital-economy-file-server/photos/cars/carro_prueba.png"
                                alt="Vehículo">
                        </div>
                        <div class="contenido-card-vehiculo">
                            <div class="marca-vehiculo">
                                <span class="marca"> Nissan <span class="modelo"> Verssa </span> </span>
                            </div>
                            <div class="color">
                                <span class="etiqueta">Color: <span class="espacio-color"></span></span>
                            </div>
                            <div class="placa-vehiculo">
                                <span class="etiqueta">Placa: <span class="numero"> PCB 0028</span> </span>
                            </div>
                        </div>
                    </div>
                    <div class="d-flex reservar">
                        <span class="pago">L.1100 <span class="moneda">HNL</span></span>
                        <button @click="Solicitar([-87.2087552,14.09074])">¡Ven por mí!</button>
                    </div>
                </div>
            </div>
            <div class="tarjeta-vehiculo-cerca">
                <div class="card">
                    <div class="d-flex detalles">
                        <div class="d-flex card-img">
                            <img class="img-fluid"
                                src="https://imrrsmkwbhsldwcxgoqv.supabase.co/storage/v1/object/public/digital-economy-file-server/photos/cars/carro_prueba.png"
                                alt="Vehículo">
                        </div>
                        <div class="contenido-card-vehiculo">
                            <div class="marca-vehiculo">
                                <span class="marca"> Nissan <span class="modelo"> Verssa </span> </span>
                            </div>
                            <div class="color">
                                <span class="etiqueta">Color: <span class="espacio-color"></span></span>
                            </div>
                            <div class="placa-vehiculo">
                                <span class="etiqueta">Placa: <span class="numero"> PCB 0028</span> </span>
                            </div>
                        </div>
                    </div>
                    <div class="d-flex reservar">
                        <span class="pago">L.1100 <span class="moneda">HNL</span></span>
                        <button @click="Solicitar([-87.2087552,14.09074])">¡Ven por mí!</button>
                    </div>
                </div>
            </div>
            <div class="tarjeta-vehiculo-cerca">
                <div class="card">
                    <div class="d-flex detalles">
                        <div class="d-flex card-img">
                            <img class="img-fluid"
                                src="https://imrrsmkwbhsldwcxgoqv.supabase.co/storage/v1/object/public/digital-economy-file-server/photos/cars/carro_prueba.png"
                                alt="Vehículo">
                        </div>
                        <div class="contenido-card-vehiculo">
                            <div class="marca-vehiculo">
                                <span class="marca"> Nissan <span class="modelo"> Verssa </span> </span>
                            </div>
                            <div class="color">
                                <span class="etiqueta">Color: <span class="espacio-color"></span></span>
                            </div>
                            <div class="placa-vehiculo">
                                <span class="etiqueta">Placa: <span class="numero"> PCB 0028</span> </span>
                            </div>
                        </div>
                    </div>
                    <div class="d-flex reservar">
                        <span class="pago">L.1100 <span class="moneda">HNL</span></span>
                        <button @click="Solicitar([-87.2087552,14.09074])">¡Ven por mí!</button>
                    </div>
                </div>
            </div>
            <div class="tarjeta-vehiculo-cerca">
                <div class="card">
                    <div class="d-flex detalles">
                        <div class="d-flex card-img">
                            <img class="img-fluid"
                                src="https://imrrsmkwbhsldwcxgoqv.supabase.co/storage/v1/object/public/digital-economy-file-server/photos/cars/carro_prueba.png"
                                alt="Vehículo">
                        </div>
                        <div class="contenido-card-vehiculo">
                            <div class="marca-vehiculo">
                                <span class="marca"> Nissan <span class="modelo"> Verssa </span> </span>
                            </div>
                            <div class="color">
                                <span class="etiqueta">Color: <span class="espacio-color"></span></span>
                            </div>
                            <div class="placa-vehiculo">
                                <span class="etiqueta">Placa: <span class="numero"> PCB 0028</span> </span>
                            </div>
                        </div>
                    </div>
                    <div class="d-flex reservar">
                        <span class="pago">L.1100 <span class="moneda">HNL</span></span>
                        <button @click="Solicitar([-87.2087552,14.09074])">¡Ven por mí!</button>
                    </div>
                </div>
            </div>
            <div class="tarjeta-vehiculo-cerca">
                <div class="card">
                    <div class="d-flex detalles">
                        <div class="d-flex card-img">
                            <img class="img-fluid"
                                src="https://imrrsmkwbhsldwcxgoqv.supabase.co/storage/v1/object/public/digital-economy-file-server/photos/cars/carro_prueba.png"
                                alt="Vehículo">
                        </div>
                        <div class="contenido-card-vehiculo">
                            <div class="marca-vehiculo">
                                <span class="marca"> Nissan <span class="modelo"> Verssa </span> </span>
                            </div>
                            <div class="color">
                                <span class="etiqueta">Color: <span class="espacio-color"></span></span>
                            </div>
                            <div class="placa-vehiculo">
                                <span class="etiqueta">Placa: <span class="numero"> PCB 0028</span> </span>
                            </div>
                        </div>
                    </div>
                    <div class="d-flex reservar">
                        <span class="pago">L.1100 <span class="moneda">HNL</span></span>
                        <button @click="Solicitar([-87.2087552,14.09074])">¡Ven por mí!</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <accionesSesion v-if="mostrandoModalAccionesSesion == true"
        @desplegar-modal="(nombreModal) => { desplegarSubModal(nombreModal), desplegarModalSesion() }" />
    <modalSesion v-if="mostrandoModalSesion == true" :accion="accionModal" @cerrar-modal="() => cerrarSubModal()" />
    <modalOtrosFiltros v-if="mostrandoModalFiltros == true" @cerrar-modal="() => desplegarOtrosFiltros()" :vista=vista />
    <modalNuevo v-if="mostrandoModalNuevo == true" :vista="vista" @cerrar-nuevo="() => desplegarModalNuevo()" />
</template>

<style scoped>

.uber-cerca{
    position: relative;
    margin-top: 15px;
    height: 505px;
    overflow-y: scroll;
}

.uber-cerca .titulo{
    font-size: calc(.65em + .75vw);
    font-weight: 500;
}
.uber-cerca .tarjeta-vehiculo-cerca{
    padding: 0 5px;
    margin: 10px 0 0 0;
}

.uber-cerca .tarjeta-vehiculo-cerca .card .detalles{
    flex-direction: row;
}

.uber-cerca .tarjeta-vehiculo-cerca .card{
    padding: 7px 0px 7px 0;
}

.card .detalles .card-img{
    width: 120px;
    padding: 0 8px;
}

.card .detalles .contenido-card-vehiculo{
    margin-left: 12px;
    text-align: start;
}

.contenido-card-vehiculo .marca-vehiculo{
    font-size: calc(.5em + .7vw);
    font-weight: 600;
}

.contenido-card-vehiculo .placa-vehiculo, .color {
    font-size: calc(.5em + .55vw);
    font-weight: 500;
}

.contenido-card-vehiculo .etiqueta{
    font-weight: 400;
}

.contenido-card-vehiculo .etiqueta .numero{
    font-weight: 500;
}

.tarjeta-vehiculo-cerca .card .reservar{
    padding: 0 10px;
    justify-content: space-between;
    align-items: center;
}

.card .reservar .pago{
    font-weight: 500;
    font-size: calc(.65em + .45vw);
}

.pago .moneda{
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
    background-color: #ff475e!important;
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
        font-size: calc(.5em + .45vw);
        margin-left: 30px;
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
}
</style>

<script setup>
import { ref } from 'vue';
import { generalStore } from '@/store/index.js'

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
    'ubicacion'
])

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

const mostrandoModalAccionesSesion = ref(false)
const mostrandoModalSesion = ref(false)
const mostrandoModalFiltros = ref(false)
const mostrandoModalNuevo = ref(false)

const mostrarMenuCel = ref(false)

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

const Solicitar = (coordenadasVehiculo) => {
    const coordenadasNuevas = [coordenadasVehiculo, ubiOrigen.value, ubiDestino.value]
    store.generarRuta(coordenadasNuevas)
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

const seleccionarDestino = (data) => {
    if (valorBuscadoOrigen !== '') {
        const ubicaciones = [ubiOrigen.value, data['center']]
        store.generarRuta(ubicaciones)
        ubiDestino.value = data['center']
        valorBuscadoDestino.value = data['place_name']
    }
    destinoSelect.value = true
}

const navegar = () => {
    router.push('/')
}

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

if (screen.width <= 768) {
    mostrarMenuCel.value = true
} else {
    mostrarMenuCel.value = false
}
</script>