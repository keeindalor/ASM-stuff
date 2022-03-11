section .text
	global sort

; struct node {
;     	int val;
;    	struct node* next;
; };
struc lista 
	.val: resd 1
	.next: resd 1
endstruc

;; struct node* sort(int n, struct node* node);
; 	The function will link the nodes in the array
;	in ascending order and will return the address
;	of the new found head of the list
; @params:
;	n -> the number of nodes in the array
;	node -> a pointer to the beginning in the array
; @returns:
;	the address of the head of the sorted list




;Algoritmul este urmatorul:
;pentru fiecare element din vector, caut valoarea sa +1, pentru a face link
;in cazul in care elementul curent din vector este egal cu n, mergem mai departe
;astfel, avem un loop principal, pentru elementele din vector
;si un loop secundar, in care cautam valoarea actuala +1.
;cand o gasim, linkam si mergem mai departe
sort:
	enter 0, 0
	
	xor eax, eax ;aici e adresa minimului
	xor ebx, ebx ;registru auxiliar
	xor ecx, ecx ;aici va fi n
	xor edx, edx ;aici va fi vector
	xor esi, esi ;contor pt loop principal

	mov ecx, [ebp + 8] ;n
	mov edx, [ebp + 12] ;array
loop_main:
	cmp ecx, [edx + 8*esi]
	je iteration
	xor edi, edi ;contor pentru loop cautare, reset la fiecare iteratie in vector
	jmp loop_search
loop_search:
	mov eax, [edx + 8*esi] ;valoarea actuala din vector, pe care o incrementam
	add eax, 1 
	cmp eax, [edx + 8*edi] ;comparam el+1 din vector cu toate restul
	je link ;daca sunt egale, am gasit si linkam
	add edi, 1
	cmp edi, ecx
	jl loop_search ;continuam cautarea
	je iteration ;daca contorul e egal cu n, mergem la elementul urmator din vetor
link:
	lea ebx, [edx + 8*edi] ;linkam
	mov [edx + 8*esi + 4], ebx
iteration: ;label pentru iteratia in vector
	inc esi 
	cmp esi, ecx
	je exit
	jmp loop_main
exit: ;aici eliberam registrele pentru a salva in eax adresa lui 1
	xor eax, eax 
	xor esi, esi
	
search_min: ;aici il cautam pe 1
	cmp dword[edx + 8*esi], 1
	je store
	add esi, 1
	cmp esi, ecx
	jne search_min

store:
	lea eax, [edx + 8 * esi] ;salvam adresa lui 1
	leave
	ret
