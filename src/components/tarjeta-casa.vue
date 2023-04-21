<template>
    <div @click="mostrarDetalles()" class="col-md-6 col-md-4 col-lg-3 contenedor-tarjeta">
        <div class="card">
            <div class="img">
                <img :src="require('../assets/img/img-pruebas/' + data['urlphoto'])" class="img-fluid card-img-top"
                    alt="...">
            </div>
            <div class="card-body">
                <div class="localizacion">
                    <span class="icono"><font-awesome-icon icon="location-dot" /></span>
                    <span class="ubicacion">La Paz, La Paz, Honduras</span>
                </div>
                <div class="distancia">
                    <span>150 mts de distancia</span>
                </div>
                <div class="precio-renta">
                    <span class="icono"><font-awesome-icon icon="money-bill" /></span>
                    <span class="precio">L11,500 HNL <span class="tiempo"> día</span></span>
                </div>
                <div class="detalles-casa d-flex">
                    <div class="tag">
                        <div class="img-detalles">
                            <img class="img-fluid" src="../assets/icons/categories/en-playa.svg" alt="nombre tag">
                        </div>
                        <span class="nombre-tag">Frente a la playa</span>
                    </div>
                    <span class="etiqueta-contenido">Servicios ofrecidos</span>
                    <div class="d-flex some-services">
                        <div class="d-flex servicio">
                            <div class="img-servicio">
                                <img class="img-fluid" src="../assets/icons/services/breakfast.svg" alt="nombre servicio">
                            </div>
                            <span class="nombre-servicio">Desayuno</span>
                        </div>
                        <div class="d-flex servicio">
                            <div class="img-servicio">
                                <img class="img-fluid" src="../assets/icons/services/clean-service.svg"
                                    alt="nombre servicio">
                            </div>
                            <span class="nombre-servicio">Limpieza</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
const emisiones = defineEmits([
    'abrirDetalles'
])

const propsTarjeta = defineProps([
    'data'
])

const mostrarDetalles = () => {
    emisiones('abrirDetalles', propsTarjeta.data)
}
</script>

<style scoped>
.contenedor-tarjeta {
    margin-bottom: 18px;
}

.card {
    border: none;
}

.card:hover {
    cursor: pointer;
}

.card .img img {
    border-bottom-left-radius: 5px;
    border-bottom-right-radius: 5px;
}

.card .card-body {
    padding: 5px 9px;
    text-align: start;
    color: #000;
}

.card .card-body .localizacion {
    display: flex;
    align-items: center;
}

.card .card-body .icono {
    color: #ff475e;
    font-size: calc(.6em + 1vw);
    justify-content: center;
    display: flex;
}

.card .card-body .localizacion .ubicacion {
    color: #000;
    margin-left: 12px;
    font-size: calc(.5em + .65vw);
    font-weight: 600;
}

.card .card-body .distancia {
    color: #8e8e8e;
    font-size: calc(.5em + .45vw);
    margin-left: 27px;
}

.card .card-body .precio-renta {
    display: flex;
    align-items: center;
    margin-top: 7px;
}

.card .card-body .precio-renta .precio {
    font-weight: 600;
    font-size: calc(.5em + .55vw);
    margin-left: 12px;
}

.card .card-body .precio-renta .precio .tiempo {
    font-weight: normal;
}

.card .card-body .detalles-casa::before {
    content: ' ';
    width: 90%;
    height: .5px;
    background-color: #8e8e8e;
    margin-top: 9px;
    margin-bottom: 6px;
    margin-left: auto;
    margin-right: auto;
}

.card .card-body .detalles-casa {
    flex-direction: column;
}

.card .card-body .detalles-casa .tag {
    display: flex;
    align-items: center;
    margin-bottom: 10px;
}

.card .card-body .detalles-casa .img-detalles {
    width: 32px;
}

.card .card-body .detalles-casa .nombre-tag {
    font-size: calc(.5em + .25vw);
    margin-left: 12px;
}

.card .card-body .detalles-casa .some-services .img-servicio {
    width: 28px;
}

.card .card-body .detalles-casa .some-services .nombre-servicio {
    margin-left: 0px;
    font-size: calc(.5em + .25vw);
}

.card .card-body .detalles-casa .some-services .servicio {
    flex-direction: column;
    align-items: center;
    justify-content: start;
    margin-right: 12px;
}

/*
  * Configuramos el media query para dispositivo celulares 
*/
@media (max-width: 768px) {
    .card .card-body .icono {
        font-size: calc(1em + .75vw);
    }

    .card .card-body .localizacion .ubicacion {
        font-size: calc(.8em + .7vw);
        margin-left: 10px;
    }

    .card .card-body .distancia {
        color: #8e8e8e;
        font-size: calc(.65em + .45vw);
        margin-left: 25px;
    }

    .card .card-body .precio-renta .precio {
        font-size: calc(.8em + .6vw);
        margin-left: 10px;
    }

    .card .card-body .detalles-casa .img-detalles {
        width: 33px;
    }

    .card .card-body .detalles-casa .nombre-tag {
        font-size: calc(.5em + .55vw);
        margin-left: 10px;
    }

    .card .card-body .detalles-casa .some-services .img-servicio {
        width: 30px;
    }

    .card .card-body .detalles-casa .some-services .nombre-servicio {
        margin-left: 0px;
        font-size: calc(.5em + .55vw);
    }
}
</style>