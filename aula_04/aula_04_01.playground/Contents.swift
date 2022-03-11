import UIKit

//classe e struct, porem muito similares, para definir, trablaha com atributo e metodos
//struct não é necessário criar o construtor e também não consegue hedar coisas
//não é possivel estanciar uma class com uma struct como herança

//class Person {
//    var name: String
//    var lastName: String
//    var age: Int
//
//    init(name: String, lastName: String, age: Int) {
//        self.name = name
//        self.lastName = lastName
//        self.age = age
//    }
//
//    func welcome() {
//        print("Seja bem vindo, \(name) \(lastName)")
//    }
//}
//
//var person1 = Person(name: "Rafael", lastName: "Rocha dos Santos", age: 29)
//var person2 = person1
//person1.name = "Rodrigo"
//
//print(person1.name)//aqui mesmo alterando esta apontando para o mesmo endereção na memoria, como mostra no print
//print(person2.name)
//
//print(person1.welcome())


//struct Person {
//    var name: String
//    var lastName: String
//    var age: Int
//
//    func welcome() {
//        print("Seja bem vindo, \(name) \(lastName)")
//    }
//}
//
//var person1 = Person(name: "Rafael", lastName: "Rocha dos Santos", age: 29)
//var person2 = person1
//
//person1.name = "Rodrigo"
//print(person1.name)// Struct faz copia as variáveis, mas não o mesmo endereço de mémoria
//print(person2.name)
//
//print(person1.welcome())
//
class CustomButton: UIButton {

}

let button: CustomButton = CustomButton(type: .close)

class Animal {
    func comer() {
        
    }
}

class Dog: Animal {
    override func comer() {
        
    }
}
