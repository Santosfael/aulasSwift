import UIKit

/*
 Programação funcional é um paradigma de programação
 Paradigma é a forma de se pensar, uma forma como entendemos a construção de um programa
 
 Swift não é totalmente uma linguagem funcional
 */

var estudantes = ["Samuel", "Matheus", "Rafael", "Rodrigo", "Ana"]

//Retorna último objeto
//print(estudantes.last)
//Retorna o primeiro objeto
//print(estudantes.first)
//Retorna a lista em ordem crescente
//print(estudantes.sorted())

/*
 lhs = left hand side = lado esquerdo
 rhs = right hand side = lado direito
 */
//Ordernando a lista de forma decrescente
estudantes.sort{(lhs: String, rhs: String) -> Bool in
    lhs > rhs
}
//print(estudantes)

let descending = estudantes.sorted(by: <)
//print(descending)

//Marge de array
let array1 = [1, 2, 3, 4, 5]
let array2 = [10 ,23, 45, 56, 91]

let flattenArray = array1 + array2
//print(flattenArray)

/*
 Map
 */

var alunosNota = [4, 5, 7, 9, 3]
var notas: [Int] = []

for nota in alunosNota {
    let novaNota = nota + 1
    notas.append(novaNota)
}

//print(alunosNota)
//print(notas)

/*
alunosNota = alunosNota.map({ result in
    return result + 1
})*/

//$0 pega o primeiro parametro para que seja adicionado 1 ponto
alunosNota = alunosNota.map{$0 + 1}
//print(alunosNota)

/*
 Filter
 */

var aprovadosNotas : [Int] = []
for nota in alunosNota {
    if nota >= 6 {
        aprovadosNotas.append(nota)
    }
}

//print(aprovadosNotas)

/*alunosNota = alunosNota.filter({ result in
    result >= 6
})*/

alunosNota = alunosNota.filter{ $0 >= 6 }
//print(alunosNota)

/*
 Reduce
 */


var soma = 0
var notasAlunos = [4, 5, 6, 8, 10]

/*for nota in notasAlunos {
    soma += nota
}*/

//soma = notasAlunos.reduce(0, {$0 + $1})

soma = notasAlunos.reduce(0, +)

print(soma)
