PARAMETERS hisname, hissurname, pass_user, numbers, histype, one
DO WHILE .t.
SET CENTURY ON 
USE fash_ropa_mercaderia
SET DELETED on
DEFINE WINDOW ta from 12,15 to 35,155 TITLE "                                                                                                                                                                "+cdow(date())+", "+mdy(date())
DEFINE WINDOW pic FROM 1,50 to 15,130 TITLE "                                                                          Ramos Fashion | Ropa Y Moda"
DEFINE WINDOW opt FROM 30,50 TO 37,130 TITLE "Ramos Fashion | Ropa Y Moda"
    STORE 0 TO opt1
    CLEAR
    ACTIVATE WINDOW pic
        @0,12 say "C:\fashion\pict_sys/fash.jpg" bitmap isometric size 50,52
    ACTIVATE WINDOW ta
        BROWSE FIELDS art_code:h="CATALOGO", descript:h="DESCRIPCION", amount:h="STOCK", price:h="PRECIO", discount:h="DESCUENTO", incomes:h="SALDO", date:h="FECHA DE REGISTRO"  NOEDIT NOAPPEND NODELETE 
    ACTIVATE WINDOW opt
        @1,1 say "�Qu� desea hacer?" font "Arial Black",20 color r/w**
        @1,46 get opt1 function "*h Volver a ver;Regresar al Menu" size 3, 2, 3 
            READ
                DO CASE 
                    CASE opt1=1
                        CLEAR 
                        LOOP  
                    CASE opt1=2
                        DEACTIVATE WINDOW ta, pic, opt
                        CLEAR
                        DO fash_principal_oper WITH hisname, hissurname, pass_user, numbers, histype, one
                ENDCASE
ENDDO