//
//  ViewController.swift
//  LifeCylce
//
//  Created by Idwall Go Dev 008 on 24/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    /*
     Sequencia de chamada: load -> viewDidLoad -> willAppear -> didAppear
     */
    
    //É um metodo que não deve ser chamado diretamente
    override func loadView() {
        super.loadView()
        
        print("loadView")
    }
    
    //Quando a tela ta toda carregada
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ViewDidLoad")
    }
    
    //é chamado toda vez que chama a view na tela
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("viewWillAppear")
    }
    
    
    //chamado toda vez que a view acaba de aparecer na tela - iniciar animação
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    //chamado para desfazer o que foi feito na viewDidAppear, exemplo - encerrar animação
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    
    //chamado toda vez que a acabar de sumir na tela
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
    
    @IBAction func getView() {
        performSegue(withIdentifier: "segueUserViewController", sender: nil)
    }
}

