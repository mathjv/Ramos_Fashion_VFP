CLEAR ALL
SET SYSMENU TO
DO fash_bienvenido.mpr
SET DEFAULT TO c:/fashion
DO WHILE .t.
SET CENTURY ON 
define window inpt from 5,50 to 30,130 title "Ramos Fashion | Inicio de Sesion"+"                                                                                                                         "+cdow(date())+", "+mdy(date())
    USE fash_usuarios index ci
    STORE space(20) TO nam, sur
    STORE SPACE(4) TO tp, nu, ask
    STORE SPACE(350) TO ph, hisname, hissurname, histype, pass_user
    STORE space(10) TO id, nums, one
    STORE 0 TO cap, opt, num2, cptch, cptch_result
    STORE 1 TO ty
    STORE DATE() to dt
    STORE SPACE(12) TO pass
    STORE DATETIME() TO day
    STORE time() to time
SET ESCAPE OFF
ACTIVATE WINDOW inpt
    @9,1 say "C:\fashion\pict_sys/perfil/clave.jfif" bitmap isometric size 12,12
    @1,16 say "Ramos Fashion | Ropa Y Moda" font "Ubuntu",20
    @4,20 say "Bienvenido(a) al mundo de la Moda" font "Poppins",15
    @7,16 say "Identificacion/Cedula: " font "Arial black",10 get id pict "9999999999" valid not EMPTY(id) or LEN(ALLTRIM(id))=10 error "Enter a valid ID" font "Noto Sans",8
        READ
            SEEK(id)
                IF FOUND()
                    DEFINE WINDOW account FROM 5,160 TO 30,190 TITLE "                      "+ALLTRIM(name)+" "+ALLTRIM(surname)
                    ACTIVATE WINDOW account 
                        @0,0 say user_photo bitmap isometric size 30,30
                ELSE 
                    MESSAGEBOX("Cuenta no registrada.",0+32,"Ramos Fashion | Ropa Y Moda")
                    CLEAR
                    LOOP 
               ENDIF 
ACTIVATE WINDOW inpt
        @12,16 say "Contraseņa: " font "Arial black",10 get pass valid ALLTRIM(pass)==ALLTRIM(password) and !EMPTY(pass) error "INCORRECT PASSWORD"
            READ
                                    
                                   DEACTIVATE WINDOW inpt, account
                                        hisname=ALLTRIM(name)
                                        histype=ALLTRIM(type)
                                        hissurname=ALLTRIM(surname)
                                        pass_user=ALLTRIM(pass)                                     
                                        one=ALLTRIM(id)
                                        USE fash_historial
                                            APPEND BLANK
                                                replace username WITH hisname
                                                replace surname WITH hissurname
                                                replace type WITH histype
                                                replace date WITH day
                                    CLEAR
                                    DO CASE
                                        CASE histype="OPER"
                                            DO fash_principal_oper WITH hisname, hissurname, pass_user, histype, one
                                        CASE histype="ADMN"
                                            DO fash_principal WITH hisname, hissurname, pass_user, histype, one
                                    ENDCASE 
            ELSE
                messagebox("Proceso Cancelado", 0+32, "Ramos Fashion | Ropa Y Moda")
                CLEAR ALL 
                DEACTIVATE WINDOW inpt
                exit
            ENDIF                    
ENDDO