#include 'protheus.ch'

                                                // proxima function

user function repet01()

local nNum1 := val(fwinputbox("primeiro número"))
local nNum2 := val(fwinputbox("segundo número"))

While nNum2 == 0 
    
    nNum2 := val(fwinputbox("segundo número (Que não seja 0)"))

End do
alert(i18n("#1 / #2 = #3",{nNum1,nNum2,nNum1/nNum2}))



return

                                                // proxima function

user function repet02()

local cNovo := "s"
local nNota2
local nNota1
while cNovo == "s"
nNota1 := val(fwinputbox("primeira nota"))

    while nNota1 < 0 .or. nNota1 >= 11
        nNota1 := val(fwinputbox("primeira nota"))

    end do

nNota2 := val(fwinputbox("segunda nota"))

    while nNota2 < 0 .or. nNota2 >=11
        nNota2 := val(fwinputbox("segunda nota"))

    end do

alert(i18n(" média do aluno: #1 + #2 = #3",{nNota1,nNota2,((nNota1+nNota2)/2)}))

cNovo := fwinputbox("deseja realizar uma nova consulta?(s/n)")

    if cNovo == "s"
        loop
    end if
end do
return


                                                // proxima function

user function repet03()

local nNum1
local nNum2


for nNum1:=1 to 10 step 1

ConOut( nNum1)

next nNum1


return


                                                // proxima function

user function repet04()

local nNum1
local nNum2


for nNum1:=100 to 200 step 10

ConOut( nNum1)

next nNum1


return

                                                // proxima function

user function repet05()

local nNum1 :=val(fwinputbox("digite um valor de 1 a 10"))
local nNum2

while nNum1 <0 .or. nNum1 >10
nNum1 :=val(fwinputbox("digite um valor de 1 a 10"))

end do
for nNum2 := 1 to 10
conout(i18n("#1 x #2 = #3",{nNum2,nNum1,(nNum1*nNum2)}))

next nNum2

return

                                                // proxima function

user function repet06()

local aLetra := array(10)
local nContador:=1
local nContLetra:=0
aLetra[1]:="a"
aLetra[2]:="b"
aLetra[3]:="c"
aLetra[4]:="d"
aLetra[5]:="e"
aLetra[6]:=1
aLetra[7]:=2
aLetra[8]:="f"
aLetra[9]:=3
aLetra[10]:="g"



    while nContador <=10
        if ValType(aLetra[nContador]) == "C"
        nContLetra++

        end if
    nContador++

    end do

alert(cvaltochar(nContLetra)+" letras")

return


                                                // proxima function

user function repet07()

local aLetra := array(10)
local nContador:=1
local nContLetra:=0
aLetra[1]:="a"
aLetra[2]:="b"
aLetra[3]:="c"
aLetra[4]:="d"
aLetra[5]:="e"
aLetra[6]:=1
aLetra[7]:=2
aLetra[8]:="f"
aLetra[9]:=3
aLetra[10]:="g"



    while nContador <=10
        if ValType(aLetra[nContador]) == "C" .and. aLetra[nContador] <> "a" .and. aLetra[nContador] <> "b" 
        nContLetra++

        end if
    nContador++

    end do

alert(cvaltochar(nContLetra)+" letras")

return

                                                // proxima function


user function repet08()

local aLetra := array(13)
local nContador:=1
local nContLetra:=0
local nFalta:=0
local nContArray:=0

aLetra[1]:="a"
aLetra[2]:="b"
aLetra[3]:="c"
aLetra[4]:="d"
aLetra[5]:="e"
aLetra[6]:=1
aLetra[7]:=2
aLetra[8]:="f"
aLetra[9]:=3
aLetra[10]:=3
aLetra[11]:=5
aLetra[12]:=8
aLetra[13]:=10

nContArray:= len(aLetra)
while nContArray != 1
    
    while nContador <=13
       
        if ValType(aLetra[nContador]) == "C"
            
            if aLetra[nContador] == "f"
                 nContArray--
                 nFalta++
                exit
             end if 

           nContLetra++
           
        end if
        
        nContador++
        nContArray--
     
    end do
    
end do
alert(cvaltochar(nContLetra)+" letras"+" e falta contar: "+cvaltochar(nFalta)+" campos")

return



user function repet09()

local aPessoa:= ()

aadd(aPessoa,1,1):="M"
aadd(aPessoa,2,1):="F"
aadd(aPessoa,1,2):=2
aadd(aPessoa,2,2):=1.70

conout(varinfo("test",aPessoa))







return