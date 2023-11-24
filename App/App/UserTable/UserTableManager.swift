//
//  UserTableManager.swift
//  App
//
//  Created by Иорданов Павел on 13.11.2023.
//

import Foundation
import UIKit

final class UserTableManager: NSObject {
    var tableData: [User]  = []
}
// MARK: old
extension UserTableManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = tableData[indexPath.row]
       // let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath)
        var cell =  UITableViewCell()
        var configuration = cell.defaultContentConfiguration()
        configuration.text = "\(user.name.title) \(user.name.first) \(user.name.last)"
        configuration.secondaryText = user.email
        
//        if let url = user.picture.large {
//            URLSession.shared.dataTask(with: url) { (data, response, error) in
//                guard let data = data, error == nil else {
//                    return
//                }
//
//                DispatchQueue.main.async {
//                    configuration.image = UIImage(data: data)
//                    cell.contentConfiguration = configuration
//                }
//
//            }.resume()
//        }
        return cell
    }
}

