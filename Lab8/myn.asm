;KJ Sweet
;Lab8
;January 30, 2016
;All work is mine unless otherwise cited
;
;This program will emulate the C program
;  #include <stdio.h>
;  int main() {
;    int r = 119;
;    int s = -32;
;    int t = 7;
;    int u = (r-(s-t)) & (s+t-r);
;    printf("r=%d,s=%d,t=%d,u=%d\n",r,s,t,u);
;  }

    extern  printf  ; C's printf function

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    section .data   ; constants

r:    dd    119     ; dd = 32 bit word
s:    dd    -32
t:    dd    7
fmt:  bd    "r=%d,s=%d,t=%d,u=%d\n",10,0  ;like .ascii
                                          ;10 = '\n', 0 = '\0'

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    section .bbs    ;variables!

u:  resb    4       ;reserve one 4 byte word

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    section .text   ;program

    global  main    ;follow C program conventions
main:
    push    ebp     ;This is important
    mov     ebp,esp ;For whatever reason

    mov     eax,[s] ;eax = s
    sub     eax,[t] ;eax = s-t
    mov     [u],eax ;save what I have already in u

    mov     eax,[r] ;eax = r
    sub     eax,[u] ;eax = (r-(s-t))
    mov     [u],eax ;save what I already have in u (again!)

    mov     eax,[s] ;eax = s
    add     eax,[t] ;eax = s+t
    sub     eax,[r] ;eax = (s+t-r)

    and     eax,[u] ;eax = eax & u (order shouldn't matter)
                    ;(technically this is backwards though)
    mov     [u],eax ;now u is what it is supposed to be

    ;Now let's print!!!
    push    dword   [u]   ;last argument first
    push    dword   [t]
    push    dword   [s]
    push    dword   [r]
    push    dword   fmt   ;the format is the first argument
    call    printf
    add     esp,20        ;pushed 5 words, pop 20 bytes

    mov     esp,ebp ;again important for some reason
    pop     ebp     ;does something

    ret             ;return from program
