import UIKit

/*
 Optional -> ele atua como container para um valor de tipo expecífico	o container contém o valor que pode vir ou não
 */

//Ao colocar o símbolo de exclamação o mesmo já identifica que é uma variável opcional
var message: String?
message = "Minha messagem"
/*
 Ao fazer deste modo você está definido que a variável message tem como padrão a string default, caso a mesmo esteja fazia
 É uma boa pratica usar valores default para resolver essas tratativas
 */
//print(message ?? "Default")

/*
 é um if que cria uma constante do retorno, ou seja, da sua variável que foi estanciada como default, nesse caso já está sendo tratada automaticamente
 Ainda nesse escopo ainda tá como valor nulo
 A constante message pode ter o mesmo nome da variável, essa constante está sendo criada e inserida dentro do contexto, que nesse caso é a variável message
 */
if let message = message {
    print(message)
}

/*
 Abaixo está a representação de como seria o escopo sem o if let
 */
if message != nil {
    print(message)
} else {
    print("Estou null")
}
