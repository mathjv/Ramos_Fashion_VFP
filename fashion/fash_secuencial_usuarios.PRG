PARAMETERS hisname, hissurname, pass_user, numbers, histype, one
CLEAR
do while .t.
define window opt from 1,156 to 15,180 title "                 Ramos Fashion | Ropa Y Moda"
DEFINE WINDOW ing from 12,15 to 35,155 TITLE "                                                                                                                                                            Ramos Fashion | Ropa Y Moda"
DEFINE WINDOW img FROM 1,50 to 15,130 TITLE "Ramos Fashion | Ropa Y Moda                                                                                                               "+cdow(date())+", "+mdy(date())
**********************************
use fash_usuarios index ci
SET DELETED ON
    store 0 to op, op3
    store 1 to op2
activate windows img
    @0,12 say "C:\fashion\pict_sys/fash.jpg" bitmap isometric size 50,52
activate window opt
    @1,4 get op2 function "*rv OPERADOR;ADMINISTRADOR" font "Arial Black",10 color r+/w**
        read 
    @6,6 get op3 function "* Aceptar" font "Arial Black",10 color r+/w**
        read
         do case
             case op2=1
                 set filter to type="OPER"
             case op2=2
                 set filter to type="ADMN"
         endcase
activate windows ing
  SKIP
  DO WHILE .t.
    CLEAR
    @1,2 say "Fecha de Ingreso:"
    @3,2 say "Cedula:"
    @5,2 say "Rol:"
    @1,54 say "Clave:"
    *Replace
    @1,20 say date
    @3,12 say id_number
    @5,11 say type
    @1,61 say "**********"
    @1,110 say name
    @1,120 say surname
    @2,110 say user_photo bitmap isometric size 20,20    
@18,25 get op function "*h <#;<;>;#>;Regresar al Menu;Volver a ver;Eliminar" size 2, 3, 2
  READ
do case
    case op=1
        go bottom
    case op=2
        if !eof()
            skip
        if eof()
            messagebox("Fin de la lista", 0+32, "Ramos Fashion | Ropa Y Moda")
            go bottom
        endif
        endif
    case op=3
        if !bof()
            SKIP -1
        if bof()
            messagebox("Fin de la lista", 0+32, "Ramos Fashion | Ropa Y Moda")
            go TOP 
        endif
        endif
    case op=4
        go top
    case op=5
        DEACTIVATE WINDOW ing, img, opt
        CLEAR
        REINDEX
        DO fash_principal with hisname, hissurname, pass_user, numbers, histype, one
    case op=6
        DEACTIVATE WINDOW ing, img, opt
        CLEAR
        EXIT
    CASE op=7
        IF name=hisname
            MESSAGEBOX("No se puede eliminar a usted mismo", 0+32, "Ramos Fashion | Ropa Y Moda")
            GO BOTTOM
        ELSE
            DELETE
            PACK
            SKIP
            REINDEX
        ENDIF
ENDCASE
ENDDO 
ENDDO 
