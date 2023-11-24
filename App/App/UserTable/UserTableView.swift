//
//  UserTableView.swift
//  App
//
//  Created by Иорданов Павел on 13.11.2023.
//

import UIKit

final class UserTableView: UIView{
    
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white 
        tableView.dataSource = tableManager
        return tableView
    }()
    
    
    
    // MARK -
    private lazy var tableManager = UserTableManager()
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .systemGray3
        addSubviews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(with viewModel: [User]){
        tableManager.tableData = viewModel
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
    
    private extension UserTableView {
        func addSubviews(){
            [tableView].forEach {
                self.addSubview($0)
            }
        }
        func makeConstraints() {
                [tableView].forEach {
                    $0.translatesAutoresizingMaskIntoConstraints = false
                
            }
            NSLayoutConstraint.activate([
                tableView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor),
                tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
                tableView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor),
                tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            ])
        }
}


