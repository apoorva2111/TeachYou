/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Debates : Codable {
	let q_id : Int?
	let heading : String?
	let image : String?
	let quotes : String?
	let q_date : String?
	let user_id : Int?
	let category : Int?
	var i_react : Bool?
	let reactions_count : Int?
	let comments_count : Int?
    let reactions:[Reaction]?
    let comments:[Comment]?

	enum CodingKeys: String, CodingKey {

		case q_id = "q_id"
		case heading = "heading"
		case image = "image"
		case quotes = "quotes"
		case q_date = "q_date"
		case user_id = "user_id"
		case category = "category"
		case i_react = "i_react"
		case reactions_count = "reactions_count"
		case comments_count = "comments_count"
        case reactions = "reactions"
        case comments = "comments"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		q_id = try values.decodeIfPresent(Int.self, forKey: .q_id)
		heading = try values.decodeIfPresent(String.self, forKey: .heading)
		image = try values.decodeIfPresent(String.self, forKey: .image)
		quotes = try values.decodeIfPresent(String.self, forKey: .quotes)
		q_date = try values.decodeIfPresent(String.self, forKey: .q_date)
		user_id = try values.decodeIfPresent(Int.self, forKey: .user_id)
		category = try values.decodeIfPresent(Int.self, forKey: .category)
		i_react = try values.decodeIfPresent(Bool.self, forKey: .i_react)
		reactions_count = try values.decodeIfPresent(Int.self, forKey: .reactions_count)
		comments_count = try values.decodeIfPresent(Int.self, forKey: .comments_count)
        reactions = try values.decodeIfPresent([Reaction].self, forKey: .reactions)
        comments = try values.decodeIfPresent([Comment].self, forKey: .comments)
	}

}


