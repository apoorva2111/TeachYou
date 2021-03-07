//
//  Reaction.swift
//  TeachYou
//
//  Created by Aarvy Technologies on 10/02/21.
//  Copyright © 2021 KritiAgarwal. All rights reserved.
//

import Foundation

struct Reaction : Codable {
    let c_id : Int?
    let q_id : Int?
    let user_id : Int?
    let rate : Int?
    let date_time : String?
    let user_name : String?
    let user_firstname : String?
    let user_lastname : String?
    let user_gender : String?
    let user_picture : String?
    let user_subscribed : Int?
    let user_verified: Int?
    

    enum CodingKeys: String, CodingKey {

        case q_id = "q_id"
        case c_id = "c_id"
        case user_id = "user_id"
        case rate = "rate"
        case date_time = "date_time"
        case user_name = "user_name"
        case user_firstname = "user_firstname"
        case user_lastname = "user_lastname"
        case user_gender = "user_gender"
        case user_picture = "user_picture"
        case user_subscribed = "user_subscribed"
        case user_verified  = "user_verified"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        q_id = try values.decodeIfPresent(Int.self, forKey: .q_id)
        c_id = try values.decodeIfPresent(Int.self, forKey: .c_id)
        user_id = try values.decodeIfPresent(Int.self, forKey: .user_id)
        rate = try values.decodeIfPresent(Int.self, forKey: .rate)
        date_time = try values.decodeIfPresent(String.self, forKey: .date_time)
        user_name = try values.decodeIfPresent(String.self, forKey: .user_name)
        user_firstname = try values.decodeIfPresent(String.self, forKey: .user_firstname)
        user_lastname = try values.decodeIfPresent(String.self, forKey: .user_lastname)
        user_gender = try values.decodeIfPresent(String.self, forKey: .user_gender)
        user_picture = try values.decodeIfPresent(String.self, forKey: .user_picture)
        user_subscribed = try values.decodeIfPresent(Int.self, forKey: .user_subscribed)
        user_verified = try values.decodeIfPresent(Int.self, forKey: .user_verified)
        
    }
}
