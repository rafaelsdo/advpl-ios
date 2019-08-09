#include "protheus.ch"
#include "fwmvcdef.ch"
#include 'tcbrowse.ch'

user function playlist()
local oBrowse :=FWMBrowse():new()// criação do browse

oBrowse:SetAlias('ZA3') 
oBrowse:SetMenuDef('projeto3') // define setmenudef


oBrowse:activate()

return

//----------------------------------------------------------------------------------

Static Function MenuDef()
Local aRotina := {}

ADD OPTION aRotina TITLE 'Visualizar' ACTION 'VIEWDEF.projeto3' OPERATION 2 ACCESS 0
ADD OPTION aRotina TITLE 'Incluir' ACTION 'VIEWDEF.projeto3' OPERATION 3 ACCESS 0
ADD OPTION aRotina TITLE 'Alterar' ACTION 'VIEWDEF.projeto3' OPERATION 4 ACCESS 0
ADD OPTION aRotina TITLE 'Excluir' ACTION 'VIEWDEF.projeto3' OPERATION 5 ACCESS 0
ADD OPTION aRotina TITLE 'Imprimir' ACTION 'VIEWDEF.projeto3' OPERATION 8 ACCESS 0
ADD OPTION aRotina TITLE 'TOCAR' ACTION 'U_PLALI' OPERATION 1 ACCESS 0
Return aRotina

//--------------------------------------------------------------------------------------------
static function ModelDef()
local oModel:= MPFormModel():new('legal1')
local oStruZA3:= FWFormStruct(1,"ZA3")
local oStruZA4:= FWFormStruct(1,"ZA4")

oModel:AddFields('ZA3MASTER',/*cOwner*/ ,oStruZA3,,)
oModel:addgrid('ZA4DETAIL','ZA3MASTER',oStruZA4,,)
oModel:SetRelation( 'ZA4DETAIL', { { 'ZA4_FILIAL', 'xFilial( "ZA4" )' }, { 'ZA4_MUSICA', 'ZA3_ALBUM' } }, ZA4->( IndexKey( 1 ) ) )


return oModel
//--------------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------------
static Function ViewDef()
local oView := FWFormView():new()
local oStruct := FWFormStruct(2,'ZA3')
local oStructZA4 := FWFormStruct(2,'ZA4')

oView:SetModel(ModelDef())

oView:AddField('ZA3_VIEW',oStruct,'ZA3MASTER')
oView:addgrid('ZA4_VIEW',oStructZA4,'ZA4DETAIL')

oView:addincrementalfield('ZA4_VIEW','ZA4_ALBUM')

oView:CreateHorizontalBox('BOXZA3',50)
oView:CreateHorizontalBox('BOXZA2',50)

oView:SetOwnerView('ZA3_VIEW','BOXZA3')
oView:SetOwnerView('ZA4_VIEW','BOXZA2')

oView:EnableTitleView("ZA4DETAIL")
Return oView




USER FUNCTION TMP()
    local nLeft := 1
    local nTopBtn := 202
    local showBar := .T.
    local isMute := .F.
    local nVolume := 70
    local cCaminho := ZA1->ZA1_CAMIN
 
    SetStyle(5)
 
    DEFINE MSDIALOG oDlg TITLE "TMediaPlayer" FROM 0,0 TO 424,510 PIXEL
 
        oMedia := TMediaPlayer():New(1,nLeft,255,200,oDlg,cCaminho,nVolume,showBar)
 
 
 
    ACTIVATE MSDIALOG oDlg CENTERED
 
RETURN cCaminho
 

 user function plali()

local cTitulo:="bom dia"
Local oDlg, oFont, oSay,oGet, cIdade := space(3),cNome:= space(30),oButton,cpass:= space(8)
local aItems:= {'Rock','Pagode','Punk','Gospel'}
local oCombo1
Local oDlg    
Local oFolder
local showBar := .T.
local nLeft := 1
local nVolume := 70
local nTopBtn := 232
local oBrowse
local aList
// local nNOVO:="C:/legal/outro.mp3"
local cNovo
DEFINE MSDIALOG oDlg TITLE cTitulo FROM 000,000 TO 700,700 PIXEL


 // Cria Fonte para visualização
oFont := TFont():New('Courier new',,-18,.T.)

// Cria o Objeto tSay usando o comando @ .. SAY
@ 10,10 SAY oSay PROMPT 'Playlist:'  SIZE 200,20 COLORS CLR_BLACK,CLR_WHITE FONT oFont OF oDlg PIXEL


// cria um browse na janela oDlg com os dados do banco de ZA1
 dbSelectArea('ZA1')  
    oBrowse := BrGetDDB():new( 30,15,260,184,,,,oDlg,,,,,,,,,,,,.F.,'ZA1',.T.,,.F.,,, )  

    oBrowse:addColumn( TCColumn():new( 'Codigo', { || ZA1->ZA1_MUSICA  },,,, 'LEFT',, .F., .F.,,,, .F. ) )
    oBrowse:addColumn( TCColumn():new( 'MUSICA', { || ZA1->ZA1_TITULO },,,, 'LEFT',, .F., .F.,,,, .F. ) )
   


//botão que seleciona a musica que tocará

@ 230, 152 BUTTON "selecionar"      OF oDlg ACTION alltrim(u_TMP())  SIZE 40,10 PIXEL


ACTIVATE MSDIALOG oDlg CENTERED




 return
