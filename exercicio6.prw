#include 'Protheus.ch'

user function exer8()


local nNum1 := val(fwinputbox("qual o primeiro n�mero?"))
local nNum2 := val(fwinputbox("qual o segundo n�mero?"))
local nNum3 := val(fwinputbox("qual o terceiro n�mero?"))

do case

    case nNum1 > nNum3 .and. nNum1 > nNum2 .and. nNum2 > nNum3  
        alert("o maior n�mero �: "+cvaltochar(nNum1+nNum2))

    case nNum2 > nNum1 .and. nNum2 > nNum3 .and. nNum3 > nNum1    
        alert("o maior n�mero �: "+cvaltochar(nNum2+nNum3))

    case nNum3 > nNum2 .and. nNum3 > nNum1 .and. nNum1 > nNum2 
        alert("o maior n�mero �: "+cvaltochar(nNum3+nNum1))

    case nNum2 > nNum1 .and. nNum2 <
     nNum3 .and. nNum3 > nNum1    
        alert("o maior n�mero �: "+cvaltochar(nNum2+nNum3))

endcase





return