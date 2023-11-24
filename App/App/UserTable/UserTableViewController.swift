import UIKit
import Foundation

final class UserTableViewController: UIViewController{
    private lazy var contentView: UserTableView = {
        let view = UserTableView()
        return view
    }()
    private let service: UserServicing
    
    
    
    
    init(service: UserServicing) {
        self.service = service
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = contentView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        service.fetchUser { users in
            DispatchQueue.main.async {
                self.contentView.configure(with: users)
            }
        }
    }
}



// MARK: OLD CODE
//import UIKit
//
//final class ViewController: UIViewController, UITableViewDataSource {
//    var users: [User] = [] // Create an array to store user data
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .systemGray3
//        view.addSubview(tableView)
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
//            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
//            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//        ])
//
//        tableView.dataSource = self
//
//        for _ in 1...100 {
//            let url: URL = URL(string: "https://randomuser.me/api")!
//            URLSession.shared.dataTask(with: url) { (data, response, error) in
//                guard let data = data, error == nil else {
//                    return
//                }
//
//                do {
//                    let decoder = JSONDecoder()
//                    let userResponse = try decoder.decode(UserResponse.self, from: data)
//                    self.users.append(contentsOf: userResponse.results) // Add the retrieved data to the array
//                    DispatchQueue.main.async {
//                        self.tableView.reloadData()
//                    }
//                } catch {
//                    print(error)
//                }
//            }.resume()
//        }
//    }
//
//    private lazy var tableView: UITableView = {
//        let tableView = UITableView()
//        tableView.backgroundColor = .black
//        return tableView
//    }()
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return users.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let user = users[indexPath.row]
//        var cell = UITableViewCell()
//        var configuration = cell.defaultContentConfiguration()
//
//        configuration.text = "\(user.name.title) \(user.name.first) \(user.name.last)"
//        configuration.secondaryText = user.email
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
//            }.resume()
//        }
//
//        return cell
//    }
//}
//
//struct UserResponse: Decodable {
//    let results: [User]
//}
//
//struct User: Decodable {
//    let name: Name
//    let email: String
//    let picture: Picture
//}
//
//struct Name: Decodable {
//    let title: String
//    let first: String
//    let last: String
//}
//
//struct Picture: Decodable {
//    let large: URL?
//    let medium: URL?
//    let thumbnail: URL?
//}
//
