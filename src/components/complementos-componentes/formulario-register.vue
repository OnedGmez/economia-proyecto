<template>
    <div class="grupo-datos datos-personales">
        <span class="nombre-grupo">Datos personales</span>
        <div class="d-flex grupos fechas">
            <div class="input-group">
                <span class="input-group-text" id="DNI-input"></span>
                <input type="text" v-model="DNI" maxlength="15" @keyup="enmascarar('DNI')" class="form-control" autofocus
                    placeholder="DNI (ej: 0000-0000-00000)" aria-label="DNI" aria-describedby="DNI-input">
            </div>
            <div class="d-flex input-label input-group">
                <label for="fecha-input">Fecha de nacimiento</label>
                <div class="d-flex">
                    <span class="input-group-text" id="fecha-input"></span>
                    <input v-model="Nacimiento" type="date" class="form-control" :max="fechaAceptada" aria-label="fecha"
                        aria-describedby="fecha-input">
                </div>
            </div>
        </div>
        <div class="d-flex grupos nombres">
            <div class="input-group">
                <span class="input-group-text" id="pnombre-input"></span>
                <input type="text" v-model="Pnombre" class="form-control" placeholder="Primer nombre" aria-label="pnombre"
                    aria-describedby="pnombre-input">
            </div>
            <div class="input-group">
                <span class="input-group-text" id="Snombre-input"></span>
                <input type="text" v-model="Snombre" class="form-control" placeholder="Segundo Nombre" aria-label="Snombre"
                    aria-describedby="Snombre-input">
            </div>
        </div>
        <div class="d-flex grupos apellidos">
            <div class="input-group">
                <span class="input-group-text" id="Apellidop-input"></span>
                <input type="text" v-model="apellidoP" class="form-control" placeholder="Apellido paterno"
                    aria-label="Apellidop" aria-describedby="Apellidop-input">
            </div>
            <div class="input-group">
                <span class="input-group-text" id="Apellidom-input"></span>
                <input type="text" v-model="apellidoM" class="form-control" placeholder="Apellido materno"
                    aria-label="Apellidom" aria-describedby="Apellidom-input">
            </div>
        </div>

        <div class="d-flex grupos">
            <div class="d-flex genero">
                <div class="form-check">
                    <input class="form-check-input" v-model="genero" value="M" type="radio" name="flexRadioDefault"
                        id="flexRadioDefault1">
                    <label class="form-check-label" for="flexRadioDefault1">
                        Masculino
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" v-model="genero" value="F" type="radio" name="flexRadioDefault"
                        id="flexRadioDefault1">
                    <label class="form-check-label" for="flexRadioDefault1">
                        Femenino
                    </label>
                </div>
            </div>
            <div class="input-group d-flex input-label">
                <label for="fecha-input">Foto de perfíl</label>
                <div class="d-flex">
                    <span class="input-group-text" id="foto-input"></span>
                    <input type="file" class="form-control" @change="asignarFoto" placeholder="Foto de perfíl"
                        aria-label="Foto perfíl" aria-describedby="Foto-input" accept="image/png, image/jpeg">
                </div>
            </div>
        </div>
    </div>

    <span class="separador"></span>
    <div class="grupo-datos información-documentos">
        <span class="nombre-grupo">Documentos</span>
        <div class="d-flex grupos">
            <div class="input-group d-flex input-label">
                <label for="fecha-input">Licencia de conducir</label>
                <div class="d-flex">
                    <span class="input-group-text" id="licencia-input"></span>
                    <input type="file" @change="asignarLicencia" class="form-control" placeholder="Licencia"
                        aria-label="Licencia de conducir" aria-describedby="licencia-input" accept=".pdf">
                </div>
            </div>
            <div class="input-group d-flex input-label">
                <label for="fecha-input">Registro judicial</label>
                <div class="d-flex">
                    <span class="input-group-text" id="judicial-input"></span>
                    <input type="file" class="form-control" @change="asignarJudicial" placeholder="Registro judicial"
                        aria-label="Registro judicial" aria-describedby="Foto-input" accept=".pdf">
                </div>
            </div>
        </div>
        <div class="input-group d-flex input-label grupos">
            <label for="fecha-input">Registro penal</label>
            <div class="d-flex">
                <span class="input-group-text" id="penal-input"></span>
                <input type="file" class="form-control" @change="asignarPenal" placeholder="Registro penal"
                    aria-label="Registro penal" aria-describedby="penal-input" accept=".pdf">
            </div>
        </div>
    </div>

    <span class="separador"></span>
    <div class="grupo-datos información-contacto">
        <span class="nombre-grupo">Información de contacto</span>
        <div class="d-flex grupos">
            <div class="input-group">
                <span class="input-group-text" id="correo-input"></span>
                <input type="text" class="form-control" v-model="correo" placeholder="Correo electrónico"
                    aria-label="correo" aria-describedby="correo-input">
            </div>
            <div class="input-group">
                <span class="input-group-text" id="telefono-input"></span>
                <input type="text" @keyup="enmascarar('Telefono')" maxlength="13" class="form-control" v-model="telefono"
                    placeholder="Número de telefóno (ej: 504 0000-0000)" aria-label="telefono"
                    aria-describedby="telefono-input">
            </div>
        </div>
    </div>

    <span class="separador"></span>
    <div class="grupo-datos datos-pago">
        <span class="nombre-grupo">Información de pago</span>
        <div class="d-flex grupos">
            <div class="input-group">
                <span class="input-group-text" id="tarjeta-input"></span>
                <input @keyup="enmascarar('Tarjeta')" maxlength="19" type="text" class="form-control" v-model="tarjetaBin"
                    placeholder="Número de tarjeta (ej: 0000 0000 0000 0000)" aria-label="tarjeta"
                    aria-describedby="tarjeta-input">
            </div>
            <div class="input-group">
                <span class="input-group-text" id="titular-input"></span>
                <input type="text" class="form-control" v-model="titular" placeholder="Nombre del titular"
                    aria-label="titular" aria-describedby="titular-input">
            </div>
        </div>
        <div class="seguridad d-flex grupos">
            <div class="d-flex input-group input-label">
                <label for="vencimiento-input">Fecha de vencimiento</label>
                <div class="d-flex">
                    <span class="input-group-text" id="vencimiento-input"></span>
                    <input type="text" class="form-control" v-model="vencimiento" placeholder="aaaa/mm" aria-label="correo"
                        aria-describedby="correo-input">
                </div>
            </div>
            <div class="input-group">
                <span class="input-group-text" id="cvv-input"></span>
                <input type="text" class="form-control" v-model="cvv" placeholder="CVV" aria-label="cvv"
                    aria-describedby="cvv-input">
            </div>
            <div class="input-group">
                <span class="input-group-text" id="cvv-input"></span>
                <input type="text" class="form-control" v-model="pin" maxlength="3" placeholder="ping" aria-label="pin"
                    aria-describedby="pin-input">
            </div>
        </div>
    </div>
    <div @click="registrar" class="button">
        Registrarme
    </div>
    <alerta v-if="mostrandoAlerta == true" :mensaje="mensaje" :error="err" />
</template>

<script setup>
import { ref } from 'vue';
import alerta from './alerta.vue';
import { generalStore } from '@/store';
import { supabase } from '@/lib/supabaseClient';
import { SHA256 } from 'crypto-js'

const date = new Date();
const fechaAceptada = String(date.getFullYear() - 18) + '-' + String(date.getMonth() + 1).padStart(2, '0') + '-' + String(date.getDate()).padStart(2, '0');
const fechaActual = String(date.getFullYear()) + '-' + String(date.getMonth() + 1).padStart(2, '0') + '-' + String(date.getDate()).padStart(2, '0');
const anio = String(date.getFullYear())

var fechaFin = new Date(fechaActual).getTime();
const store = generalStore()

const emisiones = defineEmits([
    'cerrarmodal'
])

const mensaje = ref('')
const err = ref('')
const mostrandoAlerta = ref(false)

const DNI = ref('')
const Nacimiento = ref('')
const Pnombre = ref('')
const Snombre = ref('')
const apellidoP = ref('')
const apellidoM = ref('')
const genero = ref('')
const pais = ref('HN')
const fotoPerfilFile = ref('')
const fotoPerfilNombre = ref('')
const licenciaFile = ref('')
const licenciaNombre = ref('')
const judicialFile = ref('')
const judicialNombre = ref('')
const penalFile = ref('')
const penalNombre = ref('')
const correo = ref('')
const telefono = ref('')
const tarjetaBin = ref('')
const titular = ref('')
const vencimiento = ref('')
const cvv = ref('')
const pin = ref('')
const urlLicense = ref('')
const urlPenal = ref('')
const urlJudicial = ref('')

const asignarFoto = async (event) => {
    fotoPerfilNombre.value = event.target.files[0].name
    fotoPerfilFile.value = event.target.files[0]
}

const asignarLicencia = async (event) => {
    licenciaNombre.value = event.target.files[0].name
    licenciaFile.value = event.target.files[0]
}

const asignarJudicial = async (event) => {
    judicialNombre.value = event.target.files[0].name
    judicialFile.value = event.target.files[0]
}

const asignarPenal = async (event) => {
    penalNombre.value = event.target.files[0].name
    penalFile.value = event.target.files[0]
}

const enmascarar = (campo) => {
    if (campo == 'DNI') {
        if ((DNI.value).length == 4) {
            DNI.value = DNI.value + '-'
        }

        if ((DNI.value).length == 9) {
            DNI.value = DNI.value + '-'
        }
    }

    if (campo == 'Telefono') {
        if ((telefono.value).length == 3) {
            telefono.value = telefono.value + ' '
        }

        if ((telefono.value).length == 8) {
            telefono.value = telefono.value + '-'
        }
    }

    if (campo == 'Tarjeta') {
        if ((tarjetaBin.value).length == 4) {
            tarjetaBin.value = tarjetaBin.value + ' '
        }

        if ((tarjetaBin.value).length == 9) {
            tarjetaBin.value = tarjetaBin.value + ' '
        }

        if ((tarjetaBin.value).length == 14) {
            tarjetaBin.value = tarjetaBin.value + ' '
        }
    }
}


const registrar = async () => {
    if (DNI.value !== '' && (DNI.value).length == 15) {
        if (Nacimiento.value !== '') {
            var fechaInicio = new Date(Nacimiento.value).getTime();
            if (Pnombre.value !== '' && apellidoP.value !== '') {
                if (genero.value !== '') {
                    if (pais.value !== '') {
                        if (fotoPerfilFile.value !== '' && fotoPerfilNombre.value !== '') {
                            if (licenciaNombre.value !== '') {
                                if (judicialNombre.value !== '') {
                                    if (penalNombre.value !== '') {
                                        if (tarjetaBin.value !== '' && (tarjetaBin.value).length == 19) {
                                            if (titular.value !== '') {
                                                if (vencimiento.value !== '') {
                                                    if (cvv.value !== '') {
                                                        if (telefono.value !== '') {
                                                            if (correo.value !== '') {
                                                                if (store.validarCorreo(correo.value) == true || store.validarCorreo(correo.value) == 'true') {
                                                                    const url = await store.subirArchivo(fotoPerfilNombre.value, 'photos/users', fotoPerfilFile.value)
                                                                    try {
                                                                        const { data, error } = await supabase
                                                                            .from('persons')
                                                                            .insert([
                                                                                {
                                                                                    dni: DNI.value,
                                                                                    firstname: Pnombre.value,
                                                                                    secondname: Snombre.value,
                                                                                    paternalsurname: apellidoP.value,
                                                                                    motherlastname: apellidoM.value,
                                                                                    dayofbirth: Nacimiento.value,
                                                                                    age: Math.round((fechaFin - fechaInicio) / (1000 * 60 * 60 * 24 * 365)),
                                                                                    gender: genero.value,
                                                                                    urlprofilephoto: url['publicUrl'],
                                                                                    countrycode: pais.value
                                                                                },
                                                                            ])

                                                                        if (error) {
                                                                            console.log(error)
                                                                        } else {
                                                                            guardarCliente()
                                                                            guardarDocumentos()
                                                                            guardarContact()
                                                                            guardarTarjeta()
                                                                            registrarCrendenciales()
                                                                        }

                                                                    } catch (error) {
                                                                        mensaje.value = error
                                                                        err.value = 'true'
                                                                        usarAlerta()
                                                                    }
                                                                } else {
                                                                    mensaje.value = "Proporciona un correo valido"
                                                                    err.value = 'true'
                                                                    usarAlerta()
                                                                }
                                                            } else {
                                                                mensaje.value = "Proporciona tu correo"
                                                                err.value = 'true'
                                                                usarAlerta()
                                                            }
                                                        } else {
                                                            mensaje.value = "Proporciona tu telefono"
                                                            err.value = 'true'
                                                            usarAlerta()
                                                        }
                                                    } else {
                                                        mensaje.value = "Proporciona el cvv de tu tarjeta"
                                                        err.value = 'true'
                                                        usarAlerta()
                                                    }
                                                } else {
                                                    mensaje.value = "Proporciona la fecha de vencimiento de tu tarjeta"
                                                    err.value = 'true'
                                                    usarAlerta()
                                                }
                                            } else {
                                                mensaje.value = "Proporciona el titular de tu tarjeta"
                                                err.value = 'true'
                                                usarAlerta()
                                            }
                                        } else {
                                            mensaje.value = "Proporciona el Bin de tu tarjeta"
                                            err.value = 'true'
                                            usarAlerta()
                                        }
                                    } else {
                                        mensaje.value = "Proporciona el pdf con tus antecedentes penales"
                                        err.value = 'true'
                                        usarAlerta()
                                    }
                                } else {
                                    mensaje.value = "Proporciona el pdf con tus antecedentes judiciales"
                                    err.value = 'true'
                                    usarAlerta()
                                }
                            } else {
                                mensaje.value = "Proporciona el pdf con tu licencia"
                                err.value = 'true'
                                usarAlerta()
                            }
                        } else {
                            mensaje.value = "Selecciona tu foto de perfil"
                            err.value = 'true'
                            usarAlerta()
                        }
                    } else {
                        mensaje.value = "Debes proporcionar tu país de origen"
                        err.value = 'true'
                        usarAlerta()
                    }
                } else {
                    mensaje.value = "Debes proporcionar la información sobre tu genéro"
                    err.value = 'true'
                    usarAlerta()
                }
            } else {
                mensaje.value = "Debes proporcionar al menos tu primer nombre y apellido paterno"
                err.value = 'true'
                usarAlerta()
            }
        } else {
            mensaje.value = "Debes proporcionar tu fecha de nacimiento"
            err.value = 'true'
            usarAlerta()
        }
    } else {
        mensaje.value = "Debes proporcionar tu DNI"
        err.value = 'true'
        usarAlerta()
    }
}

const usarAlerta = () => {
    mostrandoAlerta.value = !mostrandoAlerta.value
    setTimeout(() => { mostrandoAlerta.value = !mostrandoAlerta.value; }, 1900);
}

const usarAlertaCorreo = () => {
    mostrandoAlerta.value = !mostrandoAlerta.value
    setTimeout(() => { mostrandoAlerta.value = !mostrandoAlerta.value; emisiones('cerrarmodal') }, 10000);
}


const guardarDocumentos = async () => {
    try {
        urlLicense.value = await store.subirArchivo(licenciaNombre.value, 'documents/driver-licences', licenciaFile.value)
        urlPenal.value = await store.subirArchivo(penalNombre.value, 'documents/task-history', penalFile.value)
        urlJudicial.value = await store.subirArchivo(judicialNombre.value, 'documents/court-registry', judicialFile.value)
        const documentCode = (store.encriptar((DNI.value + '-' + Nacimiento.value), 'codeDocument')).substring(1, 25)
        const { data, error } = await supabase
            .from('documentsperson')
            .insert([
                {
                    documentcode: documentCode,
                    urldriverlicense: urlLicense.value['publicUrl'],
                    urltaskhistory: urlPenal.value['publicUrl'],
                    urlcourtregistry: urlJudicial.value['publicUrl'],
                    validated: '0',
                    dni: DNI.value
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

const guardarContact = async () => {
    try {
        const contactcode = (store.encriptar((DNI.value + '-' + telefono.value + '-' + correo.value + '-' + Pnombre.value), 'contactcode'))
        const { data, error } = await supabase
            .from('contactinformation')
            .insert([
                {
                    contactcode: contactcode,
                    emailaddress: correo.value,
                    telephonenumber: telefono.value,
                    dni: DNI.value
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

const guardarTarjeta = async () => {
    try {
        const { data, error } = await supabase
            .from('cards')
            .insert([
                {
                    bincard: tarjetaBin.value,
                    cardpin: pin.value,
                    expirationdate: vencimiento.value,
                    ownername: titular.value,
                    cvv: cvv.value,
                    balance: 15000,
                    dni: DNI.value
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

const guardarCliente = async () => {
    try {
        const codigo = store.encriptar((Pnombre.value + '-' + '-' + fechaActual + '-' + DNI.value), 'cliente')
        const { data, error } = await supabase
            .from('clientpersons')
            .insert([
                {
                    clientcode: codigo,
                    registerdate: fechaActual,
                    avgrating: 0,
                    numservicescontracted: 0,
                    dni: DNI.value
                },
            ])
        if (error) {
            console.log(error)
            mensaje.value = error
            err.value = 'true'
            usarAlerta()
        }
    } catch (error) {
        console.log(error)
        mensaje.value = error
        err.value = 'true'
        usarAlerta()
    }
}


const registrarCrendenciales = async () => {
    try {
        const mensajeCorreo = 'Ya puedes disfrutar de nuestras ofertas, tus credenciales son: \n usuario: ' + (Pnombre.value).toLowerCase() + (apellidoP.value).substring(1, 3).toLowerCase() + ' \n Contraseña: ' + Pnombre.value
        const { data, error } = await supabase
            .from('login')
            .insert([
                {
                    username: (Pnombre.value).toLowerCase() + (apellidoP.value).substring(1, 3).toLowerCase(),
                    password: (SHA256(Pnombre.value)).toString(),
                    rol: 'Cliente',
                    dni: DNI.value
                },
            ])

        if (error) {
            mensaje.value = error
            err.value = 'true'
            usarAlerta()
        } else {
            mensaje.value = mensajeCorreo
            err.value = 'false'
            usarAlertaCorreo()
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
}

.form-check {
    margin-right: 15px;
}

.emitida-por {

    justify-content: space-around;
}

.input-label {
    flex-direction: column;
}

.grupo-datos {
    margin-top: 20px;
}

.input-group-text {
    background-color: #ff475e;
    padding: 0.375rem 0.95rem;
    border: none;
    border-radius: 0;
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
    margin: auto 20px 20px 0;
    width: 45%;
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