PARAMETERS hisname, hissurname, pass_user, numbers, histype, one
DO WHILE .t.
CLEAR
USE fash_historial
SET DELETED ON 
SET CENTURY ON 
DEFINE WINDOW ta from 12,15 to 35,155 TITLE "                                                                                                                                                                "+cdow(date())+", "+mdy(date())
DEFINE WINDOW pic FROM 1,50 to 15,130 TITLE "                                                                          Catalogos y Moda, Todo aqui!"
DEFINE WINDOW opt FROM 30,50 TO 37,130 TITLE "Ramos Fashion | Ropa Y Moda"
    STORE 0 TO opt1
    ACTIVATE WINDOW pic
        @0,12 say "C:\fashion\pict_sys/fash.jpg" bitmap isometric size 50,52
    ACTIVATE WINDOW ta
        BROWSE FIELDS username:h="NOMBRES", surname:h="APELLIDOS", type:h="TIPO", passkey_ch:h="CAMBIO DE CLAVE", date:h="FECHA DE INGRESO" NOEDIT NOAPPEND NODELETE 
    ACTIVATE WINDOW opt
        @1,30 get opt1 function "*h Regresar a ver;Volver al Menu" size 3, 2, 3 
            READ
                DO CASE 
                    CASE opt1=1
                        CLEAR 
                        LOOP
                    CASE opt1=2
                        DEACTIVATE WINDOW ta, pic, opt
                        CLEAR
                        DO fash_principal with hisname, hissurname, pass_user, numbers, histype, one
                ENDCASE
ENDDO