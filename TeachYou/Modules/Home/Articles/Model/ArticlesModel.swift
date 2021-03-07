//
//  ArticlesModel.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 16/12/20.
//  Copyright © 2020 KritiAgarwal. All rights reserved.
//

import Foundation
import SwiftyJSON


struct ArticlesModel : Codable {
    let status : Bool?
    let message : String?
    let details : [ArticlesDetails]?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case message = "message"
        case details = "details"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        details = try values.decodeIfPresent([ArticlesDetails].self, forKey: .details)
    }

}
