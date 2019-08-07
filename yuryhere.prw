#include 'protheus.ch'

User function zika()
Local oDlg 
Local cTitulo   := 'Exemplo da aula IOS'
Local oFont
Local oSay
Local oGet
Local cUsuario := Space(100)
Local cPass := Space(10)
Local lCheck := .F.
local oCheck
local cHere := space(7)
DEFINE MSDIALOG oDlg TITLE cTitulo FROM 000,000 TO 600,800 PIXEL

// Cria Fonte para visualização
oFont := TFont():New('Courier new',,-18,.T.)
 
// Cria o Objeto tSay usando o comando @ .. SAY
@ 10,10 SAY oSay PROMPT 'Usuario :' SIZE 200,20 COLORS CLR_RED,CLR_WHITE FONT oFont OF oDlg PIXEL
@ 50,10 SAY oSay PROMPT 'Senha:' SIZE 200,20 COLORS CLR_RED,CLR_WHITE FONT oFont OF oDlg PIXEL
 
@ 10,50 GET oGet VAR cUsuario FONT oFont SIZE 200,20 OF oDlg PIXEL VALID !empty(cUsuario) 
@ 50,50 GET oGet VAR cPass FONT oFont SIZE 50,20 OF oDlg PIXEL 
@ 80,10 CHECKBOX oCheck VAR lCheck FONT oFont PROMPT "Selecione" SIZE 60,15 OF oDlg PIXEL

@150,90 BUTTON "Ok" FONT oFont SIZE 040, 045 PIXEL OF oDlg ACTION u_sen(oDlg,cPass)
@150,190 BUTTON "Cancelar" FONT oFont SIZE 040, 045 PIXEL OF oDlg ACTION u_beco(oDlg,cUsuario)

ACTIVATE MSDIALOG oDlg CENTERED

 


Return

User Function beco(oDlg,cUsuario)
Alert(cUsuario)
oDlg:End()
Return

user function sen(oDlg, cHere)
/*Crie uma janela com 2 campos do tipo GET para solicitar o nome de um usuário

e sua senha. Adicione um botão de OK e um de cancelar. Ao clicar em OK deve-
se avaliar se a senha é igual a "IOS2019", caso seja, exibir uma mensagem de

senha correta. Se estiver errado exibir uma mensagem de senha incorreta. Ao
clicar em cancelar deve-se fechar a janela */

if cHere != "ios2019"


alert("Senha incorreta")

Else 

alert("Senha correta, você etá logado")
oDlg:End()
Endif

alert("Senha Incorreta")



return