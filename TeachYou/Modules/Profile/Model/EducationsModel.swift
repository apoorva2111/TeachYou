/* 
Copyright (c) 2021 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct EducationsModel : Codable{
	let s_no : Int?
	let user_id : Int?
	let user_edu_major : String?
	let user_edu_degree : String?
	let edu_from_date : String?
	let edu_to_date : String?
	let edu_present : Int?
	let edu_id : Int?

	enum CodingKeys: String, CodingKey {

		case s_no = "s_no"
		case user_id = "user_id"
		case user_edu_major = "user_edu_major"
		case user_edu_degree = "user_edu_degree"
		case edu_from_date = "edu_from_date"
		case edu_to_date = "edu_to_date"
		case edu_present = "edu_present"
		case edu_id = "edu_id"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		s_no = try values.decodeIfPresent(Int.self, forKey: .s_no)
		user_id = try values.decodeIfPresent(Int.self, forKey: .user_id)
		user_edu_major = try values.decodeIfPresent(String.self, forKey: .user_edu_major)
		user_edu_degree = try values.decodeIfPresent(String.self, forKey: .user_edu_degree)
		edu_from_date = try values.decodeIfPresent(String.self, forKey: .edu_from_date)
		edu_to_date = try values.decodeIfPresent(String.self, forKey: .edu_to_date)
		edu_present = try values.decodeIfPresent(Int.self, forKey: .edu_present)
		edu_id = try values.decodeIfPresent(Int.self, forKey: .edu_id)
	}

}
