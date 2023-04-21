<template>
    <div @keyup.esc="cerrarModal()" class="modal fade show" id="exampleModal" tabindex="-1"
        aria-labelledby="exampleModalLabel" aria-hidden="true" style="display: block">
        <div class="modal-dialog modal-dialog-centered modal-fullscreen-md-down modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <button @click="cerrarModal" type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class=" informacion-casa">
                        <div class="d-flex mosaico">
                            <div class="columna-prin">
                                <div class="img-casa">
                                    <img :src="require('../assets/img/img-pruebas/' + data['urlphoto'])"
                                        class="img-fluid img-top" alt="...">
                                </div>
                            </div>
                            <div class="columna-secundaria">
                                <div class="img-casa">
                                    <img :src="require('../assets/img/img-pruebas/' + data['urlphoto'])"
                                        class="img-fluid img-top" alt="...">
                                </div>
                                <div class="img-casa">
                                    <img :src="require('../assets/img/img-pruebas/' + data['urlphoto'])"
                                        class="img-fluid img-top" alt="...">
                                </div>
                            </div>
                            <div class="columna-tercearia">
                                <div class="img-casa">
                                    <img :src="require('../assets/img/img-pruebas/' + data['urlphoto'])"
                                        class="img-fluid img-top" alt="...">
                                </div>
                                <div class="img-casa">
                                    <img :src="require('../assets/img/img-pruebas/' + data['urlphoto'])"
                                        class="img-fluid img-top" alt="...">
                                </div>
                            </div>
                        </div>
                        <div class="informacion-ubicacion">
                            <div class="localizacion">
                                <span class="icono"><font-awesome-icon icon="location-dot" /></span>
                                <span class="ubicacion">La Paz, La Paz, Honduras</span>
                            </div>
                            <div class="distancia">
                                <span>150 mts de distancia</span>
                            </div>
                        </div>
                        <div class="d-flex descripcion-casa">
                            <div class="detalle">
                                <span class="icono"> <font-awesome-icon icon="bath" /> </span>
                                <span class="descripcion"> <span class="cantidad-descripcion">2</span> baño(s)</span>
                            </div>
                            <div class="detalle">
                                <span class="icono"> <font-awesome-icon icon="bed" /> </span>
                                <span class="descripcion"> <span class="cantidad-descripcion">2</span> habitaciones</span>
                            </div>
                            <div class="detalle">
                                <span class="icono"> <font-awesome-icon icon="building" /> </span>
                                <span class="descripcion"> <span class="cantidad-descripcion">2</span> piso(s)</span>
                            </div>
                        </div>
                        <span class="separador"></span>
                        <div class="d-flex servicios">
                            <span>Servicios disponibles</span>
                            <carruselInformativo />
                        </div>
                        <div class="detalles-reservacion">
                            <div class="precio-renta">
                                <span class="icono"><font-awesome-icon icon="money-bill" /></span>
                                <span class="precio">L11,500 HNL <span class="tiempo"> día</span></span>
                            </div>
                            <div class="fechas">
                                <div class="d-flex dates">
                                    <span> Fecha inicial </span>
                                    <input v-model="fechaInicio" type="date">
                                </div>
                                <div class="d-flex dates">
                                    <span> Fecha final </span>
                                    <input @change="calcularDias" v-model="fechaFinal" type="date">
                                </div>
                            </div>
                            <div class="montos">
                                <div class="d-flex deposito">
                                    <span class="icono"> <font-awesome-icon icon="shield-halved" /> </span>
                                    <div class="d-flex descripcion">
                                        <span class="nombre-monto"> Depósito de seguro</span>
                                        <span class="cantidad">L540 HNL</span>
                                    </div>
                                </div>
                                <div class="d-flex deposito">
                                    <span class="icono"> <font-awesome-icon icon="shield-halved" /> </span>
                                    <div class="d-flex descripcion">
                                        <span class="nombre-monto"> Protección por cancelación</span>
                                        <span class="cantidad">L540 HNL</span>
                                    </div>
                                </div>
                                <div v-if="dias > 0" class="d-flex deposito base-dias">
                                    <div class="d-flex descripcion">
                                        <span class="nombre-monto"> Precio base x {{ dias }} días</span>
                                        <span class="cantidad">L540 HNL</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="mapa-ubicacion">
                            
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button >Reservar</button>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
import carruselInformativo from '@/components/carrusel-informativo.vue'
import { ref } from 'vue'

const fechaInicio = ref('')
const fechaFinal = ref('')
const dias = ref(0)

const propsDetalles = defineProps([
    'data'
])

const emisiones = defineEmits([
    'cerrarDetalles'
])

const cerrarModal = () => {
    emisiones('cerrarDetalles')
}

const calcularDias = () => {
    const diaInicio = new Date(fechaInicio.value)
    const diaFinal = new Date(fechaFinal.value)
    dias.value = (diaFinal.getTime() - diaInicio.getTime())/(24*3600*1000)
}

</script>

<style scoped>
.btn-close:focus {
    box-shadow: none;
    border: none;
}

.modal {
    backdrop-filter: blur(2.5px);
}

.modal-header {
    border: none !important;
    padding: 10px 5px;
}

.modal-header .btn-close{
    margin: 0 12px 0 auto  !important;
}

.modal-body {
    padding-top: 5px;
}

.modal-body .informacion-casa .mosaico .columna-prin {
    width: 50%;
    padding: 0 3px;
}

.modal-body .informacion-casa .mosaico .columna-secundaria {
    width: 25%;
    padding: 0 2px;
    display: flex;
    flex-direction: column;
    justify-content: center;
}

.modal-body .informacion-casa .mosaico .columna-tercearia {
    width: 25%;
    padding: 0 2px;
    display: flex;
    flex-direction: column;
    justify-content: center;
}

.img-casa {
    padding: 1px 0;
}

.img-casa .img-top {
    border-radius: 3px;
}

.modal-body .informacion-casa .informacion-ubicacion,
.informacion-ubicacion>div {
    width: fit-content;
    margin-left: 5px;
    margin-right: 5px;
}

.modal-body .informacion-casa .icono {
    font-size: calc(.7em + .65vw);
    color: #ff475e;
}

.modal-body .informacion-casa .informacion-ubicacion .localizacion .ubicacion {
    margin-left: 12px;
    font-size: calc(.6em + .65vw);
    font-weight: 600;
}

.modal-body .informacion-casa .informacion-ubicacion .distancia {
    margin-left: 28px;
    font-size: calc(.5em + .58vw);
    color: #8e8e8e;
}

.modal-body .informacion-casa .descripcion-casa {
    justify-content: center;
    margin: 8px 5px;
}

.modal-body .informacion-casa .descripcion-casa .detalle {
    display: flex;
    flex-direction: column;
    margin-right: 15px;
}

.modal-body .informacion-casa .descripcion-casa .detalle .descripcion {
    font-size: calc(.5em + .45vw);
}

.modal-body .informacion-casa .descripcion-casa .detalle .cantidad-descripcion {
    font-weight: 600;
    color: #ff475e;
}

.modal-body .informacion-casa .servicios {
    flex-direction: column !important;
    align-items: start;
    margin: 0 5px 0 5px;
}

.modal-body .informacion-casa .servicios span:first-child {
    font-weight: 600;
    font-size: calc(.5em + .58vw);
    color: #000;
}

.modal-body .informacion-casa .detalles-reservacion {
    width: 75%;
    margin: auto;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}

.modal-body .informacion-casa .detalles-reservacion .precio-renta {
    width: max-content;
    margin-bottom: 15px;
}

.modal-body .informacion-casa .detalles-reservacion .precio-renta .precio {
    margin-left: 12px;
    font-size: calc(.5em + .58vw);
    font-weight: 600;
    color: #000;
}

.modal-body .informacion-casa .detalles-reservacion .precio-renta .precio .tiempo {
    font-weight: normal;
}

.modal-body .informacion-casa .detalles-reservacion .fechas {
    display: flex;
}

.modal-body .informacion-casa .detalles-reservacion .dates {
    flex-direction: column;
    max-width: 130px;
    margin-right: 5px;
    border: #8e8e8e solid .5px;
    padding: 5px;
    border-radius: 7px;
    font-size: calc(.5em + .58vw);
}

.modal-body .informacion-casa .detalles-reservacion .dates input {
    border: none;
    text-align: center;
    font-weight: 100;
}

.modal-body .informacion-casa .detalles-reservacion .dates span {
    font-weight: 600;
    color: #000;
}

.modal-body .informacion-casa .detalles-reservacion .montos {
    margin-top: 15px;
    width: 100%;
}


.modal-body .informacion-casa .detalles-reservacion .montos .descripcion {
    width: 100%;
    justify-content: space-between;
    color: #000;
    font-size: calc(.5em + .65vw);
    align-content: center;
    flex-wrap: wrap;
}

.modal-body .informacion-casa .detalles-reservacion .montos .descripcion span:first-child {
    margin-left: 12px;
}

.modal-footer button {
    border: 1px #ff475e solid;
    background-color: #fff;
    color: #ff475e;
    padding: 3px 10px;
    border-radius: 7px;
    transition: all 180ms ease-in-out;
    font-weight: 600;
    font-size: calc(.5em + .45vw);
}

.modal-footer button:hover {
    background-color: #ff475e;
    color: #fff;
}

/*
  * Configuramos el media query para dispositivo celulares 
 */
@media (max-width: 768px) {
    .modal-footer button {
        font-size: calc(.6em + .45vw);
    }
}
</style>