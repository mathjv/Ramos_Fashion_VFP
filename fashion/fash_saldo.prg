PARAMETERS hisname, hissurname, pass_user, numbers, histype, one
do while .t.
define windows sis from 1,10 to 16,100 title "Sistema de Catalogo de Saldos"
define windows ing from 13,10 to 28,100 title "PATRIMONIO NETO DE RAMOS FASHION COMPANY"
USE fash_ropa_mercaderia
    CLEAR
    go 1
    store 0 to math, rec, inc
    STORE DATE() TO day
activate windows ing
activate windows sis
    browse fields art_code:h="CATALOGO", descript:h="DESCRIPCION", price:h="PRECIO" noappend noedit nodelete
activate windows ing
    @1,5 say "Click para ver su Saldo: " get math function "*h Saldo/Patrimonio/Ingresos" size 3, 2, 3
        read
        do while !eof()
            math=incomes
            inc=math+inc
            SKIP
        enddo
    @5,32 say inc pict "$###,###.99" font "Arial Black",20
    @5,7 say inc pict "Usted Tiene: " font "Arial Black",20 color r+/W**
    @5,58 get rec function "*h Guardar Registro;Volver al Menú" size 3, 2, 3
        read
        if rec=1
            USE fash_saldos
            append blank
                  replace username with hisname
                  replace surname with hissurname
                  replace total_inc with inc
                  replace date with day
                  messagebox("Saldo Guardado Exitosamente", 0+32, "Ramos Fashion | Ropa Y Moda")
                  DEACTIVATE WINDOW sis, ing
                  CLEAR
                  DO fash_principal WITH hisname, hissurname, histype, pass_user, one, numbers
        ELSE
            DEACTIVATE WINDOW ing, sis
            CLEAR
            DO fash_principal WITH hisname, hissurname, pass_user, numbers, histype, one
        endif
enddo