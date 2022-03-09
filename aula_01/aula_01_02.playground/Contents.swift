import UIKit

//Incrementos, operadores logicos
let num1 = 10
let num2 = 20

let name = "Rafael"
let lastName = "Rocha"

let compair = num1 < num2

/*
 O swift compara sempre o primeiro caractere
 No exemplo abaixo ele compara o primeiro caractere
 da primeira variavel com o segundo caractere da
 segunda variavel
 Se os primeiros caracteres forem iguais ele passa
 para o segundo caractere das variaveis e assim susessivamente
 */
let res = name < lastName
//print(res)

/*
    Operadores logicos
    = Atribuição
    == Comparação
    != Diferente de
    < Menor
    <= Menor igual a
    > Maior
    >= Maior igual a
 */

/*
    Expressões
    ! Operador de inversão
 */

let isHidden: Bool = false
let isEnable: Bool = true
//print(!isHidden)

/*
    Operadores de expressão
    || ou
    && e
 */

let res1 = isHidden || isEnable
//print(res1)

/*
    Incremento
    += incremento
    -= decremento
 */

var numIncrement = 10
numIncrement -= 1
numIncrement = numIncrement + 1
print(numIncrement)
