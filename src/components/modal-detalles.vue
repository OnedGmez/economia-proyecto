<template>
    <div @keyup.esc="cerrarModal()" class="modal fade show" id="exampleModal" tabindex="-1"
        aria-labelledby="exampleModalLabel" data-bs-backdrop="static" aria-hidden="true" style="display: block">
        <div class="modal-dialog modal-dialog-centered modal-fullscreen-md-down modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <button @click="cerrarModal" type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class=" informacion">
                        <div v-if="vista == 'Home'" class="d-flex mosaico">
                            <div class="columna-prin">
                                <div class="img-casa">
                                    <img :src="require('../assets/img/img-pruebas/' + data['urlphoto'])"
                                        class="img-fluid img-top" alt="...">
                                </div>
                            </div>
                            <div class="columna-secundaria">
                                <div class="img-casa">
                                    <img :src="require('../assets/img/img-pruebas/' + data['urlphoto'])"
                                        class="img-fluid img-top" alt="...">
                                </div>
                                <div class="img-casa">
                                    <img :src="require('../assets/img/img-pruebas/' + data['urlphoto'])"
                                        class="img-fluid img-top" alt="...">
                                </div>
                            </div>
                            <div class="columna-tercearia">
                                <div class="img-casa">
                                    <img :src="require('../assets/img/img-pruebas/' + data['urlphoto'])"
                                        class="img-fluid img-top" alt="...">
                                </div>
                                <div class="img-casa">
                                    <img :src="require('../assets/img/img-pruebas/' + data['urlphoto'])"
                                        class="img-fluid img-top" alt="...">
                                </div>
                            </div>
                        </div>
                        <div v-if="vista == 'RentaCar'" class="img-carro">
                            <img src="https://rentaway-file-serve.s3.amazonaws.com/rentaway/photos/cars/carro_prueba.png"
                                alt="img" class="img-fluid">
                        </div>
                        <div v-if="vista == 'Home'" class="informacion-ubicacion">
                            <div class="localizacion">
                                <span class="icono"><font-awesome-icon icon="location-dot" /></span>
                                <span class="ubicacion">La Paz, La Paz, Honduras</span>
                            </div>
                            <div class="distancia">
                                <span>150 mts de distancia</span>
                            </div>
                        </div>
                        <div v-if="vista == 'RentaCar'" class="informacion-carro">
                            <div class="marca-carro">
                                <span>Nissan Versa</span>
                            </div>
                            <div class="categoria-tipo-carro">
                                <span class="texto"> Camioneta </span>
                                <span class="texto"> Familiar </span>
                            </div>
                            <div class="anio-carro">
                                <span class="tiempo"> Año: <span class="precio"> 2020</span></span>
                            </div>
                            <div class="color-carro">
                                <span class="tiempo"> Color: <span class="espacio-color"></span></span>
                            </div>
                        </div>
                        <div v-if="vista == 'Home'" class="d-flex descripcion-casa">
                            <div class="detalle">
                                <span class="icono"> <font-awesome-icon icon="bath" /> </span>
                                <span class="descripcion"> <span class="cantidad-descripcion">2</span> baño(s)</span>
                            </div>
                            <div class="detalle">
                                <span class="icono"> <font-awesome-icon icon="bed" /> </span>
                                <span class="descripcion"> <span class="cantidad-descripcion">2</span> habitaciones</span>
                            </div>
                            <div class="detalle">
                                <span class="icono"> <font-awesome-icon icon="building" /> </span>
                                <span class="descripcion"> <span class="cantidad-descripcion">2</span> piso(s)</span>
                            </div>
                        </div>
                        <div v-if="vista == 'RentaCar'" class="d-flex caracteristicas-carro">
                            <div class="d-flex basicas">
                                <div class="capacidad">
                                    <div class="icono">
                                        <span> <font-awesome-icon icon="user" /> </span>
                                    </div>
                                    <div class="descripcion">
                                        <span class="cantidad"> 4</span>
                                    </div>
                                </div>
                                <div class="transmition-type">
                                    <div class="img-caracteristica">
                                        <svg class="img-fluid" version="1.0" xmlns="http://www.w3.org/2000/svg"
                                            width="512.000000pt" height="512.000000pt" viewBox="0 0 512.000000 512.000000"
                                            preserveAspectRatio="xMidYMid meet">
                                            <g transform="translate(0.000000,512.000000) scale(0.100000,-0.100000)"
                                                fill="#000000" stroke="none">
                                                <path d="M3245 4529 c-475 -44 -906 -214 -1425 -563 -164 -110 -1637 -1212
-1699 -1270 -56 -53 -86 -101 -106 -168 -13 -48 -15 -157 -13 -930 l3 -876 30
-43 c19 -27 50 -54 84 -71 l53 -28 2024 0 2024 0 0 80 0 80 -2010 0 c-1977 0
-2010 0 -2029 19 -11 11 -23 35 -26 53 -3 18 -5 395 -3 838 3 750 4 808 21
845 10 22 30 53 45 69 26 28 1436 1088 1612 1212 478 336 857 504 1310 580 93
16 201 18 929 21 454 2 836 1 849 -2 54 -14 52 71 52 -1813 0 -1244 -3 -1748
-11 -1771 -6 -17 -19 -36 -29 -41 -10 -6 -73 -10 -139 -10 l-121 0 0 -80 0
-80 139 0 c132 0 141 1 192 28 34 17 65 44 84 71 l30 43 0 1838 0 1838 -30 43
c-19 27 -50 54 -84 71 l-53 28 -807 -1 c-443 -1 -846 -5 -896 -10z" />
                                                <path d="M3285 4229 c-198 -21 -453 -85 -655 -166 -94 -37 -385 -178 -438
-212 -11 -7 -6 -22 24 -75 21 -36 42 -66 46 -66 5 0 68 31 141 69 248 131 490
218 747 268 l135 27 693 4 692 3 0 -780 0 -781 -1265 0 -1266 0 35 46 c76 99
111 211 105 336 -5 92 -34 143 -106 185 l-48 28 -303 5 -303 5 116 104 c150
135 275 236 400 324 55 39 102 72 104 73 4 4 -79 134 -86 134 -7 0 -124 -81
-219 -151 -101 -76 -202 -162 -416 -357 -96 -87 -159 -137 -181 -143 -53 -14
-112 -63 -135 -111 -12 -23 -24 -73 -28 -110 l-7 -68 -85 0 c-113 0 -157 -15
-212 -70 -66 -65 -85 -143 -58 -234 16 -54 90 -128 144 -144 32 -9 486 -12
2003 -12 l1961 0 0 940 0 940 -727 -1 c-401 -1 -764 -5 -808 -10z m-1184
-1290 c19 -19 21 -30 17 -89 -9 -127 -104 -253 -228 -303 -51 -20 -74 -22
-319 -25 -146 -2 -275 -1 -289 3 -40 10 -52 58 -52 214 0 142 8 186 37 209 13
9 112 12 415 12 392 0 398 0 419 -21z m-1031 -296 c0 -10 3 -42 6 -70 l7 -53
-87 0 c-79 0 -89 2 -111 25 -14 13 -25 34 -25 45 0 12 11 32 25 45 22 22 32
25 105 25 69 0 80 -2 80 -17z" />
                                                <path d="M4370 3860 l0 -80 75 0 75 0 0 80 0 80 -75 0 -75 0 0 -80z" />
                                                <path d="M4370 3560 l0 -80 75 0 75 0 0 80 0 80 -75 0 -75 0 0 -80z" />
                                                <path d="M3589 2192 c-34 -17 -65 -44 -84 -71 -30 -43 -30 -43 -33 -202 l-3
-159 589 0 590 0 53 28 c34 17 65 44 84 71 30 43 30 43 33 202 l3 159 -589 0
-590 0 -53 -28z m701 -202 l0 -70 -335 0 -335 0 0 29 c0 39 17 83 37 99 13 9
94 12 325 12 l308 0 0 -70z m380 41 c0 -41 -19 -90 -40 -101 -10 -6 -55 -10
-99 -10 l-81 0 0 70 0 70 110 0 110 0 0 -29z" />
                                                <path d="M4370 660 l0 -80 75 0 75 0 0 80 0 80 -75 0 -75 0 0 -80z" />
                                            </g>
                                        </svg>
                                    </div>
                                    <div class="descripcion">
                                        <span class="cantidad"> 4</span>
                                    </div>
                                </div>
                                <div class="maletas-pequenias">
                                    <div class="icono">
                                        <span> <font-awesome-icon icon="suitcase" /> </span>
                                    </div>
                                    <div class="descripcion">
                                        <span class="cantidad"> 8</span>
                                    </div>
                                </div>
                                <div class="motor-type">
                                    <div class="img-caracteristica">
                                        <svg class="img-fluid" version="1.0" xmlns="http://www.w3.org/2000/svg"
                                            width="512.000000pt" height="512.000000pt" viewBox="0 0 512.000000 512.000000"
                                            preserveAspectRatio="xMidYMid meet">
                                            <g transform="translate(0.000000,512.000000) scale(0.100000,-0.100000)"
                                                fill="#000000" stroke="none">
                                                <path d="M535 5101 c-51 -23 -93 -65 -116 -116 -18 -38 -19 -129 -19 -2276 l0
-2237 -117 -4 c-129 -4 -172 -18 -225 -75 -81 -85 -77 -242 8 -326 58 -58 75
-62 264 -65 167 -3 176 -2 198 18 35 33 33 84 -4 118 -24 21 -34 22 -173 22
-141 0 -148 1 -169 23 -31 33 -29 80 4 106 l27 21 1637 0 1637 0 27 -21 c34
-27 36 -77 3 -107 l-23 -22 -1391 0 -1390 0 -27 -21 c-34 -27 -37 -88 -4 -119
22 -20 27 -20 1422 -20 957 0 1413 3 1439 11 49 13 115 73 138 124 37 81 19
197 -39 258 -54 57 -96 71 -229 75 l-123 4 0 863 0 863 64 4 64 3 5 -305 c5
-342 7 -356 79 -500 33 -67 61 -104 128 -170 137 -138 292 -202 490 -202 313
0 564 185 669 490 l26 77 3 903 3 902 63 0 c83 0 158 37 201 98 l30 44 3 399
c3 379 2 400 -17 437 -44 86 -125 132 -233 132 l-48 0 0 143 c0 78 -3 153 -7
165 -7 27 -325 289 -360 298 -40 11 -73 -5 -90 -42 -16 -33 -16 -37 1 -67 10
-18 80 -81 156 -142 l139 -110 1 -121 0 -121 -75 -6 c-154 -11 -234 -102 -236
-266 l0 -56 -127 -90 c-85 -61 -128 -99 -133 -115 -4 -14 -7 -131 -8 -261 -1
-244 5 -291 39 -309 11 -6 128 -10 279 -10 l261 0 0 -863 c0 -828 -1 -867 -20
-941 -27 -106 -63 -168 -145 -251 -110 -110 -226 -158 -381 -157 -224 0 -417
139 -502 358 l-27 69 -5 515 c-5 512 -5 515 -28 558 -39 73 -132 122 -232 122
l-30 0 0 808 0 809 -23 21 c-34 32 -89 30 -116 -4 l-21 -27 0 -1973 0 -1974
-1285 0 -1285 0 0 2223 0 2224 23 21 23 22 1240 0 1241 0 21 -23 c21 -22 22
-33 22 -174 0 -137 2 -153 21 -177 27 -35 86 -36 117 -3 21 22 22 33 22 183 0
87 -5 176 -11 197 -13 49 -73 115 -124 138 -38 18 -103 19 -1310 19 -1211 0
-1272 -1 -1310 -19z m4389 -762 c14 -7 30 -25 36 -42 14 -42 14 -644 -1 -686
-6 -17 -19 -36 -29 -41 -10 -6 -97 -10 -193 -10 -157 0 -177 2 -198 19 l-24
19 -3 338 c-3 357 0 387 42 404 32 13 341 12 370 -1z m-574 -538 c0 -98 3
-193 6 -210 l7 -31 -62 0 -61 0 0 174 0 174 48 36 c26 19 50 36 55 36 4 0 7
-80 7 -179z m-948 -1181 c15 -18 18 -41 18 -121 0 -120 -12 -139 -85 -139
l-45 0 0 146 0 147 47 -6 c32 -3 53 -12 65 -27z" />
                                                <path d="M945 4701 c-49 -22 -98 -76 -116 -128 -11 -31 -14 -174 -14 -738 0
-670 1 -702 19 -739 29 -57 82 -104 139 -121 75 -22 1669 -22 1743 0 58 17
109 63 135 119 18 39 19 81 19 751 0 667 -2 712 -19 750 -20 45 -69 91 -118
112 -26 10 -193 13 -890 13 -808 0 -860 -1 -898 -19z m1747 -158 c17 -15 18
-45 18 -550 l0 -533 -622 0 c-669 0 -661 0 -685 -52 -16 -31 -1 -83 27 -98 12
-6 257 -10 649 -10 l631 0 0 -67 c0 -74 -4 -84 -37 -102 -31 -16 -1621 -16
-1657 0 -30 14 -46 55 -46 120 l0 49 138 0 c125 0 140 2 160 20 30 28 30 90 1
116 -18 16 -40 19 -160 22 l-140 4 3 528 c3 503 4 529 22 549 l19 21 830 0
c759 0 832 -1 849 -17z" />
                                                <path d="M1792 4383 c-31 -28 -212 -318 -234 -376 -44 -114 -2 -261 94 -338
192 -151 470 -35 495 207 10 91 -10 141 -129 326 -60 95 -117 178 -126 185
-24 18 -77 16 -100 -4z m122 -318 c82 -128 90 -164 53 -228 -17 -28 -40 -51
-63 -62 -101 -48 -219 41 -201 152 5 27 130 243 141 243 2 0 33 -47 70 -105z" />
                                                <path d="M1025 2805 c-5 -2 -26 -6 -46 -9 -45 -8 -113 -65 -141 -120 -19 -36
-22 -57 -23 -166 0 -141 10 -182 58 -237 64 -73 61 -73 543 -73 l430 0 52 26
c61 30 108 94 118 160 3 24 5 92 3 151 -4 97 -7 113 -32 156 -33 55 -83 92
-147 106 -41 9 -789 15 -815 6z m794 -170 c38 -19 41 -30 41 -139 0 -148 38
-136 -444 -136 -473 0 -438 -9 -445 117 -4 97 10 148 47 161 16 6 179 11 400
11 309 1 378 -2 401 -14z" />
                                                <path d="M2251 2799 c-54 -22 -69 -89 -28 -127 23 -22 29 -22 315 -22 279 0
293 1 312 20 28 28 27 90 -1 116 -20 18 -41 19 -298 21 -164 1 -286 -2 -300
-8z" />
                                            </g>
                                        </svg>
                                    </div>
                                </div>
                                <div class="transmition-type">
                                    <div class="img-caracteristica">
                                        <svg class="img-fluid" version="1.0" xmlns="http://www.w3.org/2000/svg"
                                            width="512.000000pt" height="512.000000pt" viewBox="0 0 512.000000 512.000000"
                                            preserveAspectRatio="xMidYMid meet">
                                            <g transform="translate(0.000000,512.000000) scale(0.100000,-0.100000)"
                                                fill="#000000" stroke="none">
                                                <path d="M500 5104 c-30 -8 -93 -33 -140 -56 -163 -80 -299 -250 -345 -433
-20 -77 -20 -253 0 -330 46 -182 181 -352 344 -433 46 -23 90 -42 97 -42 12 0
14 -77 14 -473 0 -512 2 -532 56 -640 15 -28 40 -71 56 -94 l29 -43 -29 -42
c-16 -24 -41 -67 -56 -95 -54 -108 -56 -128 -56 -640 0 -396 -2 -473 -14 -473
-7 0 -51 -19 -97 -42 -163 -81 -298 -251 -344 -433 -20 -77 -20 -253 0 -330
60 -235 255 -430 490 -490 77 -20 253 -20 330 0 235 60 430 255 490 490 20 77
20 253 0 330 -46 182 -181 352 -344 433 -46 23 -90 42 -98 42 -12 0 -14 63
-11 448 3 435 4 448 24 487 25 46 45 65 94 91 33 18 73 19 713 22 l677 3 0
-526 c0 -440 -2 -525 -14 -525 -7 0 -51 -19 -97 -42 -163 -81 -298 -251 -344
-433 -20 -77 -20 -253 0 -330 60 -235 255 -430 490 -490 77 -20 253 -20 330 0
183 46 353 182 433 345 56 114 72 183 72 310 0 127 -16 196 -72 310 -57 117
-168 229 -287 288 -46 23 -90 42 -97 42 -12 0 -14 85 -14 525 l0 525 681 0
c756 0 737 -1 873 67 96 48 201 153 249 249 66 132 67 139 67 663 0 394 2 471
14 471 7 0 51 19 97 42 163 81 298 251 344 433 20 77 20 253 0 330 -46 183
-182 353 -345 433 -114 56 -183 72 -310 72 -127 0 -196 -16 -310 -72 -163 -80
-299 -250 -345 -433 -20 -77 -20 -253 0 -330 46 -182 181 -352 344 -433 46
-23 90 -42 98 -42 12 0 14 -63 11 -447 -3 -415 -4 -451 -22 -483 -26 -49 -45
-69 -91 -94 -40 -21 -47 -21 -697 -24 l-658 -3 0 526 c0 440 2 525 14 525 7 0
51 19 97 42 163 81 298 251 344 433 20 77 20 253 0 330 -60 235 -255 430 -490
490 -77 20 -253 20 -330 0 -235 -60 -430 -255 -490 -490 -20 -77 -20 -253 0
-330 46 -182 181 -352 344 -433 46 -23 90 -42 97 -42 12 0 14 -85 14 -525 l0
-526 -677 3 c-671 3 -678 3 -718 24 -46 25 -65 45 -91 94 -18 32 -19 68 -22
483 -3 384 -1 447 11 447 8 0 52 19 98 42 163 81 298 251 344 433 20 77 20
253 0 330 -60 235 -255 430 -490 490 -75 19 -261 19 -335 -1z m275 -413 c100
-45 155 -131 155 -240 0 -79 -22 -132 -75 -186 -54 -53 -107 -75 -186 -75
-151 0 -259 108 -259 260 0 107 49 188 142 234 65 32 161 35 223 7z m1910 0
c100 -45 155 -131 155 -240 0 -79 -22 -132 -75 -186 -54 -53 -107 -75 -186
-75 -151 0 -259 108 -259 260 0 107 49 188 142 234 65 32 161 35 223 7z m1870
0 c100 -45 155 -131 155 -240 0 -79 -22 -132 -75 -186 -54 -53 -107 -75 -186
-75 -151 0 -259 108 -259 260 0 107 49 188 142 234 65 32 161 35 223 7z
m-3780 -3780 c100 -45 155 -131 155 -240 0 -79 -22 -132 -75 -186 -54 -53
-107 -75 -186 -75 -151 0 -259 108 -259 260 0 107 49 188 142 234 65 32 161
35 223 7z m1910 0 c100 -45 155 -131 155 -240 0 -79 -22 -132 -75 -186 -54
-53 -107 -75 -186 -75 -151 0 -259 108 -259 260 0 107 49 188 142 234 65 32
161 35 223 7z" />
                                                <path d="M3900 860 l0 -860 200 0 200 0 0 305 0 305 23 0 c21 0 42 -37 178
-305 l154 -305 233 0 233 0 -166 324 -166 324 58 32 c119 67 223 203 257 336
20 77 20 221 1 294 -50 190 -206 346 -391 394 -51 13 -127 16 -438 16 l-376 0
0 -860z m695 450 c26 -6 53 -23 78 -49 34 -37 37 -45 37 -96 0 -51 -3 -59 -37
-96 -48 -50 -81 -58 -245 -59 l-128 0 0 155 0 155 128 0 c70 0 145 -5 167 -10z" />
                                            </g>
                                        </svg>
                                    </div>
                                    <div class="descripcion">
                                        <span class="tipo"> A</span>
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex extras">
                                <div class="AC">
                                    <div class="img-caracteristica">
                                        <svg viewBox="0 0 200 200" width="100%" height="100%"
                                            xmlns="http://www.w3.org/2000/svg" role="img"
                                            style="width:inherit;height:inherit;line-height:inherit;color:inherit">
                                            <path fill-rule="evenodd" clip-rule="evenodd"
                                                d="M173.484 133.824l-11.015-6.488l7.75-2.119c10.241-2.802 6.103-18.612-4.147-15.807l-23.249 6.357c-24.647-14.513-11.332-3.975-15.563-22.369l15.563-9.164l23.249 6.357c10.243 2.803 14.4-13.002 4.147-15.807l-7.75-2.119l11.015-6.488c9.188-5.399 1.197-19.589-8.022-14.171l-11.015 6.488l2.078-7.904c2.748-10.467-12.752-14.683-15.499-4.238l-6.226 23.71l-15.564 9.164c-13.458-12.955-11.215 4.381-11.215-24.93l17.016-17.354c3.137-3.199 3.137-8.378 0-11.569c-6.561-6.708-12.765 1.45-17.016 5.785c0-9.357 2.051-21.158-8.022-21.158c-10.06 0-8.022 11.879-8.022 21.158c-4.146-4.228-10.41-12.539-17.016-5.785c-7.567 7.698 3.024 14.654 17.016 28.923c0 29.291 2.242 11.983-11.207 24.93l-15.563-9.164l-6.234-23.711c-2.748-10.446-18.23-6.237-15.499 4.238l2.078 7.904l-11.015-6.488c-9.194-5.403-17.218 8.767-8.022 14.171l11.015 6.488l-7.75 2.119c-10.254 2.806-6.095 18.612 4.156 15.807l23.249-6.357c24.691 14.539 11.267 4.004 15.563 22.369l-15.563 9.164l-23.249-6.357c-10.248-2.804-14.414 13-4.156 15.807l7.75 2.119l-11.015 6.488c-9.183 5.396-1.193 19.587 8.022 14.171l11.015-6.488l-2.078 7.904c-2.733 10.462 12.749 14.692 15.499 4.238l6.234-23.711l15.563-9.164c13.428 12.927 11.207-4.356 11.207 24.93l-17.016 17.354c-3.137 3.199-3.137 8.378 0 11.569c6.561 6.708 12.765-1.45 17.016-5.785c0 9.357-2.051 21.158 8.022 21.158c10.06 0 8.022-11.879 8.022-21.158c4.141 4.223 10.41 12.539 17.016 5.785c7.567-7.698-3.024-14.654-17.016-28.923c0-29.312-2.243-11.975 11.215-24.93l15.564 9.164l6.225 23.711c2.751 10.457 18.249 6.216 15.499-4.238l-2.078-7.904l11.015 6.488c9.227 5.422 17.2-8.778 8.023-14.17zm-63.064-27.688c-7.965 14.053-28.805 1.791-20.842-12.272c7.952-14.047 28.817-1.795 20.842 12.272z">
                                            </path>
                                        </svg>
                                    </div>
                                    <div class="descripcion">
                                        <span class="tipo"> A/C</span>
                                    </div>
                                </div>
                                <div class="drink">
                                    <div class="img-caracteristica">
                                        <svg class="img-fluid" version="1.0" xmlns="http://www.w3.org/2000/svg"
                                            width="853.000000pt" height="1280.000000pt" viewBox="0 0 853.000000 1280.000000"
                                            preserveAspectRatio="xMidYMid meet">
                                            <g transform="translate(0.000000,1280.000000) scale(0.100000,-0.100000)"
                                                fill="#000000" stroke="none">
                                                <path d="M4120 10814 c-116 -8 -227 -26 -266 -44 -41 -18 -42 -19 -49 -81 -3
-35 -13 -96 -21 -136 -19 -100 -18 -240 2 -289 15 -36 16 -75 5 -459 -12 -428
-36 -1142 -46 -1361 -11 -257 -33 -302 -250 -524 -225 -229 -298 -331 -368
-515 -65 -169 -62 -90 -59 -1740 2 -825 8 -2121 12 -2880 9 -1486 9 -1492 62
-1633 49 -130 166 -206 423 -272 249 -64 548 -92 870 -80 444 17 725 85 867
209 52 46 85 120 115 252 21 94 23 487 4 1039 -10 311 -10 724 0 2155 14 2054
7 2689 -32 2860 -39 169 -206 405 -461 650 -82 80 -130 151 -163 245 -34 95
-50 448 -65 1363 -9 563 -9 644 5 696 18 72 7 237 -25 378 -24 102 -43 127
-114 150 -51 16 -313 26 -446 17z" />
                                            </g>
                                        </svg>
                                    </div>
                                </div>
                                <div class="songs">
                                    <div class="img-caracteristica">
                                        <svg class="img-fluid" fill="#000000" height="800px" width="800px" version="1.1"
                                            id="Capa_1" xmlns="http://www.w3.org/2000/svg"
                                            xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 512.002 512.002"
                                            xml:space="preserve">
                                            <g>
                                                <g>
                                                    <path
                                                        d="M501.969,5.636c-5.049-4.379-11.751-6.345-18.366-5.406L160.829,46.341c-11.359,1.623-19.795,11.351-19.795,22.825v92.221
			v178.088c-13.656-7.956-29.509-12.537-46.421-12.537c-51.023,0-92.532,41.51-92.532,92.532s41.509,92.532,92.532,92.532
			s92.532-41.51,92.532-92.532V181.383l276.664-39.524v151.506c-13.656-7.956-29.509-12.537-46.421-12.537
			c-51.023,0-92.532,41.51-92.532,92.532s41.509,92.532,92.532,92.532c51.023,0,92.532-41.51,92.532-92.532V115.275V23.054
			C509.918,16.37,507.018,10.015,501.969,5.636z M94.612,465.89c-25.596,0-46.421-20.825-46.421-46.421
			c0-25.596,20.825-46.421,46.421-46.421c25.596,0,46.421,20.825,46.421,46.421C141.033,445.065,120.208,465.89,94.612,465.89z
			 M463.808,95.279l-276.664,39.524V89.161l276.664-39.524V95.279z M417.387,419.779c-25.596,0-46.421-20.825-46.421-46.421
			s20.825-46.421,46.421-46.421c25.596,0,46.421,20.825,46.421,46.421C463.808,398.954,442.983,419.779,417.387,419.779z" />
                                                </g>
                                            </g>
                                        </svg>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <span class="separador"></span>
                        <div v-if="vista == 'Home'" class="d-flex servicios">
                            <span>Servicios disponibles</span>
                            <carruselInformativo />
                        </div>
                        <div class="detalles-reservacion">
                            <div class="precio-renta">
                                <span class="icono"><font-awesome-icon icon="money-bill" /></span>
                                <span class="precio">L11,500 HNL <span class="tiempo"> día</span></span>
                            </div>
                            <div class="fechas">
                                <div class="d-flex dates">
                                    <span> Fecha inicial </span>
                                    <input v-model="fechaInicio" type="date">
                                </div>
                                <div class="d-flex dates">
                                    <span> Fecha final </span>
                                    <input @change="calcularDias" v-model="fechaFinal" type="date">
                                </div>
                            </div>
                            <div class="montos">
                                <div class="d-flex deposito">
                                    <span class="icono"> <font-awesome-icon icon="shield-halved" /> </span>
                                    <div class="d-flex descripcion">
                                        <span class="nombre-monto"> Depósito de seguro</span>
                                        <span class="cantidad">L540 HNL</span>
                                    </div>
                                </div>
                                <div class="d-flex deposito">
                                    <span class="icono"> <font-awesome-icon icon="shield-halved" /> </span>
                                    <div class="d-flex descripcion">
                                        <span class="nombre-monto"> Protección por cancelación</span>
                                        <span class="cantidad">L540 HNL</span>
                                    </div>
                                </div>
                                <div v-if="dias > 0" class="d-flex deposito base-dias">
                                    <div class="d-flex descripcion">
                                        <span class="nombre-monto"> Precio base x {{ dias }} días</span>
                                        <span class="cantidad">L540 HNL</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="mapa-ubicacion">

                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button>Reservar</button>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
import carruselInformativo from '@/components/carrusel-informativo.vue'
import { ref } from 'vue'

const fechaInicio = ref('')
const fechaFinal = ref('')
const dias = ref(0)

const propsDetalles = defineProps([
    'data',
    'vista'
])

const emisiones = defineEmits([
    'cerrarDetalles'
])

const cerrarModal = () => {
    emisiones('cerrarDetalles')
}

const calcularDias = () => {
    const diaInicio = new Date(fechaInicio.value)
    const diaFinal = new Date(fechaFinal.value)
    dias.value = (diaFinal.getTime() - diaInicio.getTime()) / (24 * 3600 * 1000)
}

</script>

<style scoped>
.btn-close:focus {
    box-shadow: none;
    border: none;
}

.modal {
    backdrop-filter: blur(2.5px);
}

.espacio-color {
    width: 50px;
    height: 5px;
    height: 7px;
    display: inline-flex;
    background-color: #000;
}

.modal-header {
    border: none !important;
    padding: 10px 5px;
}

.modal-header .btn-close {
    margin: 0 12px 0 auto !important;
}

.modal-body {
    padding-top: 5px;
}

.modal-body .informacion .mosaico .columna-prin {
    width: 50%;
    padding: 0 3px;
}

.modal-body .informacion .mosaico .columna-secundaria {
    width: 25%;
    padding: 0 2px;
    display: flex;
    flex-direction: column;
    justify-content: center;
}

.modal-body .informacion .mosaico .columna-tercearia {
    width: 25%;
    padding: 0 2px;
    display: flex;
    flex-direction: column;
    justify-content: center;
}

.img-casa {
    padding: 1px 0;
}

.img-casa .img-top {
    border-radius: 3px;
}

.modal-body .informacion .informacion-ubicacion,
.informacion-carro,
.informacion-ubicacion>div {
    width: fit-content;
    margin-left: 5px;
    margin-right: 5px;
    text-align: start;
}

/**Retocado */
.modal-body .informacion .icono {
    font-size: calc(.7em + .65vw);
    color: #ff475e;
}

/**Retocado */
.modal-body .informacion .informacion-ubicacion .localizacion .ubicacion,
.marca-carro {
    margin-left: 12px;
    font-size: calc(.6em + .65vw);
    font-weight: 600;
}

/**Retocado */
.modal-body .informacion .informacion-ubicacion .distancia,
.categoria-tipo-carro,
.anio-carro,
.color-carro {
    margin-left: 28px;
    font-size: calc(.5em + .58vw);
    color: #8e8e8e;
}

.categoria-tipo-carro span:last-child {
    font-weight: 600;
}

.modal-body .informacion .descripcion-casa {
    justify-content: center;
    margin: 8px 5px;
}

.modal-body .informacion .descripcion-casa .detalle {
    display: flex;
    flex-direction: column;
    margin-right: 15px;
}

.modal-body .informacion .descripcion-casa .detalle .descripcion {
    font-size: calc(.5em + .45vw);
}

.modal-body .informacion .descripcion-casa .detalle .cantidad-descripcion {
    font-weight: 600;
    color: #ff475e;
}

.modal-body .informacion .servicios {
    flex-direction: column !important;
    align-items: start;
    margin: 0 5px 0 5px;
}

.modal-body .informacion .servicios span:first-child {
    font-weight: 600;
    font-size: calc(.5em + .58vw);
    color: #000;
}

.modal-body .informacion .detalles-reservacion {
    width: 75%;
    margin: auto;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}

.modal-body .informacion .detalles-reservacion .precio-renta {
    width: max-content;
    margin-bottom: 15px;
}

/**Retocado */
.modal-body .informacion .detalles-reservacion .precio-renta .precio {
    margin-left: 12px;
    font-size: calc(.5em + .58vw);
    font-weight: 600;
    color: #000;
}

.modal-body .informacion .detalles-reservacion .precio-renta .precio .tiempo {
    font-weight: normal;
}

.modal-body .informacion .detalles-reservacion .fechas {
    display: flex;
}

.modal-body .informacion .detalles-reservacion .dates {
    flex-direction: column;
    max-width: 150px;
    margin-right: 5px;
    border: #8e8e8e solid .5px;
    padding: 5px;
    border-radius: 7px;
    font-size: calc(.5em + .58vw);
}

.modal-body .informacion .detalles-reservacion .dates input {
    border: none;
    text-align: center;
    font-weight: 100;
}

.modal-body .informacion .detalles-reservacion .dates span {
    font-weight: 600;
    color: #000;
}

.modal-body .informacion .detalles-reservacion .montos {
    margin-top: 15px;
    width: 100%;
}


.modal-body .informacion .detalles-reservacion .montos .descripcion {
    width: 100%;
    justify-content: space-between;
    color: #000;
    font-size: calc(.5em + .65vw);
    align-content: center;
    flex-wrap: wrap;
}

.modal-body .informacion .detalles-reservacion .montos .descripcion span:first-child {
    margin-left: 12px;
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

.modal-footer {
    padding: auto 5px;
}

.modal-footer button:hover {
    background-color: #ff475e;
    color: #fff;
}

/*
* Estilos de los elementos de carro
 */
.caracteristicas-carro .basicas>div {
    display: flex;
    margin-right: 7px;
    justify-content: center;
    align-items: center;
}

.caracteristicas-carro .basicas>div:last-child {
    margin-right: 0px;
}

.caracteristicas-carro .basicas>div:hover {
    cursor: pointer;
}

.caracteristicas-carro {
    align-items: center;
    flex-direction: column;
}

.caracteristicas-carro .extras>div {
    display: flex;
    margin-right: 12px;
    justify-content: center;
    align-items: center;
}

.caracteristicas-carro .extras>div:hover {
    cursor: pointer;
}

.img-caracteristica {
    width: 16px;
    fill: #ff475e;
    stroke: #ff475e;
    margin-right: 5px;
}

.caracteristicas-carro .img-caracteristica g {
    fill: #ff475e;
    stroke: #ff475e;
}

.caracteristicas-carro .icono {
    color: #ff475e;
    font-size: calc(.6em + .5vw);
    justify-content: center;
    display: flex;
    margin-right: 5px;
}

/*
  * Configuramos el media query para Tablets 
 */
@media (max-width: 768px) {
    .modal-footer button {
        font-size: calc(.7em + .65vw);
    }

    .modal-body .informacion .informacion-ubicacion .localizacion .ubicacion,
    .marca-carro {
        margin-left: 12px;
        font-size: calc(1em + .8vw);
        font-weight: 600;
    }

    .modal-body .informacion .informacion-ubicacion .distancia,
    .categoria-tipo-carro,
    .anio-carro,
    .color-carro {
        margin-left: 27px;
        font-size: calc(.75em + .7vw);
    }

    .modal-body .informacion .descripcion-casa .detalle .descripcion {
        font-size: calc(.6em + .65vw);
    }

    .modal-body .informacion .icono {
        font-size: calc(.8em + .85vw);
    }

    .modal-body .informacion .detalles-reservacion .precio-renta .precio {
        font-size: calc(.75em + .6vw);
    }

    .modal-body .informacion .detalles-reservacion {
        margin-top: 15px;
    }

    .modal-body .informacion .detalles-reservacion .dates {
        font-size: calc(.6em + .45vw);
    }

    .modal-body .informacion .detalles-reservacion .montos .descripcion {
        font-size: calc(.65em + .5vw);
    }
}

/*
  * Configuramos el media query para dispositivo celulares 
 */
@media (max-width: 576px) {
    .modal-footer button {
        font-size: calc(.6em + .5vw);
    }

    .modal-body .informacion .informacion-ubicacion .localizacion .ubicacion,
    .marca-carro {
        margin-left: 12px;
        font-size: calc(1em + .65vw);
        font-weight: 600;
    }

    .modal-body .informacion .informacion-ubicacion .distancia,
    .categoria-tipo-carro,
    .anio-carro,
    .color-carro {
        margin-left: 27px;
        font-size: calc(.75em + .65vw);
    }

    .modal-body .informacion .descripcion-casa .detalle .descripcion {
        font-size: calc(.6em + .65vw);
    }

    .modal-body .informacion .icono {
        font-size: calc(.8em + .85vw);
    }

    .modal-body .informacion .detalles-reservacion .precio-renta .precio {
        font-size: calc(.75em + .6vw);
    }

    .modal-body .informacion .detalles-reservacion {
        margin-top: 15px;
    }

    .modal-body .informacion .detalles-reservacion .dates {
        font-size: calc(.6em + .52vw);
    }

    .modal-body .informacion .detalles-reservacion .montos .descripcion {
        font-size: calc(.65em + .5vw);
    }

}
</style>