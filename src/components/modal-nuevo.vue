<template>
    <div @keyup.esc="cerrarModal()" class="modal fade show" id="exampleModal" tabindex="-1"
        aria-labelledby="exampleModalLabel" data-bs-backdrop="static" aria-hidden="true" style="display: block">
        <div class="modal-dialog modal-dialog-centered modal-fullscreen-md-down modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <button @click="cerrarModal" type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
                </div>
                <div v-if="vista == 'Home'" class="modal-body">
                    <div class="mb-3">
                        <label for="formFile" class="form-label">Default file input example</label>
                        <input class="form-control" type="file" id="formFile">
                    </div>
                    <div class="mb-3">
                        <label for="formFileDisabled" class="form-label">Disabled file input example</label>
                        <input class="form-control" type="file" id="formFileDisabled" disabled>
                    </div>
                    <div class="mb-3">
                        <label for="formFileSm" class="form-label">Small file input example</label>
                        <input class="form-control form-control-sm" id="formFileSm" type="file">
                    </div>
                    <div>
                        <label for="formFileLg" class="form-label">Large file input example</label>
                        <input class="form-control form-control-lg" id="formFileLg" type="file">
                    </div>
                    <div class="mb-3">
                        <label for="formFileMultiple" class="form-label">Multiple files input example</label>
                        <input class="form-control" type="file" id="formFileMultiple" multiple>
                    </div>
                </div>
                <div class="modal-footer">
                    <button>Agregar</button>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
import { ref } from 'vue'

const fechaInicio = ref('')
const fechaFinal = ref('')
const dias = ref(0)

const propsDetalles = defineProps([
    'data',
    'vista'
])

const emisiones = defineEmits([
    'cerrarNuevo'
])

const cerrarModal = () => {
    emisiones('cerrarNuevo')
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

.modal-header .btn-close {
    margin: 0 12px 0 auto !important;
}

.modal-body {
    padding-top: 5px;
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

.modal-footer {
    padding: auto 5px;
}

.modal-footer button:hover {
    background-color: #ff475e;
    color: #fff;
}

/*
* Estilos de los elementos de carro
 */
.caracteristicas-carro .basicas>div {
    display: flex;
    margin-right: 7px;
    justify-content: center;
    align-items: center;
}

.caracteristicas-carro .basicas>div:last-child {
    margin-right: 0px;
}

.caracteristicas-carro .basicas>div:hover {
    cursor: pointer;
}

.caracteristicas-carro {
    align-items: center;
    flex-direction: column;
}

.caracteristicas-carro .extras>div {
    display: flex;
    margin-right: 12px;
    justify-content: center;
    align-items: center;
}

.caracteristicas-carro .extras>div:hover {
    cursor: pointer;
}

.img-caracteristica {
    width: 16px;
    fill: #ff475e;
    stroke: #ff475e;
    margin-right: 5px;
}

.caracteristicas-carro .img-caracteristica g {
    fill: #ff475e;
    stroke: #ff475e;
}

.caracteristicas-carro .icono {
    color: #ff475e;
    font-size: calc(.6em + .5vw);
    justify-content: center;
    display: flex;
    margin-right: 5px;
}

/*
  * Configuramos el media query para Tablets 
 */
@media (max-width: 768px) {
    .modal-footer button {
        font-size: calc(.7em + .65vw);
    }
}

/*
  * Configuramos el media query para dispositivo celulares 
 */
@media (max-width: 576px) {
    .modal-footer button {
        font-size: calc(.6em + .5vw);
    }
}
</style>