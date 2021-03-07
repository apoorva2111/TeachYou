/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Article : Codable {
	let article_id : Int?
	let post_id : Int?
	let cover : String?
	let title : String?
	let text : String?
	let category_id : Int?
	let tags : String?
	let views : Int?
	let category_name : String?
	let category_url : String?
	let parsed_cover : String?
	let title_url : String?
	let parsed_text : String?
	let text_snippet : String?
	let parsed_tags : [String]?

	enum CodingKeys: String, CodingKey {

		case article_id = "article_id"
		case post_id = "post_id"
		case cover = "cover"
		case title = "title"
		case text = "text"
		case category_id = "category_id"
		case tags = "tags"
		case views = "views"
		case category_name = "category_name"
		case category_url = "category_url"
		case parsed_cover = "parsed_cover"
		case title_url = "title_url"
		case parsed_text = "parsed_text"
		case text_snippet = "text_snippet"
		case parsed_tags = "parsed_tags"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		article_id = try values.decodeIfPresent(Int.self, forKey: .article_id)
		post_id = try values.decodeIfPresent(Int.self, forKey: .post_id)
		cover = try values.decodeIfPresent(String.self, forKey: .cover)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		text = try values.decodeIfPresent(String.self, forKey: .text)
		category_id = try values.decodeIfPresent(Int.self, forKey: .category_id)
		tags = try values.decodeIfPresent(String.self, forKey: .tags)
		views = try values.decodeIfPresent(Int.self, forKey: .views)
		category_name = try values.decodeIfPresent(String.self, forKey: .category_name)
		category_url = try values.decodeIfPresent(String.self, forKey: .category_url)
		parsed_cover = try values.decodeIfPresent(String.self, forKey: .parsed_cover)
		title_url = try values.decodeIfPresent(String.self, forKey: .title_url)
		parsed_text = try values.decodeIfPresent(String.self, forKey: .parsed_text)
		text_snippet = try values.decodeIfPresent(String.self, forKey: .text_snippet)
		parsed_tags = try values.decodeIfPresent([String].self, forKey: .parsed_tags)
	}

}