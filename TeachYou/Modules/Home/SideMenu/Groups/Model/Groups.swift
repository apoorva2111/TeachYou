/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Groups : Codable {
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
    let i_joined : Bool?

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
        case i_joined = "i_joined"
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
        i_joined = try values.decodeIfPresent(Bool.self, forKey: .i_joined)
    }

}
