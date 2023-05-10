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
                    <div class="d-flex input-group">
                        <span class="input-group-text" id="ubicacion-input"></span>
                        <input type="text" v-model="ubicacion" disabled class="form-control"
                            placeholder="Ubicacion de la casa" aria-label="ubicacion" aria-describedby="ubicacion-input">
                    </div>
                    <div class="d-flex input-group">
                        <span class="input-group-text" id="ciudad-input"></span>
                        <input type="text" v-model="ciudad" disabled class="form-control" placeholder="Ciudad"
                            aria-label="ciudad" aria-describedby="ciudad-input">
                    </div>
                    <div class="d-flex precios">
                        <div class="input-group">
                            <span>Precio base de la renta/día</span>
                            <div class="d-flex">
                                <span class="input-group-text" id="rental-input"></span>
                                <input type="number" v-model="baseRental" min="0" class="form-control" placeholder="rental"
                                    aria-label="rental" aria-describedby="rental-input">
                            </div>
                        </div>
                        <div class="input-group">
                            <span>Depósito por seguridad</span>
                            <div class="d-flex">
                                <span class="input-group-text" id="seguridad-input"></span>
                                <input type="number" v-model="seguridad" min="0" class="form-control"
                                    placeholder="seguridad" aria-label="seguridad" aria-describedby="seguridad-input">
                            </div>
                        </div>
                        <div class="input-group">
                            <span>Protección por cancelación</span>
                            <div class="d-flex">
                                <span class="input-group-text" id="cancelacion-input"></span>
                                <input type="number" v-model="cancelacion" min="0" class="form-control"
                                    placeholder="cancelacion" aria-label="cancelacion" aria-describedby="cancelacion-input">
                            </div>
                        </div>
                    </div>
                    <div class="d-flex selects">
                        <div class="d-flex input-group grupo-datos input-label">
                            <span>Selecciona la categoria de la casa</span>
                            <select v-model="categoria" class="form-control" aria-label="Default select example">
                                <option v-for="categoria of categorias" :value="categoria['categorycode']">{{
                                    categoria['categoryname'] }}</option>
                            </select>
                        </div>
                        <div class="d-flex input-group grupo-datos input-label">
                            <span>Selecciona la etiqueta de la casa</span>
                            <select v-model="etiqueta" class="form-control" aria-label="Default select example">
                                <option v-for="etiqueta of etiquetas" :value="etiqueta['code']">{{
                                    etiqueta['name'] }}</option>
                            </select>
                        </div>
                    </div>
                    <div class="d-flex numeros">
                        <div class="numbers">
                            <div class="d-flex input-group grupo-datos input-label">
                                <span>Pisos</span>
                                <div class="d-flex">
                                    <span class="input-group-text" id="pisos-input"></span>
                                    <input type="number" v-model="pisos" min="0" class="form-control"
                                        placeholder="Cantidad de pisos" aria-label="pisos" aria-describedby="pisos-input">
                                </div>
                            </div>
                        </div>
                        <div class="numbers">
                            <div class="d-flex input-group grupo-datos input-label">
                                <span>Baños</span>
                                <div class="d-flex">
                                    <span class="input-group-text" id="banios-input"></span>
                                    <input type="number" v-model="banios" min="0" class="form-control"
                                        placeholder="Cantidad de baños" aria-label="banios" aria-describedby="banios-input">
                                </div>
                            </div>
                        </div>
                        <div class="numbers">
                            <div class="d-flex input-group grupo-datos input-label">
                                <span>Habitaciones</span>
                                <div class="d-flex">
                                    <span class="input-group-text" id="habitaciones-input"></span>
                                    <input type="number" v-model="habitaciones" min="0" class="form-control"
                                        placeholder="Cantidad de habitaciones" aria-label="habitaciones"
                                        aria-describedby="habitaciones-input">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="input-group d-flex input-label">
                        <label for="fecha-input">Elige las 5 fotografías a mostrar</label>
                        <div class="d-flex">
                            <span class="input-group-text" id="foto-input"></span>
                            <input type="file" class="form-control" @change="asignarFotos" placeholder="Fotos de la casa"
                                aria-label="Fotos de casa" aria-describedby="Foto-input" multiple
                                accept="image/png, image/jpeg">
                        </div>
                    </div>
                    <div class="input-group d-flex input-label">
                        <label for="fecha-input">Selecciona el documento de propiedad</label>
                        <div class="d-flex">
                            <span class="input-group-text" id="foto-input"></span>
                            <input type="file" class="form-control" @change="asignarDoc" placeholder="Documento"
                                aria-label="Documento" aria-describedby="doc-input" multiple accept=".pdf">
                        </div>
                    </div>
                    <div class="d-flex servicios">
                        <span>Selecciona los servicios</span>
                        <div class="d-flex">
                            <div v-for="service of services" class="form-check">
                                <input @click="agregar(service['code'])" class="form-check-input" type="checkbox"
                                    :value="service['code']">
                                <label class="form-check-label">
                                    {{ service['name'] }}
                                </label>
                            </div>
                        </div>
                    </div>
                    <div @click="buscarDestino" class="espacio-mapa">
                        <span>Haz click sobre el mapa para indicar la ubicación de la casa</span>
                        <div ref="mapa" id="mapa-casa" class="map-container"></div>
                    </div>
                    <div class="modal-footer">
                        <button @click="guardarCasa">Agregar</button>
                    </div>
                </div>
            </div>
        </div>
        <alerta v-if="mostrandoAlerta == true" :mensaje="mensaje" :error="err" />
    </div>
</template>

<script setup>
import { ref } from 'vue'
import { generalStore } from '@/store'
import alerta from '@/components/complementos-componentes/alerta.vue';
import axios from 'axios';
import { supabase } from '@/lib/supabaseClient';

const fechaInicio = ref('')
const fechaFinal = ref('')
const dias = ref(0)
const serviciosC = ref([])
const ubicacionActual = ref([])
const ubicacion = ref('')
const ciudad = ref('')
const categoria = ref('Selecciona la categoria')
const baseRental = ref(0)
const seguridad = ref(0)
const etiqueta = ref('')
const etiquetas = ref('')
const cancelacion = ref(0)
const categorias = ref('')
const mapa = ref()
const pisos = ref(0)
const banios = ref(0)
const habitaciones = ref(0)
const store = generalStore()
const mensaje = ref('')
const nombreDoc = ref('')
const fileDoc = ref('')
const mostrandoAlerta = ref(false)
const err = ref('false')
const fotosNombres = ref('')
const fotosFiles = ref('')
const services = ref('')

if ("geolocation" in navigator) {
    /**CODIGO SI EL NAVEGADOR PERMITE LA UBICACION */
    navigator.geolocation.getCurrentPosition(ubicacionOK => {
        /**CODIGO FUNCION SI HAY ERRORES EN LA OBTENCIÓN DE LA UBICACION */
        ubicacionActual.value.push(ubicacionOK.coords.longitude)
        ubicacionActual.value.push(ubicacionOK.coords.latitude)
        store.cargarMapa(mapa.value, ubicacionActual.value, 16, 'Casa')
    }, () => {
        /**CODIGO FUNCION SI HAY ERRORES EN LA OBTENCIÓN DE LA UBICACION */
        /**Si no obtenemos la ubicación, mandamos una ubicación generica, para no quitar la posibilidad de usar el servicio */
        store.cargarMapa(mapa.value, [-87.1999111, 14.1110500], 15, 'Casa')
    },
        {
            /**Indicamos alta precisión en la obtención de la ubicación */
            enableHighAccuracy: true,
            timeout: 5000,
            maximumAge: 30000
        })
}

const buscarDestino = () => {
    const parametros = {
        'limit': 1,
        'proximity': store.ubicacionCasa,
        'access_token': store.apikey,
        'language': 'es',
        'country': 'hn'
    }
    setTimeout(() => {
        axios.get('https://api.mapbox.com/geocoding/v5/mapbox.places/' + store.ubicacionCasa + '.json', {
            params: parametros
        }
        ).then(respuesta => {
            ubicacion.value = respuesta['data']['features'][0]['place_name']
            ciudad.value = respuesta['data']['features'][0]['context'][1]['text']
            console.log(ubicacion.value)
        }).catch(error => {
            mensaje.value = error
            err.value = 'true'
            usarAlerta()
        })
    }, 1300)
}

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

const usarAlerta = () => {
    mostrandoAlerta.value = !mostrandoAlerta.value
    setTimeout(() => { mostrandoAlerta.value = !mostrandoAlerta.value; }, 1900);
}

const cargarCategorias = async () => {
    try {
        let { data: categories, error } = await supabase
            .from('categories')
            .select('*')

        if (error) {
            mensaje.value = error
            err.value = 'true'
            usarAlerta()
        } else {
            categorias.value = categories
        }
    } catch (error) {
        mensaje.value = error
        err.value = 'true'
        usarAlerta()
    }
}
cargarCategorias()

const asignarFotos = async (event) => {
    fotosNombres.value = [event.target.files[0].name, event.target.files[1].name, event.target.files[2].name, event.target.files[3].name, event.target.files[4].name]
    fotosFiles.value = [event.target.files[0], event.target.files[1], event.target.files[2], event.target.files[3], event.target.files[4]]
}

const asignarDoc = async () => {
    nombreDoc.value = event.target.files[0].name
    fileDoc.value = event.target.files[0]
}

const agregar = (servicio) => {
    if (serviciosC.value == []) {
        serviciosC.value = servicio
    } else {
        (serviciosC.value).push(servicio)
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
            mensaje.value = error
            err.value = 'true'
            usarAlerta()
        }
        else {
            services.value = data.filter(filtro => filtro.itemname == 'Casa')
        }
    } catch (error) {
        mensaje.value = error
        err.value = 'true'
        usarAlerta()
    }
}
cargarServices()

/**
* dev: Oned Gómez
* Función para arrastrar todas las tags de la base de datos
*/
const cargarTags = async () => {
    try {
        let { data, error } = await supabase
            .rpc('seleccionartags')

        if (error) {
            mensaje.value = error
            err.value = 'true'
            usarAlerta()
        }
        else {
            etiquetas.value = data
        }
    } catch (error) {
        mensaje.value = error
        err.value = 'true'
        usarAlerta()
    }
}
cargarTags()

const guardarCasa = async () => {
    try {
        if (ubicacion.value !== '' && ciudad.value !== '') {
            if (baseRental.value > 0) {
                if (categoria.value !== '') {
                    if (etiqueta.value !== '') {
                        if (pisos.value > 0 && banios.value > 0 && habitaciones.value > 0) {
                            if ((fotosFiles.value).length == 5) {
                                const url1 = await store.subirArchivo(fotosNombres.value[0], 'photos/houses', fotosFiles.value[0])
                                const url2 = await store.subirArchivo(fotosNombres.value[1], 'photos/houses', fotosFiles.value[1])
                                const url3 = await store.subirArchivo(fotosNombres.value[2], 'photos/houses', fotosFiles.value[2])
                                const url4 = await store.subirArchivo(fotosNombres.value[3], 'photos/houses', fotosFiles.value[3])
                                const url5 = await store.subirArchivo(fotosNombres.value[4], 'photos/houses', fotosFiles.value[4])
                                const apartmentCode = store.encriptar((url1 + '-' + ubicacion.value + '-' + ciudad.value + '-' + store.ubicacionCasa), 'Casa')
                                const { data, error } = await supabase
                                    .from('apartments')
                                    .insert([
                                        {
                                            apartmentcode: apartmentCode,
                                            coords: store.ubicacionCasa,
                                            city: ciudad.value,
                                            rating: 0,
                                            baserentalprice: baseRental.value,
                                            urlphoto: url1['publicUrl'] + ',' + url2['publicUrl'] + ',' + url3['publicUrl'] + ',' + url4['publicUrl'] + ',' + url5['publicUrl'],
                                            securitydeposit: seguridad.value,
                                            cancellationprotection: cancelacion.value,
                                            categorycode: categoria.value
                                        },
                                    ])

                                if (error) {
                                    mensaje.value = error
                                    err.value = 'true'
                                    usarAlerta()
                                } else {
                                    guardarDetallesCasa(apartmentCode)
                                    documentosCasa(apartmentCode)
                                    guardarServiciosCasa(apartmentCode)
                                }
                            } else {
                                mensaje.value = 'Debes seleccionar 5 fotografías'
                                err.value = 'true'
                                usarAlerta()
                            }
                        } else {
                            mensaje.value = 'Brinda la información de los pisos, baños y habitaciones'
                            err.value = 'true'
                            usarAlerta()
                        }
                    } else {
                        mensaje.value = 'Indica la Etiqueta de la casa'
                        err.value = 'true'
                        usarAlerta()
                    }
                } else {
                    mensaje.value = 'Indica la categoria de la casa'
                    err.value = 'true'
                    usarAlerta()
                }
            } else {
                mensaje.value = 'Indica el valor base de renta'
                err.value = 'true'
                usarAlerta()
            }
        } else {
            mensaje.value = 'Selecciona en el mapa la ubicación de la casa'
            err.value = 'true'
            usarAlerta()
        }
    } catch (error) {
        mensaje.value = error
        err.value = 'true'
        usarAlerta()
    }
}

const guardarDetallesCasa = async (code) => {
    try {
        const { data, error } = await supabase
            .from('detailsapartment')
            .insert([
                {
                    location: ubicacion.value,
                    floornum: pisos.value,
                    numrooms: habitaciones.value,
                    numbathrooms: banios.value,
                    apartmentcode: code,
                    tagcode: etiqueta.value
                },
            ])
        if (error) {
            mensaje.value = error
            err.value = 'true'
            usarAlerta()
        }
    } catch (error) {
        mensaje.value = error
        err.value = 'true'
        usarAlerta()
    }
}

const guardarServiciosCasa = async (code) => {
    try {
        for (var i = 0; i < 5; i++) {
            const { data, error } = await supabase
                .from('servicesapartment')
                .insert([
                    {
                        apartmentcode: code,
                        servicecode: serviciosC.value[i]
                    },
                ])
            if (error) {
                mensaje.value = error
                err.value = 'true'
                usarAlerta()
            } else {
                mensaje.value = 'Casa agregada exitosamente'
                err.value = 'false'
                usarAlerta()
            }
        }
    } catch (error) {
        mensaje.value = error
        err.value = 'true'
        usarAlerta()
    }
}

const documentosCasa = async (code) => {
    try {
        if (nombreDoc.value !== '') {
            const url = await store.subirArchivo(nombreDoc.value, 'documents/property-deed', fileDoc.value)
            const { data, error } = await supabase
                .from('apartmentdocuments')
                .insert([
                    { urlpropertydeed: url['publicUrl'], apartmentcode: code },
                ])
            if (error) {
                mensaje.value = error
                err.value = 'true'
                usarAlerta()
            }
        } else {
            mensaje.value = 'Selecciona el documento de propiedad de la casa'
            err.value = 'false'
            usarAlerta()
        }
    } catch (error) {
        mensaje.value = error
        err.value = 'true'
        usarAlerta()
    }
}
</script>

<style scoped>
* {
    font-family: 'fredoka-family';
    font-size: calc(.5em + .45vw) !important;
}

.servicios {
    flex-direction: column;
}

.btn-close:focus {
    box-shadow: none;
    border: none;
}

.form-check {
    margin-right: 15px;
}

.emitida-por {

    justify-content: space-around;
}

.numbers {
    margin-right: 12px;
}

.input-label {
    flex-direction: column;
}

#mapa-casa {
    height: 250px;
}

.espacio-mapa {
    width: 100%
}

.grupo-datos {
    margin-top: 20px;
}

.selects {
    width: 100%;
    justify-content: space-evenly;
}

select {
    width: 100% !important;
}

.input-group-text {
    background-color: #ff475e;
    padding: 0.375rem 0.95rem;
    border: none;
    border-radius: 0;
}

.form-control {
    border-radius: 0 25px 24px 0;
    width: 100%;
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
    margin: auto 20px 20px 0;
    width: auto;
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
    background-color: #ff475e !important;
    color: #fff !important;
}

.grupos {
    justify-content: space-between;
    align-items: center;
}

/*Estilos CSS creados*/

.button {
    background: linear-gradient(90deg, #ff475e, #6907f2);
    width: 100%;
    border-radius: 0 0 calc(1em + 0.1vw) calc(1em + 0.1vw);
    color: #fff;
    font-weight: 600;
    font-size: calc(.5em + .95vw);
    text-align: center;
    font-family: 'fredoka-family';
    transition: all 300ms ease-in;
}

.button:hover {
    cursor: pointer;
    background: linear-gradient(90deg, #ff475e, #ff475e);
    transition: all 300ms ease-out;
}

.modal-footer {
    padding: 0;
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