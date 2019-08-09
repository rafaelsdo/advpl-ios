#include "protheus.ch"


user function play1()
local oBrowse :=FWMBrowse():new()// criação do browse

oBrowse:SetAlias('ZA7') 
oBrowse:SetMenuDef('menu') // define setmenudef



oBrowse:activate()

return

//----------------------------------------------------------------------------------

static function MenuDef()



return FWMVCMenu('menu') //menu padrão c.r.u.d.

//--------------------------------------------------------------------------------------------
static function ModelDef()
local oModel:= MPFormModel():new('legal2')
local oStruZA7:= FWFormStruct(1,"ZA7")
local oStruZA8:= FWFormStruct(1,"ZA8")

oModel:AddFields('ZA7MASTER',/*cOwner*/ ,oStruZA7, ,, )
oModel:addgrid('ZA8MASTER','ZA7MASTER',oStruZA8)
oModel:SetRelation( 'ZA8MASTER', { { 'ZA8_FILIAL', 'xFilial( "ZA8" )' }, { 'ZA8_PLAY', 'ZA7_CODIGO' } }, ZA8->( IndexKey( 1 ) ) )



return oModel
//--------------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------------
static Function ViewDef()
local oView := FWFormView():new()
local oStruct := FWFormStruct(2,'ZA7')
local oStructZA8 := FWFormStruct(2,'ZA8')

oView:SetModel(ModelDef())

oView:AddField('ZA7_VIEW',oStruct,'ZA7MASTER')
oView:addgrid('ZA8_VIEW',oStructZA8,'ZA8MASTER')

oView:addincrementalfield('ZA8_VIEW','ZA8_ITEM')

oStruct:RemoveField("ZA7_FILIAL")
oStructZA8:RemoveField("ZA8_FILIAL")

oStruct:RemoveField("ZA7_CODIGO")

oView:AddIncrementField("ZA8MASTER", "ZA8_CODIGO")

oView:CreateHorizontalBox('BOXZA1',50)
oView:CreateHorizontalBox('BOXZA2',50)

oView:SetOwnerView('ZA7_VIEW','BOXZA1')
oView:SetOwnerView('ZA8_VIEW','BOXZA2')

oView:EnableTitleView("ZA8MASTER")

Return oView






