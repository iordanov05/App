//
//  Users.swift
//  App
//
//  Created by Иорданов Павел on 13.11.2023.
//

import Foundation
struct UserResponse: Decodable {
    let results: [User]
}
struct User: Decodable {
    let name: Name
    let email: String
    let picture: Picture
}

struct Name: Decodable {
    let title: String
    let first: String
    let last: String
}

struct Picture: Decodable {
    let large: URL?
    let medium: URL?
    let thumbnail: URL?
}
//import Foundation
//
//struct UserResponse: Decodable {
//    let results: [User]
//    let info: UserInfo
//}
//
//struct UserInfo: Decodable {
//    let seed: String
//    let results: Int
//    let page: Int
//    let version: String
//}
//
//struct User: Decodable {
//    let gender: String
//    let name: UserName
//    let location: UserLocation
//    let email: String
//    let login: UserLogin
//    let dob: UserDOB
//    let registered: UserRegistered
//    let phone: String
//    let cell: String
//    let id: UserID
//    let picture: UserPicture
//    let nat: String
//}
//
//struct UserName: Decodable {
//    let title: String
//    let first: String
//    let last: String
//}
//
//struct UserLocation: Decodable {
//    let street: UserStreet
//    let city: String
//    let state: String
//    let country: String
//    let postcode: Int
//    let coordinates: UserCoordinates
//    let timezone: UserTimezone
//}
//
//struct UserStreet: Decodable {
//    let number: Int
//    let name: String
//}
//
//struct UserCoordinates: Decodable {
//    let latitude: String
//    let longitude: String
//}
//
//struct UserTimezone: Decodable {
//    let offset: String
//    let description: String
//}
//
//struct UserLogin: Decodable {
//    let uuid: String
//    let username: String
//    let password: String
//    let salt: String
//    let md5: String
//    let sha1: String
//    let sha256: String
//}
//
//struct UserDOB: Decodable {
//    let date: String
//    let age: Int
//}
//
//struct UserRegistered: Decodable {
//    let date: String
//    let age: Int
//}
//
//struct UserID: Decodable {
//    let name: String
//    let value: String
//}
//
//struct UserPicture: Decodable {
//    let large: URL
//    let medium: URL
//    let thumbnail: URL
//}
//
