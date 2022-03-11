; This is your structure
struc  my_date
    .day: resw 1
    .month: resw 1
    .year: resd 1
endstruc
section .text
    global ages
    

; void ages(int len, struct my_date* present, struct my_date* dates, int* all_ages);
ages:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edx, [ebp + 8]  ; len
    mov     esi, [ebp + 12] ; present
    mov     edi, [ebp + 16] ; dates
    mov     ecx, [ebp + 20] ; all_ages
    ;; DO NOT MODIFY

    ;; TODO: Implement ages
    ;; FREESTYLE STARTS HERE
    mov eax, 0
    mov ebx, 0
loop:
    mov eax, [esi + my_date.year] ; memorise the current year
    sub eax, [edi + my_date.year] ; curr year - date[i] year
    jle errors ; case for year 0 / lower
    mov bl, [esi + my_date.month] ;
    cmp bl, [edi + my_date.month] ;compare the month
    jl sub_year ;case for lower month
    je check_day ;case for same month
    mov [ecx], eax ;the ages array
    add ecx, 4 ;inc the position in array
    add edi, 8 ;in the position in ages array
    sub edx, 1 ;loop cond
    jnz loop
    jmp endd
errors:
    mov eax, 0 ;add 0 in array
    mov [ecx], eax ;idem in loop
    add ecx, 4
    add edi, 8
    sub edx, 1
    jnz loop
    jmp endd
sub_year:
    dec eax ;year - 1
    mov [ecx], eax ;idem in loop
    add ecx, 4
    add edi, 8
    sub edx, 1
    jnz loop
    jmp endd
check_day:
    mov bl, [esi + my_date.day] 
    cmp bl, [edi + my_date.day] ;check the day
    jl sub_year ;year - 1
    mov [ecx], eax ;idem in loop
    add ecx, 4
    add edi, 8
    sub edx, 1
    jnz loop
    jmp endd

endd:
    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
