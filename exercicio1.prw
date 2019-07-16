#include 'Protheus.ch'

                user function exer2()

local nProva1 :=val(fwinputbox("valor da nota 1?"))*2
local nProva2 :=val(fwinputbox("valor da nota 2?"))*3
local nProva3 :=val(fwinputbox("valor da nota 3?"))*5
local nMedia := (nProva1+nProva2+nProva3)/10

alert(cvaltochar(nMedia))

return

                User function exer3()

local nNumero1 := val(fwinputbox("qual o primeiro valor?"))
local nNumero2 := val(fwinputbox("qual o segundo valor?"))

do case 

    case nNumero1 > nNumero2
        alert(nNumero1)
    case nNumero2 > nNumero1
        alert(nNumero2)    

endcase


return


                user function exer4()

local nNumero1 := val(fwinputbox("qual o número?"))

do case

    case nNumero1 > 0
        alert("maior que 0")
    case nNumero1 < 0
        alert("menor que 0")
    otherwise
        alert("é igual a 0")        

endcase

return

                user function exer5()

local cProduto := fwinputbox("qual o produto?")
local nPreco := val(fwinputbox("qual o preço?"))
local nQuantidade := val(fwinputbox("quantas unidades?"))
local nTotal1 := nPreco * nQuantidade
local nDesconto := 0
local nTotal2 := nTotal1 - nDesconto

do case

    case (nQuantidade <= 5)
    nDesconto == 0.02)
    
    case ((nQuantidade > 5) and (nQuantidade <= 10))
    nDesconto == 0.03

    otherwise 
    nDesconto == 0.05

endcase

alert(cvaltochar(nTotal1)+" "+cvaltochar(nDesconto)+" "+cvaltochar(nTotal2))


return