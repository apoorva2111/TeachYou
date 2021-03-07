/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Photos : Codable {
	let photo_id : Int?
	let post_id : Int?
	let album_id : Int?
	let source : String?
	let reaction_like_count : Int?
	let reaction_love_count : Int?
	let reaction_haha_count : Int?
	let reaction_yay_count : Int?
	let reaction_wow_count : Int?
	let reaction_sad_count : Int?
	let reaction_angry_count : Int?
	let comments : Int?

	enum CodingKeys: String, CodingKey {

		case photo_id = "photo_id"
		case post_id = "post_id"
		case album_id = "album_id"
		case source = "source"
		case reaction_like_count = "reaction_like_count"
		case reaction_love_count = "reaction_love_count"
		case reaction_haha_count = "reaction_haha_count"
		case reaction_yay_count = "reaction_yay_count"
		case reaction_wow_count = "reaction_wow_count"
		case reaction_sad_count = "reaction_sad_count"
		case reaction_angry_count = "reaction_angry_count"
		case comments = "comments"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		photo_id = try values.decodeIfPresent(Int.self, forKey: .photo_id)
		post_id = try values.decodeIfPresent(Int.self, forKey: .post_id)
		album_id = try values.decodeIfPresent(Int.self, forKey: .album_id)
		source = try values.decodeIfPresent(String.self, forKey: .source)
		reaction_like_count = try values.decodeIfPresent(Int.self, forKey: .reaction_like_count)
		reaction_love_count = try values.decodeIfPresent(Int.self, forKey: .reaction_love_count)
		reaction_haha_count = try values.decodeIfPresent(Int.self, forKey: .reaction_haha_count)
		reaction_yay_count = try values.decodeIfPresent(Int.self, forKey: .reaction_yay_count)
		reaction_wow_count = try values.decodeIfPresent(Int.self, forKey: .reaction_wow_count)
		reaction_sad_count = try values.decodeIfPresent(Int.self, forKey: .reaction_sad_count)
		reaction_angry_count = try values.decodeIfPresent(Int.self, forKey: .reaction_angry_count)
		comments = try values.decodeIfPresent(Int.self, forKey: .comments)
	}

}