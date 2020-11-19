; This example will demonstrate how to replace the entire ROM.

    .org $fffc  ; since this is a 65c02, we need to define the reset vector
	.word reset
	.word $0000

    .org $C000  ; since this is a Commander X16, the ROM starts loading at $C000

reset:
    ; now you add whatever code you like
    LDA #$12
    LDX #$34
    LDY #$56
    
loop:
    JMP loop
