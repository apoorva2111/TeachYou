//
//  LoginModel.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 01/12/20.
//  Copyright © 2020 KritiAgarwal. All rights reserved.
//

import Foundation

struct LoginModel : Codable {
    let status : Bool?
    let message : String?
    let user : User?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case message = "message"
        case user = "user"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        user = try values.decodeIfPresent(User.self, forKey: .user)
    }

}

struct User : Codable {
    let id : Int?
    let name : String?
    let user_password : String?
    let email : String?
    let image : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case user_password = "user_password"
        case email = "email"
        case image = "image"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        user_password = try values.decodeIfPresent(String.self, forKey: .user_password)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        image = try values.decodeIfPresent(String.self, forKey: .image)
    }

}
