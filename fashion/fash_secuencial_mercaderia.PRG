PARAMETERS hisname, hissurname, pass_user, numbers, histype, one
DO WHILE .t. 
define windows pict from 1,50 to 15,132 title "                                                                                 Ramos Fashion | Ropa Y Moda"
define windows inpt from 12,50 to 45,132 title "Ramos Fashion"
define windows rest from 12,2 to 20,38 title ""+cdow(date())+". "+MDY(DATE())+"                                                                                                                                                   "+TIME()
use fash_ropa_mercaderia index codexy
    STORE 0 TO rec, rec_final
activate windows pict
  @0,12 say "C:\fashion\pict_sys/fash.jpg" bitmap isometric size 50,52
activate windows inpt
DO WHILE .t.
SET DELETED ON
    CLEAR
       @3,5 say "Product code: "
       @6,5 say "Product descript: "
       @9,5 say "Product marque: "
       @12,5 say "Amount/Stock: "
       @15,5 say "Date: "
       @18,5 say "Product Descount: " 
       @21,5 say "Product price: "
       @24,5 say "Unit: "
       @27,5 say "Incomes/Total: " 
       &&Replace
       @3,25 say art_code
       @6,25 say descript
       @9,25 say marque
       @12,25 say amount
       @15,25 say date
       @18,25 say discount
       @21,25 say price
       @24,25 say uni
       @27,25 say incomes
       @1,50 say art_img bitmap isometric size 15,15
@30,16 get rec_final function "*h <#;<;>;#>;Eliminar;Regresar" size 2,5,4
      READ 
do case
    case rec_final=1
        go bottom
    case rec_final=2
        if !eof()
            skip
        if eof()
            messagebox("Fin de la lista", 0+32, "Ramos Fashion | Ropa Y Moda")
            go bottom
        endif
        endif
    case rec_final=3
        if !bof()
            SKIP -1
        if bof()
            messagebox("Fin de la lista", 0+32, "Ramos Fashion | Ropa Y Moda")
            go TOP 
        endif
        endif
    case rec_final=4
        GO TOP 
    CASE rec_final=5
        IF MESSAGEBOX("Seguro desea eliminar este catalogo", 4+64, "Ramos Fashion | Ropa Y Moda")=6
            DELETE
            PACK
            SKIP
        ELSE 
            MESSAGEBOX("Recibido", 0+32, "Ramos Fashion | Ropa Y Moda")
            CLEAR
            LOOP 
        ENDIF 
    CASE rec_final=6 
        ACTIVATE WINDOW rest
            @1,2 say "¿Que desea hacer?"
            @3,2 get rec function "*H Volver a Ver;Menu" size 3,2,3
                READ 
                    DO CASE 
                        case rec=1
                            DEACTIVATE WINDOW rest, pict, inpt
                            CLEAR
                            EXIT
                        CASE rec=2 
                            DEACTIVATE WINDOW pict,inpt,rest
                            CLEAR
                            REINDEX
                            DO fash_principal WITH hisname, hissurname, pass_user, numbers, histype, one
                    ENDCASE
ENDCASE
ENDDO
ENDDO


