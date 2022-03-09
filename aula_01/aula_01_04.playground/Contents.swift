import UIKit

/*
 Coleção de dados - Array
 */

var cars = ["Fusca", "Ferrari", "Santana", "Celta", "Marea"]
var number = [1, 2, 3, 4]
//print(cars)

cars.append("Grand Siena")
//print(cars)
cars.insert("Audi A3", at: 0)
print(cars)
cars.removeLast()
//print(cars)
cars.remove(at: 1)
//print(cars)
cars.removeFirst()
print(cars)
