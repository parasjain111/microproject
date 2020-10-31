; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h          



MSG1 DB 10,13,’ENTERED PASSWORD : $’
MSG2 DB 10,13,’YOU HAVE ENTERED WRONG PASSWORD !!! $’
MSG3 DB 10,13,’YOU HAVE ENTERED CORRECT PASSWORD ! $’
MSG4 DB 10,13,’PASSWORD LENGTH IS NOT EQUAL $’

STR1 DB "MICROPRO"
P1 LABEL BYTE
M1 DB 0FFH
L1 DB ?
P11 DB 0FFH DUP ('$')
DISPLAY MACRO MSG
MOV AH,9
LEA DX,MSG
INT 21H
ENDM

INTRO DB '* MEDICAL SHOP SYSTEM *$',10,13
INTRO2 DB '*   MICRO PROJECT REVIEW 2.0    * $',10,13   
INTRO3 DB '*  Enter the password * $',10,13

                              
ENTER DB 10,13,'PLEASE ENTER THE KEYS WHAT YOU WANT TO BUY: $'

INFO DB 10,13,'KEYS         ITEMS               PRICE$'

VITA_C DB 10,13,' 1    Vitamin C with Zinc        Rs 290 $'
                        
VOL_SPR DB 10,13,' 2    Volini Spray               Rs 50 $'
                     
N_95 DB 10,13,' 3    N95 (Mask)               Rs 240 $'

VICKS DB 10,13,' 4    Vicks               Rs 120 $'

DIGENE_TAB DB 10,13,' 5    DIGENE TABLETS           Rs 20 $'

OMEGA_CAP DB 10,13,' 6   OMEGA Capsule    Rs 210 $'

OXI_MET DB 10,13,' 7    Oximeter                   Rs 1040 $'

CREPEBAND DB 10,13,' 8    Crepe Bandage              Rs 115 $'


AMBROLITE DB 10,13,' 9    Ambrolite Syrup          Rs 70 $'




E_QUANTITY DB 10,13,'ENTER QUANTITY: $'

AGAIN DB 10,13,'DO YOU WANT TO BUY MORE? (1.YES || 2.NO): $'

ER_MSG DB 10,13,'ERROR INPUT$'  

CHOICE DB 10,13,'ENTER YOUR CHOICE:$'    

FT DB 10,13,'TOTAL AMOUNT IS :$' 
 
ERR DB 0DH,0AH,'WRONG INPUT! START FROM THE BEGINNING $'   

ERR2 DB 0DH,0AH,'WRONG INPUT.PRESS Y/Y OR N/N $' 

R DB 0DH,0AH,'PRESENT AMOUNT IS : $' 

E_DISCOUNT DB 10,13,'ENTER DISCOUNT(IF NOT AVAILABLE ENTER 0 ): $' 

ERASK DB 10,13,'START FROM THE BEGINNING $'

EN_DIS DB 10,13,'AGAIN ENTER DISCOUNT: $'   


A DW ?                           ;DECALRED VARIABLES
B DW ?
C DW ?
S DW 0,'$'
                                 
NL DB 0DH,0AH,'$'                ;NEW LINE    
   
filename db "c:/ss2.doc", 0
    handle dw ?
    data1 db "write me i am !$"
    buffer db 200 dup(' ') 
    errormess db "Error in opening file!$"
.stack 100h

 
.CODE
  
     MOV AX, @DATA               
     MOV DS, AX     
     
     
     LEA DX,INTRO                ;PRINT INTRO STRING 
     MOV AH,9
     INT 21H
     
     LEA DX,INTRO2               ;PRINT INTRO2 STRING 
     MOV AH,9
     INT 21H     
     
          
     LEA DX,NL                   ;PRINT A NEW LINE
     MOV AH,9
     INT 21H       

DISPLAY MSG1

LEA DX,P1
MOV AH,0AH
INT 21H

CMP L1,8
JNE NOTEQUAL

LEA SI,STR1
LEA DI,P11

MOV CX,8
CHECK:
MOV AL,[SI]
CMP [DI],AL
JNE NOPASWD
INC SI
INC DI
LOOP CHECK

DISPLAY MSG3 
       
     LEA DX,NL                   ;PRINT A NEW LINE
     MOV AH,9
     INT 21H       

     JMP BEGINTOP


NOTEQUAL:
DISPLAY MSG4

NOPASWD:
DISPLAY MSG2
JMP EXIT

EXIT: MOV AH,4CH
INT 21H

    
          
     LEA DX,NL                   ;PRINT A NEW LINE
     MOV AH,9
     INT 21H       

     JMP BEGINTOP                ;DIRECTLY GO TO BEGINTOP LEBEL WHERE USER WILL GIVE INPUT 

 ERROR121:  
                  
     LEA DX,ER_MSG               ;PRINT ERROR MESSAGE 
     MOV AH,9
     INT 21H 
                                 ;IF USER GIVES AN ERROR THEN USER WILL BE ASKED TO INPUT AGAIN
     LEA DX,ERASK
     MOV AH,9
     INT 21H
                

 BEGINTOP:   
 
     LEA DX,NL                   ;PRINT A NEW LINE
     MOV AH,9
     INT 21H
    
                                 
     MOV BL,10                   ;COLOR CODE
     MOV AH,9 
     MOV AL,0  
     INT 10H                
      
     LEA DX,INFO                 ;PRINT INFO STRING
     MOV AH,9 
     INT 21H                     
     
     MOV BL,11                   ;COLOR CODE
     MOV AH,9 
     MOV AL,0  
     INT 10H   
   
        

     LEA DX,VITA_C              ;PRINT VITAMIN C AS STRING
     MOV AH,9
     INT 21H 
     
     LEA DX,NL                   ;PRINT A NEW LINE
     MOV AH,9
     INT 21H

                  
     LEA DX,VOL_SPR              ;PRINT VOLINI SPRAY STRING
     MOV AH,9
     INT 21H  
     
     LEA DX,NL                   ;PRINT A NEW LINE
     MOV AH,9
     INT 21H
     
                   
     LEA DX,N_95            ;PRINT N_95 MASK STRING
     MOV AH,9
     INT 21H    
     
     LEA DX,NL                   ;PRINT A NEW LINE
     MOV AH,9
     INT 21H
     
                   
     LEA DX,VICKS              ;PRINT VICKS STRING
     MOV AH,9
     INT 21H   
     
     LEA DX,NL                   ;PRINT A NEW LINE
     MOV AH,9
     INT 21H
     
                   
     LEA DX,DIGENE_TAB            ;PRINT DIGENE TABLET STRING
     MOV AH,9
     INT 21H  
     
     LEA DX,NL                   ;PRINT A NEW LINE
     MOV AH,9
     INT 21H
     
                   
     LEA DX,OMEGA_CAP          ;PRINT OMEGA CAPSULES STRING
     MOV AH,9
     INT 21H 
     
     LEA DX,NL                   ;PRINT A NEW LINE
     MOV AH,9
     INT 21H
     
     LEA DX,OXI_MET              ;PRINT OXIMETER STRING
     MOV AH,9
     INT 21H    
     
     LEA DX,NL                   ;PRINT A NEW LINE
     MOV AH,9
     INT 21H
     
      
     LEA DX,CREPEBAND              ;PRINT CREPEBAND STRING
     MOV AH,9       
     INT 21H    
     
     LEA DX,NL                   ;PRINT A NEW LINE
     MOV AH,9
     INT 21H
     
      
     LEA DX,AMBROLITE                ;PRINT AMBROLITE STRING
     MOV AH,9       
     INT 21H    
     
     LEA DX,NL                   ;PRINT A NEW LINE
     MOV AH,9
     INT 21H
            
     LEA DX,ENTER                ;PRINT ENTER STRING
     MOV AH,9       
     INT 21H    
        
     
     MOV AH,1                    ;TAKE AN INPUT & SAVED TO AL
     INT 21H 
     
                                 
     CMP AL,49     
     
     
                   ;IF AL=1 GO TO VITA_CB LEBEL
     JE VITA_CB
     
     CMP AL,50                   ;IF AL=2 GO TO VOL_SPRB LEBEL  
     
           
     
     JE VOL_SPRB
     
     CMP AL,51                   ;IF AL=3 GO TO N_95B LEBEL  
     
     
      
     
     
     JE N_95B
     
     CMP AL,52                   ;IF AL=4 GO TO VICKSB LEBEL 
       
     
     
     JE VICKSB
     
     CMP AL,53                   ;IF AL=5 GO TO DIGENE_TABB LEBEL    
     
     JE DIGENE_TABB
     
     CMP AL,54                   ;IF AL=6 GO TO OMEGA_CAPB LEBEL 
    
     JE OMEGA_CAPB
     
     CMP AL,55                   ;IF AL=7 GO TO OXI_METB LEBEL  
     
    
     JE OXI_METB
     
     CMP AL,56                   ;IF AL=8 GO TO CREPEBANDB LEBEL  
     
   
     JE CREPEBANDB
     
     CMP AL,57                   ;IF AL=9 GO TO AMBROLITEB LEBEL 
       
     
     JE AMBROLITEB
     
    
     
     
     JMP ERROR121                ;IF WRONG KEYWORD IS PRESSED THEN THE MEDICINE LIST WILL SHOW AGAIN 
     
  
VITA_CB:     
     
   

    mov AH,3dh
    mov AL,2
    lea dx,filename
    int 21h

    mov handle,AX
    jc erroropen
    jmp noerror
    erroropen:
        lea dx, errormess
        mov ah, 09h
        int 21h
        jmp exit
    noerror:

    mov bx, handle
    mov ah, 42h  ; "lseek"
    mov al, 2    ; position relative to end of file
    mov cx, 0    ; offset MSW
    mov dx, 0    ; offset LSW
    int 21h

    ;mov bx, handle
    mov dx, offset VITA_C
    mov cx, 40
    mov ah, 40h
    int 21h ; write to file...

    mov bx, handle
    mov ah, 3eh
    int 21h ; close file... 



                                 
MOV A,290                        ;PRICE OF VITAMIN C TABLETS IS MOVED TO A WHERE PRICE IS 290

JMP QUANTITY

VOL_SPRB:       

         
      mov AH,3dh
    mov AL,2
    lea dx,filename
    int 21h

    mov handle,AX
    jc erroropen1
    jmp noerror1
    erroropen1:
        lea dx, errormess
        mov ah, 09h
        int 21h
        jmp exit
    noerror1:

    mov bx, handle
    mov ah, 42h  ; "lseek"
    mov al, 2    ; position relative to end of file
    mov cx, 0    ; offset MSW
    mov dx, 0    ; offset LSW
    int 21h

    ;mov bx, handle
    mov dx, offset VOL_SPR
    mov cx, 40
    mov ah, 40h
    int 21h ; write to file...

    mov bx, handle
    mov ah, 3eh
    int 21h ; close file...    
     



MOV A,50                        ;PRICE OF VOLINI SPRAY IS MOVED TO A WHERE PRICE IS 50

JMP QUANTITY 

N_95B:              

      
       mov AH,3dh
    mov AL,2
    lea dx,filename
    int 21h

    mov handle,AX
    jc erroropen2
    jmp noerror2
    erroropen2:
        lea dx, errormess
        mov ah, 09h
        int 21h
        jmp exit
    noerror2:

    mov bx, handle
    mov ah, 42h  ; "lseek"
    mov al, 2    ; position relative to end of file
    mov cx, 0    ; offset MSW
    mov dx, 0    ; offset LSW
    int 21h

    ;mov bx, handle
    mov dx, offset N_95
    mov cx, 40
    mov ah, 40h
    int 21h ; write to file...

    mov bx, handle
    mov ah, 3eh
    int 21h ; close file...  




MOV A,240                        ;PRICE OF N_95 IS MOVED TO A WHERE PRICE IS 240

JMP QUANTITY 

VICKSB:              

 mov AH,3dh
    mov AL,2
    lea dx,filename
    int 21h

    mov handle,AX
    jc erroropen3
    jmp noerror3
    erroropen3:
        lea dx, errormess
        mov ah, 09h
        int 21h
        jmp exit
    noerror3:

    mov bx, handle
    mov ah, 42h  ; "lseek"
    mov al, 2    ; position relative to end of file
    mov cx, 0    ; offset MSW
    mov dx, 0    ; offset LSW
    int 21h

    ;mov bx, handle
    mov dx, offset VICKS
    mov cx, 40
    mov ah, 40h
    int 21h ; write to file...

    mov bx, handle
    mov ah, 3eh
    int 21h ; close file...  


MOV A,120                        ;PRICE OF VICKS IS MOVED TO A WHERE PRICE IS 120

JMP QUANTITY 

DIGENE_TABB:               


 mov AH,3dh
    mov AL,2
    lea dx,filename
    int 21h

    mov handle,AX
    jc erroropen4
    jmp noerror4
    erroropen4:
        lea dx, errormess
        mov ah, 09h
        int 21h
        jmp exit
    noerror4:

    mov bx, handle
    mov ah, 42h  ; "lseek"
    mov al, 2    ; position relative to end of file
    mov cx, 0    ; offset MSW
    mov dx, 0    ; offset LSW
    int 21h

    ;mov bx, handle
    mov dx, offset DIGENE_TAB
    mov cx, 40
    mov ah, 40h
    int 21h ; write to file...

    mov bx, handle
    mov ah, 3eh
    int 21h ; close file...  


MOV A,20                        ;PRICE OF DIGENE TABLETS IS MOVED TO A WHERE PRICE IS 20

JMP QUANTITY 

OMEGA_CAPB:          


 mov AH,3dh
    mov AL,2
    lea dx,filename
    int 21h

    mov handle,AX
    jc erroropen5
    jmp noerror5
    erroropen5:
        lea dx, errormess
        mov ah, 09h
        int 21h
        jmp exit
    noerror5:

    mov bx, handle
    mov ah, 42h  ; "lseek"
    mov al, 2    ; position relative to end of file
    mov cx, 0    ; offset MSW
    mov dx, 0    ; offset LSW
    int 21h

    ;mov bx, handle
    mov dx, offset OMEGA_CAP
    mov cx, 40
    mov ah, 40h
    int 21h ; write to file...

    mov bx, handle
    mov ah, 3eh
    int 21h ; close file...  



MOV A,210                        ;PRICE OF OMEGA CAPSULES IS MOVED TO A WHERE PRICE IS 210

JMP QUANTITY 

OXI_METB:                   


 mov AH,3dh
    mov AL,2
    lea dx,filename
    int 21h

    mov handle,AX
    jc erroropen6
    jmp noerror6
    erroropen6:
        lea dx, errormess
        mov ah, 09h
        int 21h
        jmp exit
    noerror6:

    mov bx, handle
    mov ah, 42h  ; "lseek"
    mov al, 2    ; position relative to end of file
    mov cx, 0    ; offset MSW
    mov dx, 0    ; offset LSW
    int 21h

    ;mov bx, handle
    mov dx, offset OXI_MET
    mov cx, 40
    mov ah, 40h
    int 21h ; write to file...

    mov bx, handle
    mov ah, 3eh
    int 21h ; close file...  


MOV A,1040                        ;PRICE OF OXIMETER IS MOVED TO A WHERE PRICE IS 1040

JMP QUANTITY 

CREPEBANDB:       

 mov AH,3dh
    mov AL,2
    lea dx,filename
    int 21h

    mov handle,AX
    jc erroropen7
    jmp noerror7
    erroropen7:
        lea dx, errormess
        mov ah, 09h
        int 21h
        jmp exit
    noerror7:

    mov bx, handle
    mov ah, 42h  ; "lseek"
    mov al, 2    ; position relative to end of file
    mov cx, 0    ; offset MSW
    mov dx, 0    ; offset LSW
    int 21h

    ;mov bx, handle
    mov dx, offset CREPEBAND
    mov cx, 40
    mov ah, 40h
    int 21h ; write to file...

    mov bx, handle
    mov ah, 3eh
    int 21h ; close file...  


MOV A,115                        ;PRICE OF CREPEBAND IS MOVED TO A WHERE PRICE IS 115

JMP QUANTITY 

AMBROLITEB:         



 mov AH,3dh
    mov AL,2
    lea dx,filename
    int 21h

    mov handle,AX
    jc erroropen8
    jmp noerror8
    erroropen8:
        lea dx, errormess
        mov ah, 09h
        int 21h
        jmp exit
    noerror8:

    mov bx, handle
    mov ah, 42h  ; "lseek"
    mov al, 2    ; position relative to end of file
    mov cx, 0    ; offset MSW
    mov dx, 0    ; offset LSW
    int 21h

    ;mov bx, handle
    mov dx, offset AMBROLITE
    mov cx, 40
    mov ah, 40h
    int 21h ; write to file...

    mov bx, handle
    mov ah, 3eh
    int 21h ; close file...  


MOV A,70                        ;PRICE OF AMBROLITE IS MOVED TO A WHERE PRICE IS 70

JMP QUANTITY 

;AFTER MOVING PRICE PROGRAM WILL JUMP TO QUANTITY LEBEL    

QUANTITY:  

    MOV BL,6 
    MOV AH,9                     ;COLOR CODE
    MOV AL,0  
    INT 10H

    LEA DX,E_QUANTITY            ;PRINT ENTER QUANTITY STRING
    MOV AH,9
    INT 21H 
    MOV AH,00H
    MOV DI,AX
              
     mov AH,3dh
    mov AL,2
    lea dx,filename
    int 21h

    mov handle,AX
    jc erroropen10
    jmp noerror10
    erroropen10:
        lea dx, errormess
        mov ah, 09h
        int 21h
        jmp exit
    noerror10:

    mov bx, handle
    mov ah, 42h  ; "lseek"
    mov al, 2    ; position relative to end of file
    mov cx, 0    ; offset MSW
    mov dx, 0    ; offset LSW
    int 21h

    ;mov bx, handle 
    mov ah,00h  
    MOV SI,48H
   SUB DI,SI
   
    mov dx,DI
    mov cx, 4
    mov ah, 40h
    int 21h ; write to file...

    mov bx, handle
    mov ah, 3eh
    int 21h ; close file...    
    
              
    JMP MULTI           ;PROGRAM WILL GO TO MULTI LEBEL WHERE THE PRICE WILL BE MILTIPLIED WITH THE AMOUNT


ASK: 

    MOV BL,1                     ;COLOR  CODE
    MOV AH,9 
    MOV AL,0  
    INT 10H
    
    LEA DX,AGAIN                 ;PRINT AGAIN IF USER WANTS TO BUY MORE
    MOV AH,9
    INT 21H 
    
    MOV AH,1                     ;TAKES THE INPUT OF YES OR NO
    INT 21H
    
    CMP AL,49                    ;IF YES, THEN AGAIN GO TO MEDICAL LIST MENU AND BUY AGAIN
    JE BEGINTOP
    
    CMP AL,50
    JE OUTPUT2                   ;IF NO, PROGRAM WILL GIVE THE TOTAL OUTPUT
    
    LEA DX,ER_MSG
    MOV AH,9                     ;IF ANY WRONG INPUT, PRINT ERROR MESSAGE AND AGAIN ASK TO BUY AGAIN
    INT 21H
    
    JMP ASK                      
    


ERROR:
    
    LEA DX,ER_MSG                ;PRINT ERROR MESSAGE 
    MOV AH,9
    INT 21H
    
    JMP QUANTITY                 ;JUMP TO QUANTITY LEBEL
    
ER_DISCOUNT:   

    LEA DX,ER_MSG                ;DURING DISCOUNT INPUT IF WRONG INPUT IS PRESSES ERROR MESSSAGE WILL SHOW
    MOV AH,9
    INT 21H
    
    LEA DX,NL                    ;PRINT NEW LINE
    MOV AH,9
    INT 21H
    
    LEA DX,EN_DIS                ;PRINT AGAIN INPUT DISCOUNT VALUE 
    MOV AH,9
    INT 21H
    
    JMP INPUT_SUB                ;DIRECLTY JUMP TO INPUT OF DISCOUNT 
    
    
MULTI:         

    MOV BL,4                       ;COLOR CODE
    MOV AH,9 
    MOV AL,0  
    INT 10H    

INDEC3 PROC                        ;INDEC3 IS FOR TAKING INPUT FOR MULTIPLY WITH THE GIVEN AMOUNT
    
    PUSH BX                        ;TAKE VALUES INTO STACK 
    PUSH CX
    PUSH DX

    
    
    XOR BX,BX                       ;HOLDS TOTAL
    
    XOR CX,CX                       ;SIGN
                    
    
    MOV AH,1                        ;TAKE CHARACTER IN AL
    INT 21H


    
    REPEAT4: 
                                     
    CMP AL,48                       ;IF AL<0, PRINT ERROR MESSAGE
    JL ERROR
    
    CMP AL,57                       ;IF AL>9, PRINT ERRIR MESSAGE 
    JG ERROR


    AND AX,00FH                     ;CONVERT TO DIGIT
    PUSH AX                         ;SAVE ON STACK
    
    MOV AX,10                       ;GET 10
    MUL BX                          ;AX=TOTAL * 10
    POP BX                          ;GET DIGIT BACK
    ADD BX,AX                       ;TOTAL = TOTAL X 10 +DIGIT
    
    
    MOV AH,1
    INT 21H
    
    CMP AL,0DH                      ;CARRIAGE RETURN
    JNE REPEAT4                     ;IF NO CARRIEGE RETURN THEN MOVE ON
    
    MOV AX,BX                       ;STORE IN AX
    
    
    JMP MUL_
    
    POP DX                          ;RESTORE REGISTERS
    POP CX
    POP BX
    RET                             ;AND RETURN
    
    

INDEC3 ENDP                         ;END OF INDEC3 

ADD_: 


    ;SECOND VALUE STORED IN B
    MOV B,AX  
    
    MOV BL,4                         ;COLOR CODE
    MOV AH,9 
    MOV AL,0  
    INT 10H 
    
    
    XOR AX,AX                        ;CLEAR AX
    
    MOV AX,B                         ;MOV B TO AX
    ADD A,AX                         ;ADD A WITH AX
    
    
    MOV AX,A                         ;MOV A TO AX
    
    PUSH AX                          ;TAKE AX INTO STACK
    
    
    JMP END

SUB_: 


    ;SECOND VALUE STORED IN B
    MOV B,AX 
    
    LEA DX,R                         ;PRINT PRESENT AMOUNT STRING
    MOV AH,9
    INT 21H
    
    
    XOR AX,AX                        ;CLEAR AX
    
    MOV AX,B                         ;MOV B TO AX
    SUB A,AX                         ;SUBSTRACT AX FROM A
    
    
    MOV AX,A                         ;MOV A TO AX
    
    PUSH AX  
    
    ADD S,AX
    
    JMP OUTPUT

MUL_: 


    ;SECOND VALUE STORED IN B
    MOV B,AX             
    
    MOV BL,4
    MOV AH,9                         ;COLOR CODE
    MOV AL,0  
    INT 10H 
    
    LEA DX,E_DISCOUNT                ;PRINT ENTER DISCOUNT STRING
    MOV AH,9
    INT 21H
    
    XOR AX,AX                        ;CLEAR AX
    
    MOV AX,B
    
    MUL A                            ;MULTIPLY A WITH AX
    
    
    PUSH AX                          ;TAKE AX INTO STACK
    
    MOV A,AX 
   
                                     
    JMP INPUT_SUB                    ;JUMP TO INP1UT_SUB
    
    
    
    JMP OUTPUT 
                                          
INPUT_ADD: 

INDEC1 PROC                          ;INDEC PROC1 IS FOR ADDING THE PRESENT AMOUNTS INTO TOTAL 
    
    PUSH BX                          ;TAKE THE VALUES IN STACK
    PUSH CX
    PUSH DX
    
        
    BEGIN1:
    
    
    XOR BX,BX                        ;HOLDS TOTAL
    
    XOR CX,CX                        ;SIGN
                    
    
    MOV AH,1                         ;TAKE CHARACTER IN AL
    INT 21H

    
    REPEAT2: 
                                     ;IF AL<0, PRINT ERROR MESSAGE
    CMP AL,48
    JL ERROR
    
    CMP AL,57                        ;IF AL>9, PRINT ERROR MESSAGE
    JG ERROR


    AND AX,00FH                      ;CONVERT TO DIGIT
    PUSH AX                          ;SAVE ON STACK
    
    MOV AX,10                        ;GET 10
    MUL BX                           ;AX=TOTAL * 10
    POP BX                           ;GET DIGIT BACK
    ADD BX,AX                        ;TOTAL = TOTAL X 10 +DIGIT
    
    
    MOV AH,1                         ;TAKE VALUE INTO AL
    INT 21H
    
    CMP AL,0DH                       ;CARRIAGE RETURN
    JNE REPEAT2                      ;NO KEEP GOING
    
    MOV AX,BX                        ;STORE IN AX
                         
    
    JMP ADD_                         ;JUMP TO ADD_ TO STORE THE TOTAL VALUE
    
    POP DX                           ;RESTORE REGISTERS
    POP CX
    POP BX
    RET                              ;AND RETURN
    
    

INDEC1 ENDP   

INPUT_SUB: 

INDEC2 PROC
    
    PUSH BX                          ;SAVE TO STACK 
    PUSH CX
    PUSH DX
    
    
    
    XOR BX,BX                        ;HOLDS TOTAL
    
    XOR CX,CX                        ;SIGN
                    

    MOV AH,1                         ;CHAR IN AL
    INT 21H
    
    
    
    REPEAT3: 
    
    CMP AL,48                        ;IF AL<0, PRINT ERROR MESSAGE 
    JL ER_DISCOUNT
    
    CMP AL,57                        ;IF AL>9, PRINT ERROR MESSAGE 
    JG ER_DISCOUNT


    AND AX,00FH                      ;CONVERT TO DIGIT
    PUSH AX                          ;SAVE ON STACK
    
    MOV AX,10                        ;GET 10
    MUL BX                           ;AX=TOTAL * 10
    POP BX                           ;GET DIGIT BACK
    ADD BX,AX                        ;TOTAL = TOTAL X 10 +DIGIT
    
    
    MOV AH,1
    INT 21H
    
    CMP AL,0DH                       ;CARRIAGE RETURN
    JNE REPEAT3                      ;NO KEEP GOING
    
    MOV AX,BX                        ;STORE IN AX
    
    OR CX,CX                         ;NEG NUM
    
    
    JMP SUB_

    POP DX                           ;RESTORE REGISTERS
    POP CX
    POP BX
    RET                              ;AND RETURN
                            


INDEC2 ENDP 
    
OUTPUT:         

;OUTDEC PROC IS FOR GIVING THE OUTPUT OF THE PRESENT AMOUNT

OUTDEC PROC
    
    
    PUSH AX                          ;SAVE REGISTERS
    PUSH BX
    PUSH CX
    PUSH DX
    
    XOR CX,CX                        ;CX COUNTS DIGITS
    MOV BX,10D                       ;BX HAS DIVISOR
    
    REPEAT1:
    
    XOR DX,DX                        ;PREP HIGH WORD
    DIV BX                           ;AX = QUOTIENT, DX=REMAINDER
    
    PUSH DX                          ;SAVE REMAINDER ON STACK
    INC CX                           ;COUNT = COUNT +1
    
    OR AX,AX                         ;QUOTIENT = 0?
    JNE REPEAT1                      ;NO, KEEP GOING
    
    MOV AH,2                         ;PRINT CHAR FUNCTION
    
    PRINT_LOOP:
    
    POP DX                           ;DIGIT IN DL
    OR DL,30H                        ;CONVERT TO CHAR
    INT 21H                          ;PRINT DIGIT
    LOOP PRINT_LOOP                  ;LOOP UNTILL DONE
    
    POP DX
    POP CX                           ;RESTORE REGISTERS
    POP BX
    POP AX 
    
    JMP ASK
    
    RET
    OUTDEC ENDP 

OUTPUT2: 

    LEA DX,FT                        ;PRINT FINAL TOTAL
    MOV AH,9
    INT 21H
    
    XOR AX,AX                        ;CLEAR AX
    
    MOV AX,S                         ;SET AX INTO 0
    
    
    ;OUTDEC2 IS FOR GIVING THE TOTAL OUTPUT OF THE AMOUNT
    
                                     
OUTDEC2 PROC
    
    
    PUSH AX                          ;SAVE REGISTERS
    PUSH BX
    PUSH CX
    PUSH DX

    XOR CX,CX                        ;CX COUNTS DIGITS
    MOV BX,10D                       ;BX HAS DIVISOR
    
    REPEAT12:
    
    XOR DX,DX                        ;PREP HIGH WORD
    DIV BX                           ;AX = QUOTIENT, DX=REMAINDER
    
    PUSH DX                          ;SAVE REMAINDER ON STACK
    INC CX                           ;COUNT = COUNT +1
    
    OR AX,AX                         ;QUOTIENT = 0?
    JNE REPEAT12                     ;NO, KEEP GOING
    
    MOV AH,2                         ;PRINT CHAR FUNCTION
    
    PRINT_LOOP2:
    
    POP DX                           ;DIGIT IN DL
    OR DL,30H                        ;CONVERT TO CHAR
    INT 21H                          ;PRINT DIGIT
    LOOP PRINT_LOOP2                 ;LOOP UNTILL DONE
    
    POP DX
    POP CX                           ;RESTORE REGISTERS
    POP BX
    POP AX 
    

    OUTDEC2 ENDP 
 

     
END:
MOV AH, 4CH                  
INT 21H

ret  