import { defineStore } from 'pinia'
import {ref} from 'vue'

export const generalStore = defineStore('store', () => {
  const pathCategorias = 'https://rentaway-file-serve.s3.amazonaws.com/rentaway/categories/'
  const pathServicios = 'https://rentaway-file-serve.s3.amazonaws.com/rentaway/services/'

  return {
    pathCategorias,
    pathServicios
  }
})