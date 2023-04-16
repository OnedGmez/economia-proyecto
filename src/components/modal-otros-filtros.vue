<template>
    <div @keyup.esc="cerrar" class="modal fade show" id="exampleModalToggle" aria-hidden="true"
        aria-labelledby="exampleModalToggleLabel" style="display: block;" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button @click="cerrar" type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="filtro-servicios">
                        <span class="etiqueta-contenido">Selecciona un servicio: </span>
                        <carruselFiltro ubicacion="Modal" />
                    </div>
                    <span class="separador"></span>
                    <div class="d-flex filtros-principales">
                        <div class="rating">
                            <span class="etiqueta-contenido">Busca lo mejor valorado </span>
                            <div class="estrellas">
                                <span @click="seleccionarRating(5)" :class="[IDSeleccionada == 5 ? 'fijada' : '']"
                                    class="estrella"> <font-awesome-icon icon="star" /> </span>
                                <span @click="seleccionarRating(4)" :class="[IDSeleccionada == 4 ? 'fijada' : '']"
                                    class="estrella"> <font-awesome-icon icon="star" /> </span>
                                <span @click="seleccionarRating(3)" :class="[IDSeleccionada == 3 ? 'fijada' : '']"
                                    class="estrella"> <font-awesome-icon icon="star" /> </span>
                                <span @click="seleccionarRating(2)" :class="[IDSeleccionada == 2 ? 'fijada' : '']"
                                    class="estrella"> <font-awesome-icon icon="star" /> </span>
                                <span @click="seleccionarRating(1)" :class="[IDSeleccionada == 1 ? 'fijada' : '']"
                                    class="estrella"> <font-awesome-icon icon="star" /> </span>
                            </div>
                        </div>

                        <div class="filtro-precios">
                            <span class="etiqueta-contenido">Según tu presupuesto </span>
                            <div class="d-flex">
                                <div class="mr">
                                    <div class="input-group">
                                        <span class="input-group-text" id="basic-addon3">Min</span>
                                        <input type="number" class="form-control" min="0"
                                            aria-describedby="basic-addon3 basic-addon4">
                                    </div>
                                </div>
                                <div class="">
                                    <div class="input-group">
                                        <span class="input-group-text" id="basic-addon3">Max</span>
                                        <input type="number" class="form-control" min="0"
                                            aria-describedby="basic-addon3 basic-addon4">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button>Eliminar filtros</button>
                    <button>Aplicar</button>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
import { ref } from 'vue';
import carruselFiltro from './carrusel-filtro.vue';



const emisiones = defineEmits([
    'cerrarModal'
])

const cerrar = () => {
    emisiones('cerrarModal')
}

const seleccionarRating = (rating) => {
    IDSeleccionada.value = rating
}

</script>

<style scoped>
.modal {
    backdrop-filter: blur(2.5px);
}

.modal-header {
    border: none;
    padding-bottom: 0px;
}

.modal-body {
    padding-top: 5px;
}

.filtros-principales {
    justify-content: space-around;
    color: #000;
}

.filtros-principales .rating .estrellas {
    display: flex;
    flex-direction: row-reverse;
    justify-content: center;
}

.filtros-principales .rating .estrellas .estrella {
    font-size: calc(1em + .7vw);
    float: right;
}

.filtros-principales .rating .estrellas .fijada {
    color: #ff475e;
}


.filtros-principales .rating .estrellas>.fijada~.estrella {
    color: #ff475e;
}

.filtros-principales .rating .estrellas:not(.fijada)>.estrella:hover,
.filtros-principales .rating .estrellas:not(.fijada)>.estrella:hover~.estrella {
    color: #ff475e;
}

.filtros-principales .rating .estrellas>.fijada+.estrella:hover,
.filtros-principales .rating .estrellas>.fijada+.estrella:hover~.estrella,
.filtros-principales .rating .estrellas>.fijada~.estrella:hover,
.filtros-principales .rating .estrellas>.fijada~.estrella:hover~.estrella,
.filtros-principales .rating .estrellas>.estrella:hover~.fijada~.estrella {
    color: #ff475e;
}

.input-group .input-group-text {
    font-size: calc(.5em + .45vw) !important;
    font-weight: 600;
    padding: 3px 6px;
    background-color: #ff475e;
    color: #fff;
    border: #ff475e solid .5px;
}

.input-group>.form-control {
    flex: none;
    width: 80px;
    font-size: calc(.6em + .2vw) !important;
}

.form-control:focus-visible {
    outline: none !important;
}

.form-control:focus {
    box-shadow: none;
    border: #ff475e solid .5px;
    border-bottom: #6907f2 solid .5px;
}

.filtros-principales .filtro-precios div:first-child {
    margin-right: 6px;
}

.input-group-text {
    width: auto;
    flex-wrap: wrap;
    white-space: pre-wrap;
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

    .filtros-principales {
        justify-content: space-between;
    }

    .input-group>.form-control {
        flex: none;
        width: 50px;
    }
}
</style>