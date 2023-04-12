<template>
  <div class="home">
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
        <div class="inicio-sesion">
          <div class="d-flex inicio-sesion-nombre">
            <div class="nombre-usuario">
              <span>$Nombre-Usuario</span>
            </div>
            <div class="avatar">
              <span><font-awesome-icon icon="user-tie" /></span>
            </div>
          </div>
        </div>
      </div>
      <div class="zona-filtros">
        <div class="categorias">
          <div class="categoria">
            
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import barraBusqueda from '@/components/barra-busqueda.vue'


export default {
  name: 'Home',
  components: {
    barraBusqueda
  }
}
</script>

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
  flex: 1 0 105px;
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
  min-width: 575px;
  margin: 0 15px;
}

.pagina .cabecera .inicio-sesion {
  position: relative;
  flex: 1 0 105px;
  justify-content: end;
}

.pagina .cabecera .inicio-sesion .inicio-sesion-nombre{
  justify-content: flex-end;
  align-items: center;
}

.pagina .cabecera .inicio-sesion .inicio-sesion-nombre .nombre-usuario{
  margin: 0 20px 0 0;
}

.pagina .cabecera .inicio-sesion .inicio-sesion-nombre .avatar{
  border-radius: 50%;
  background-color: #fe4b56;
  color: #fff;
  font-size: x-large;
  padding: 4px 12px;
}
</style>
