//
//  baggss.swift
//  App
//
//  Created by Иорданов Павел on 13.11.2023.
//

import Foundation
import Foundation

protocol UserServicing {
    func fetchUser(completionHandler: @escaping ([User]) -> Void)
}

final class UserService: UserServicing {
    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    func fetchUser(completionHandler: @escaping ([User]) -> Void) {
        guard let url = URL(string: "https://randomuser.me/api") else {
            // Handle invalid URL
            completionHandler([])
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                // Handle network error
                completionHandler([])
                return
            }
            
            do {
                let userResponse = try self.decoder.decode(UserResponse.self, from: data)
                completionHandler(userResponse.results)
            } catch {
                // Handle decoding error
                print(error)
                completionHandler([])
            }
        }.resume()
    }
}
