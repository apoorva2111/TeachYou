/* 
Copyright (c) 2021 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Conversations : Codable {
	let conversation_id : Int?
	let conversation_name : String?
	let last_message_id : Int?
	let color : String?
	let message : String?
	let image : String?
	let time : String?
	let seen : Int?
	let recipients : [Recipients]?
	let seen_name_list : String?
	let name_list : String?
	let multiple_recipients : Bool?
	let user_id : Int?
	let link : String?
	let picture : String?
	let name : String?
	let name_html : String?
	let total_messages : Int?
	let message_orginal : String?

	enum CodingKeys: String, CodingKey {

		case conversation_id = "conversation_id"
		case conversation_name = "conversation_name"
		case last_message_id = "last_message_id"
		case color = "color"
		case message = "message"
		case image = "image"
		case time = "time"
		case seen = "seen"
		case recipients = "recipients"
		case seen_name_list = "seen_name_list"
		case name_list = "name_list"
		case multiple_recipients = "multiple_recipients"
		case user_id = "user_id"
		case link = "link"
		case picture = "picture"
		case name = "name"
		case name_html = "name_html"
		case total_messages = "total_messages"
		case message_orginal = "message_orginal"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		conversation_id = try values.decodeIfPresent(Int.self, forKey: .conversation_id)
		conversation_name = try values.decodeIfPresent(String.self, forKey: .conversation_name)
		last_message_id = try values.decodeIfPresent(Int.self, forKey: .last_message_id)
		color = try values.decodeIfPresent(String.self, forKey: .color)
		message = try values.decodeIfPresent(String.self, forKey: .message)
		image = try values.decodeIfPresent(String.self, forKey: .image)
		time = try values.decodeIfPresent(String.self, forKey: .time)
		seen = try values.decodeIfPresent(Int.self, forKey: .seen)
		recipients = try values.decodeIfPresent([Recipients].self, forKey: .recipients)
		seen_name_list = try values.decodeIfPresent(String.self, forKey: .seen_name_list)
		name_list = try values.decodeIfPresent(String.self, forKey: .name_list)
		multiple_recipients = try values.decodeIfPresent(Bool.self, forKey: .multiple_recipients)
		user_id = try values.decodeIfPresent(Int.self, forKey: .user_id)
		link = try values.decodeIfPresent(String.self, forKey: .link)
		picture = try values.decodeIfPresent(String.self, forKey: .picture)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		name_html = try values.decodeIfPresent(String.self, forKey: .name_html)
		total_messages = try values.decodeIfPresent(Int.self, forKey: .total_messages)
		message_orginal = try values.decodeIfPresent(String.self, forKey: .message_orginal)
	}

}