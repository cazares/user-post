//
//  User.swift
//  UserPost
//
//  Created by Miguel Cazares on 1/11/18.
//  Copyright © 2018 Miguel Cazares. All rights reserved.
//

import UIKit

struct User: Decodable {
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
    
    init(id: Int, name: String, username: String, email: String, address: Address, phone: String, website: String, company: Company) {
        self.id = id
        self.name = name
        self.username = name
        self.email = email
        
        self.address = address
        self.phone = phone
        self.website = website
        self.company = company
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: UserKeys.self)
        
        let id: Int = try container.decode(Int.self, forKey: .id)
        let name: String = try container.decode(String.self, forKey: .name)
        let username: String = try container.decode(String.self, forKey: .username)
        let email: String = try container.decode(String.self, forKey: .email)
        
        let address: Address = try container.decode(Address.self, forKey: .address)
        let phone: String = try container.decode(String.self, forKey: .phone)
        let website: String = try container.decode(String.self, forKey: .website)
        let company: Company = try container.decode(Company.self, forKey: .company)
        
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


