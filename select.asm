TITLE SORT: SELECT SORT PROGRAM
.MODEL SMALL
.STACK 100H
.DATA
A DB 5 , 2 , 1 , 3 , 4
.CODE
MAIN PROC
MOV AX , @DATA
MOV DS , AX
LEA SI , A
CALL SELECT
;dos exit
MOV AH,4CH
INT 21H
MAIN ENDP
INCLUDE DES_NUM.ASM
END MAIN