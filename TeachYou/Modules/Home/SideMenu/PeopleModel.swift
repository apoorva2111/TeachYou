//
//  PeopleModel.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 13/01/21.
//  Copyright © 2021 KritiAgarwal. All rights reserved.
//

import Foundation

struct PeopleModel : Codable {
    let all_data : [PeopleDataModel]?

    enum CodingKeys: String, CodingKey {
        case all_data = "all_data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        all_data = try values.decodeIfPresent([PeopleDataModel].self, forKey: .all_data)
    }

}


struct PeopleDataModel: Codable {
    let user_id : Int?
    let user_name : String?
    let user_firstname : String?
    let user_lastname : String?
    let user_gender : String?
    let user_picture : String?
    let user_subscribed : Int?
    let user_verified : Int?
    let connection : String?
    let distance : Double?
    let is_online : Int?
    let mutual_friends_count : Int?
    
    enum CodingKeys: String, CodingKey {
        
        case user_id = "user_id"
        case user_name = "user_name"
        case user_firstname = "user_firstname"
        case user_lastname = "user_lastname"
        case user_gender = "user_gender"
        case user_picture = "user_picture"
        case user_subscribed = "user_subscribed"
        case user_verified = "user_verified"
        case connection = "connection"
        case distance = "distance"
        case is_online = "is_online"
        case mutual_friends_count = "mutual_friends_count"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        user_id = try values.decodeIfPresent(Int.self, forKey: .user_id)
        user_name = try values.decodeIfPresent(String.self, forKey: .user_name)
        user_firstname = try values.decodeIfPresent(String.self, forKey: .user_firstname)
        user_lastname = try values.decodeIfPresent(String.self, forKey: .user_lastname)
        user_gender = try values.decodeIfPresent(String.self, forKey: .user_gender)
        user_picture = try values.decodeIfPresent(String.self, forKey: .user_picture)
        user_subscribed = try values.decodeIfPresent(Int.self, forKey: .user_subscribed)
        user_verified = try values.decodeIfPresent(Int.self, forKey: .user_verified)
        connection = try values.decodeIfPresent(String.self, forKey: .connection)
        distance = try values.decodeIfPresent(Double.self, forKey: .distance)
        is_online = try values.decodeIfPresent(Int.self, forKey: .is_online)
        mutual_friends_count = try values.decodeIfPresent(Int.self, forKey: .mutual_friends_count)
    }
}
