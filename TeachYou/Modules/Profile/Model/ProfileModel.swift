/* 
Copyright (c) 2021 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation

struct ProfileModel : Codable {
	let user_id : Int?
	let user_group : Int?
	let user_name : String?
	let user_work_from_date : String?
	let user_work_to_date : String?
	let user_work_present : Int?
	let user_edu_degree : String?
	let edu_from_date : String?
	let edu_to_date : String?
	let edu_present : Int?
	let user_email : String?
	let user_contact_number : String?
	let user_last_seen : String?
	let user_email_verified : Int?
	let user_email_verification_code : String?
	let user_phone : String?
	let user_phone_verified : Int?
	let user_phone_verification_code : String?
	let user_password : String?
	let user_two_factor_enabled : Int?
	let user_two_factor_type : String?
	let user_two_factor_key : String?
	let user_two_factor_gsecret : String?
	let user_activated : Int?
	let user_reseted : Int?
	let user_reset_key : String?
	let user_subscribed : Int?
	let user_package : String?
	let user_subscription_date : String?
	let user_boosted_posts : Int?
	let user_boosted_pages : Int?
	let user_started : Int?
	let user_verified : Int?
	let user_banned : Int?
	let user_live_requests_counter : Int?
	let user_live_requests_lastid : Int?
	let user_live_messages_counter : Int?
	let user_live_messages_lastid : Int?
	let user_live_notifications_counter : Int?
	let user_live_notifications_lastid : Int?
	let user_latitude : Double?
	let user_longitude : Double?
	let user_location_updated : String?
	let user_firstname : String?
	let user_lastname : String?
	let user_gender : String?
	let user_about_me : String?
	let user_picture : String?
	let user_picture_id : Int?
	let user_cover : String?
	let user_cover_id : String?
	let user_cover_position : String?
	let user_album_pictures : Int?
	let user_album_covers : Int?
	let user_album_timeline : Int?
	let user_pinned_post : Int?
	let user_registered : String?
	let user_country : Int?
	let user_birthdate : String?
	let user_relationship : String?
	let user_biography : String?
	let user_website : String?
	let user_work_title : String?
	let user_work_place : String?
	let user_work_url : String?
	let user_current_city : String?
	let user_hometown : String?
	let user_edu_major : String?
	let user_edu_school : String?
	let user_edu_class : String?
	let user_social_facebook : String?
	let user_social_twitter : String?
	let user_social_google : String?
	let user_social_youtube : String?
	let user_social_instagram : String?
	let user_social_linkedin : String?
	let user_social_vkontakte : String?
	let user_chat_enabled : Int?
	let user_privacy_newsletter : Int?
	let user_privacy_poke : String?
	let user_privacy_gifts : String?
	let user_privacy_wall : String?
	let user_privacy_birthdate : String?
	let user_privacy_relationship : String?
	let user_privacy_basic : String?
	let user_privacy_work : String?
	let user_privacy_location : String?
	let user_privacy_education : String?
	let user_privacy_other : String?
	let user_privacy_friends : String?
	let user_privacy_photos : String?
	let user_privacy_pages : String?
	let user_privacy_groups : String?
	let user_privacy_events : String?
	let email_post_likes : Int?
	let email_post_comments : Int?
	let email_post_shares : Int?
	let email_wall_posts : Int?
	let email_mentions : Int?
	let email_profile_visits : Int?
	let email_friend_requests : Int?
	let facebook_connected : Int?
	let facebook_id : String?
	let twitter_connected : Int?
	let twitter_id : String?
	let instagram_connected : Int?
	let instagram_id : String?
	let linkedin_connected : Int?
	let linkedin_id : String?
	let vkontakte_connected : Int?
	let vkontakte_id : String?
	let user_referrer_id : String?
	let user_affiliate_balance : Int?
	let user_wallet_balance : Int?
	let user_points : Int?
	let chat_sound : Int?
	let notifications_sound : Int?
	let user_type : String?
	let user_type_other : String?
	let languages : String?
	let user_languages : String?
	let user_skills : String?
	let user_interests : String?
	let educations : [EducationsModel]?
	let experiences : [ExperiencesModel]?

	enum CodingKeys: String, CodingKey {

		case user_id = "user_id"
		case user_group = "user_group"
		case user_name = "user_name"
		case user_work_from_date = "user_work_from_date"
		case user_work_to_date = "user_work_to_date"
		case user_work_present = "user_work_present"
		case user_edu_degree = "user_edu_degree"
		case edu_from_date = "edu_from_date"
		case edu_to_date = "edu_to_date"
		case edu_present = "edu_present"
		case user_email = "user_email"
		case user_contact_number = "user_contact_number"
		case user_last_seen = "user_last_seen"
		case user_email_verified = "user_email_verified"
		case user_email_verification_code = "user_email_verification_code"
		case user_phone = "user_phone"
		case user_phone_verified = "user_phone_verified"
		case user_phone_verification_code = "user_phone_verification_code"
		case user_password = "user_password"
		case user_two_factor_enabled = "user_two_factor_enabled"
		case user_two_factor_type = "user_two_factor_type"
		case user_two_factor_key = "user_two_factor_key"
		case user_two_factor_gsecret = "user_two_factor_gsecret"
		case user_activated = "user_activated"
		case user_reseted = "user_reseted"
		case user_reset_key = "user_reset_key"
		case user_subscribed = "user_subscribed"
		case user_package = "user_package"
		case user_subscription_date = "user_subscription_date"
		case user_boosted_posts = "user_boosted_posts"
		case user_boosted_pages = "user_boosted_pages"
		case user_started = "user_started"
		case user_verified = "user_verified"
		case user_banned = "user_banned"
		case user_live_requests_counter = "user_live_requests_counter"
		case user_live_requests_lastid = "user_live_requests_lastid"
		case user_live_messages_counter = "user_live_messages_counter"
		case user_live_messages_lastid = "user_live_messages_lastid"
		case user_live_notifications_counter = "user_live_notifications_counter"
		case user_live_notifications_lastid = "user_live_notifications_lastid"
		case user_latitude = "user_latitude"
		case user_longitude = "user_longitude"
		case user_location_updated = "user_location_updated"
		case user_firstname = "user_firstname"
		case user_lastname = "user_lastname"
		case user_gender = "user_gender"
		case user_about_me = "user_about_me"
		case user_picture = "user_picture"
		case user_picture_id = "user_picture_id"
		case user_cover = "user_cover"
		case user_cover_id = "user_cover_id"
		case user_cover_position = "user_cover_position"
		case user_album_pictures = "user_album_pictures"
		case user_album_covers = "user_album_covers"
		case user_album_timeline = "user_album_timeline"
		case user_pinned_post = "user_pinned_post"
		case user_registered = "user_registered"
		case user_country = "user_country"
		case user_birthdate = "user_birthdate"
		case user_relationship = "user_relationship"
		case user_biography = "user_biography"
		case user_website = "user_website"
		case user_work_title = "user_work_title"
		case user_work_place = "user_work_place"
		case user_work_url = "user_work_url"
		case user_current_city = "user_current_city"
		case user_hometown = "user_hometown"
		case user_edu_major = "user_edu_major"
		case user_edu_school = "user_edu_school"
		case user_edu_class = "user_edu_class"
		case user_social_facebook = "user_social_facebook"
		case user_social_twitter = "user_social_twitter"
		case user_social_google = "user_social_google"
		case user_social_youtube = "user_social_youtube"
		case user_social_instagram = "user_social_instagram"
		case user_social_linkedin = "user_social_linkedin"
		case user_social_vkontakte = "user_social_vkontakte"
		case user_chat_enabled = "user_chat_enabled"
		case user_privacy_newsletter = "user_privacy_newsletter"
		case user_privacy_poke = "user_privacy_poke"
		case user_privacy_gifts = "user_privacy_gifts"
		case user_privacy_wall = "user_privacy_wall"
		case user_privacy_birthdate = "user_privacy_birthdate"
		case user_privacy_relationship = "user_privacy_relationship"
		case user_privacy_basic = "user_privacy_basic"
		case user_privacy_work = "user_privacy_work"
		case user_privacy_location = "user_privacy_location"
		case user_privacy_education = "user_privacy_education"
		case user_privacy_other = "user_privacy_other"
		case user_privacy_friends = "user_privacy_friends"
		case user_privacy_photos = "user_privacy_photos"
		case user_privacy_pages = "user_privacy_pages"
		case user_privacy_groups = "user_privacy_groups"
		case user_privacy_events = "user_privacy_events"
		case email_post_likes = "email_post_likes"
		case email_post_comments = "email_post_comments"
		case email_post_shares = "email_post_shares"
		case email_wall_posts = "email_wall_posts"
		case email_mentions = "email_mentions"
		case email_profile_visits = "email_profile_visits"
		case email_friend_requests = "email_friend_requests"
		case facebook_connected = "facebook_connected"
		case facebook_id = "facebook_id"
		case twitter_connected = "twitter_connected"
		case twitter_id = "twitter_id"
		case instagram_connected = "instagram_connected"
		case instagram_id = "instagram_id"
		case linkedin_connected = "linkedin_connected"
		case linkedin_id = "linkedin_id"
		case vkontakte_connected = "vkontakte_connected"
		case vkontakte_id = "vkontakte_id"
		case user_referrer_id = "user_referrer_id"
		case user_affiliate_balance = "user_affiliate_balance"
		case user_wallet_balance = "user_wallet_balance"
		case user_points = "user_points"
		case chat_sound = "chat_sound"
		case notifications_sound = "notifications_sound"
		case user_type = "user_type"
		case user_type_other = "user_type_other"
		case languages = "languages"
		case user_languages = "user_languages"
		case user_skills = "user_skills"
		case user_interests = "user_interests"
		case educations = "educations"
		case experiences = "experiences"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		user_id = try values.decodeIfPresent(Int.self, forKey: .user_id)
		user_group = try values.decodeIfPresent(Int.self, forKey: .user_group)
		user_name = try values.decodeIfPresent(String.self, forKey: .user_name)
		user_work_from_date = try values.decodeIfPresent(String.self, forKey: .user_work_from_date)
		user_work_to_date = try values.decodeIfPresent(String.self, forKey: .user_work_to_date)
		user_work_present = try values.decodeIfPresent(Int.self, forKey: .user_work_present)
		user_edu_degree = try values.decodeIfPresent(String.self, forKey: .user_edu_degree)
		edu_from_date = try values.decodeIfPresent(String.self, forKey: .edu_from_date)
		edu_to_date = try values.decodeIfPresent(String.self, forKey: .edu_to_date)
		edu_present = try values.decodeIfPresent(Int.self, forKey: .edu_present)
		user_email = try values.decodeIfPresent(String.self, forKey: .user_email)
		user_contact_number = try values.decodeIfPresent(String.self, forKey: .user_contact_number)
		user_last_seen = try values.decodeIfPresent(String.self, forKey: .user_last_seen)
		user_email_verified = try values.decodeIfPresent(Int.self, forKey: .user_email_verified)
		user_email_verification_code = try values.decodeIfPresent(String.self, forKey: .user_email_verification_code)
		user_phone = try values.decodeIfPresent(String.self, forKey: .user_phone)
		user_phone_verified = try values.decodeIfPresent(Int.self, forKey: .user_phone_verified)
		user_phone_verification_code = try values.decodeIfPresent(String.self, forKey: .user_phone_verification_code)
		user_password = try values.decodeIfPresent(String.self, forKey: .user_password)
		user_two_factor_enabled = try values.decodeIfPresent(Int.self, forKey: .user_two_factor_enabled)
		user_two_factor_type = try values.decodeIfPresent(String.self, forKey: .user_two_factor_type)
		user_two_factor_key = try values.decodeIfPresent(String.self, forKey: .user_two_factor_key)
		user_two_factor_gsecret = try values.decodeIfPresent(String.self, forKey: .user_two_factor_gsecret)
		user_activated = try values.decodeIfPresent(Int.self, forKey: .user_activated)
		user_reseted = try values.decodeIfPresent(Int.self, forKey: .user_reseted)
		user_reset_key = try values.decodeIfPresent(String.self, forKey: .user_reset_key)
		user_subscribed = try values.decodeIfPresent(Int.self, forKey: .user_subscribed)
		user_package = try values.decodeIfPresent(String.self, forKey: .user_package)
		user_subscription_date = try values.decodeIfPresent(String.self, forKey: .user_subscription_date)
		user_boosted_posts = try values.decodeIfPresent(Int.self, forKey: .user_boosted_posts)
		user_boosted_pages = try values.decodeIfPresent(Int.self, forKey: .user_boosted_pages)
		user_started = try values.decodeIfPresent(Int.self, forKey: .user_started)
		user_verified = try values.decodeIfPresent(Int.self, forKey: .user_verified)
		user_banned = try values.decodeIfPresent(Int.self, forKey: .user_banned)
		user_live_requests_counter = try values.decodeIfPresent(Int.self, forKey: .user_live_requests_counter)
		user_live_requests_lastid = try values.decodeIfPresent(Int.self, forKey: .user_live_requests_lastid)
		user_live_messages_counter = try values.decodeIfPresent(Int.self, forKey: .user_live_messages_counter)
		user_live_messages_lastid = try values.decodeIfPresent(Int.self, forKey: .user_live_messages_lastid)
		user_live_notifications_counter = try values.decodeIfPresent(Int.self, forKey: .user_live_notifications_counter)
		user_live_notifications_lastid = try values.decodeIfPresent(Int.self, forKey: .user_live_notifications_lastid)
		user_latitude = try values.decodeIfPresent(Double.self, forKey: .user_latitude)
		user_longitude = try values.decodeIfPresent(Double.self, forKey: .user_longitude)
		user_location_updated = try values.decodeIfPresent(String.self, forKey: .user_location_updated)
		user_firstname = try values.decodeIfPresent(String.self, forKey: .user_firstname)
		user_lastname = try values.decodeIfPresent(String.self, forKey: .user_lastname)
		user_gender = try values.decodeIfPresent(String.self, forKey: .user_gender)
		user_about_me = try values.decodeIfPresent(String.self, forKey: .user_about_me)
		user_picture = try values.decodeIfPresent(String.self, forKey: .user_picture)
		user_picture_id = try values.decodeIfPresent(Int.self, forKey: .user_picture_id)
		user_cover = try values.decodeIfPresent(String.self, forKey: .user_cover)
		user_cover_id = try values.decodeIfPresent(String.self, forKey: .user_cover_id)
		user_cover_position = try values.decodeIfPresent(String.self, forKey: .user_cover_position)
		user_album_pictures = try values.decodeIfPresent(Int.self, forKey: .user_album_pictures)
		user_album_covers = try values.decodeIfPresent(Int.self, forKey: .user_album_covers)
		user_album_timeline = try values.decodeIfPresent(Int.self, forKey: .user_album_timeline)
		user_pinned_post = try values.decodeIfPresent(Int.self, forKey: .user_pinned_post)
		user_registered = try values.decodeIfPresent(String.self, forKey: .user_registered)
		user_country = try values.decodeIfPresent(Int.self, forKey: .user_country)
		user_birthdate = try values.decodeIfPresent(String.self, forKey: .user_birthdate)
		user_relationship = try values.decodeIfPresent(String.self, forKey: .user_relationship)
		user_biography = try values.decodeIfPresent(String.self, forKey: .user_biography)
		user_website = try values.decodeIfPresent(String.self, forKey: .user_website)
		user_work_title = try values.decodeIfPresent(String.self, forKey: .user_work_title)
		user_work_place = try values.decodeIfPresent(String.self, forKey: .user_work_place)
		user_work_url = try values.decodeIfPresent(String.self, forKey: .user_work_url)
		user_current_city = try values.decodeIfPresent(String.self, forKey: .user_current_city)
		user_hometown = try values.decodeIfPresent(String.self, forKey: .user_hometown)
		user_edu_major = try values.decodeIfPresent(String.self, forKey: .user_edu_major)
		user_edu_school = try values.decodeIfPresent(String.self, forKey: .user_edu_school)
		user_edu_class = try values.decodeIfPresent(String.self, forKey: .user_edu_class)
		user_social_facebook = try values.decodeIfPresent(String.self, forKey: .user_social_facebook)
		user_social_twitter = try values.decodeIfPresent(String.self, forKey: .user_social_twitter)
		user_social_google = try values.decodeIfPresent(String.self, forKey: .user_social_google)
		user_social_youtube = try values.decodeIfPresent(String.self, forKey: .user_social_youtube)
		user_social_instagram = try values.decodeIfPresent(String.self, forKey: .user_social_instagram)
		user_social_linkedin = try values.decodeIfPresent(String.self, forKey: .user_social_linkedin)
		user_social_vkontakte = try values.decodeIfPresent(String.self, forKey: .user_social_vkontakte)
		user_chat_enabled = try values.decodeIfPresent(Int.self, forKey: .user_chat_enabled)
		user_privacy_newsletter = try values.decodeIfPresent(Int.self, forKey: .user_privacy_newsletter)
		user_privacy_poke = try values.decodeIfPresent(String.self, forKey: .user_privacy_poke)
		user_privacy_gifts = try values.decodeIfPresent(String.self, forKey: .user_privacy_gifts)
		user_privacy_wall = try values.decodeIfPresent(String.self, forKey: .user_privacy_wall)
		user_privacy_birthdate = try values.decodeIfPresent(String.self, forKey: .user_privacy_birthdate)
		user_privacy_relationship = try values.decodeIfPresent(String.self, forKey: .user_privacy_relationship)
		user_privacy_basic = try values.decodeIfPresent(String.self, forKey: .user_privacy_basic)
		user_privacy_work = try values.decodeIfPresent(String.self, forKey: .user_privacy_work)
		user_privacy_location = try values.decodeIfPresent(String.self, forKey: .user_privacy_location)
		user_privacy_education = try values.decodeIfPresent(String.self, forKey: .user_privacy_education)
		user_privacy_other = try values.decodeIfPresent(String.self, forKey: .user_privacy_other)
		user_privacy_friends = try values.decodeIfPresent(String.self, forKey: .user_privacy_friends)
		user_privacy_photos = try values.decodeIfPresent(String.self, forKey: .user_privacy_photos)
		user_privacy_pages = try values.decodeIfPresent(String.self, forKey: .user_privacy_pages)
		user_privacy_groups = try values.decodeIfPresent(String.self, forKey: .user_privacy_groups)
		user_privacy_events = try values.decodeIfPresent(String.self, forKey: .user_privacy_events)
		email_post_likes = try values.decodeIfPresent(Int.self, forKey: .email_post_likes)
		email_post_comments = try values.decodeIfPresent(Int.self, forKey: .email_post_comments)
		email_post_shares = try values.decodeIfPresent(Int.self, forKey: .email_post_shares)
		email_wall_posts = try values.decodeIfPresent(Int.self, forKey: .email_wall_posts)
		email_mentions = try values.decodeIfPresent(Int.self, forKey: .email_mentions)
		email_profile_visits = try values.decodeIfPresent(Int.self, forKey: .email_profile_visits)
		email_friend_requests = try values.decodeIfPresent(Int.self, forKey: .email_friend_requests)
		facebook_connected = try values.decodeIfPresent(Int.self, forKey: .facebook_connected)
		facebook_id = try values.decodeIfPresent(String.self, forKey: .facebook_id)
		twitter_connected = try values.decodeIfPresent(Int.self, forKey: .twitter_connected)
		twitter_id = try values.decodeIfPresent(String.self, forKey: .twitter_id)
		instagram_connected = try values.decodeIfPresent(Int.self, forKey: .instagram_connected)
		instagram_id = try values.decodeIfPresent(String.self, forKey: .instagram_id)
		linkedin_connected = try values.decodeIfPresent(Int.self, forKey: .linkedin_connected)
		linkedin_id = try values.decodeIfPresent(String.self, forKey: .linkedin_id)
		vkontakte_connected = try values.decodeIfPresent(Int.self, forKey: .vkontakte_connected)
		vkontakte_id = try values.decodeIfPresent(String.self, forKey: .vkontakte_id)
		user_referrer_id = try values.decodeIfPresent(String.self, forKey: .user_referrer_id)
		user_affiliate_balance = try values.decodeIfPresent(Int.self, forKey: .user_affiliate_balance)
		user_wallet_balance = try values.decodeIfPresent(Int.self, forKey: .user_wallet_balance)
		user_points = try values.decodeIfPresent(Int.self, forKey: .user_points)
		chat_sound = try values.decodeIfPresent(Int.self, forKey: .chat_sound)
		notifications_sound = try values.decodeIfPresent(Int.self, forKey: .notifications_sound)
		user_type = try values.decodeIfPresent(String.self, forKey: .user_type)
		user_type_other = try values.decodeIfPresent(String.self, forKey: .user_type_other)
		languages = try values.decodeIfPresent(String.self, forKey: .languages)
		user_languages = try values.decodeIfPresent(String.self, forKey: .user_languages)
		user_skills = try values.decodeIfPresent(String.self, forKey: .user_skills)
		user_interests = try values.decodeIfPresent(String.self, forKey: .user_interests)
		educations = try values.decodeIfPresent([EducationsModel].self, forKey: .educations)
		experiences = try values.decodeIfPresent([ExperiencesModel].self, forKey: .experiences)
	}

}
