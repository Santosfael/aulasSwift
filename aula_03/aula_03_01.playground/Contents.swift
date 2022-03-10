import UIKit

let notaMedia = 6

/*switch notaMedia {
case 5:
    print("Você está abaixo da média")
case 6:
    print("Você está na média")
case 10:
    print("Parabéns, você tirou a nota máxima")
default:
    print("Você não informou sua nota")
}

switch notaMedia {
case 0:
    print("Você precisa estudar")
case 1...5:
    print("Você está abaixo da média")
case 6...9:
    print("Você está acima da média")
default:
    print("Você não informou a nota")
}*/
/*
 Enumerador é definido como um tipo comum enumerado
 */

/*enum Aluno {
    case Joao
    case Pedro
    case Maria
}

let aluno = Aluno.Joao
print(aluno)

switch aluno {
    case .Joao:
        print("Nota 6")
    case .Pedro:
        print("Nota 8")
    case .Maria:
        print("Nota 10")
}

enum State {
    case Success
    case Error
    case Loading
}

let state = State.Loading

switch state {
case .Success:
    print("Sucesso")
case .Error:
    print("Error")
case .Loading:
    print("Carregando")
}*/

//Enum de forma tipada
enum State: String {
    case Success = "Efetuado com sucesso"
    case Failure = "Falha, tente novamente"
}

enum Strings: String {
    case titleButton = "Comprar"
    case titleLabel = "O texto referente"
}

//print(State.Failure.rawValue)

//Por conta de ser um valor inteiro e também já foi atribuido no primeiro case, desse modo os demais já entendem os seus respectivos valores, exemplo: Two = 2
enum Page: Int {
    //Atribuição implicita
    case One = 1, Two, Tree, Four
    
    func getPage() -> Int {
        return self.rawValue
    }
}

var numberPage = Page.Four
//print(numberPage.getPage())

//Valores enumerado
enum BankDesposit {
    case inValue(Int)
    case inCheck(Bool)
}

func makeDeposit(values: BankDesposit) {
    switch values {
    case .inValue(let value):
        print("O valor passado é: \(value)")
    case .inCheck(let isCheck):
        print("In check: \(isCheck)")
    }
}

let deposit = BankDesposit.inValue(400)
makeDeposit(values: deposit)
