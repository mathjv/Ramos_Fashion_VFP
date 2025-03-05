PARAMETERS hisname, hissurname, pass_user, numbers, histype, one
DO WHILE .t.
SET SYSMENU TO
DO fash_menu.mpr
SET CENTURY ON
ON KEY LABEL ESC
DEFINE WINDOW ch from 8,110 to 32,177 TITLE "                                                     Ramos Fashion | Ropa Y Moda:  "+hisname+" "+hissurname
DEFINE WINDOW pic FROM 6,1 to 36,77 TITLE ""+cdow(date())+". "+MDY(DATE())+"                                                                                                                                        "+TIME() COLOR SCHEME 4 RGB(0, 0, 0)
    CLEAR
    STORE 0 TO aga, opt, opt1, opt2, opt3, final_opt, final_opt2, sis1, sis2
    STORE 24 TO con
    STORE 45 TO rev
    STORE DATE() to dt
    STORE time() to time
ACTIVATE WINDOW pic
    @0,0 say "C:\fashion\pict_sys/fash.jpg" bitmap isometric size 80, 80
ACTIVATE WINDOW ch
@6,0 SAY "c:/fashion/pict_sys/ropa1.jpeg" bitmap isometric SIZE 30,30
wait "" timeout 0.80
clear
@6,23 SAY "c:/fashion/pict_sys/ropa2.jpg" bitmap isometric SIZE 30,30
wait "" timeout 0.80
clear
@6,17 SAY "c:/fashion/pict_sys/ropa3.jpeg" bitmap isometric SIZE 30, 30
wait "" timeout 0.80
CLEAR
@8,16 SAY "c:/fashion/pict_sys/ropa3.jpeg" bitmap SIZE 120, 120
    @19,1 get opt2 function "*h Opciones" size 3, 2, 3
    @1,3 get opt function "*h Registro de Catalogo;Consultas de Catalogo (Ropa y Moda)" size 3, 2, 3
    @4,0 get opt1 function "*h Opciones de Usuario;Historial;Visor de Catalogo;Compras" size 3, 2, 3
        READ
        DO CASE 
            CASE opt1=1
                     @5,20 get sis1 function "^ Cambio de Clave;Centro de Respaldos" size 3, 2, 3
                        READ
                            DO CASE 
                                CASE sis1=1
                                    DEACTIVATE WINDOW pic, ch
                                    CLEAR
                                    DO fash_cambio_contraseña WITH hisname, hissurname, pass_user, histype, one
                                CASE sis1=2
                                    DEACTIVATE WINDOW pic, ch
                                    CLEAR
                                    DO fash_backup WITH hisname, hissurname, pass_user, histype, one
                            ENDCASE
            CASE opt1=2
                     @5,32 get sis1 function "^ Historial Completo" size 3, 2, 3
                        READ
                            DO CASE 
                                CASE sis1=1
                                    DEACTIVATE WINDOW pic, ch
                                    clear
                                    DO fash_historial_con WITH hisname, hissurname, pass_user, numbers, histype, one
                            ENDCASE
             CASE opt1=3
                     @5,54 get sis1 function "^ Visor de Catalogo" size 3, 2, 3
                        READ
                            DO CASE 
                                CASE sis1=1
                                    DEACTIVATE WINDOW pic, ch
                                    CLEAR
                                    DO fash_secuencial_mercaderia WITH hisname, hissurname, pass_user, numbers, histype, one
                            ENDCASE
            CASE opt1=4
                     @5,64 get sis1 function "^ Saldos;Compras Anonimas" size 3, 2, 3
                        READ
                            DO CASE 
                                CASE sis1=1
                                    DEACTIVATE WINDOW pic, ch
                                    CLEAR 
                                    DO fash_saldo WITH hisname, hissurname, pass_user, numbers, histype, one
                                CASE sis1=2
                                    DEACTIVATE WINDOW pic, ch
                                    CLEAR
                                    DO fash_factura WITH hisname, hissurname, pass_user, numbers, histype, one
                            ENDCASE
        ENDCASE 
        DO CASE 
            CASE opt=1
                DEACTIVATE WINDOW pic,ch
                clear
                DO fash_registros WITH hisname, hissurname, pass_user, numbers, histype, one
            CASE opt=2
                    @1,63 get sis1 function "^ Registros de Catalogo(Tabla);Cuentas de usuario;Consultas de Stock" size 3, 2, 3
                        READ
                            DO CASE 
                                CASE sis1=1
                                    DEACTIVATE WINDOW pic, ch
                                    clear
                                    DO fash_tabla_registros WITH hisname, hissurname, pass_user, numbers, histype, one
                                CASE sis1=2
                                    DEACTIVATE WINDOW pic, ch
                                    clear
                                    DO fash_secuencial_usuarios WITH hisname, hissurname, pass_user, numbers, histype, one
                                CASE sis1=3
                                    DEACTIVATE WINDOW pic, ch
                                    clear
                                    DO fash_amount_searcher WITH hisname, hissurname, pass_user, numbers, histype, one
                            ENDCASE
            ENDCASE
        DO CASE 
            CASE opt2=1
                    @19,10 get aga function "^ Salir de Ramos Fashion;Cerrar Sesion" size 3, 2, 3
                        READ
                            DO CASE 
                                CASE aga=1
                                        MESSAGEBOX("Gracias Por Elegirnos!", 0+32, "Ramos Fashion | Ropa Y Moda")
                                        DEACTIVATE WINDOW ch, pic
                                        CLEAR ALL 
                                        QUIT
                                CASE aga=2
                                        DEACTIVATE WINDOW ch, pic
                                        CLEAR ALL 
                                        DO fash_sesion
                            ENDCASE 
        ENDCASE
ENDDO