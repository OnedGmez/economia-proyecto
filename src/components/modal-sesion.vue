<template>
    <div @keyup.esc="cerrarModal" class="modal fade show" id="exampleModal" tabindex="-1"
        aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <button @click="cerrarModal" type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-6 img-lateral">
                                <img v-if="accion === 'Iniciar Sesion'" class="img-fluid" src="../assets/img/login.svg"
                                    alt="Representación Inicio Sesión">
                            </div>
                            <div class="col-lg-6 form-space">
                                <inicioSesion v-if="accion === 'Iniciar Sesion'" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
import inicioSesion from '@/components/complementos-componentes/formulario-inicio-sesion.vue'

const propsModal = defineProps([
    'accion'
])

const emisiones = defineEmits([
    'cerrar-modal'
])

const cerrarModal = () => {
    emisiones('cerrar-modal')
}

</script>

<style scoped>
.modal {
    display: block !important;
    backdrop-filter: blur(2.5px);
}

.modal-header {
    border: none;
    padding-bottom: 0px;
    position: absolute;
    z-index: 1;
    right: 0;
}

.form-space {
    border-left: 1px solid #7e7e7e;
    padding-right: 0;
    padding-left: 16px;
}

/*
  * Configuramos el media query para dispositivo celulares 
 */
@media (max-width: 768px) {
    .img-lateral{
        display: none;
    }
}
</style>