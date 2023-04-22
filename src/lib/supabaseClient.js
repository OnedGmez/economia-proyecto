// Importamos supabase
import { createClient } from '@supabase/supabase-js'

// Configuramos el URL de nuestro proyecto con su respectiva key
const anonKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImltcnJzbWt3YmhzbGR3Y3hnb3F2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODIxMzQ5MzEsImV4cCI6MTk5NzcxMDkzMX0.GM7d9937qOXZGHEsW_UQTB1Qobz_kNhDnhqhHuXI9Fw'
export const supabase = createClient('https://imrrsmkwbhsldwcxgoqv.supabase.co', anonKey)