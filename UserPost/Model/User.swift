//
//  User.swift
//  UserPost
//
//  Created by Miguel Cazares on 1/11/18.
//  Copyright © 2018 Miguel Cazares. All rights reserved.
//

import UIKit

struct User: Codable {
    let id: Int
    let name: String
    let username: String
    let email: String
    
    let address: Address
    let phone: String
    let website: String
    let company: Company
    
    enum UserKeys: String, CodingKey {
        case id, name, username, email, address, phone, website, company
    }
}

extension User {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: UserKeys.self)
        
        let id = try container.decode(Int.self, forKey: .id)
        let name = try container.decode(String.self, forKey: .name)
        let username = try container.decode(String.self, forKey: .username)
        let email = try container.decode(String.self, forKey: .email)
        
        let address = try container.decode(Address.self, forKey: .address)
        let phone = try container.decode(String.self, forKey: .phone)
        let website = try container.decode(String.self, forKey: .website)
        let company = try container.decode(Company.self, forKey: .company)
        
        self.init(id: id, name: name, username: username, email: email, address: address, phone: phone, website: website, company: company)
    }
    
    var description: String {
        return """
            Username: \(username)
            Email: \(email)
            Address
            \(address.description)
            Phone: \(phone)
            Website: \(website)
            Company
            \(company.description)
        """
    }
}


