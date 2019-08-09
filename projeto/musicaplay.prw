#include "protheus.ch"


user function music1()
local oBrowse :=FWMBrowse():new()// criação do browse

oBrowse:SetAlias('ZA8') 
oBrowse:SetMenuDef('musicaplay') // define setmenudef



oBrowse:activate()

return

//----------------------------------------------------------------------------------

static function MenuDef()



return FWMVCMenu('musicaplay') //musicaplay padrão c.r.u.d.

//--------------------------------------------------------------------------------------------
static function ModelDef()
local oModel:= MPFormModel():new('legal1')
local oStruZA8:= FWFormStruct(1,"ZA8")
local oStruZA1:= FWFormStruct(1,"ZA1")


oModel:AddFields('ZA8MASTER',/*cOwner*/ ,oStruZA8, ,, )
oModel:addgrid('add2','ZA8MASTER',oStruZA1)
oModel:SetRelation( 'add2', { { 'ZA1_FILIAL', 'xFilial( "ZA1" )' }, { 'ZA1_MUSICA', 'ZA8_MUSICA' } }, ZA1->( IndexKey( 1 ) ) )

return oModel
//--------------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------------
static Function ViewDef()
local oView := FWFormView():new()
local oStruct := FWFormStruct(2,'ZA8')
local oStructZA1 := FWFormStruct(2,'ZA1')
oView:SetModel(ModelDef())

oView:AddField('ZA8_VIEW',oStruct,'ZA8MASTER')
oView:addgrid('ZA1_VIEW',oStructZA1,'add2')

oView:addincrementalfield('ZA1_VIEW','ZA1_ITEM')

oView:CreateHorizontalBox('BOXZA1',50)
oView:CreateHorizontalBox('BOXZA2',50)

oView:SetOwnerView('ZA8_VIEW','BOXZA1')
oView:SetOwnerView('ZA1_VIEW','BOXZA2')

oView:EnableTitleView("add2")

Return oView






