.intel_syntax noprefix

.global rotHash
.global _Z7rotHashPK4word
_Z7rotHashPK4word:
rotHash:
    xor rax, rax
    xor rsi, rsi
    mov rcx, 32

loopByte:
    rol rax, 1
    mov sil, BYTE PTR [rdi]
    inc rdi
    sub rsi, 'a'
    xor rax, rsi    
    loop loopByte
    ret
