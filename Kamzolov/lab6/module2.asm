.586p
.MODEL FLAT, C
.CODE
PUBLIC C MODULE2
MODULE2 PROC C ARRAY:DWORD, SIZEARRAY:DWORD, BOARDERS:DWORD, BOARDERSSIZE:DWORD, XMIN:DWORD, XMAX:DWORD, RESARRAY:DWORD
	PUSH ESI
	PUSH EDI;���������� ���������
	PUSH EBP
	
	
	MOV ESI, BOARDERS ;��������� �� ������ ������
	MOV EAX, 0 ;������ ��������������� �������
	MOV EDX, XMIN ;����������� �������� 
	MOV ECX, BOARDERSSIZE ;���-�� ������
for_loop:
	MOV EAX, [ESI]
	ADD EAX, XMAX
	MOV [ESI], EAX
	ADD ESI, 4
	loop for_loop
	
	
	MOV EDI, ARRAY ;��������� �� �������� ������
	MOV ECX, BOARDERSSIZE
	MOV ESI, BOARDERS
	SUB EBX, EBX
	MOV EAX, [ESI]
	
for_loop2:
	PUSH ECX
	MOV ECX, EAX
	PUSH ESI
	MOV ESI, RESARRAY
	forik: 
		MOV EAX, [EDI]
		ADD [ESI + EBX*4], EAX
		ADD EDI, 4
		loop forik
	POP ESI

	MOV EAX, [ESI]
	ADD ESI, 4
	SUB EAX, [ESI]
	NEG EAX
	
	INC EBX
	POP ECX
	loop for_loop2
	
	MOV ESI, RESARRAY
	MOV ECX, BOARDERSSIZE
	SUB EAX, EAX

last_forik:
    ADD EAX, [ESI]
    ADD ESI, 4
    loop last_forik

	MOV ESI, RESARRAY
	SUB EAX, SIZEARRAY
	NEG EAX
	ADD [ESI + 4 * EBX], EAX

	
	POP EBP
	POP EDI
	POP ESI

	ret
MODULE2 ENDP
END