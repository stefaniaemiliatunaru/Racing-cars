section .data

section .text
    global bonus

bonus:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]	; x
    mov ebx, [ebp + 12]	; y
    mov ecx, [ebp + 16] ; board

    ;; DO NOT MODIFY
    ;; FREESTYLE STARTS HERE

    ; algoritmul verifica fiecare pozitie pe care o poate lua dama in matrice
    ; dupa care plaseaza fiecare dintre pozitiile valide in matrice prin construirea numerelor
    ; ce reprezinta puteri ale lui 2, conform exemplului din cerinta

    ; verific fiecare pozitie de pe linia 0 si
    ; adaug 1 in matrice corespunzator mutarilor valide ale damei

pozitie0_0:
    cmp eax, 0  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei
    jne pas0_0
    cmp ebx, 0               
    jne pas0_0
    mov dword [ecx], 0            
    mov dword [ecx + 4], 512 ; actualizez pozitia valida corespunzator prin puterea lui 2
pas0_0:

pozitie0_1:
    cmp eax, 0  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei
    jne pas0_1
    cmp ebx, 1                
    jne pas0_1
    mov dword [ecx], 0
    mov dword [ecx + 4], 256  ; actualizez pozitiile valide corespunzator prin puterea lui 2
    add dword [ecx + 4], 1024
pas0_1:

pozitie0_2:
    cmp eax, 0  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei
    jne pas0_2
    cmp ebx, 2                
    jne pas0_2
    mov dword [ecx], 0
    mov dword [ecx + 4], 512  ; actualizez pozitiile valide corespunzator prin puterea lui 2   
    add dword [ecx + 4], 2048
pas0_2:

pozitie0_3:
    cmp eax, 0  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei                   
    jne pas0_3 
    cmp ebx, 3                    
    jne pas0_3                      
    mov dword [ecx], 0
    mov dword [ecx + 4], 1024  ; actualizez pozitiile valide corespunzator prin puterea lui 2     
    add dword [ecx + 4], 4096
pas0_3:

pozitie0_4:
    cmp eax, 0  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei
    jne pas0_4 
    cmp ebx, 4               
    jne pas0_4
    mov dword [ecx], 0
    mov dword [ecx + 4], 2048  ; actualizez pozitiile valide corespunzator prin puterea lui 2
    add dword [ecx + 4], 8192
pas0_4:

pozitie0_5:
    cmp eax, 0  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei
    jne pas0_5
    cmp ebx, 5
    jne pas0_5
    mov dword [ecx], 0
    mov dword [ecx + 4], 4096  ; actualizez pozitiile valide corespunzator prin puterea lui 2
    add dword [ecx + 4], 16384
pas0_5:

pozitie0_6:
    cmp eax, 0  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei
    jne pas0_6
    cmp ebx, 6
    jne pas0_6
    mov dword [ecx], 0
    mov dword [ecx + 4], 8192  ; actualizez pozitiile valide corespunzator prin puterea lui 2
    add dword [ecx + 4], 32768
pas0_6:

pozitie0_7:
    cmp eax, 0  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei
    jne pas0_7
    cmp ebx, 7
    jne pas0_7
    mov dword [ecx], 0
    mov dword [ecx + 4], 16384  ; actualizez pozitiile valide corespunzator prin puterea lui 2
pas0_7:


; verific fiecare pozitie de pe linia 1 si 
; adaug 1 in matrice corespunzator mutarilor valide ale damei

pozitie1_0:
    cmp eax, 1  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei
    jne pas1_0
    cmp ebx, 0
    jne pas1_0
    mov dword [ecx], 0
    mov dword [ecx + 4], 2  ; actualizez pozitiile valide corespunzator prin puterea lui 2
    add dword [ecx + 4], 131072
pas1_0:

pozitie1_1:
    cmp eax, 1  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei
    jne pas1_1
    cmp ebx, 1
    jne pas1_1
    mov dword [ecx], 0
    mov dword [ecx + 4], 1  ; actualizez pozitiile valide corespunzator prin puterea lui 2 
    add dword [ecx + 4], 4
    add dword [ecx + 4], 65536
    add dword [ecx + 4], 262144
pas1_1:

pozitie1_2:
    cmp eax, 1  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei
    jne pas1_2
    cmp ebx, 2
    jne pas1_2
    mov dword [ecx], 0
    mov dword [ecx + 4], 2  ; actualizez pozitiile valide corespunzator prin puterea lui 2 
    add dword [ecx + 4], 8
    add dword [ecx + 4], 131072
    add dword [ecx + 4], 524288
pas1_2:

pozitie1_3:
    cmp eax, 1  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei
    jne pas1_3
    cmp ebx, 3
    jne pas1_3
    mov dword [ecx], 0
    mov dword [ecx + 4], 4  ; actualizez pozitiile valide corespunzator prin puterea lui 2 
    add dword [ecx + 4], 16
    add dword [ecx + 4], 262144
    add dword [ecx + 4], 1048576
pas1_3:

pozitie1_4:
    cmp eax, 1  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei
    jne pas1_4
    cmp ebx, 4
    jne pas1_4
    mov dword [ecx], 0
    mov dword [ecx + 4], 8  ; actualizez pozitiile valide corespunzator prin puterea lui 2
    add dword [ecx + 4], 32
    add dword [ecx + 4], 524288
    add dword [ecx + 4], 2097152
pas1_4:

pozitie1_5:
    cmp eax, 1  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei
    jne pas1_5
    cmp ebx, 5
    jne pas1_5
    mov dword [ecx], 0
    mov dword [ecx + 4], 16  ; actualizez pozitiile valide corespunzator prin puterea lui 2
    add dword [ecx + 4], 64
    add dword [ecx + 4], 1048576
    add dword [ecx + 4], 4194304
pas1_5:

pozitie1_6:
    cmp eax, 1  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei
    jne pas1_6
    cmp ebx, 6
    jne pas1_6
    mov dword [ecx], 0
    mov dword [ecx + 4], 32  ; actualizez pozitiile valide corespunzator prin puterea lui 2
    add dword [ecx + 4], 128
    add dword [ecx + 4], 2097152
    add dword [ecx + 4], 8388608
pas1_6:

pozitie1_7:
    cmp eax, 1  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei
    jne pas1_7
    cmp ebx, 7
    jne pas1_7
    mov dword [ecx], 0
    mov dword [ecx + 4], 64  ; actualizez pozitiile valide corespunzator prin puterea lui 2
    add dword [ecx + 4], 4194304
pas1_7:


; verific fiecare pozitie de pe linia 2 si
; adaug 1 in matrice corespunzator mutarilor valide ale damei

pozitie2_0:
    cmp eax, 2  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei
    jne pas2_0
    cmp ebx, 0
    jne pas2_0
    mov dword [ecx], 0
    mov dword [ecx + 4], 512  ; actualizez pozitiile valide corespunzator prin puterea lui 2
    add dword [ecx + 4], 33554432
pas2_0:

pozitie2_1:
    cmp eax, 2  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei
    jne pas2_1
    cmp ebx, 1
    jne pas2_1
    mov dword [ecx], 0
    mov dword [ecx + 4], 256  ; actualizez pozitiile valide corespunzator prin puterea lui 2
    add dword [ecx + 4], 1024
    add dword [ecx + 4], 16777216
    add dword [ecx + 4], 67108864
pas2_1:

pozitie2_2:
    cmp eax, 2  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei
    jne pas2_2
    cmp ebx, 2
    jne pas2_2
    mov dword [ecx], 0
    mov dword [ecx + 4], 512  ; actualizez pozitiile valide corespunzator prin puterea lui 2
    add dword [ecx + 4], 2048
    add dword [ecx + 4], 33554432
    add dword [ecx + 4], 134217728
pas2_2:

pozitie2_3:
    cmp eax, 2  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei
    jne pas2_3
    cmp ebx, 3
    jne pas2_3
    mov dword [ecx], 0
    mov dword [ecx + 4], 1024  ; actualizez pozitiile valide corespunzator prin puterea lui 2
    add dword [ecx + 4], 4096
    add dword [ecx + 4], 67108864
    add dword [ecx + 4], 268435456
pas2_3:

pozitie2_4:
    cmp eax, 2  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei
    jne pas2_4
    cmp ebx, 4
    jne pas2_4
    mov dword [ecx], 0
    mov dword [ecx + 4], 2048  ; actualizez pozitiile valide corespunzator prin puterea lui 2
    add dword [ecx + 4], 8192
    add dword [ecx + 4], 134217728
    add dword [ecx + 4], 536870912
pas2_4:

pozitie2_5:
    cmp eax, 2  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei
    jne pas2_5
    cmp ebx, 5
    jne pas2_5
    mov dword [ecx], 0
    mov dword [ecx + 4], 4096  ; actualizez pozitiile valide corespunzator prin puterea lui 2
    add dword [ecx + 4], 16384
    add dword [ecx + 4], 268435456
    add dword [ecx + 4], 1073741824
pas2_5:

pozitie2_6:
    cmp eax, 2  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei
    jne pas2_6
    cmp ebx, 6
    jne pas2_6
    mov dword [ecx], 0
    mov dword [ecx + 4], 8192  ; actualizez pozitiile valide corespunzator prin puterea lui 2
    add dword [ecx + 4], 32768
    add dword [ecx + 4], 536870912
    add dword [ecx + 4], 2147483648
pas2_6:

pozitie2_7:
    cmp eax, 2  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei
    jne pas2_7
    cmp ebx, 7
    jne pas2_7
    mov dword [ecx], 0
    mov dword [ecx + 4], 16384  ; actualizez pozitiile valide corespunzator prin puterea lui 2
    add dword [ecx + 4], 1073741824
pas2_7:


; verific fiecare pozitie de pe linia 3 si
; adaug 1 in matrice corespunzator mutarilor valide ale damei

pozitie3_0:
    cmp eax, 3  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei
    jne pas3_0
    cmp ebx, 0
    jne pas3_0
    mov dword [ecx], 2  ; actualizez pozitiile valide corespunzator prin puterea lui 2
    mov dword [ecx + 4], 131072
pas3_0:

pozitie3_1:
    cmp eax, 3  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei
    jne pas3_1
    cmp ebx, 1
    jne pas3_1
    mov dword [ecx], 1  ; actualizez pozitiile valide corespunzator prin puterea lui 2
    add dword [ecx], 4
    mov dword [ecx + 4], 65536
    add dword [ecx + 4], 262144
pas3_1:

pozitie3_2:
    cmp eax, 3  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei
    jne pas3_2
    cmp ebx, 2
    jne pas3_2
    mov dword [ecx], 2  ; actualizez pozitiile valide corespunzator prin puterea lui 2
    add dword [ecx], 8
    mov dword [ecx + 4], 131072
    add dword [ecx + 4], 524288
pas3_2:

pozitie3_3:
    cmp eax, 3  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei
    jne pas3_3
    cmp ebx, 3
    jne pas3_3
    mov dword [ecx], 4  ; actualizez pozitiile valide corespunzator prin puterea lui 2
    add dword [ecx], 16
    mov dword [ecx + 4], 262144
    add dword [ecx + 4], 1048576
pas3_3:

pozitie3_4:
    cmp eax, 3  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei
    jne pas3_4
    cmp ebx, 4
    jne pas3_4
    mov dword [ecx], 8  ; actualizez pozitiile valide corespunzator prin puterea lui 2
    add dword [ecx], 32
    mov dword [ecx + 4], 524288
    add dword [ecx + 4], 2097152
pas3_4:

pozitie3_5:
    cmp eax, 3  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei
    jne pas3_5
    cmp ebx, 5
    jne pas3_5
    mov dword [ecx], 16  ; actualizez pozitiile valide corespunzator prin puterea lui 2
    add dword [ecx], 64
    mov dword [ecx + 4], 1048576
    add dword [ecx + 4], 4194304
pas3_5:

pozitie3_6:
    cmp eax, 3  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei
    jne pas3_6
    cmp ebx, 6
    jne pas3_6
    mov dword [ecx], 32  ; actualizez pozitiile valide corespunzator prin puterea lui 2
    add dword [ecx], 128
    mov dword [ecx + 4], 2097152
    add dword [ecx + 4], 8388608
pas3_6:

pozitie3_7:
    cmp eax, 3  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei
    jne pas3_7
    cmp ebx, 7
    jne pas3_7
    mov dword [ecx], 64  ; actualizez pozitiile valide corespunzator prin puterea lui 2
    mov dword [ecx + 4], 4194304
pas3_7:


; verific fiecare pozitie de pe linia 4 si
; adaug 1 in matrice corespunzator mutarilor valide ale damei

pozitie4_0:
    cmp eax, 4  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei
    jne pas4_0
    cmp ebx, 0
    jne pas4_0
    mov dword [ecx], 512  ; actualizez pozitiile valide corespunzator prin puterea lui 2
    mov dword [ecx + 4], 33554432
pas4_0:

pozitie4_1:
    cmp eax, 4  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei
    jne pas4_1
    cmp ebx, 1
    jne pas4_1
    mov dword [ecx], 256  ; actualizez pozitiile valide corespunzator prin puterea lui 2
    add dword [ecx], 1024
    mov dword [ecx + 4], 16777216
    add dword [ecx + 4], 67108864
pas4_1:

pozitie4_2:
    cmp eax, 4  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei
    jne pas4_2
    cmp ebx, 2
    jne pas4_2
    mov dword [ecx], 512  ; actualizez pozitiile valide corespunzator prin puterea lui 2
    add dword [ecx], 2048
    mov dword [ecx + 4], 33554432
    add dword [ecx + 4], 134217728
pas4_2:

pozitie4_3:
    cmp eax, 4  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei
    jne pas4_3
    cmp ebx, 3
    jne pas4_3
    mov dword [ecx], 1024  ; actualizez pozitiile valide corespunzator prin puterea lui 2
    add dword [ecx], 4096
    mov dword [ecx + 4], 67108864
    add dword [ecx + 4], 268435456
pas4_3:

pozitie4_4:
    cmp eax, 4  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei
    jne pas4_4
    cmp ebx, 4
    jne pas4_4
    mov dword [ecx], 2048  ; actualizez pozitiile valide corespunzator prin puterea lui 2
    add dword [ecx], 8192
    mov dword [ecx + 4], 134217728
    add dword [ecx + 4], 536870912
pas4_4:

pozitie4_5:
    cmp eax, 4  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei
    jne pas4_5
    cmp ebx, 5
    jne pas4_5
    mov dword [ecx], 4096  ; actualizez pozitiile valide corespunzator prin puterea lui 2
    add dword [ecx], 16384
    mov dword [ecx + 4], 268435456
    add dword [ecx + 4], 1073741824
pas4_5:

pozitie4_6:
    cmp eax, 4  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei
    jne pas4_6
    cmp ebx, 6
    jne pas4_6
    mov dword [ecx], 8192  ; actualizez pozitiile valide corespunzator prin puterea lui 2
    add dword [ecx], 32768
    add dword [ecx + 4], 536870912
    add dword [ecx + 4], 2147483648
pas4_6:

pozitie4_7:
    cmp eax, 4  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei
    jne pas4_7
    cmp ebx, 7
    jne pas4_7
    mov dword [ecx], 16384  ; actualizez pozitiile valide corespunzator prin puterea lui 2
    mov dword [ecx + 4], 1073741824
pas4_7:


; verific fiecare pozitie de pe linia 5 si
; adaug 1 in matrice corespunzator mutarilor valide ale damei

pozitie5_0:
    cmp eax, 5  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei
    jne pas5_0
    cmp ebx, 0
    jne pas5_0
    mov dword [ecx], 2  ; actualizez pozitiile valide corespunzator prin puterea lui 2
    add dword [ecx], 131072
    mov dword [ecx + 4], 0
pas5_0:

pozitie5_1:
    cmp eax, 5  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei
    jne pas5_1
    cmp ebx, 1
    jne pas5_1
    mov dword [ecx], 1  ; actualizez pozitiile valide corespunzator prin puterea lui 2
    add dword [ecx], 4
    add dword [ecx], 65536
    add dword [ecx], 262144
    mov dword [ecx + 4], 0
pas5_1:

pozitie5_2:
    cmp eax, 5  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei
    jne pas5_2
    cmp ebx, 2
    jne pas5_2
    mov dword [ecx], 2  ; actualizez pozitiile valide corespunzator prin puterea lui 2
    add dword [ecx], 8
    add dword [ecx], 131072
    add dword [ecx], 524288
    mov dword [ecx + 4], 0
pas5_2:

pozitie5_3:
    cmp eax, 5  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei
    jne pas5_3
    cmp ebx, 3
    jne pas5_3
    mov dword [ecx], 4  ; actualizez pozitiile valide corespunzator prin puterea lui 2
    add dword [ecx], 16
    add dword [ecx], 262144
    add dword [ecx], 1048576
    mov dword [ecx + 4], 0
pas5_3:

pozitie5_4:
    cmp eax, 5  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei
    jne pas5_4
    cmp ebx, 4
    jne pas5_4
    mov dword [ecx], 8  ; actualizez pozitiile valide corespunzator prin puterea lui 2
    add dword [ecx], 32
    add dword [ecx], 524288
    add dword [ecx], 2097152
    mov dword [ecx + 4], 0
pas5_4:

pozitie5_5:
    cmp eax, 5  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei
    jne pas5_5
    cmp ebx, 5
    jne pas5_5
    mov dword [ecx], 16  ; actualizez pozitiile valide corespunzator prin puterea lui 2
    add dword [ecx], 64
    add dword [ecx], 1048576
    add dword [ecx], 4194304
    mov dword [ecx + 4], 0
pas5_5:

pozitie5_6:
    cmp eax, 5  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei
    jne pas5_6
    cmp ebx, 6
    jne pas5_6
    mov dword [ecx], 32  ; actualizez pozitiile valide corespunzator prin puterea lui 2
    add dword [ecx], 128
    add dword [ecx], 2097152
    add dword [ecx], 8388608
    mov dword [ecx + 4], 0
pas5_6:

pozitie5_7:
    cmp eax, 5  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei
    jne pas5_7
    cmp ebx, 7
    jne pas5_7
    mov dword [ecx], 64  ; actualizez pozitiile valide corespunzator prin puterea lui 2
    add dword [ecx], 4194304
    mov dword [ecx + 4], 0
pas5_7:


; verific fiecare pozitie de pe linia 6 si
; adaug 1 in matrice corespunzator mutarilor valide ale damei

pozitie6_0:
    cmp eax, 6  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei
    jne pas6_0
    cmp ebx, 0
    jne pas6_0
    mov dword [ecx], 512  ; actualizez pozitiile valide corespunzator prin puterea lui 2
    add dword [ecx], 33554432
    mov dword [ecx + 4], 0
pas6_0:

pozitie6_1:
    cmp eax, 6  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei
    jne pas6_1
    cmp ebx, 1
    jne pas6_1
    mov dword [ecx], 256  ; actualizez pozitiile valide corespunzator prin puterea lui 2
    add dword [ecx], 1024
    add dword [ecx], 16777216
    add dword [ecx], 67108864
    mov dword [ecx + 4], 0
pas6_1:

pozitie6_2:
    cmp eax, 6  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei
    jne pas6_2
    cmp ebx, 2
    jne pas6_2
    mov dword [ecx], 512  ; actualizez pozitiile valide corespunzator prin puterea lui 2
    add dword [ecx], 2048
    add dword [ecx], 33554432
    add dword [ecx], 134217728
    mov dword [ecx + 4], 0
pas6_2:

pozitie6_3:
    cmp eax, 6  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei
    jne pas6_3
    cmp ebx, 3
    jne pas6_3
    mov dword [ecx], 1024  ; actualizez pozitiile valide corespunzator prin puterea lui 2
    add dword [ecx], 4096
    add dword [ecx], 67108864
    add dword [ecx], 268435456
    mov dword [ecx + 4], 0
pas6_3:

pozitie6_4:
    cmp eax, 6  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei
    jne pas6_4
    cmp ebx, 4
    jne pas6_4
    mov dword [ecx], 2048  ; actualizez pozitiile valide corespunzator prin puterea lui 2
    add dword [ecx], 8192
    add dword [ecx], 134217728
    add dword [ecx], 536870912
    mov dword [ecx + 4], 0
pas6_4:

pozitie6_5:
    cmp eax, 6  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei
    jne pas6_5
    cmp ebx, 5
    jne pas6_5
    mov dword [ecx], 4096  ; actualizez pozitiile valide corespunzator prin puterea lui 2
    add dword [ecx], 16384
    add dword [ecx], 268435456
    add dword [ecx], 1073741824
    mov dword [ecx + 4], 0
pas6_5:

pozitie6_6:
    cmp eax, 6  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei
    jne pas6_6
    cmp ebx, 6
    jne pas6_6
    mov dword [ecx], 8192  ; actualizez pozitiile valide corespunzator prin puterea lui 2
    add dword [ecx], 32768
    add dword [ecx], 536870912
    add dword [ecx], 2147483648
    mov dword [ecx + 4], 0
pas6_6:

pozitie6_7:
    cmp eax, 6  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei
    jne pas6_7
    cmp ebx, 7
    jne pas6_7
    mov dword [ecx], 16384  ; actualizez pozitiile valide corespunzator prin puterea lui 2
    add dword [ecx], 1073741824
    mov dword [ecx + 4], 0
pas6_7:


; verific fiecare pozitie de pe linia 7 si
; adaug 1 in matrice corespunzator mutarilor valide ale damei

pozitie7_0:
    cmp eax, 7  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei
    jne pas7_0
    cmp ebx, 0
    jne pas7_0
    mov dword [ecx], 131072  ; actualizez pozitiile valide corespunzator prin puterea lui 2
    mov dword [ecx + 4], 0
pas7_0:

pozitie7_1:
    cmp eax, 7  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei
    jne pas7_1
    cmp ebx, 1
    jne pas7_1
    mov dword [ecx], 65536  ; actualizez pozitiile valide corespunzator prin puterea lui 2
    add dword [ecx], 262144
    mov dword [ecx + 4], 0
pas7_1:

pozitie7_2:
    cmp eax, 7  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei
    jne pas7_2
    cmp ebx, 2
    jne pas7_2
    mov dword [ecx], 131072  ; actualizez pozitiile valide corespunzator prin puterea lui 2
    add dword [ecx], 524288
    mov dword [ecx + 4], 0
pas7_2:

pozitie7_3:
    cmp eax, 7  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei
    jne pas7_3
    cmp ebx, 3
    jne pas7_3
    mov dword [ecx], 262144  ; actualizez pozitiile valide corespunzator prin puterea lui 2
    add dword [ecx], 1048576
    mov dword [ecx + 4], 0
pas7_3:

pozitie7_4:
    cmp eax, 7  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei
    jne pas7_4
    cmp ebx, 4
    jne pas7_4
    mov dword [ecx], 524288  ; actualizez pozitiile valide corespunzator prin puterea lui 2
    add dword [ecx], 2097152
    mov dword [ecx + 4], 0
pas7_4:

pozitie7_5:
    cmp eax, 7  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei
    jne pas7_5
    cmp ebx, 5
    jne pas7_5
    mov dword [ecx], 1048576  ; actualizez pozitiile valide corespunzator prin puterea lui 2
    add dword [ecx], 4194304
    mov dword [ecx + 4], 0
pas7_5:

pozitie7_6:
    cmp eax, 7  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei
    jne pas7_6
    cmp ebx, 6
    jne pas7_6
    mov dword [ecx], 2097152  ; actualizez pozitiile valide corespunzator prin puterea lui 2
    add dword [ecx], 8388608
    mov dword [ecx + 4], 0
pas7_6:

pozitie7_7:
    cmp eax, 7  ; verific daca pozitia este cea cautata prin verificarea liniei si a coloanei
    jne pas7_7
    cmp ebx, 7
    jne pas7_7
    mov dword [ecx], 4194304  ; actualizez pozitiile valide corespunzator prin puterea lui 2
    mov dword [ecx + 4], 0
pas7_7:

    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY