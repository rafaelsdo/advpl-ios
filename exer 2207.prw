#include 'protheus.ch'


user function peso()
// corrigir erro de apenas numero nAltura
//receber o peso e altura
//receber sexo da pessoa,

local nAltura := val(fwinputbox("qual altura?"))
local nSexo := (fwinputbox("qual sexo?(M/F)"))
local nPeso

//processar o calculo do peso ideal
nPeso := u_calculo(nAltura,nSexo)


// exibe a saida com o valor do peso ideal
alert(nPeso)


return



user function calc(nAlt,cSexo)
// homens = 72.7 x alt- 58 
// mulheres = 62.1 x alt - 44.7.
local nRet := 0

if upper(cSexo) == 'M'
    nRet := 72.7 * nAlt - 58 

elseif upper(cSexo) == 'F'
    nRet := 62.1 * nAlt - 44.7

endif


return nRet