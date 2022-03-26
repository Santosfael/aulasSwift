//
//  ViewController.swift
//  ViewCodeTableView
//
//  Created by Idwall Go Dev 008 on 24/03/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var safeArea: UILayoutGuide!
    
    lazy var tableview: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    //Esta relacionado ao ciclo de vida
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
        let appearence = UINavigationBarAppearance()
        appearence.backgroundColor = .purple
        appearence.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearence.largeTitleTextAttributes =  [.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = appearence
        navigationController?.navigationBar.compactAppearance = appearence
        navigationController?.navigationBar.scrollEdgeAppearance = appearence
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Voltar", style: .plain, target: nil, action: nil)
        let addButton = UIBarButtonItem(image: UIImage.init(systemName: "dpad.down.filled"), style: .plain, target: self, action: #selector(callSecoundView))
        navigationItem.rightBarButtonItems = [addButton]
    }
    
    @IBAction func callSecoundView() {
        let secoundViewController = SecoundViewController()
        secoundViewController.idProduct = "Teste id"
        navigationController?.present(secoundViewController, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        view.backgroundColor = .systemBackground
        
        view.addSubview(tableview)
        
        tableview.delegate = self
        tableview.dataSource = self
        
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: view.topAnchor),
            tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        tableview.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.indentifier)
    }


}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let thirdViewController = ThirdViewController()
        if let _ = navigationController {
            navigationController?.pushViewController(thirdViewController, animated: true)
        } else {
            present(thirdViewController, animated: true)
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.indentifier, for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        //cell.textLabel?.text = "Rafael"
        return cell
    }
    
    
}

