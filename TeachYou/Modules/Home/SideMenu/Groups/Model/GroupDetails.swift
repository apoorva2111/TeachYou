//
//  GroupDetails.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 29/12/20.
//  Copyright © 2020 KritiAgarwal. All rights reserved.
//

import Foundation

struct GroupDetails : Codable {
    let group_id : Int?
    let group_privacy : String?
    let group_admin : Int?
    let group_category : Int?
    let group_name : String?
    let group_title : String?
    let group_description : String?
    let group_picture : String?
    let group_picture_id : Int?
    let group_cover : String?
    let group_cover_id : String?
    let group_cover_position : String?
    let group_album_pictures : Int?
    let group_album_covers : String?
    let group_album_timeline : String?
    let group_pinned_post : String?
    let group_members : Int?
    let group_date : String?
    let group_picture_full : String?
    let group_cover_full : String?
    let group_category_name : String?
    let group_picture_default : Bool?
    let i_admin : Bool?
    let i_joined : Bool?
    var photos : [String]?

    enum CodingKeys: String, CodingKey {

        case group_id = "group_id"
        case group_privacy = "group_privacy"
        case group_admin = "group_admin"
        case group_category = "group_category"
        case group_name = "group_name"
        case group_title = "group_title"
        case group_description = "group_description"
        case group_picture = "group_picture"
        case group_picture_id = "group_picture_id"
        case group_cover = "group_cover"
        case group_cover_id = "group_cover_id"
        case group_cover_position = "group_cover_position"
        case group_album_pictures = "group_album_pictures"
        case group_album_covers = "group_album_covers"
        case group_album_timeline = "group_album_timeline"
        case group_pinned_post = "group_pinned_post"
        case group_members = "group_members"
        case group_date = "group_date"
        case group_picture_full = "group_picture_full"
        case group_cover_full = "group_cover_full"
        case group_category_name = "group_category_name"
        case group_picture_default = "group_picture_default"
        case i_admin = "i_admin"
        case i_joined = "i_joined"
        case photos = "photos"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        group_id = try values.decodeIfPresent(Int.self, forKey: .group_id)
        group_privacy = try values.decodeIfPresent(String.self, forKey: .group_privacy)
        group_admin = try values.decodeIfPresent(Int.self, forKey: .group_admin)
        group_category = try values.decodeIfPresent(Int.self, forKey: .group_category)
        group_name = try values.decodeIfPresent(String.self, forKey: .group_name)
        group_title = try values.decodeIfPresent(String.self, forKey: .group_title)
        group_description = try values.decodeIfPresent(String.self, forKey: .group_description)
        group_picture = try values.decodeIfPresent(String.self, forKey: .group_picture)
        group_picture_id = try values.decodeIfPresent(Int.self, forKey: .group_picture_id)
        group_cover = try values.decodeIfPresent(String.self, forKey: .group_cover)
        group_cover_id = try values.decodeIfPresent(String.self, forKey: .group_cover_id)
        group_cover_position = try values.decodeIfPresent(String.self, forKey: .group_cover_position)
        group_album_pictures = try values.decodeIfPresent(Int.self, forKey: .group_album_pictures)
        group_album_covers = try values.decodeIfPresent(String.self, forKey: .group_album_covers)
        group_album_timeline = try values.decodeIfPresent(String.self, forKey: .group_album_timeline)
        group_pinned_post = try values.decodeIfPresent(String.self, forKey: .group_pinned_post)
        group_members = try values.decodeIfPresent(Int.self, forKey: .group_members)
        group_date = try values.decodeIfPresent(String.self, forKey: .group_date)
        group_picture_full = try values.decodeIfPresent(String.self, forKey: .group_picture_full)
        group_cover_full = try values.decodeIfPresent(String.self, forKey: .group_cover_full)
        group_category_name = try values.decodeIfPresent(String.self, forKey: .group_category_name)
        group_picture_default = try values.decodeIfPresent(Bool.self, forKey: .group_picture_default)
        i_admin = try values.decodeIfPresent(Bool.self, forKey: .i_admin)
        i_joined = try values.decodeIfPresent(Bool.self, forKey: .i_joined)
        photos = try values.decodeIfPresent([String].self, forKey: .photos)
    }

}
