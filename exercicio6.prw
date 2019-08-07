#include 'Protheus.ch'

user function exer8()


local nNum1 := val(fwinputbox("qual o primeiro número?"))
local nNum2 := val(fwinputbox("qual o segundo número?"))
local nNum3 := val(fwinputbox("qual o terceiro número?"))

do case

    case nNum1 > nNum3 .and. nNum1 > nNum2 .and. nNum2 > nNum3  
        alert("o maior número é: "+cvaltochar(nNum1+nNum2))

    case nNum2 > nNum1 .and. nNum2 > nNum3 .and. nNum3 > nNum1    
        alert("o maior número é: "+cvaltochar(nNum2+nNum3))

    case nNum3 > nNum2 .and. nNum3 > nNum1 .and. nNum1 > nNum2 
        alert("o maior número é: "+cvaltochar(nNum3+nNum1))

    case nNum2 > nNum1 .and. nNum2 <
     nNum3 .and. nNum3 > nNum1    
        alert("o maior número é: "+cvaltochar(nNum2+nNum3))

endcase





return