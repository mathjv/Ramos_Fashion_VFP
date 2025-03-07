CLEAR ALL
SET SYSMENU TO
DO fash_bienvenido.mpr
SET DEFAULT TO c:/fashion
DO WHILE .t.
SET ESCAPE OFF
SET CENTURY ON 
DEFINE WINDOW pic FROM 25,50 TO 42,130 TITLE "Ramos Fashion"
define window inpt from 5,50 to 30,130 title "Ramos Fashion."+"                                                                                                                        "+cdow(date())+", "+mdy(date())
    USE fash_usuarios INDEX ci
    STORE space(20) TO nam, sur
    STORE SPACE(4) TO tp, nu
    STORE SPACE(10) TO capt_result, capt_result_entered
    STORE SPACE(350) TO ph
    STORE space(10) TO id, num
    STORE 0 TO cap, opt, num2
    STORE 1 TO ty
    STORE DATE() to dt
    STORE SPACE(15) TO pass, pass_rep, adm
    STORE DATETIME() TO day
    STORE time() to time
    nu="NA"
    adm="admin"
    cond=.t.
ACTIVATE WINDOW pic
    @0,0 say "C:\fashion\pict_sys/fash.jpg" bitmap isometric size 80, 80
ACTIVATE WINDOW inpt
    @1,6 say "Ramos Fashion" font "Verdana",20
    @4,6 say "Catalogos: Ropa y Moda | Compras Boutique" font "Verdana",15
    @7,4 say "Cedula: " font "Arial black" get id pict "9999999999" valid not EMPTY(id) or LEN(ALLTRIM(id))=10 error "Enter a valid ID" font "Noto Sans",8
        READ
            seek id
                if found()
                    messagebox("Cedula ya en uso", 0+48, "ERROR 204")
                    loop
                ENDIF
    @10,8 say "Nombre: " font "Arial black",10
    @10,20 get nam pict "AAAAAAAAAAAAAAAAAAAA" valid not EMPTY(nam) error "This field can't be empty" font "Noto Sans",8
    @12,8 say "Apellidos: " font "Arial black",10
    @12,20 get sur pict "AAAAAAAAAAAAAAAAAAAA" valid not EMPTY(sur) error "This field can't be empty" font "Noto Sans",8
    @16,8 say "Contraseņa:   " font "Arial black",10 get pass valid not EMPTY(pass) and LEN(ALLTRIM(pass))>=5 error "Debe agregar una contraseņa de minimo 5 caracteres"
       READ 
        IF !EMPTY(pass)
            @18,8 say "Repetir Contraseņa:    " font "Arial black",10 get pass_rep valid not EMPTY(pass_rep) and pass=pass_rep error "Debe repetir la contraseņa obligatoriamente"
                read
        ENDIF
    @10,38 say "Tipo de usuario: " font "Arial black",10 get ty function "*rv Operador;Administrador" font "Arial black",10
        READ 
        do CASE 
            case ty=1
                tp="OPER"
            case ty=2
                tp="ADMN"
        ENDCASE 
    @20,43 get opt function "*h Registrarse!;Cancelar Registro" size 3, 2, 3
        READ 
            IF opt=1
                APPEND BLANK 
                    replace id_number with id
                    replace name with ALLTRIM(nam)
                    replace surname WITH ALLTRIM(sur)
                    replace type with ALLTRIM(tp)
                    replace date with day
                    replace password WITH ALLTRIM(pass)
                    DO CASE
                        CASE EMPTY(pass)
                            replace password WITH ALLTRIM(adm)
                    ENDCASE
                    IF messagebox("Ingresar foto de usuario?", 4+64, "Ramos Fashion | Ropa Y Moda")=6
                        DO WHILE cond
                            ph=getfile()
                            IF !EMPTY(ph)  
                                replace user_photo WITH ALLTRIM(ph)
                                messagebox("Imagen Cargada Exitosamente", 0+64, "Ramos Fashion | Ropa Y Moda")
                                cond=.f.
                            ELSE 
                                messagebox("Debe Insertar una foto de Usuario..", 00+48, "Ramos Fashion | Ropa Y Moda")
                                loop
                            ENDIF
                            cond=.f.
                        ENDDO
                    ELSE
                        DO WHILE cond
                            messagebox("Debe insertar una foto de Usuario..", 0+48, "Ramos Fashion | Ropa Y Moda")
                            ph=getfile()
                            IF !EMPTY(ph)  
                                replace user_photo WITH ALLTRIM(ph)
                                messagebox("Imagen Cargada exitosamente", 0+64, "Ramos Fashion | Ropa Y Moda")
                                cond=.f.
                            ELSE 
                                loop
                            ENDIF
                            cond=.f.
                        ENDDO 
                    ENDIF
                                    DEACTIVATE WINDOW inpt, capt, capt2
                                    CLEAR 
                                    DO fash_sesion                  
            ELSE
                messagebox("Proceso cancelado.", 0+32, "Ramos Fashion | Ropa Y Moda")
                CLEAR ALL 
                DEACTIVATE WINDOW inpt
                QUIT
            ENDIF                    
ENDDO