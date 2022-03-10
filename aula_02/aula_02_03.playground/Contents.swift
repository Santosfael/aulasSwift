import UIKit

func myCar() {
    print("Meu carro")
}

func myCar(name: String) {
    print("Meu carro é: \(name)")
}

func myName(name first: String) {
    print("Meu nome é: \(first)")
}

func myAge( _ age: Int) {
    print("Minha idade é: \(age)")
}

//myCar(name: "Santana")
//myName(name: "Rafael")
//myAge(10)

/*
 função com retorno
 */

typealias FullName = String

func getName(name: String) -> FullName {
    name
}
//print(getName(name: "Rafael"))

func getPerson(name: String, lastName: String, age: Int) -> (String, String, Int) {
    return (name, lastName, age)
}

let person = getPerson(name: "Rafael", lastName: "Rocha dos Santos", age: 29)
//print(person.2)

struct Person {
    var name: String?
    var age: Int?
}

func makeBuy(value: Int, onCompletion: (Person) -> Void) {
    let person = Person(name: "Rafael", age: 29)
    onCompletion(person)
}

/*makeBuy(value: 40) { result in
    print("Resultado: \(result)")
}*/

/*typealias onCompletion = (Int, String, Bool) -> Void

func makeBuyProduct(onCompletion: onCompletion) {
    onCompletion(29, "Rafael", true)
}*/

typealias onCompletion = (String) -> Void

func makeBuyProduct(onCompletion: onCompletion) {
    onCompletion("Rafael")
}


/*makeBuyProduct { result, name, isValid in
    print("\(result) \(name) \(isValid)")
}*/

//makeBuyProduct{print($0)}
typealias onCompletionSuccess = (String) -> Void
typealias onCompletionError = (String) -> Void

func makeBuyProduct(isValid: Bool,
                    onCompletionSuccess: onCompletionSuccess,
                    onCompletionError: onCompletionError) {
    if isValid {
        onCompletionSuccess("Rafael")
    } else {
        onCompletionError("Error")
    }
}

makeBuyProduct(isValid: false) { success in
    print("Success: resposta: \(success)")
} onCompletionError: { error in
    print("Error: response: \(error)")
}

