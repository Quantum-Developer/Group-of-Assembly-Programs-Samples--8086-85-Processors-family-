TITLE SECOND: DISPLAY STRING
.MODEL SMALL
.STACK 100H
.DATA
MSG DB 'HELLO!$'
.CODE
MAIN PROC
MOV AX,@DATA
MOV DS,AX
LEA DX,MSG
MOV AH,09H
INT 21H
MOV AH,4CH
INT 21H
MAIN ENDP
END MAIN