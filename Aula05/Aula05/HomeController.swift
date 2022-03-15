//
//  ViewController.swift
//  Aula05
//
//  Created by Idwall Go Dev 008 on 11/03/22.
//

import UIKit

class HomeController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Properties IBOutlet

    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var authenticatorButton: UIButton!
    
    // MARK: - Properties Publics
    
    // MARK: - Properties Privates
    
    // MARK: - Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        delegates()
    }
    
    // MARK: - Methods Privates
    private func delegates() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
     // MARK: - Methods Action Button
    @IBAction func authenticate(_ sender: UIButton) {
        if let email = emailTextField,
        let password = passwordTextField {
                print("E-mail: \(email) e senha: \(password)")
        }
        
        let alert = UIAlertController(title: "Login", message: "Login Realizado com sucesso", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Confirmar", style: .default, handler: { action in
            print("Cliquei no confirmar")
        }))
        
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: { cancel in
            print("Cliquei no cancelar")
        }))
        
        alert.addAction(UIAlertAction(title: "Destrutivo", style: .destructive, handler: { destructive in
            print("Cliquei no destrutivo")
        }))
        
        present(alert, animated: true, completion: nil)
        
        /*if let email = emailTextField.text {
            print("O e-mail é: \(email)")
        }
        if let password = passwordTextField.text {
            print("senha: \(password)")
        }*/
        
//        let myColor: UIColor = UIColor.red
//        emailTextField.layer.borderColor = myColor.cgColor
//        emailTextField.layer.borderWidth = 1.0
//        emailTextField.layer.cornerRadius = 8.0
        
        //Tela de login, validando email e senha. Colocando o alerta de sucesso e erro
       
    }
    
}

extension HomeController: UITextViewDelegate {
    /*
     Chamado quando o usuário clica ou preciona no botão de return
     */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
