%include "../include/io.mac"

section .text
    global simple
    extern printf

simple:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     ecx, [ebp + 8]  ; len
    mov     esi, [ebp + 12] ; plain
    mov     edi, [ebp + 16] ; enc_string
    mov     edx, [ebp + 20] ; step

    ;; DO NOT MODIFY
   
    ;; Your code starts here

   xor eax, eax            ; contorul structurii de tip loop, initializat cu 0
   xor ebx, ebx  

parcurgere_string:
    cmp eax, ecx           ; verific daca am parcurs tot cuvantul
    je end_loop            ; inchei structura repetitiva daca am parcurs tot cuvantul
    mov bl, [esi + eax]    ; copiez litera curenta din cuvant
    add bl, dl             ; adaug step la litera curenta
    mov bh, 'Z'
    cmp bl, bh             ; verific daca litera curenta este 'Z'
    jle adaugare_caracter  ; daca litera actualizata este 'Z' sau mai mica decat 'Z'
    sub bl, 90             ; scad 90 pentru a ajunge la valoarea 0
    add bl, 64             ; adun 64 pentru a ajunge la valoarea lui 'A'

adaugare_caracter:
    xor bh, bh
    mov [edi + eax], ebx   ; salvez litera actualizata in string-ul nou
    add eax, 1             ; incrementez contorul
    jmp parcurgere_string  ; ma intorc la label-ul de tip loop
    
end_loop:

    ;; Your code ends here
    
    ;; DO NOT MODIFY

    popa
    leave
    ret
    
    ;; DO NOT MODIFY
