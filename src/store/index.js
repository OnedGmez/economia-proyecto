import { defineStore } from 'pinia'
import { ref, watchEffect } from 'vue'
import { usuarioStore } from './user.js';
import { supabase } from '@/lib/supabaseClient'
import mapboxgl from 'mapbox-gl'; // or "const mapboxgl = require('mapbox-gl');"
import 'mapbox-gl/dist/mapbox-gl.css';
import axios from 'axios';
import CryptoJS from 'crypto-js'

const apikey = 'pk.eyJ1Ijoib25lZGdtZXoiLCJhIjoiY2xnaWx0OHJrMHdsczNycG50b2VpcXFuaSJ9.VyY3HkNgaG3Ex3oOJQ-SIg'
mapboxgl.accessToken = apikey;
let map = mapboxgl.Map
let marcadorLocalizacion = mapboxgl.Marker
let marcadorLocalizacionfinal = mapboxgl.Marker
let marcadorUber = mapboxgl.Marker

localStorage.setItem('ruta-generada-bool', false)
localStorage.setItem('uber-buscado-bool', false)
const distanciaViaje = ref('')
const duracionViaje = ref('')
const dataNoFiltradaCasas = ref('')
const dataCompletaCasas = ref([])
const dataTags = ref('')
const ubicacionCasa = ref([])

export const generalStore = defineStore('store', () => {

  const userStore = usuarioStore()

  const cargarMapa = (contenedor, ubicacionCarga, valorZoom, zona) => {
    map = new mapboxgl.Map({
      container: contenedor, // container ID
      style: 'mapbox://styles/mapbox/outdoors-v12', // style URL
      center: ubicacionCarga, // starting position [lng, lat]
      zoom: valorZoom
    });
    //const popUpLocalizacion = new Mapboxgl.Popup().setLngLat([-74.5, 40]).setHTML(`<p>Yo</p>`).addTo(map) PERSONALIZAR
    marcadorLocalizacion = new mapboxgl.Marker({
      color: '#6907f2',
      draggable: false
    }).setLngLat(ubicacionCarga).addTo(map)

    if (zona == 'Casa') {
      map.on('click', (e) => {
        ubicacionCasa.value = [(e.lngLat)['lng'], (e.lngLat)['lat']]
        marcadorLocalizacion.remove();
        marcadorLocalizacion = new mapboxgl.Marker({
          color: '#6907f2',
          draggable: false
        }).setLngLat(ubicacionCasa.value).addTo(map)
      })
    }
  }

  const moverCamMapa = (ubicacion, zoom) => {
    map.flyTo({
      center: ubicacion,
      zoom: zoom
    })
  }

  const crearMarker = (ubicaciones, tipo) => {
    if (tipo == 'Vehiculos') {
      ubicaciones.forEach(ubicacion => {
        marcadorLocalizacion = new mapboxgl.Marker({
          color: '#6907f2'
        }).setLngLat(ubicacion).addTo(map)
      })
    };


    if (tipo == 'Origen') {
      if (localStorage.getItem('ruta-generada-bool') == true || localStorage.getItem('ruta-generada-bool') == 'true') {
        marcadorLocalizacionfinal.remove();
        localStorage.setItem('ruta-generada-bool', false)
      }
      if (localStorage.getItem('uber-buscado-bool') == true || localStorage.getItem('uber-buscado-bool') == 'true') {
        marcadorUber.remove();
        localStorage.setItem('uber-buscado-bool', false)
      }

      moverCamMapa(ubicaciones[0], 15)
      marcadorLocalizacion.remove();
      marcadorLocalizacion = new mapboxgl.Marker({
        color: '#6907f2',
        draggable: false
      }).setLngLat(ubicaciones[0]).addTo(map)
    }

    if (tipo == 'Uber') {
      if (localStorage.getItem('uber-buscado-bool') == true || localStorage.getItem('uber-buscado-bool') == 'true') {
        marcadorUber.remove();
        localStorage.setItem('uber-buscado-bool', false)
      }

      marcadorUber = new mapboxgl.Marker({
        color: '#000',
        draggable: false
      }).setLngLat(ubicaciones[0]).addTo(map)
    }


    if (tipo == 'Destino') {
      if (localStorage.getItem('ruta-generada-bool') == false || localStorage.getItem('ruta-generada-bool') == 'false') {
        marcadorLocalizacionfinal = new mapboxgl.Marker({
          color: '#ff475e',
          draggable: false
        }).setLngLat(ubicaciones[(ubicaciones).length - 1]).addTo(map)
      } else {
        moverCamMapa(ubicaciones[0], 15)
        localStorage.setItem('ruta-generada-bool', false)
        marcadorLocalizacionfinal.remove();
        marcadorLocalizacionfinal = new mapboxgl.Marker({
          color: '#ff475e',
          draggable: false
        }).setLngLat(ubicaciones[(ubicaciones).length - 1]).addTo(map)
      }
    }
  }

  const generarRuta = (ubicaciones) => {
    const parametros = {
      'alternatives': false,
      'geometries': 'geojson',
      'overview': 'simplified',
      'access_token': apikey
    }

    const puntos = ref('')
    const ruta = ref('')

    if ((ubicaciones).length > 2) {
      crearMarker(ubicaciones, 'Uber')
      localStorage.setItem('uber-buscado-bool', true)
    }
    for (const ubicacion of ubicaciones) {
      if (puntos.value == '') {
        puntos.value = ubicacion
      } else {
        puntos.value = puntos.value + ';' + ubicacion
      }
    }

    axios.get('https://api.mapbox.com/directions/v5/mapbox/driving/' + puntos.value, {
      params: parametros
    }).then(respuesta => {
      duracionViaje.value = respuesta.data['routes'][0]['duration']
      distanciaViaje.value = respuesta.data['routes'][0]['distance']
      localStorage.setItem('duracion', CryptoJS.AES.encrypt((duracionViaje.value).toString(), 'duracion').toString())
      localStorage.setItem('distancia', CryptoJS.AES.encrypt((distanciaViaje.value).toString(), 'distancia').toString())
      ruta.value = respuesta.data['routes'][0].geometry.coordinates
      crearMarker(ubicaciones, 'Destino')
      if (map.getLayer('ruta-layer')) {
        map.removeLayer('ruta-layer');
        map.removeSource('ruta');
      }

      map.addSource('ruta', {
        type: 'geojson',
        data: {
          type: 'Feature',
          properties: {},
          geometry: {
            type: 'LineString',
            coordinates: ruta.value
          }
        }
      });

      map.addLayer({
        id: 'ruta-layer',
        type: 'line',
        source: 'ruta',
        layout: {
          'line-join': 'round',
          'line-cap': 'round'
        },
        paint: {
          'line-color': '#ff475e',
          'line-width': 5.5
        }
      });

      if (localStorage.getItem('uber-buscado-bool') == false || localStorage.getItem('uber-buscado-bool') == 'false') {
        map.fitBounds([ruta.value[0], ruta.value[(ruta.value).length - 1]], {
          padding: 100
        })
      } else {
        map.fitBounds([ruta.value[0], ubicaciones[1]], {
          padding: 100
        })
      }
      localStorage.setItem('ruta-generada-bool', true)
    }).catch(error => {
      console.log(error)
    })
  }


  const subirArchivo = async (nombreA, carpeta, file) => {
    const rutaParcial = ref('')
    try {
      const ruta = carpeta + '/' + nombreA
      const { data, error } = await supabase
        .storage
        .from('digital-economy-file-server')
        .upload(ruta, file, {
          cacheControl: '3600',
          upsert: false
        })

      if (data !== '') {
        rutaParcial.value = data
      }
    } catch (error) {
      console.log(error)
    } finally {
      const { data } = supabase
        .storage
        .from('digital-economy-file-server')
        .getPublicUrl(rutaParcial.value['path'])
      return data
    }
  }

  const encriptar = (data, key) => {
    return CryptoJS.AES.encrypt(data, key).toString();
  }

  const desencriptar = (data, key) => {
    return CryptoJS.AES.decrypt(data, key).toString(CryptoJS.enc.Utf8);
  }

  const obtenerDistanciaTiempo = () => {
    axios.get('https://api.mapbox.com/directions/v5/mapbox/driving/' + + '?access_token=' + apikey)
  }

  const validarCorreo = (correo) => {
    if (/^\w+([.-_+]?\w+)*@\w+([.-]?\w+)*(\.\w{2,10})+$/.test(correo)) {
      return true
    } else {
      return false
    }
  }

  return {
    subirArchivo,
    cargarMapa,
    apikey,
    generarRuta,
    crearMarker,
    encriptar,
    desencriptar,
    dataNoFiltradaCasas,
    dataTags,
    validarCorreo,
    ubicacionCasa,
    dataCompletaCasas
  }
})