//
//  ViewController.swift
//  AppNetworking
//
//  Created by Idwall Go Dev 008 on 18/03/22.
//

import UIKit

class ViewController: UIViewController {
    //Protocol é as interfaces do TS
    //clojures é o callback func do TS
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var loading: UIActivityIndicatorView!
    //lazy(preguiçoso) - Cuja o valor dela não é calculado até a vez dela não é calculado
    lazy var users = [User]() {
        didSet {
            //o Dispatch é pq todo update de UI(interface) dever ser chamado na main thread
            DispatchQueue.main.async {
                //Como se tivesse em outra thread
                self.tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        delegates()
        getUsers()
        showLoading()
        // Do any additional setup after loading the view.
    }
    
    private func delegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }

    private func getUsers() {
        Service.shared.getUsers { result in
            switch result {
            case .success(let response):
                self.users = response
            case .failure(let error):
                print(error)
            }
            
            self.hideLoading()
        }
    }
    
    private func showLoading() {
        loading.startAnimating()
        loading.isHidden = false
    }
    
    private func hideLoading() {
        DispatchQueue.main.async {
            self.loading.stopAnimating()
            self.loading.isHidden = true
        }
    }
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let user = users[indexPath.row]
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = user.email
        
        return cell
    }
    
    
}

