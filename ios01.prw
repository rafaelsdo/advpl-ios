#include 'protheus.ch'

user function funci()
local oBrowse :=FWMBrowse():new()// criação do browse

oBrowse:SetAlias('ZA0') 
oBrowse:SetMenuDef('ios01') // define setmenudef


oBrowse:activate()

return

//----------------------------------------------------------------------------------

static function MenuDef()




return FWMVCMenu('ios01') //menu padrão c.r.u.d.

//--------------------------------------------------------------------------------------------
static function ModelDef()
local oModel:= MPFormModel():new('legal1')
local oStruZA0:= FWFormStruct(1,"ZA0")
local bPos:= {|oModelField| PosVldAutor(oModelField)}

oModel:AddFields('ZA0MASTER',/*cOwner*/ ,oStruZA0, ,bPos, )

return oModel
//--------------------------------------------------------------------------------------------
static function PosVldAutor(oModelField)
local lTudoOk:= .T.
local dFalec:= oModelField:Getvalue("ZA0_DTAFAL")
local cNome:= oModelField:Getvalue("ZA0_NOME")

if dFalec > date()
    lTudoOk:= .F.
    help(,,'HELP',,'não adivinhe',1,0,,,,,,{"ajuda"})
endif

if 'RICARDO' $ UPPER(cNome) .or. empty(cNome)
    lTudoOk:= .F.
    help(,,'HELP',,'ele não pode estar aqui ',1,0)
endif


return lTudoOk
//--------------------------------------------------------------------------------------------
static Function ViewDef()
local oView := FWFormView():new()
local oStruct := FWFormStruct(2,'ZA0')
oView:SetModel(ModelDef())

oView:AddField('ZA0_VIEW',oStruct,'ZA0MASTER')
oView:CreateHorizontalBox('BOXZA0',100)
oView:SetOwnerView('ZA0_VIEW','BOXZA0')

Return oView