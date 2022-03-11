import UIKit

//
protocol SomeProtocol {
    
}

protocol reformarCampo {
    func plantarNovaGrama()
    func pintarNovasLinhas()
}

class EmpresaA: reformarCampo {
    func plantarNovaGrama() {
        //func contratarVariosFuncionarios()
        //func fazerOsFuncionariosPlantaremGrama()
    }
    
    func pintarNovasLinhas() {
        //func contratarVariosFuncionarios()
        //func fazerOsFuncionariosPintaremAsLinhas()
    }
      
}

class EmpresaB: reformarCampo {
    func plantarNovaGrama() {
        //func comprarMaquinas()
        //func usarMaquinasParaPlantarGrama()
    }
    
    func pintarNovasLinhas() {
        //func comprarMaquinas()
        //func usarMaquinaParaPintarLinhas()
    }
    
    
}
