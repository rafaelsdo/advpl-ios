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
local nTotal2 := 0

do case

    case nQuantidade <= 5
    nDesconto := 0.02
    nTotal2 := nTotal1 * nDesconto
    case nQuantidade > 5 .and. nQuantidade <= 10
    nDesconto := 0.03
    nTotal2 := nTotal1 * nDesconto
    otherwise 
    nDesconto := 0.05
    nTotal2 := nTotal1 * nDesconto
endcase


alert(cProduto+" valor total: "+cvaltochar(nTotal1)+" desconto: "+cvaltochar(nDesconto)+" valor a pagar: "+cvaltochar(nTotal1-nTotal2))


return


user function exer6()

local nNum1 := val(fwinputbox("qual o primeiro número?"))
local nNum2 := val(fwinputbox("qual o segundo número?"))
local nNum3 := val(fwinputbox("qual o terceiro número?"))

do case

    case nNum1 > nNum2 .and. nNum1 > nNum3
        alert("o maior número é: "+cvaltochar(nNum1))
    case nNum2 > nNum1 .and. nNum2 > nNum3    
        alert("o maior número é: "+cvaltochar(nNum2))
    case nNum3 > nNum1 .and. nNum3 > nNum2
        alert("o maior número é: "+cvaltochar(nNum3))
endcase


return

user function exer7()

local nNum1 := val(fwinputbox("qual o primeiro número?"))
local nNum2 := val(fwinputbox("qual o segundo número?"))
local nNum3 := val(fwinputbox("qual o terceiro número?"))


do case

case nNum1 > nNum2 .and. nNum1 > nNum3


endcase



return