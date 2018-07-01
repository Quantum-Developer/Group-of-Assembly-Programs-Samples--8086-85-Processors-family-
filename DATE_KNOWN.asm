.MODEL SMALL
.STACK 100H
.DATA
CR EQU 0DH
LF EQU 0AH
MSG DB 'GET SYSTEM DATE :INT 21H FUNCTION 2A',CR,LF
DB 'YEAR :$'
YEAR DW '?'
MSG2 DB CR,LF,'MONTH :$'
MONTH DB '?'
MSG3 DB CR,LF,'DAY :$'
DAY DB '?'
MSG4 DB CR,LF,'DAY OF WEEK:','$'
Dweek DB '?'
SUN DB 'Sunday $'
MON DB 'Monday $'
TUES DB 'Tuesday $'
WEDN DB 'Wednesday $'
THURS DB 'Thursday $'
FRID DB 'Friday $'
SAT DB 'Saturday $'
.CODE
MAIN PROC
;initialization
MOV AX,@DATA
MOV DS,AX
;get system date
MOV AH,2AH
INT 21H
;assign values of date
MOV YEAR,CX
MOV MONTH,DH
MOV DAY,DL
MOV Dweek,AL
MOV DL,dWEEK
MOV AL,2H
INT 21H
;display values of date
LEA DX,MSG
MOV AH,09H
INT 21H
;year
MOV AX,CX
CALL OUTDEC
;month
LEA DX,MSG2
MOV AH,09H
INT 21H
XOR AX,AX ;clear AH and AL
MOV AL,MONTH
CALL OUTDEC
;day
LEA DX,MSG3
MOV AH,09H
INT 21H
XOR AX,AX
MOV AL,DAY
CALL OUTDEC
; display the equivalent day of week
LEA DX,MSG4
MOV AH,09H
INT 21H
CMP Dweek,0
JE ZERO
CMP Dweek,1
JE ONE
CMP Dweek,2
JE TWO
CMP Dweek,3
JE THREE
CMP Dweek,4
JE FOUR
CMP Dweek,5
JE FIVE
CMP Dweek,6
JE SIX
JMP END_CASE
ZERO:
LEA DX,SUN
JMP DISPLAY_
ONE:
LEA DX,MON
JMP DISPLAY_
TWO:
LEA DX,TUES
JMP DISPLAY_
THREE:
LEA DX,WEDN
JMP DISPLAY_
FOUR:
LEA DX,THURS
JMP DISPLAY_
FIVE:
LEA DX,FRID
JMP DISPLAY_
SIX:
LEA DX,SAT
DISPLAY_:
MOV AH,09H
INT 21H
END_CASE:
MOV AH,4CH
INT 21H
MAIN ENDP
Include DES_NUM.asm
END MAIN