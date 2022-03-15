//
//  ViewController.swift
//  Aula_06_02
//
//  Created by Idwall Go Dev 008 on 14/03/22.
//

import UIKit

struct Times {
    var logo: String
    var name: String
    var description: String
    var isValid: Bool
}

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var times: [Times] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Times"
        delegate()
        TimesData()
    }

    private func delegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func TimesData() {
        times = [Times(logo: "keyboard", name: "Atletico Mineiro", description: " é um texto modelo da indústria tipográfica e de impressão. O Lorem Ipsum tem vindo a ser o texto padrão usado por estas indústrias desde o ano de 1500, quando uma misturou os caracteres de um texto para criar um espécime de livro", isValid: true), Times(logo: "keyboard", name: "Palmeiras", description: " é um texto modelo da indústria tipográfica e de impressão. O Lorem Ipsum tem vindo a ser o texto padrão usado por estas indústrias desde o ano de 1500, quando uma misturou os caracteres de um texto para criar um espécime de livro", isValid: false),Times(logo: "keyboard", name: "Flamengo", description: " é um texto modelo da indústria tipográfica e de impressão. O Lorem Ipsum tem vindo a ser o texto padrão usado por estas indústrias desde o ano de 1500, quando uma misturou os caracteres de um texto para criar um espécime de livro", isValid: true),Times(logo: "keyboard", name: "Vasco", description: " é um texto modelo da indústria tipográfica e de impressão. O Lorem Ipsum tem vindo a ser o texto padrão usado por estas indústrias desde o ano de 1500, quando uma misturou os caracteres de um texto para criar um espécime de livro", isValid: true)]
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Eu cliquei np time: \(times[indexPath.row].name)")
        
        if times[indexPath.row].isValid {
            print("Tem mundial")
        }
        
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return times.count
    }
        
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        
        let time = times[indexPath.row]
        
        cell.setup(logo: time.logo, name: time.name, description: time.description)
        return cell
    }
    
}
