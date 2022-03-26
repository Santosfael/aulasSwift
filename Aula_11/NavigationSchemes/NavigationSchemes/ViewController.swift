//
//  ViewController.swift
//  NavigationSchemes
//
//  Created by Idwall Go Dev 008 on 22/03/22.
//

import UIKit
import MessageUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "App 2"
        view.backgroundColor = .lightGray
    }
    
    @IBAction func getFacebook() {
        let schemes = "fb://"
        if let url = URL(string: schemes) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            } else {
                print("Erro ao abrir")
            }
        }
    }
    
    @IBAction func getWhatsApp() {
        let schemes = "whatsapp://"
        if let url = URL(string: schemes) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            } else {
                print("Erro ao abrir")
            }
        }
    }
    
    @IBAction func getNumberPhone() {
        let schemes = "tel://+55(34)992269887"
        if let url = URL(string: schemes) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            } else {
                print("Erro ao abrir")
            }
        }
    }
    
    @IBAction func getSMS() {
        let schemes = "sms://+55(34)992269887"
        if let url = URL(string: schemes) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            } else {
                print("Erro ao abrir")
            }
        }
    }
    
    @IBAction func getEmailGmail() {
        let recipentEmail = "rafaelsantoscv_@hotmail.com"
        let subject = "Test para envio de e-mail"
        let body = "Teste Teste envio"
        createEmail(to: recipentEmail, subject: subject, body: body)
    }
    
    private func createEmail(to: String, subject: String, body: String) {
        var schemes = ""
        if let subjectEncoded = subject.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
           let bodyEncoded = body.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            schemes = "googlegmail://co?to\(to)&subject=\(subjectEncoded)&body=\(bodyEncoded)"
        }
        
        if let url = URL(string: schemes) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            } else {
                print("error")
            }
        }
        
        
    }
    
    @IBAction func getEmail() {
        let recipentEmail = "rafaelsantoscv_@hotmail.com"
        let subject = "Test para envio de e-mail"
        let body = "Teste Teste envio"
        
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setCcRecipients([recipentEmail])
            mail.setSubject(subject)
            mail.setMessageBody(body, isHTML: false)
            
            present(mail, animated: true)
        } else {
            print("Error")
        }
    }

}

extension ViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        switch result {
        case .cancelled:
            print("cancelado")
        case .saved:
            print("salvo")
        case .sent:
            print("enviado")
        case .failed:
            print("não enviado")
        @unknown default:
            print("Default")
        }
    }
}

