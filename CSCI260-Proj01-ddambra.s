; Apple II: print a string backwards
; Assemble to a safe RAM area (example: $0300)

        DSK CSCI260-Proj01-ddambra
        TYP $06
        ORG $0300

COUT1   EQU     $FDED
HOME    EQU     $FC58

        JSR     HOME

; Find the end of the string
        LDX     #0

FINDEND
        LDA     MSG,X
        BEQ     START
        INX
        JMP     FINDEND

; Move backwards and print each character

START
        DEX

LOOP
        CPX     #$FF
        BEQ     DONE

        LDA     MSG,X
        JSR     COUT1
        DEX
        JMP     LOOP

DONE
        RTS

MSG     ASC     "MADAVE!"
        HEX     8D00
        ; $8D = CR
        ; $00 terminates the string