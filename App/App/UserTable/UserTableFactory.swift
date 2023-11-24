//
//  UserTableFactory.swift
//  App
//
//  Created by Иорданов Павел on 13.11.2023.
//

import Foundation
final class UserTableFactory{
    func build() -> UserTableViewController{
        let service = UserService()
        let viewController = UserTableViewController(service: service)
        return viewController
    }
    
}
