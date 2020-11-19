    .org $0801      ; Start of BASIC program

    .byte $0C, $08  ; $080C - pointer to next line of BASIC code
    .byte $0A,$00   ; 2-byte line number ($000A = 10)
    .byte $9E
    .byte $20
    .byte $32,$30,$36,$34   ; $32="2",$30="0",$36="6",$34="4"
    
    .byte $00               ; End of Line
    .byte $00,$00

; Start of actual program
    .org $0810              ; Here starts the real program

CHROUT=$FFD2		; CHROUT outputs a character (C64 Kernal API)
CHRIN=$FFCF		; CHRIN read from default input

	ldx	#0		; X register used to index string
loop:
	lda	mystring, x	; Load character from string into A register
	beq	end		; If the character is 0, jump to end label
	jsr	CHROUT		; Call KERNAL API to print char in A register
	inx			; Increment X register
	jmp	loop		; Jump back to loop label to get next character
end:
	rts			; Return to caller

; zero-terminated string containing a newline at the end (char# 13)
	;!pet	"hello, world!!",13,0
mystring: .asciiz "Hello, world!",13,0
