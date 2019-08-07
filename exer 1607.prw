#include 'protheus.ch'

user function exerc3()
local aAluno := {}

aAdd(aAluno,{"amarelo", 7,87,"programador"})
aAdd(aAluno,{"Lucas 1", 10,27,"Jogador de CS"})
aAdd(aAluno,{"Ualace", 2,30,"Instrutor"})
aAdd(aAluno,{"Castanhari", 5,23,"Youtuber"})
aAdd(aAluno,{"Igor RS", 6,24,"Do Sul"})


alert("Nome do aluno: " + aAluno[5,1] +;
       " Média: " + cvaltochar(aAluno[5,2]) +;
       " Idade: " + cvaltochar(aAluno[5,3]) +;
       " Profissão: " + aAluno[5,4] )

varinfo("texto qualquer",aAluno)

return

user function exerc1()

local aAluno := {}

aAdd(aAluno,{"marcos"})
aAdd(aAluno,{"marcio"})
aAdd(aAluno,{"rafael"})
aAdd(aAluno,{"natanael"})
aAdd(aAluno,{"gabriel"})

alert(aAluno[3,1])


return



user function exerc2()

local aAluno := {}


aAdd(aAluno,{"marcos",19})
aAdd(aAluno,{"marcio",20})
aAdd(aAluno,{"rafael",23})
aAdd(aAluno,{"natanael",26})
aAdd(aAluno,{"gabriel",28})


alert(aAluno[3,1]+" idade: "+cvaltochar(aAluno[3,2]))

return


user function exerc4()

local aAluno := {}

aAdd(aAluno,{"rafael",{7,8,7,6}})
aAdd(aAluno,{"yuri",{8,6,7,9}})
aAdd(aAluno,{"gaby",{3,6,10,7}})


alert(cvaltochar(aAluno[2,2,1])+" "+cvaltochar(aAluno[2,2,2])+" "+cvaltochar(aAluno[2,2,3])+" "+cvaltochar(aAluno[2,2,4]))
varinfo("teste",aAluno)



return




user function exerc5()


local aAluno := {}


aAdd(aAluno,"marcos")
aAdd(aAluno,"marcio")
aAdd(aAluno,"rafael",)
aAdd(aAluno,"natanael")
aAdd(aAluno,"gabriel")

aAdd(aAluno,"marcia")
aAdd(aAluno,"marci")
aAdd(aAluno,"rafa")
aAdd(aAluno,"natan")
aAdd(aAluno,"gab")


adel(aAluno,1)
adel(aAluno,3)
adel(aAluno,6)
adel(aAluno,7)
adel(aAluno,8)

asize(aAluno,5)
varinfo("test",aAluno)

return




user function exere7()

local aPessoa := array(2,3)



aAdd(aPessoa,1,1) :="M"
aAdd(aPessoa,1,2) :="F"
aAdd(aPessoa,1,3) :="M"
aAdd(aPessoa,2,1) :=1.95
aAdd(aPessoa,2,2) :=1.70
aAdd(aPessoa,2,3) :=1.90


If aPessoa[2,1] > aPessoa[2,2] .and. aPessoa[2,1] > aPessoa[2,3]

alert("a maior altura é"+cvaltochar(aPessoa[2,1]))
       
       elseif aPessoa[2,2] > aPessoa[2,1] .and. aPessoa[2,2] > aPessoa[2,3]

alert("a maior altura é"+cvaltochar(aPessoa[2,2]))

       else

alert("a maior altura é"+cvaltochar(aPessoa[2,3]))

EndIf







return 