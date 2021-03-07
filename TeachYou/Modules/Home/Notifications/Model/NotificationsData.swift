/* 
Copyright (c) 2021 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct NotificationsData : Codable {
	let notification_id : Int?
	let to_user_id : Int?
	let from_user_id : Int?
	let action : String?
	let node_type : String?
	let node_url : String?
	let notify_id : String?
	let message : String?
	let time : String?
	let seen : Int?
	let user_id : Int?
	let user_name : String?
	let user_firstname : String?
	let user_lastname : String?
	let user_gender : String?
	let user_picture : String?
	let user_subscribed : Int?
	let user_verified : Int?
	let icon : String?
	let url : String?
	let full_message : String?

	enum CodingKeys: String, CodingKey {

		case notification_id = "notification_id"
		case to_user_id = "to_user_id"
		case from_user_id = "from_user_id"
		case action = "action"
		case node_type = "node_type"
		case node_url = "node_url"
		case notify_id = "notify_id"
		case message = "message"
		case time = "time"
		case seen = "seen"
		case user_id = "user_id"
		case user_name = "user_name"
		case user_firstname = "user_firstname"
		case user_lastname = "user_lastname"
		case user_gender = "user_gender"
		case user_picture = "user_picture"
		case user_subscribed = "user_subscribed"
		case user_verified = "user_verified"
		case icon = "icon"
		case url = "url"
		case full_message = "full_message"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		notification_id = try values.decodeIfPresent(Int.self, forKey: .notification_id)
		to_user_id = try values.decodeIfPresent(Int.self, forKey: .to_user_id)
		from_user_id = try values.decodeIfPresent(Int.self, forKey: .from_user_id)
		action = try values.decodeIfPresent(String.self, forKey: .action)
		node_type = try values.decodeIfPresent(String.self, forKey: .node_type)
		node_url = try values.decodeIfPresent(String.self, forKey: .node_url)
		notify_id = try values.decodeIfPresent(String.self, forKey: .notify_id)
		message = try values.decodeIfPresent(String.self, forKey: .message)
		time = try values.decodeIfPresent(String.self, forKey: .time)
		seen = try values.decodeIfPresent(Int.self, forKey: .seen)
		user_id = try values.decodeIfPresent(Int.self, forKey: .user_id)
		user_name = try values.decodeIfPresent(String.self, forKey: .user_name)
		user_firstname = try values.decodeIfPresent(String.self, forKey: .user_firstname)
		user_lastname = try values.decodeIfPresent(String.self, forKey: .user_lastname)
		user_gender = try values.decodeIfPresent(String.self, forKey: .user_gender)
		user_picture = try values.decodeIfPresent(String.self, forKey: .user_picture)
		user_subscribed = try values.decodeIfPresent(Int.self, forKey: .user_subscribed)
		user_verified = try values.decodeIfPresent(Int.self, forKey: .user_verified)
		icon = try values.decodeIfPresent(String.self, forKey: .icon)
		url = try values.decodeIfPresent(String.self, forKey: .url)
		full_message = try values.decodeIfPresent(String.self, forKey: .full_message)
	}

}
