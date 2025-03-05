PARAMETERS hisname, hissurname, pass_user, numbers, histype, one
define windows fit from 1,50 to 15,130 title "                                                                                  Raybox.MJ | Hardware Tools"
define windows back from 12,50 to 35,130 title ""+cdow(date())+". "+MDY(DATE())+"                                                                                                                                                   "+TIME()
x=0
do while .t.
    store space(15) to path, pass
    store 0 to a, e, rec
    STORE SPACE(5) TO t
     x=x+1
     s=alltrim(str(x))
           do case
              case x<10
               z="0000"
              case x>9 and x<100
                z="000"
              case x>99 and x<1000
                z="00"
              case x>999 and x<10000
              z="0"
           ENDCASE
         t=z+s
    activate WINDOW fit
        @0,12 say "C:\fashion\pict_sys/fash.jpg" bitmap isometric size 50,52
    activate WINDOW back
        @20,33 say "Ramos Fashion | Derechos Reservados." font "Verdana",10 color r/w**
        @1,2 say "Gestion de Respaldo de Datos | Usuario: "+hisname font "Verdana",15 color r/w**
        @4,2 say "Confirme su clave: " font "Arial black",10 get pass valid ALLTRIM(pass)==ALLTRIM(pass_user) and !EMPTY(pass) error "Ingrese Correctamente los datos"
            READ
                IF readkey()=12
                   DEACTIVATE WINDOW back, fit
                   CLEAR
                   DO fash_principal WITH hisname, hissurname, pass_user, numbers, histype, one
                ENDIF
        @10,4 get rec function "*H Catalogos;Historial;Usuarios Registrados;Saldos;Facturas" size 3, 2, 3 color r/w**
            READ
                DO CASE
                    CASE rec=1
                        USE fash_ropa_mercaderia
                        path=PUTFILE("Save as:", "fash_catalogo_"+ALLTRIM(t), "XLS")
                        copy to fash_ropa_mercaderia TYPE XLS
                            IF messagebox("Crear algun otro respaldo?",4+64, "Ramos Fashion | Ropa Y Moda")=6
                                CLEAR
                                LOOP 
                            ELSE 
                                CLEAR
                                DEACTIVATE WINDOW back, fit
                                DO fash_principal WITH hisname, hissurname, pass_user, numbers, histype, one
                            ENDIF 
                    CASE rec=2
                        USE fash_historial
                        path=PUTFILE("Save as:", "fash_hist_"+ALLTRIM(t), "XLS")
                        copy to fash_historial TYPE XLS
                            IF messagebox("Crear algun otro respaldo?",4+64, "Ramos Fashion | Ropa Y Moda")=6
                                CLEAR
                                LOOP 
                            ELSE 
                                CLEAR
                                DEACTIVATE WINDOW back, fit
                                DO fash_principal WITH hisname, hissurname, pass_user, numbers, histype, one
                            ENDIF
                    CASE rec=3
                        USE fash_usuarios
                        path=PUTFILE("Save as:", "fash_usuarios_"+ALLTRIM(t), "XLS")
                        copy to fash_usuarios TYPE XLS
                            IF messagebox("Crear algun otro respaldo?",4+64, "Ramos Fashion | Ropa Y Moda")=6
                                CLEAR
                                LOOP 
                            ELSE 
                                CLEAR
                                DEACTIVATE WINDOW back, fit
                                DO fash_principal WITH hisname, hissurname, pass_user, numbers, histype, one
                            ENDIF
                    CASE rec=4
                        USE fash_saldos
                        path=PUTFILE("Save as:", "fash_saldos_"+ALLTRIM(t), "XLS")
                        copy to fash_saldos TYPE XLS
                            IF messagebox("Crear algun otro respaldo?",4+64, "Ramos Fashion | Ropa Y Moda")=6
                                CLEAR
                                LOOP 
                            ELSE 
                                CLEAR
                                DEACTIVATE WINDOW back, fit
                                DO fash_principal WITH hisname, hissurname, pass_user, numbers, histype, one
                            ENDIF
                    CASE rec=5
                        USE fash_factura
                        path=PUTFILE("Save as:", "fash_fact_"+ALLTRIM(t), "XLS")
                        copy to fash_factura TYPE XLS
                            IF messagebox("Crear algun otro respaldo?",4+64, "Ramos Fashion | Ropa Y Moda")=6
                                CLEAR
                                LOOP 
                            ELSE 
                                CLEAR
                                DEACTIVATE WINDOW back, fit
                                DO fash_principal WITH hisname, hissurname, pass_user, numbers, histype, one
                            ENDIF
                ENDCASE         
enddo
