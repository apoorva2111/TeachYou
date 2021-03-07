/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Events : Codable {
	let event_id : Int?
	let event_privacy : String?
	let event_admin : Int?
	let event_category : Int?
	let event_title : String?
	let event_location : String?
	let event_description : String?
	let event_start_date : String?
	let event_end_date : String?
	let event_cover : String?
	let event_cover_id : Int?
	let event_cover_position : String?
	let event_album_covers : Int?
	let event_album_timeline : String?
	let event_pinned_post : String?
	let event_invited : Int?
	var event_interested : Int?
	var event_going : Int?
	let event_date : String?
	let event_picture : String?
	let i_joined : I_joined?

	enum CodingKeys: String, CodingKey {

		case event_id = "event_id"
		case event_privacy = "event_privacy"
		case event_admin = "event_admin"
		case event_category = "event_category"
		case event_title = "event_title"
		case event_location = "event_location"
		case event_description = "event_description"
		case event_start_date = "event_start_date"
		case event_end_date = "event_end_date"
		case event_cover = "event_cover"
		case event_cover_id = "event_cover_id"
		case event_cover_position = "event_cover_position"
		case event_album_covers = "event_album_covers"
		case event_album_timeline = "event_album_timeline"
		case event_pinned_post = "event_pinned_post"
		case event_invited = "event_invited"
		case event_interested = "event_interested"
		case event_going = "event_going"
		case event_date = "event_date"
		case event_picture = "event_picture"
		case i_joined = "i_joined"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		event_id = try values.decodeIfPresent(Int.self, forKey: .event_id)
		event_privacy = try values.decodeIfPresent(String.self, forKey: .event_privacy)
		event_admin = try values.decodeIfPresent(Int.self, forKey: .event_admin)
		event_category = try values.decodeIfPresent(Int.self, forKey: .event_category)
		event_title = try values.decodeIfPresent(String.self, forKey: .event_title)
		event_location = try values.decodeIfPresent(String.self, forKey: .event_location)
		event_description = try values.decodeIfPresent(String.self, forKey: .event_description)
		event_start_date = try values.decodeIfPresent(String.self, forKey: .event_start_date)
		event_end_date = try values.decodeIfPresent(String.self, forKey: .event_end_date)
		event_cover = try values.decodeIfPresent(String.self, forKey: .event_cover)
		event_cover_id = try values.decodeIfPresent(Int.self, forKey: .event_cover_id)
		event_cover_position = try values.decodeIfPresent(String.self, forKey: .event_cover_position)
		event_album_covers = try values.decodeIfPresent(Int.self, forKey: .event_album_covers)
		event_album_timeline = try values.decodeIfPresent(String.self, forKey: .event_album_timeline)
		event_pinned_post = try values.decodeIfPresent(String.self, forKey: .event_pinned_post)
		event_invited = try values.decodeIfPresent(Int.self, forKey: .event_invited)
		event_interested = try values.decodeIfPresent(Int.self, forKey: .event_interested)
		event_going = try values.decodeIfPresent(Int.self, forKey: .event_going)
		event_date = try values.decodeIfPresent(String.self, forKey: .event_date)
		event_picture = try values.decodeIfPresent(String.self, forKey: .event_picture)
		i_joined = try values.decodeIfPresent(I_joined.self, forKey: .i_joined)
	}

}
