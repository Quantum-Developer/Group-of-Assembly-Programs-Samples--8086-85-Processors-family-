.MODEL SMALL
.STACK 100H
.DATA 
QUS DB "HOW OLD YOU :$"
OLD DB "YOU ARE OLD$"
HOW DB ?
YUNG DB "YOU ARE YUNG$"
.CODE
MAIN PROC
MOV AX,@DATA
MOV DS,AX
LEA DX,QUS
MOV AH,9
INT 21H
MOV AH,1
INT 21H
CMP AH,20
JGE OLDER
CALL YUNGER
YUNGER:
LEA DX,YUNG
MOV AH,9
INT 21H
OLDER:
LEA DX,OLD
MOV AH,9
INT 21H
MOV AH,4CH
INT 21H
MAIN ENDP
END MAIN