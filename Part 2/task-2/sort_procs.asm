%include "../include/io.mac"

struc proc
    .pid: resw 1
    .prio: resb 1
    .time: resw 1
endstruc

section .text
    global sort_procs

sort_procs:
    ;; DO NOT MODIFY
    enter 0,0
    pusha

    mov edx, [ebp + 8]      ; processes
    mov eax, [ebp + 12]     ; length
    ;; DO NOT MODIFY

    ;; Your code starts here

    xor ebx, ebx  ; initializez contorul pentru 
    sub eax, 1    ; pregatesc lungimea pentru bubblesort 

while:
    xor ebx, ebx  ; regsitrul ebx are rol de bec in bubblesort
    mov edi, edx  ; fac o copie a vectorului salvat in edx
    xor ecx, ecx  ; registrul este contorul pentru loop-ul for
    for:
        push eax  
        push ecx
        xor eax, eax
        mov al, byte [edi + proc.prio]      ; mut in subregistrul al campul prio al elementului 1
        xor ecx, ecx
        mov cl, byte [edi + 5 + proc.prio]  ; mut in subregistrul cl campul prio al elementului 2
        cmp al, cl                          ; compar cele doua campuri
        jg swap_1                      ; daca primul este mai mare decat al doilea le interschimb
        je cmp_urm_crt_1               ; daca sunt egale, trec la urmatorul criteriu de comparatie
        jl urm_elem        ; daca primul este mai mic decat al doilea trec la urmatoarele elemente
        swap_1:            ; functia ce interschimba elementele
            add ebx, 1
            xor eax, eax
            mov al, byte [edi + proc.prio]
            xor ecx, ecx
            mov cl, byte [edi + 5 + proc.prio]
            mov [edi + proc.prio], cl
            mov [edi + 5 + proc.prio], al
            xor eax, eax
            mov ax, word [edi + proc.time]
            xor ecx, ecx
            mov cx, word [edi + 5 + proc.time]
            mov [edi + proc.time], cx
            mov [edi + 5 + proc.time], ax
            xor eax, eax
            mov ax, word [edi + proc.pid]
            xor ecx, ecx
            mov cx, word [edi + 5 + proc.pid]
            mov [edi + proc.pid], cx
            mov [edi + 5 + proc.pid], ax
            jmp urm_elem
        cmp_urm_crt_1:        ; repet procedeul explicat anterior pentru campul prio
            xor eax, eax
            mov ax, word [edi + proc.time]
            xor ecx, ecx
            mov cx, word [edi + 5 + proc.time]
            cmp ax, cx
            jg swap_2
            je cmp_urm_crt_2
            jl urm_elem
        swap_2:        ; functia ce interschimba elementele
            add ebx, 1
            xor eax, eax
            mov al, byte [edi + proc.prio]
            xor ecx, ecx
            mov cl, byte [edi + 5 + proc.prio]
            mov [edi + proc.prio], cl
            mov [edi + 5 + proc.prio], al
            xor eax, eax
            mov ax, word [edi + proc.time]
            xor ecx, ecx
            mov cx, word [edi + 5 + proc.time]
            mov [edi + proc.time], cx
            mov [edi + 5 + proc.time], ax
            xor eax, eax
            mov ax, word [edi + proc.pid]
            xor ecx, ecx
            mov cx, word [edi + 5 + proc.pid]
            mov [edi + proc.pid], cx
            mov [edi + 5 + proc.pid], ax
            jmp urm_elem
        cmp_urm_crt_2:        ; repet procedeul explicat anterior pentru campul prio
            xor eax, eax
            mov ax, word [edi + proc.pid]
            xor ecx, ecx
            mov cx, word [edi + 5 + proc.pid]
            cmp ax, cx
            jg swap_3
            jle urm_elem
        swap_3:        ; functia ce interschimba elementele
            add ebx, 1
            xor eax, eax
            mov al, byte [edi + proc.prio]
            xor ecx, ecx
            mov cl, byte [edi + 5 + proc.prio]
            mov [edi + proc.prio], cl
            mov [edi + 5 + proc.prio], al
            xor eax, eax
            mov ax, word [edi + proc.time]
            xor ecx, ecx
            mov cx, word [edi + 5 + proc.time]
            mov [edi + proc.time], cx
            mov [edi + 5 + proc.time], ax
            xor eax, eax
            mov ax, word [edi + proc.pid]
            xor ecx, ecx
            mov cx, word [edi + 5 + proc.pid]
            mov [edi + proc.pid], cx
            mov [edi + 5 + proc.pid], ax
            jmp urm_elem
        urm_elem:
            pop ecx
            pop eax
            add ecx, 1      ; trec la urmatorul element
            add edi, 5      ; trec la urmatorul element
            cmp ecx, eax    ; verific daca am ajuns la finalul vectorului 
            jl for
    cmp ebx, 0
    jne while

    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY