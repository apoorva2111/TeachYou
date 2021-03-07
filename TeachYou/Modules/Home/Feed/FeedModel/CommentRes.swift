/* 
Copyright (c) 2021 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct CommentRes : Codable {
	let node_id : Int?
	let node_type : String?
	let text : String?
	let image : String?
	let time : String?
	let reaction_like_count : Int?
	let reaction_love_count : Int?
	let reaction_haha_count : Int?
	let reaction_yay_count : Int?
	let reaction_wow_count : Int?
	let reaction_sad_count : Int?
	let reaction_angry_count : Int?
	let reactions_total_count : Int?
	let replies : Int?
	let user_id : Int?
	let user_type : String?
	let author_picture : String?
	let author_url : String?
	let author_user_name : String?
	let author_name : String?
	let author_verified : Int?
	let comment_id : Int?
	let text_plain : String?
	let edit_comment : Bool?
	let delete_comment : Bool?

	enum CodingKeys: String, CodingKey {

		case node_id = "node_id"
		case node_type = "node_type"
		case text = "text"
		case image = "image"
		case time = "time"
		case reaction_like_count = "reaction_like_count"
		case reaction_love_count = "reaction_love_count"
		case reaction_haha_count = "reaction_haha_count"
		case reaction_yay_count = "reaction_yay_count"
		case reaction_wow_count = "reaction_wow_count"
		case reaction_sad_count = "reaction_sad_count"
		case reaction_angry_count = "reaction_angry_count"
		case reactions_total_count = "reactions_total_count"
		case replies = "replies"
		case user_id = "user_id"
		case user_type = "user_type"
		case author_picture = "author_picture"
		case author_url = "author_url"
		case author_user_name = "author_user_name"
		case author_name = "author_name"
		case author_verified = "author_verified"
		case comment_id = "comment_id"
		case text_plain = "text_plain"
		case edit_comment = "edit_comment"
		case delete_comment = "delete_comment"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		node_id = try values.decodeIfPresent(Int.self, forKey: .node_id)
		node_type = try values.decodeIfPresent(String.self, forKey: .node_type)
		text = try values.decodeIfPresent(String.self, forKey: .text)
		image = try values.decodeIfPresent(String.self, forKey: .image)
		time = try values.decodeIfPresent(String.self, forKey: .time)
		reaction_like_count = try values.decodeIfPresent(Int.self, forKey: .reaction_like_count)
		reaction_love_count = try values.decodeIfPresent(Int.self, forKey: .reaction_love_count)
		reaction_haha_count = try values.decodeIfPresent(Int.self, forKey: .reaction_haha_count)
		reaction_yay_count = try values.decodeIfPresent(Int.self, forKey: .reaction_yay_count)
		reaction_wow_count = try values.decodeIfPresent(Int.self, forKey: .reaction_wow_count)
		reaction_sad_count = try values.decodeIfPresent(Int.self, forKey: .reaction_sad_count)
		reaction_angry_count = try values.decodeIfPresent(Int.self, forKey: .reaction_angry_count)
		reactions_total_count = try values.decodeIfPresent(Int.self, forKey: .reactions_total_count)
		replies = try values.decodeIfPresent(Int.self, forKey: .replies)
		user_id = try values.decodeIfPresent(Int.self, forKey: .user_id)
		user_type = try values.decodeIfPresent(String.self, forKey: .user_type)
		author_picture = try values.decodeIfPresent(String.self, forKey: .author_picture)
		author_url = try values.decodeIfPresent(String.self, forKey: .author_url)
		author_user_name = try values.decodeIfPresent(String.self, forKey: .author_user_name)
		author_name = try values.decodeIfPresent(String.self, forKey: .author_name)
		author_verified = try values.decodeIfPresent(Int.self, forKey: .author_verified)
		comment_id = try values.decodeIfPresent(Int.self, forKey: .comment_id)
		text_plain = try values.decodeIfPresent(String.self, forKey: .text_plain)
		edit_comment = try values.decodeIfPresent(Bool.self, forKey: .edit_comment)
		delete_comment = try values.decodeIfPresent(Bool.self, forKey: .delete_comment)
	}

}
