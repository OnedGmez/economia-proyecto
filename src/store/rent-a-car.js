import { defineStore } from 'pinia'
import {ref} from 'vue'

export const rentCarStore = defineStore('rentCar', () => {
  const pathVehiculos = 'https://rentaway-file-serve.s3.amazonaws.com/rentaway/cars/'
  
  return {
    pathCategorias,
    pathServicios
  }
})