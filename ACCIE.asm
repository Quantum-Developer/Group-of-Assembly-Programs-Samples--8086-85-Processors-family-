.MODEL SMALL
.STACK 100H
.DATA
MSD DB "ACCIE$"
.CODE
MAIN PROC
MOV AX,@DATA
MOV DS,AX
LEA DX,MSD
MOV AH,9
INT 21H
MOV DL,0DH
INT 21H
MOV AH,2
MOV CX,256
MOV DL,0
PRINT_TUCK:
INT 21H
INC DL
DEC CX
JNZ PRINT_TUCK
MOV AH,4CH
INT 21H
MAIN ENDP
END MAIN
