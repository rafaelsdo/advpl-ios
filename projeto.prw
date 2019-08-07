#include "protheus.ch"


user function inter()
local oBrowse :=FWMBrowse():new()// criação do browse

oBrowse:SetAlias('ZA0') 
oBrowse:SetMenuDef('projeto') // define setmenudef


oBrowse:activate()

return

//----------------------------------------------------------------------------------

static function MenuDef()



return FWMVCMenu('projeto') //menu padrão c.r.u.d.

//--------------------------------------------------------------------------------------------
static function ModelDef()
local oModel:= MPFormModel():new('legal1')
local oStruZA0:= FWFormStruct(1,"ZA0")


oModel:AddFields('ZA0MASTER',/*cOwner*/ ,oStruZA0, ,, )

return oModel
//--------------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------------
static Function ViewDef()
local oView := FWFormView():new()
local oStruct := FWFormStruct(2,'ZA0')
oView:SetModel(ModelDef())

oView:AddField('ZA0_VIEW',oStruct,'ZA0MASTER')
oView:CreateHorizontalBox('BOXZA0',100)
oView:SetOwnerView('ZA0_VIEW','BOXZA0')

Return oView






