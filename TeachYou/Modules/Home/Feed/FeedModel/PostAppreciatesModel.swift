//
//  PostAppreciatesModel.swift
//  TeachYou
//
//  Created by Apoorva Gangrade on 08/02/21.
//  Copyright © 2021 KritiAgarwal. All rights reserved.
//

import Foundation
import SwiftyJSON

struct PostAppreciatesModel : Codable {
    let status : Bool?
    let message : String?
    let appreciates : [PostAppreciates]?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case message = "message"
        case appreciates = "appreciates"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        appreciates = try values.decodeIfPresent([PostAppreciates].self, forKey: .appreciates)
    }
}
