section .text
    global rotp

;; void rotp(char *ciphertext, char *plaintext, char *key, int len);
rotp:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edx, [ebp + 8]  ; ciphertext
    mov     esi, [ebp + 12] ; plaintext
    mov     edi, [ebp + 16] ; key
    mov     ecx, [ebp + 20] ; len
    ;; DO NOT MODIFY

    ;; TODO: Implment rotp
    ;; FREESTYLE STARTS HERE
    mov ebx, 0
loop:
    mov bl, byte[esi] ; the letter from plaintext
    xor bl, byte[edi + ecx - 1] ; xor between plaintext and reversed key
    mov [edx], bl ;memorise the result in ciphertext
    add esi, 1 ; move 1 poisition in plaintext
    add edx, 1 ;move 1 poisition in cyphertext
    sub ecx, 1 ; decrement the length and loop condition
    jnz loop
    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY