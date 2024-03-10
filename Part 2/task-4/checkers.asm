
section .data

section .text
	global checkers

checkers:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]	; x
    mov ebx, [ebp + 12]	; y
    mov ecx, [ebp + 16] ; table

    ;; DO NOT MODIFY
    ;; FREESTYLE STARTS HERE

    xor dl, dl     ; subregistrul in care retin coloana noua 
    xor dh, dh     ; subregistrul in care retin linia noua
    mov esi, ecx   ; fac o copie a matricei

verificare_diagonala_stanga_jos:
    mov dl, bl     ; copiez coloana tablei
    sub dl, 1      ; actualizez coloana tablei
    cmp dl, 0      
    jl stop_1      ; verific daca pozitia este invalida, caz in care ma opresc
    mov dh, al     ; copiez linia tablei
    sub dh, 1      ; actualizez linia tablei
    cmp dh, 0  
    jl stop_1      ; verific daca coloana este invalida, caz in care ma opresc

adauga_pozitie_1:
    cmp dh, 0            ; verific daca sunt pe linia 0
    je nu_se_face_loop_1 ; daca sunt pe linia 0 nu intru in loop
    loop_1:
        add ecx, 8       ; adaug linii pana ajung la linia elementului pe care il adaug in matrice
        sub dh, 1        ; scad contorul liniilor
        jnz loop_1       ; cat timp contorul nu e 0, continui loop-ul de adaugare linii
    nu_se_face_loop_1:
    add ecx, edx         ; adaug coloana pentru a ajunge pe pozitia dorita
    mov byte [ecx], 1    ; pun 1 corespunzator in matrice
    mov ecx, esi          

stop_1:

    xor dl, dl           ; reinitializez coloana
    xor dh, dh           ; reinitializez linia

verificare_diagonala_stanga_sus:
    mov dl, bl      ; copiez coloana tablei
    sub dl, 1       ; actualizez coloana tablei
    cmp dl, 0
    jl stop_2       ; verific daca pozitia este invalida, caz in care ma opresc
    mov dh, al      ; copiez linia tablei
    add dh, 1       ; actualizez linia tablei
    cmp dh, 7
    jg stop_2       ; verific daca coloana este invalida, caz in care ma opresc
 
adauga_pozitie_2:
    cmp dh, 0             ; verific daca sunt pe linia 0
    je nu_se_face_loop_2  ; daca sunt pe linia 0 nu intru in loop
    loop_2:
        add ecx, 8        ; adaug linii pana ajung la linia elementului pe care il adaug in matrice
        sub dh, 1         ; scad contorul liniilor
        jnz loop_2        ; cat timp contorul nu e 0, continui loop-ul de adaugare linii
    nu_se_face_loop_2:
    add ecx, edx          ; adaug coloana pentru a ajunge pe pozitia dorita
    mov byte [ecx], 1     ; pun 1 corespunzator in matrice
    mov ecx, esi

stop_2:

    xor dl, dl         ; reinitializez coloana
    xor dh, dh         ; reinitializez linia

verificare_diagonala_dreapta_jos:
    mov dl, bl      ; copiez coloana tablei
    add dl, 1       ; actualizez coloana tablei
    cmp dl, 7
    jg stop_3       ; verific daca pozitia este invalida, caz in care ma opresc
    mov dh, al      ; copiez linia tablei
    sub dh, 1       ; actualizez linia tablei
    cmp dh, 0
    jl stop_3       ; verific daca coloana este invalida, caz in care ma opresc

adauga_pozitie_3:
    cmp dh, 0             ; verific daca sunt pe linia 0
    je nu_se_face_loop_3  ; daca sunt pe linia 0 nu intru in loop
    loop_3:
        add ecx, 8        ; adaug linii pana ajung la linia elementului pe care il adaug in matrice
        sub dh, 1         ; scad contorul liniilor
        jnz loop_3        ; cat timp contorul nu e 0, continui loop-ul de adaugare linii
    nu_se_face_loop_3:
    add ecx, edx          ; adaug coloana pentru a ajunge pe pozitia dorita
    mov byte [ecx], 1     ; pun 1 corespunzator in matrice
    mov ecx, esi

stop_3:

    xor dl, dl          ; reinitializez coloana
    xor dh, dh          ; reinitializez linia

verificare_diagonala_dreapta_sus:
    mov dl, bl      ; copiez coloana tablei
    add dl, 1       ; actualizez coloana tablei
    cmp dl, 7
    jg stop_4       ; verific daca pozitia este invalida, caz in care ma opresc
    mov dh, al      ; copiez linia tablei
    add dh, 1       ; actualizez linia tablei
    cmp dh, 7
    jg stop_4       ; verific daca coloana este invalida, caz in care ma opresc

adauga_pozitie_4:
    cmp dh, 0             ; verific daca sunt pe linia 0
    je nu_se_face_loop_4  ; daca sunt pe linia 0 nu intru in loop
    loop_4:
        add ecx, 8        ; adaug linii pana ajung la linia elementului pe care il adaug in matrice
        sub dh, 1         ; scad contorul liniilor
        jnz loop_4        ; cat timp contorul nu e 0, continui loop-ul de adaugare linii
    nu_se_face_loop_4:
    add ecx, edx          ; adaug coloana pentru a ajunge pe pozitia dorita
    mov byte [ecx], 1     ; pun 1 corespunzator in matrice
    mov ecx, esi

stop_4:

    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY