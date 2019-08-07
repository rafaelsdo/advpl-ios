
#include "protheus.ch"

user function musica()
local oBrowse :=FWMBrowse():new()// criação do browse


oBrowse:SetAlias('ZA1') 
oBrowse:SetMenuDef('projeto2') // define setmenudef

oBrowse:AddLegend( "ZA1_MUSICA <= '000005'","GREEN","free")
oBrowse:AddLegend( "ZA1_MUSICA > '000005'","RED","vip")
oBrowse:activate()

return

//----------------------------------------------------------------------------------

static function MenuDef()




return FWMVCMenu('projeto2') //menu padrão c.r.u.d.

//--------------------------------------------------------------------------------------------
static function ModelDef()
local oModel:= MPFormModel():new('legal1')
local oStruZA1:= FWFormStruct(1,"ZA1")
local oStruZA2:= FWFormStruct(1,"ZA2")


oModel:AddFields('ZA1MASTER',/*cOwner*/ ,oStruZA1)
oModel:addgrid('ZA2DETAIL','ZA1MASTER',oStruZA2)
oModel:SetRelation( 'ZA2DETAIL', { { 'ZA2_FILIAL', 'xFilial( "ZA2" )' }, { 'ZA2_MUSICA', 'ZA1_MUSICA' } }, ZA2->( IndexKey( 1 ) ) )

oModel:getmodel("ZA1MASTER"):setdescription("dados da musica")
oModel:getmodel("ZA2DETAIL"):setdescription("dado do autor")

return oModel
//--------------------------------------------------------------------------------------------
static Function ViewDef()
local oView := FWFormView():new()
local oStruct := FWFormStruct(2,'ZA1')
local oStructZA2 := FWFormStruct(2,'ZA2')

oView:SetModel(ModelDef())

oView:AddField('ZA1_VIEW',oStruct,'ZA1MASTER')
oView:addgrid('ZA2_VIEW',oStructZA2,'ZA2DETAIL')

oView:addincrementalfield('ZA2_VIEW','ZA2_ITEM')

oView:CreateHorizontalBox('BOXZA1',50)
oView:CreateHorizontalBox('BOXZA2',50)

oView:SetOwnerView('ZA1_VIEW','BOXZA1')
oView:SetOwnerView('ZA2_VIEW','BOXZA2')

oView:EnableTitleView("ZA2DETAIL")
Return oView
//----------------------------------------------------------------------------------------------------------------------
// 1) buscar o registro do autor que está sendo inserido no grid

// 2) pega a data de falecimento

// 3) se a data de falecimento não estiver em branca,bloquear a inclusão exibindo msg de erro

// guardar a area ativa e a area da tabela

// abrir a tabela ZA0

// setar o indice da ZA0 (indice que contenha filial+código)

// buscar o registro filtrando o código especifico

// se eu achar o registro eu avalio o campo de data de falecimento

// restaurar a area de tabela e area ativa
//----------------------------------------------------------------------------------------------------------------------

static function ValidAutor(oModelGrid)
local lRet:= .F.
local cCodAutor:= oModelGrid:GetValue('ZA2_AUTOR')
local resut
local rest



DbSelectArea("ZA0")// selecionar o banco da tabela ZA0

rest:=getarea()//armazena o GETAREA em "rest"      GETAREA armazena a "tabela ativa"(ZA0)

ZA0->(DbSetOrder(1)) // ordenar por (1), no caso Cod da tabela ZA0

If ZA0->(DBSeek(xFilial("ZA0") + cCodAutor )) // se XFILIAL ZA0 + codigo do autor(cCodAutor) == verdadeiro 

resut:=ZA0->ZA0_DTAFAL // armazena data de falecimento em (resut)

 If empty(resut) // se a variavel resut estiver vazia(empty) entao...

       lRet:= .T.//retorna valor verdadeiro,fazendo com que a função ValidAutor retorne verdadeiro permitindo que o autor seja gravado
    else 
        help(,,,,"error")// caso não seja verdadeiro "empty(resut)" exibe uma mensagem de erro e não deixa gravar
    EndIf


endif

restarea(rest)

return lRet
