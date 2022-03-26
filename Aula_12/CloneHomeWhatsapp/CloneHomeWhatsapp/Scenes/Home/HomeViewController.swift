//
//  ViewController.swift
//  CloneHomeWhatsapp
//
//  Created by Idwall Go Dev 008 on 25/03/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    lazy private var chatsTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    lazy var talks = [Talk]() {
        didSet {
            DispatchQueue.main.async {
                self.chatsTableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configHome()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let appearence = UINavigationBarAppearance()
        appearence.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.00)
        
        navigationController?.navigationBar.scrollEdgeAppearance = appearence
        
        
        let editIconButton = UIBarButtonItem(image: UIImage.init(systemName: "square.and.pencil"), style: .plain, target: self, action: #selector(popupInfo))
        navigationItem.rightBarButtonItems = [editIconButton]
        let editButton = UIBarButtonItem(title: "Editar", style: .plain, target: self, action: nil)
        navigationItem.leftBarButtonItem = editButton
    }
    
    @objc private func popupInfo() {
        let inforEditViewController = InforEditViewController()
        navigationController?.present(inforEditViewController, animated: true)
    }
    
    private func configHome() {
        title = "Chats"
        view.backgroundColor = .systemBackground
        
        view.addSubview(chatsTableView)
        
        chatsTableView.delegate = self
        chatsTableView.dataSource = self
        
        constraintsView()
        getTalks()
        
        chatsTableView.register(ChatTableViewCell.self, forCellReuseIdentifier: ChatTableViewCell.identifier)
    }
    
    private func getTalks() {
        Service.shared.getChat { result in
            switch result {
            case .success(let response):
                self.talks = response
                //print(response)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    private func constraintsView() {
        NSLayoutConstraint.activate([
            chatsTableView.topAnchor.constraint(equalTo: view.topAnchor),
            chatsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            chatsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            chatsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return talks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatTableViewCell.identifier, for: indexPath) as? ChatTableViewCell else { return UITableViewCell() }
        let talk = talks[indexPath.row]
        cell.updateDataTalk(talks: talk)
        return cell
    }
    
    
}

