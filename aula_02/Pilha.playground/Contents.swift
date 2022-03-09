import UIKit

var pilha: [String] = []

func insert(value: String) {
    pilha.append(value)
}

func remove() -> String {
    if !pilha.isEmpty {
        return pilha.remove(at: pilha.count - 1)
    } else {
        return "Pilha Vazia"
    }
}

insert(value: "Celta")
insert(value: "Santana")
insert(value: "Grand Siena")
print(pilha)

print(remove())
print(pilha)
