section .data
    extern len_cheie, len_haystack

section .text
    global columnar_transposition
;; void columnar_transposition(int key[], char *haystack, char *ciphertext);
columnar_transposition:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha 

    mov edi, [ebp + 8]   ;key
    mov esi, [ebp + 12]  ;haystack
    mov ebx, [ebp + 16]  ;ciphertext
    ;; DO NOT MODIFY

    ;; TODO: Implment columnar_transposition
    ;; FREESTYLE STARTS HERE
    mov eax, 0
    mov edx, 0
    mov ecx, [len_cheie] ;store key lentgth
loop:
    mov eax, [edi] ;memorise the key array
    cmp eax, [len_haystack] ; compare they element from array to haystack length
    jl crypt ; case for lower
    jmp advance ; advance loop
advance:
    add edi, 4 ; advance in key array
    sub ecx, 1 ; subtract the length
    jnz loop ; main loop, if we still have elements from array
    jmp end
crypt:
    mov dl, byte[esi + eax] ; take the letter from matrix (which is an array actually)
    mov [ebx], dl ;store it in ciphertext
    add ebx, 1 ; advance in ciphertext string
    add eax, [len_cheie] ; move to next element in column
    cmp eax, [len_haystack] ; out of bounds matrix condition
    jl crypt ; loop
    jmp advance
end:
    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY