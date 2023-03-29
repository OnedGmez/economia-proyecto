<template>
    <div class="pagina">
        <div class="d-flex cabecera">
            <div class="logo">
                <div class="img">
                    <img class="img-fluid" src="../assets/img/logo.png" alt="Logo RentAway">
                </div>
            </div>
            <div class="busqueda">
                <barraBusqueda />
            </div>
            <div class="d-flex inicio-sesion">
                <div class="inicio-sesion-lenguaje">
                    <div class="img">
                        <img class="img-fluid" src="../assets/img/logo.png" alt="Logo RentAway">
                    </div>
                </div>
            </div>
        </div>
        <div class="zona-filtros">

        </div>
    </div>
</template>

<style scoped>
.pagina .cabecera {
    height: 65px;
    width: 100%;
    align-items: center;
    position: sticky;
    padding: 0 15px;
    margin: 10px 0;
}

.pagina .cabecera .logo {
    position: relative;
    flex: 1 0 165px;
}

.pagina .cabecera .logo .img {
    position: relative;
    width: fit-content;
}

.pagina .cabecera .logo img {
    width: 165px;
}

.pagina .cabecera .busqueda {
    position: relative;
    flex: 0 1 auto;
    min-width: 348px;
}

.pagina .cabecera .inicio-sesion {
    flex: 1 0 165px;
}
</style>

<script>
import barraBusqueda from '@/components/barraBusqueda.vue'

export default {
    name: "principal",
    components: {
        barraBusqueda
    }
}
</script>