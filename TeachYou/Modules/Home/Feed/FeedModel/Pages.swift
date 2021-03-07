/* 
Copyright (c) 2021 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Pages : Codable {
	let page_id : Int?
	let page_admin : Int?
	let page_category : String?
	let page_name : String?
	let page_title : String?
	let page_picture : String?
	let page_picture_id : Int?
	let page_cover : String?
	let page_cover_id : String?
	let page_cover_position : String?
	let page_album_pictures : Int?
	let page_album_covers : String?
	let page_album_timeline : Int?
	let page_pinned_post : String?
	let page_verified : Int?
	let page_boosted : Int?
	let page_boosted_by : Int?
	let page_company : String?
	let page_phone : String?
	let page_website : String?
	let page_location : String?
	let page_description : String?
	let page_action_text : String?
	let page_action_color : String?
	let page_action_url : String?
	let page_social_facebook : String?
	let page_social_twitter : String?
	let page_social_google : String?
	let page_social_youtube : String?
	let page_social_instagram : String?
	let page_social_linkedin : String?
	let page_social_vkontakte : String?
	let page_likes : Int?
	let page_date : String?
	let i_like : Bool?

	enum CodingKeys: String, CodingKey {

		case page_id = "page_id"
		case page_admin = "page_admin"
		case page_category = "page_category"
		case page_name = "page_name"
		case page_title = "page_title"
		case page_picture = "page_picture"
		case page_picture_id = "page_picture_id"
		case page_cover = "page_cover"
		case page_cover_id = "page_cover_id"
		case page_cover_position = "page_cover_position"
		case page_album_pictures = "page_album_pictures"
		case page_album_covers = "page_album_covers"
		case page_album_timeline = "page_album_timeline"
		case page_pinned_post = "page_pinned_post"
		case page_verified = "page_verified"
		case page_boosted = "page_boosted"
		case page_boosted_by = "page_boosted_by"
		case page_company = "page_company"
		case page_phone = "page_phone"
		case page_website = "page_website"
		case page_location = "page_location"
		case page_description = "page_description"
		case page_action_text = "page_action_text"
		case page_action_color = "page_action_color"
		case page_action_url = "page_action_url"
		case page_social_facebook = "page_social_facebook"
		case page_social_twitter = "page_social_twitter"
		case page_social_google = "page_social_google"
		case page_social_youtube = "page_social_youtube"
		case page_social_instagram = "page_social_instagram"
		case page_social_linkedin = "page_social_linkedin"
		case page_social_vkontakte = "page_social_vkontakte"
		case page_likes = "page_likes"
		case page_date = "page_date"
		case i_like = "i_like"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		page_id = try values.decodeIfPresent(Int.self, forKey: .page_id)
		page_admin = try values.decodeIfPresent(Int.self, forKey: .page_admin)
		page_category = try values.decodeIfPresent(String.self, forKey: .page_category)
		page_name = try values.decodeIfPresent(String.self, forKey: .page_name)
		page_title = try values.decodeIfPresent(String.self, forKey: .page_title)
		page_picture = try values.decodeIfPresent(String.self, forKey: .page_picture)
		page_picture_id = try values.decodeIfPresent(Int.self, forKey: .page_picture_id)
		page_cover = try values.decodeIfPresent(String.self, forKey: .page_cover)
		page_cover_id = try values.decodeIfPresent(String.self, forKey: .page_cover_id)
		page_cover_position = try values.decodeIfPresent(String.self, forKey: .page_cover_position)
		page_album_pictures = try values.decodeIfPresent(Int.self, forKey: .page_album_pictures)
		page_album_covers = try values.decodeIfPresent(String.self, forKey: .page_album_covers)
		page_album_timeline = try values.decodeIfPresent(Int.self, forKey: .page_album_timeline)
		page_pinned_post = try values.decodeIfPresent(String.self, forKey: .page_pinned_post)
		page_verified = try values.decodeIfPresent(Int.self, forKey: .page_verified)
		page_boosted = try values.decodeIfPresent(Int.self, forKey: .page_boosted)
		page_boosted_by = try values.decodeIfPresent(Int.self, forKey: .page_boosted_by)
		page_company = try values.decodeIfPresent(String.self, forKey: .page_company)
		page_phone = try values.decodeIfPresent(String.self, forKey: .page_phone)
		page_website = try values.decodeIfPresent(String.self, forKey: .page_website)
		page_location = try values.decodeIfPresent(String.self, forKey: .page_location)
		page_description = try values.decodeIfPresent(String.self, forKey: .page_description)
		page_action_text = try values.decodeIfPresent(String.self, forKey: .page_action_text)
		page_action_color = try values.decodeIfPresent(String.self, forKey: .page_action_color)
		page_action_url = try values.decodeIfPresent(String.self, forKey: .page_action_url)
		page_social_facebook = try values.decodeIfPresent(String.self, forKey: .page_social_facebook)
		page_social_twitter = try values.decodeIfPresent(String.self, forKey: .page_social_twitter)
		page_social_google = try values.decodeIfPresent(String.self, forKey: .page_social_google)
		page_social_youtube = try values.decodeIfPresent(String.self, forKey: .page_social_youtube)
		page_social_instagram = try values.decodeIfPresent(String.self, forKey: .page_social_instagram)
		page_social_linkedin = try values.decodeIfPresent(String.self, forKey: .page_social_linkedin)
		page_social_vkontakte = try values.decodeIfPresent(String.self, forKey: .page_social_vkontakte)
		page_likes = try values.decodeIfPresent(Int.self, forKey: .page_likes)
		page_date = try values.decodeIfPresent(String.self, forKey: .page_date)
		i_like = try values.decodeIfPresent(Bool.self, forKey: .i_like)
	}

}
