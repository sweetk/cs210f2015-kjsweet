;KJ Sweet
;Lab8 Optional Part
;January 30, 2016
;All work is mine unless otherwise cited
;
;This program will emulate the C program
;  #include <stdio.h>
;	int main() {			 
; 	int i = 36;
; 	int j = 15;	
; 	int k = i*i + j*j;	
; 	printf("i=%d,j=%d,k=%d\n",i,j,k);
;  }


    extern  printf  ; C's printf function

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    section .data   ; constants

i:    dd    36      ; dd = 32 bit word
j:    dd    15
fmt:  db    "i=%d,j=%d,k=%d",10,0  ;like .ascii
                                   ;10 = '\n', 0 = '\0'

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    section .bss    ;variables!

k:  resb    4       ;reserve one 4 byte word

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    section .text   ;program

    global  main    ;follow C program conventions
main:
    push    ebp     ;This is important
    mov     ebp,esp ;For whatever reason

    mov     eax,[i] ;eax = i
    mov     ebx,[i] ;oh, NOW you tell me there are two registers I can use
    mul	    ebx	    ;eax = eax * ebx
    mov     [k],eax ;k stores i*i

    mov     eax,[j] ;eax = i
    mov     ebx,[j] ;oh, NOW you tell me there are two registers I can use
    mul	    ebx	    ;eax = eax * ebx

    add     eax,[k] ;eax = i*i + j*j
    mov     [k],eax ;k now contains the answer

    ;Now let's print!!!
    push    dword   [k]   ;last argument first
    push    dword   [j]
    push    dword   [i]
    push    dword   fmt   ;the format is the first argument
    call    printf
    add     esp,16        ;pushed 4 words, pop 16 bytes

    mov     esp,ebp ;again important for some reason
    pop     ebp     ;does something

    ret             ;return from program
