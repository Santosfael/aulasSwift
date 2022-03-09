import UIKit

let isHidden = false
let isEnable = false

if isHidden {
    print("Caso verdadeiro")
} else if isEnable {
    //print("Caso verdadeiro: isEnable")
} else {
    //print("Caso falso")
}

/*
    Caso a variavel esteja declarada
    e não inicializada o mesmo irá dá error,
    sendo assim em algum momento deve receber um valor
 */
var system: String
let company: String = "Apple"

if company == "Apple" {
    system = "iOS"
} else {
    system = "Android"
}

//print(system)

//If ternario
system = company == "Apple" ? "iOS" : "Android"
print(system)
