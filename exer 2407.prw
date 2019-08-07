#include 'protheus.ch'


user function new()

local cTitulo:="bom dia"
Local oDlg, oFont, oSay,oGet, cIdade := space(3),cNome:= space(30),oButton,cpass:= space(8)
local aItems:= {'masculino','feminino'}
local oCombo1
DEFINE MSDIALOG oDlg TITLE cTitulo FROM 000,000 TO 500,500 PIXEL


 // Cria Fonte para visualização
oFont := TFont():New('Courier new',,-18,.T.)

// Cria o Objeto tSay usando o comando @ .. SAY
@ 10,10 SAY oSay PROMPT 'NOME:'  SIZE 200,20 COLORS CLR_BLACK,CLR_WHITE FONT oFont OF oDlg PIXEL
@ 50,10 SAY oSay PROMPT 'SENHA:' SIZE 200,20 COLORS CLR_BLACK,CLR_WHITE FONT oFont OF oDlg PIXEL

@ 50,50 GET oGet  VAR cpass FONT oFont SIZE 100,10 OF oDlg PIXEL 
@ 10,50 GET oGet  VAR cNome  FONT oFont SIZE 100,10 OF oDlg PIXEL 





@ 090,050 BUTTON 'ENTRAR'  FONT oFont  SIZE  100,10 PIXEL OF oDlg ACTION u_entrar(oDlg,cNome,cpass)
@ 070,050 BUTTON 'CANCELAR' FONT oFont SIZE  100,10 PIXEL OF oDlg ACTION u_cancela(oDlg)


ACTIVATE MSDIALOG oDlg CENTERED


return



USER FUNCTION entrar(oDlg,nome,cpass)


if alltrim(nome) == "rafael" .and. alltrim(cpass) == "123"
alert("bem vindo(a)!")
endif

RETURN

user function cancela(oDlg)

oDlg:end()

return