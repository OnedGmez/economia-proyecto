import { defineStore } from 'pinia'
import { ref } from 'vue'
import { supabase } from '@/lib/supabaseClient'

export const generalStore = defineStore('store', () => {


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

        if(data !== ''){
          rutaParcial.value = data
        }
    } catch (error) {
      console.log(error)
    } finally {
      const { data } = supabase
        .storage
        .from('digital-economy-file-server')
        .getPublicUrl(rutaParcial.value)
      
      return data
    }
  }


  return {
    subirArchivo
  }
})