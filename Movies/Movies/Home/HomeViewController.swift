//
//  HomeViewController.swift
//  Movies
//
//  Created by Nikolai Maksimov on 29.01.2024.
//

import UIKit

final class HomeViewController: UIViewController {
    
    // MARK: Private Properties
    private lazy var tableView = makeTableView()
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(tableView)
    }
}

// MARK: Private Methods
extension HomeViewController {
    
    private func commonInit() {
        
    }
    
    private func makeTableView() -> UITableView {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.frame = view.bounds
        tableView.dataSource = self
        return tableView
    }
}

// MARK: Table View Data Source
extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = "test"
        cell.contentConfiguration = content
        return cell
    }
}
