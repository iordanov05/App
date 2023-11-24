import Foundation


protocol UserServicing {
    func fetchUser(completionHandler: @escaping ([User]) -> Void)
}

final class UserService {
   var users: [User] = []
    let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    let session: URLSession = {
        let sessionConfiguration = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfiguration)
        return session
    }()
}



extension UserService: UserServicing{
    func fetchUser(completionHandler: @escaping ([User]) -> Void) {
        for _ in 1...30 {
            let url: URL = URL(string: "https://randomuser.me/api")!
            session.dataTask(with: url, completionHandler: { (data, response, error) in
                guard let data = data, error == nil else {
                    return
                }
                
                
                
                do {
                    let userData = try self.decoder.decode([User].self, from: data)
                    self.users.append( contentsOf: userData)
                    print("________userResponse.results__________")
                    print(userData)
                   // print(self.users)
                    print("_______self.users__________")
                    print(self.users)
                    print("_______self.users.end__________")
                    completionHandler(userData)
                } catch {
                    print(error)
                    print("FUCK")
                }
            }).resume()
        }
    }
    
}
