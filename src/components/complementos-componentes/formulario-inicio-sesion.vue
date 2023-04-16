<template>
    <div id="space-form" class="d-flex justify-content-center align-content-center flex-wrap">
        <div class="avatar d-flex align-content-center justify-content-center">
            <img class="img-fluid" src="../../assets/img/Icono.png" alt="Icono">
        </div>
        <div class="form d-flex">
            <div class="input-group">
                <span class="input-group-text" id="usuario-input"></span>
                <input type="text" class="form-control" autofocus required
                    placeholder="Usuario/Correo electrónico" aria-label="Usuario"
                    aria-describedby="usuario-input">
            </div>
            <div class="input-group">
                <span class="input-group-text" id="contra-input"></span>
                <input type="password" class="form-control" required
                    placeholder="Contraseña" aria-label="Contrasenia" aria-describedby="contra-input">
            </div>
            <a href="#">Olvidé mi contraseña</a>
        </div>
        <div @click="emisionInicioSesion" class="button">
            Iniciar Sesión
        </div>
    </div>
</template>

<script setup>
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

/*Media Querys*/
@media (max-width: 991.5px) {
    .form-control {
        font-size: calc(.9em + 0.15vw) !important;
    }
}
</style>