#include 'Protheus.ch'
#include 'FWMVCDEF.ch'

User Function ios02() //O nome da function foi definido com o nome do Browse
Local oBrowse := FWMBrowse():New()

oBrowse:SetAlias("ZA1")
//oBrowse:SetMenuDef('ios02') 
/* Se Utiliza este método quando o nome da função principal não possui o mesmo
nome do fonte .prw */

oBrowse:Activate() // \o/

Return 

Static Function MenuDef()
Local aRotina :=  FWMVCMenu('ios02') 

ADD OPTION aRotina Title 'Player gráfico' Action 'u_player' OPERATION 2 ACCESS 0

/*ADD OPTION aRotina Title 'Visualizar' Action 'VIEWDEF.IOS02' OPERATION 2 ACCESS 0
ADD OPTION aRotina Title 'Incluir'    Action 'VIEWDEF.IOS02' OPERATION 3 ACCESS 0
ADD OPTION aRotina Title 'Alterar'    Action 'VIEWDEF.IOS02' OPERATION 4 ACCESS 0
ADD OPTION aRotina Title 'Excluir'    Action 'VIEWDEF.IOS02' OPERATION 5 ACCESS 0
ADD OPTION aRotina Title 'Imprimir'   Action 'VIEWDEF.IOS02' OPERATION 8 ACCESS 0
ADD OPTION aRotina Title 'Copiar'     Action 'VIEWDEF.IOS02' OPERATION 9 ACCESS 0
*/
Return aRotina

//MVC - Model (Dados e regra de negócio) 
//      View (Interface) 
//      Controller (dentro da lib)


Static Function ModelDef() //Não tinha teto não tinha nada
Local oModel := MPFormModel():New("ZA1MODEL")
Local oStruZA1 := FWFormStruct(1, "ZA1")
Local oStruZA2 := FWFormStruct(1, "ZA2")
Local bValid := {|oModelGrid| ValidAutor(oModelGrid) } //validação da linha do grid

oModel:AddFields("ZA1MASTER",/* Owner */,oStruZA1,/* */)
oModel:AddGrid( 'ZA2DETAIL', 'ZA1MASTER', oStruZA2, , bValid ) 


oModel:SetRelation( 'ZA2DETAIL', { ;
                                    {'ZA2_FILIAL', "xFilial('ZA2')"},;
                                    {"ZA2_MUSICA" , "ZA1_MUSICA"} ;
                                },;
                    ZA2->( IndexKey( 1 ) );
                 )


oModel:GetModel( 'ZA1MASTER' ):SetDescription( 'Dados da Musica' )
oModel:GetModel( 'ZA2DETAIL' ):SetDescription( 'Dados do Autor Da Musica'  )

Return oModel


Static Function ViewDef() //O.O
Local oView := FWFormView():New()
Local oStruct := FWFormStruct(2, "ZA1")
Local oStructZA2 := FWFormStruct(2, "ZA2")
oView:SetModel(ModelDef()) //return do ModelDef para SetModel

              //ID       , Estrutura, ID do Model
oView:AddField("ZA1_VIEW", oStruct, "ZA1MASTER")
oView:AddGrid( 'ZA2_VIEW', oStructZA2, 'ZA2DETAIL' )
// Define campos que terao Auto Incremento
oView:AddIncrementField( 'ZA2_VIEW', 'ZA2_ITEM' )

oView:CreateHorizontalBox("BOXZA1", 50)
oView:CreateHorizontalBox("BOXZA2", 50)

oView:SetOwnerView("ZA1_VIEW","BOXZA1") //Cajuzinho ?
oView:SetOwnerView("ZA2_VIEW","BOXZA2") 

oView:EnableTitleView('ZA2_VIEW') //habilita a descricao do submodelo

Return oView


Static Function ValidAutor(oModelGrid)
Local lRet := .F.
Local cCodAutor := oModelGrid:GetValue('ZA2_AUTOR')

// 1) buscar na ZA0 o registro do autor que está sendo inserido no grid
// 2) Pegar a data de falecimento
// 3) se a data nao estiver em branco, bloquear a inclusao exibindo msg de erro

//guardar a area ativa e a area da tabela 

//Abrir a tabela ZA0

//setar o indice da ZA0 (indice que contenha filial+código)

//buscar o registro filtrando o código especifico
//se eu achar o registro eu avalio o campo de data de falecimento


//Restaurar a area da tabela e a area ativa 
Return lRet

user function player()
local oDlg
local aItems := {}
Local nlist := 1
local aArea := GetArea()
local aAreaZA0 := ZA0->(GetArea())


DbSelectArea("ZA2")
ZA2->(DBSetOrder(1)) //ZA2_FILIAL+ZA2_MUSICA

IF ZA2->(DBSeek(xFilial("ZA2")+ZA1->ZA1_MUSICA)) 
    //abro a tabela za0 e defino o indice fora do while para 
    //fazer apenas uma vez
    DbSelectArea("ZA0")    
    ZA0->(DBSetOrder(1)) //ZA0_FILIAL+ZA0_CODIGO

    While ZA2->(!EOF()) .AND. ZA2->ZA2_FILIAL == xFilial("ZA2");
        .AND.  ZA2->ZA2_MUSICA == ZA1->ZA1_MUSICA
        //busco na tabela de autores baseado na ZA2 (autores da musica)
        IF ZA0->(DBSeek(xFilial("ZA0")+ZA2->ZA2_AUTOR))
            AADD(aItems, ZA0->ZA0_NOME)
        EndIf

        ZA2->(DBSkip())
    EndDo

EndIf



DEFINE MSDIALOG oDlg TITLE 'Player da Plalist' FROM 000,000 TO 400,300 PIXEL
         
        // Usando o New
        oList1 := TListBox():New(020,020,{|u|iif(Pcount()>0,nList:=u,nList)},aItems,100,100,;
                                ,oDlg,,,,.T.)
 

 @110,70 BUTTON "clique aqui" SIZE 30, 20 PIXEL OF oDlg ACTION Botao(aItems[nList])

ACTIVATE MSDIALOG oDlg CENTERED


restarea(aAreaZA0)
restarea(aArea)

Return

static function Botao(cParametro)

    alert(cParametro)

Return
