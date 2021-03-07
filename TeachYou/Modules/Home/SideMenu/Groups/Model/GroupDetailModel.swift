//
//  GroupDetailModel.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 29/12/20.
//  Copyright © 2020 KritiAgarwal. All rights reserved.
//

import Foundation

struct GroupDetailModel : Codable {
    let status : Bool?
    let message : String?
    let group : GroupDetails?
    let posts : [Posts]?
    
    enum CodingKeys: String, CodingKey {
        
        case status = "status"
        case message = "message"
        case group = "group"
        case posts = "posts"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        group = try values.decodeIfPresent(GroupDetails.self, forKey: .group)
        posts = try values.decodeIfPresent([Posts].self, forKey: .posts)
    }
}
