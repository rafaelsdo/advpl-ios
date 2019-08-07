#include 'protheus.ch'

user function peso22()

local aPessoas := {}
local cMensagem := ""
local nX :=0

aAdd(aPessoas,{1.56 , 'M' , 0 })
aAdd(aPessoas,{2    , 'F' , 0 })
aAdd(aPessoas,{1.60 , 'M' , 0 })
aAdd(aPessoas,{2.89 , 'F' , 0 })
aAdd(aPessoas,{1.84 , 'F' , 0 })

//processar o calculo do peso ideal
for nX := 1 to len(aPessoas)
    aPessoas[nX,3] := u_calculo(aPessoas[nX,1],aPessoas[nX,2])
    cMensagem += "o peso ideal da pessoa " + cvaltochar(nX) + " é " + str(aPessoas[nX,3],6,2) + CRLF
next nX

// exibe a saida com o valor do peso ideal
alert(cMensagem)


return

user function 230701()

local nNum1:=val(fwinputbox("qual numero 1?"))
local nNum2:=val(fwinputbox("qual numero 2?"))
local nTotal
nTotal := u_soma(nNum1,nNum2)

alert(nTotal)
return


user function soma(nN1,nN2)

nTotal:= nN1+nN2


return nTotal


user function 230702()

local nNum1:=val(fwinputbox("qual numero 1?"))
local nNum2:=val(fwinputbox("qual numero 2?"))
local nTotal
nTotal := u_soma2(nNum1,nNum2)

alert(nTotal)
return


user function soma2(nN1,nN2)

nTotal:= nN1*nN2


return nTotal



user function 230703()

local aPessoas:= {}
local nX := 0
local cMensagem:=""

aAdd(aPessoas,5)
aAdd(aPessoas,7)
aAdd(aPessoas,200)
aAdd(aPessoas,-1)
ASORT(aPessoas,,, { |x,y| x>y})
for nX := 1 to len(aPessoas)

cMensagem += "a referencia é "+cvaltochar(aPessoas[nX]) + CRLF

next
alert(cMensagem)
return



 user function 230704()
// 4. Fazer a função POW (base, expoente) que recebe base e expoente e retorna o valor
// de base elevado a expoente. Se os valores de base e expoente não forem inteiros a
// função deve retornar 0.
// Operador de exponenciação: http://tdn.totvs.com/display/tec/Operadores+Comuns

local nNum1:=val(fwinputbox("qual numero 1?"))
local nNum2:=val(fwinputbox("qual numero 2?"))
local nTotal := 0
if nNum1 == int(nNum1)  .and. nNum2 == int(nNum2)
nTotal := u_expo(nNum1,nNum2)
else
 nNum1:=0
 nNum2:=0
nTotal := u_expo(nNum1,nNum2)

end if
alert(nTotal)


return


user function expo(nN1,nN2)

nTotal:= nN1 ^ nN2



return nTotal




user function 230705()
// 5. Criar uma função que recebe um valor inteiro e verifica se o valor é par ou ímpar. A
// função deve retornar um valor booleano.
local nNum1:= val(fwinputbox("qual numero?"))


if int(nNum1) % 2 ==0

alert("numero par")
else
alert("numero impar")
endif

return




user function 230707()
// 7. Realizar o processamento do salário de 5 funcionários, exibindo como resultado final
// o Nome, salário bruto e salário líquido de cada funcionário. Os dados de entrada de
// cada funcionário devem ser o nome, o valor hora e a quantidade de horas trabalhadas
// no mês.
// Criar uma função que receba esse valor hora de um funcionário e a quantidade de
// horas trabalhadas no mês e retorne o Salário Bruno, Salário Líquido e INSS do
// funcionário.
// Considere que:
// Salário Bruto = Qtde horas trabalhadas * valor hora
// INSS = 8% do Salário Bruto
// Salário Líquido = Salário Bruno - INSS

local aFuncionario := {}
local nBruto     := 0
local nInssTotal := 0
local nLiqui     := 0
local nX         := 0
local cMensagem:=""

aAdd(aFuncionario,{"Mario"   , 5 ,8 , 0 , 0 , 0})
aAdd(aFuncionario,{"Lucas"   , 7 ,8 , 0 , 0 , 0})
aAdd(aFuncionario,{"Gabriel" , 3 ,8 , 0 , 0 , 0})
aAdd(aFuncionario,{"Ana"     , 9 ,8 , 0 , 0 , 0})
aAdd(aFuncionario,{"Maria"   , 5 ,8 , 0 , 0 , 0})

    for nX :=1 to len(aFuncionario)
    // salario bruto sendo inserido na coluna 4 do array aFuncionario por meio de uma chamada de função
    // e sendo atribuido em cMensagem

        aFuncionario[nX,4]:= u_salbru(aFuncionario[nX,2],aFuncionario[nX,3])

    // pegando valor bruto e chamando inss    
        aFuncionario[nX,5]:= u_inss(aFuncionario[nX,4])
    // pegando salario liquido
         aFuncionario[nX,6]:= u_liqui(aFuncionario[nX,4],aFuncionario[nX,5])
    // mostrando em tela
        cMensagem += "salario bruto: "+ aFuncionario[nX,1] + " = " + cvaltochar(aFuncionario[nX,4]) +;
         " , INSS: " +cvaltochar(aFuncionario[nX,5]) +" , Total: " + cvaltochar(aFuncionario[nX,6]) + CRLF

    next

// mostra salario bruto
alert(cMensagem) 

return

// -------------------------------------------------------------------------------

                    // pegando salario bruto
user function salbru(nN1,nN2)

nBruto := nN1*nN2



return nBruto
                    // retorna salario bruto

 // ---------------------------------------------------------------------------

                    // pegando inss
user function inss(nN1)

nInssTotal:= (nN1 * 0.08)



return nInssTotal
                    // retorna inss

// -------------------------------------------------------------------------------
                        // retorna salario liquido
user function liqui(nN1,nN2)

nLiqui:= nN1 - nN2

return nLiqui