///*
//Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com
//
//Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//
//For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar
//
//*/
//
//import Foundation
//struct Posts : Codable {
//    let post_id : Int?
//    let user_id : Int?
//    let user_type : String?
//    let page_id : Int?
//    let in_group : Int?
//    let group_id : Int?
//    let in_event : Int?
//    let event_id : Int?
//    let in_wall : Int?
//    let wall_id : Int?
//    let post_type : String?
//    let origin_id : String?
//    let time : String?
//    let location : String?
//    let privacy : String?
//    let text : String?
//    let feeling_action : String?
//    let feeling_value : String?
//    let boosted : Int?
//    let boosted_by : String?
//    let comments_disabled : Int?
//    let reaction_like_count : Int?
//    let reaction_love_count : Int?
//    let reaction_haha_count : Int?
//    let reaction_yay_count : Int?
//    let reaction_wow_count : Int?
//    let reaction_sad_count : Int?
//    let reaction_angry_count : Int?
//    let comments : Int?
//    let shares : Int?
//    let ue_name : String?
//    let user_name : String?
//    let user_firstname : String?
//    let user_lastname : String?
//    let user_gender : String?
//    let user_picture : String?
//    let user_picture_id : Int?
//    let user_cover : String?
//    let user_cover_id : String?
//    let user_verified : Int?
//    let user_subscribed : Int?
//    let user_pinned_post : Int?
//    let page_admin : Int?
//    let page_category : Int?
//    let page_name : String?
//    let page_title : String?
//    let page_picture : String?
//    let page_picture_id : String?
//    let page_cover : String?
//    let page_cover_id : String?
//    let page_cover_position : String?
//    let page_album_pictures : String?
//    let page_album_covers : String?
//    let page_album_timeline : Int?
//    let page_pinned_post : String?
//    let page_verified : Int?
//    let page_boosted : Int?
//    let page_boosted_by : String?
//    let page_company : String?
//    let page_phone : String?
//    let page_website : String?
//    let page_location : String?
//    let page_description : String?
//    let page_action_text : String?
//    let page_action_color : String?
//    let page_action_url : String?
//    let page_social_facebook : String?
//    let page_social_twitter : String?
//    let page_social_google : String?
//    let page_social_youtube : String?
//    let page_social_instagram : String?
//    let page_social_linkedin : String?
//    let page_social_vkontakte : String?
//    let page_likes : Int?
//    let page_date : String?
//    let group_privacy : String?
//    let group_admin : Int?
//    let group_category : Int?
//    let group_name : String?
//    let group_title : String?
//    let group_description : String?
//    let group_picture : String?
//    let group_picture_id : Int?
//    let group_cover : String?
//    let group_cover_id : String?
//    let group_cover_position : String?
//    let group_album_pictures : Int?
//    let group_album_covers : String?
//    let group_album_timeline : String?
//    let group_pinned_post : String?
//    let group_members : Int?
//    let group_date : String?
//    let event_privacy : String?
//    let event_admin : Int?
//    let event_category : Int?
//    let event_title : String?
//    let event_location : String?
//    let event_description : String?
//    let event_start_date : String?
//    let event_end_date : String?
//    let event_cover : String?
//    let event_cover_id : Int?
//    let event_cover_position : String?
//    let event_album_covers : Int?
//    let event_album_timeline : String?
//    let event_pinned_post : String?
//    let event_invited : Int?
//    let event_interested : Int?
//    let event_going : Int?
//    let event_date : String?
//    let reactions : Reactions?
//    let reactions_total_count : Int?
//    let author_id : Int?
//    let is_page_admin : Bool?
//    let is_group_admin : Bool?
//    let is_event_admin : Bool?
//    let post_author_picture : String?
//    let post_author_url : String?
//    let post_author_name : String?
//    let post_author_verified : Int?
//    let pinned : Bool?
//    let manage_post : Bool?
//    let i_save : Bool?
//    let i_react : Bool?
//    let text_plain : String?
//    let og_title : String?
//    let og_description : String?
//    let photos_num : Int?
//    let photos : [Photos]?
//    let og_image : String?
//    let post_comments : [Post_comments]?
//
//    enum CodingKeys: String, CodingKey {
//
//        case post_id = "post_id"
//        case user_id = "user_id"
//        case user_type = "user_type"
//        case page_id = "page_id"
//        case in_group = "in_group"
//        case group_id = "group_id"
//        case in_event = "in_event"
//        case event_id = "event_id"
//        case in_wall = "in_wall"
//        case wall_id = "wall_id"
//        case post_type = "post_type"
//        case origin_id = "origin_id"
//        case time = "time"
//        case location = "location"
//        case privacy = "privacy"
//        case text = "text"
//        case feeling_action = "feeling_action"
//        case feeling_value = "feeling_value"
//        case boosted = "boosted"
//        case boosted_by = "boosted_by"
//        case comments_disabled = "comments_disabled"
//        case reaction_like_count = "reaction_like_count"
//        case reaction_love_count = "reaction_love_count"
//        case reaction_haha_count = "reaction_haha_count"
//        case reaction_yay_count = "reaction_yay_count"
//        case reaction_wow_count = "reaction_wow_count"
//        case reaction_sad_count = "reaction_sad_count"
//        case reaction_angry_count = "reaction_angry_count"
//        case comments = "comments"
//        case shares = "shares"
//        case ue_name = "ue_name"
//        case user_name = "user_name"
//        case user_firstname = "user_firstname"
//        case user_lastname = "user_lastname"
//        case user_gender = "user_gender"
//        case user_picture = "user_picture"
//        case user_picture_id = "user_picture_id"
//        case user_cover = "user_cover"
//        case user_cover_id = "user_cover_id"
//        case user_verified = "user_verified"
//        case user_subscribed = "user_subscribed"
//        case user_pinned_post = "user_pinned_post"
//        case page_admin = "page_admin"
//        case page_category = "page_category"
//        case page_name = "page_name"
//        case page_title = "page_title"
//        case page_picture = "page_picture"
//        case page_picture_id = "page_picture_id"
//        case page_cover = "page_cover"
//        case page_cover_id = "page_cover_id"
//        case page_cover_position = "page_cover_position"
//        case page_album_pictures = "page_album_pictures"
//        case page_album_covers = "page_album_covers"
//        case page_album_timeline = "page_album_timeline"
//        case page_pinned_post = "page_pinned_post"
//        case page_verified = "page_verified"
//        case page_boosted = "page_boosted"
//        case page_boosted_by = "page_boosted_by"
//        case page_company = "page_company"
//        case page_phone = "page_phone"
//        case page_website = "page_website"
//        case page_location = "page_location"
//        case page_description = "page_description"
//        case page_action_text = "page_action_text"
//        case page_action_color = "page_action_color"
//        case page_action_url = "page_action_url"
//        case page_social_facebook = "page_social_facebook"
//        case page_social_twitter = "page_social_twitter"
//        case page_social_google = "page_social_google"
//        case page_social_youtube = "page_social_youtube"
//        case page_social_instagram = "page_social_instagram"
//        case page_social_linkedin = "page_social_linkedin"
//        case page_social_vkontakte = "page_social_vkontakte"
//        case page_likes = "page_likes"
//        case page_date = "page_date"
//        case group_privacy = "group_privacy"
//        case group_admin = "group_admin"
//        case group_category = "group_category"
//        case group_name = "group_name"
//        case group_title = "group_title"
//        case group_description = "group_description"
//        case group_picture = "group_picture"
//        case group_picture_id = "group_picture_id"
//        case group_cover = "group_cover"
//        case group_cover_id = "group_cover_id"
//        case group_cover_position = "group_cover_position"
//        case group_album_pictures = "group_album_pictures"
//        case group_album_covers = "group_album_covers"
//        case group_album_timeline = "group_album_timeline"
//        case group_pinned_post = "group_pinned_post"
//        case group_members = "group_members"
//        case group_date = "group_date"
//        case event_privacy = "event_privacy"
//        case event_admin = "event_admin"
//        case event_category = "event_category"
//        case event_title = "event_title"
//        case event_location = "event_location"
//        case event_description = "event_description"
//        case event_start_date = "event_start_date"
//        case event_end_date = "event_end_date"
//        case event_cover = "event_cover"
//        case event_cover_id = "event_cover_id"
//        case event_cover_position = "event_cover_position"
//        case event_album_covers = "event_album_covers"
//        case event_album_timeline = "event_album_timeline"
//        case event_pinned_post = "event_pinned_post"
//        case event_invited = "event_invited"
//        case event_interested = "event_interested"
//        case event_going = "event_going"
//        case event_date = "event_date"
//        case reactions = "reactions"
//        case reactions_total_count = "reactions_total_count"
//        case author_id = "author_id"
//        case is_page_admin = "is_page_admin"
//        case is_group_admin = "is_group_admin"
//        case is_event_admin = "is_event_admin"
//        case post_author_picture = "post_author_picture"
//        case post_author_url = "post_author_url"
//        case post_author_name = "post_author_name"
//        case post_author_verified = "post_author_verified"
//        case pinned = "pinned"
//        case manage_post = "manage_post"
//        case i_save = "i_save"
//        case i_react = "i_react"
//        case text_plain = "text_plain"
//        case og_title = "og_title"
//        case og_description = "og_description"
//        case photos_num = "photos_num"
//        case photos = "photos"
//        case og_image = "og_image"
//        case post_comments = "post_comments"
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        post_id = try values.decodeIfPresent(Int.self, forKey: .post_id)
//        user_id = try values.decodeIfPresent(Int.self, forKey: .user_id)
//        user_type = try values.decodeIfPresent(String.self, forKey: .user_type)
//        page_id = try values.decodeIfPresent(Int.self, forKey: .page_id)
//        in_group = try values.decodeIfPresent(Int.self, forKey: .in_group)
//        group_id = try values.decodeIfPresent(Int.self, forKey: .group_id)
//        in_event = try values.decodeIfPresent(Int.self, forKey: .in_event)
//        event_id = try values.decodeIfPresent(Int.self, forKey: .event_id)
//        in_wall = try values.decodeIfPresent(Int.self, forKey: .in_wall)
//        wall_id = try values.decodeIfPresent(Int.self, forKey: .wall_id)
//        post_type = try values.decodeIfPresent(String.self, forKey: .post_type)
//        origin_id = try values.decodeIfPresent(String.self, forKey: .origin_id)
//        time = try values.decodeIfPresent(String.self, forKey: .time)
//        location = try values.decodeIfPresent(String.self, forKey: .location)
//        privacy = try values.decodeIfPresent(String.self, forKey: .privacy)
//        text = try values.decodeIfPresent(String.self, forKey: .text)
//        feeling_action = try values.decodeIfPresent(String.self, forKey: .feeling_action)
//        feeling_value = try values.decodeIfPresent(String.self, forKey: .feeling_value)
//        boosted = try values.decodeIfPresent(Int.self, forKey: .boosted)
//        boosted_by = try values.decodeIfPresent(String.self, forKey: .boosted_by)
//        comments_disabled = try values.decodeIfPresent(Int.self, forKey: .comments_disabled)
//        reaction_like_count = try values.decodeIfPresent(Int.self, forKey: .reaction_like_count)
//        reaction_love_count = try values.decodeIfPresent(Int.self, forKey: .reaction_love_count)
//        reaction_haha_count = try values.decodeIfPresent(Int.self, forKey: .reaction_haha_count)
//        reaction_yay_count = try values.decodeIfPresent(Int.self, forKey: .reaction_yay_count)
//        reaction_wow_count = try values.decodeIfPresent(Int.self, forKey: .reaction_wow_count)
//        reaction_sad_count = try values.decodeIfPresent(Int.self, forKey: .reaction_sad_count)
//        reaction_angry_count = try values.decodeIfPresent(Int.self, forKey: .reaction_angry_count)
//        comments = try values.decodeIfPresent(Int.self, forKey: .comments)
//        shares = try values.decodeIfPresent(Int.self, forKey: .shares)
//        ue_name = try values.decodeIfPresent(String.self, forKey: .ue_name)
//        user_name = try values.decodeIfPresent(String.self, forKey: .user_name)
//        user_firstname = try values.decodeIfPresent(String.self, forKey: .user_firstname)
//        user_lastname = try values.decodeIfPresent(String.self, forKey: .user_lastname)
//        user_gender = try values.decodeIfPresent(String.self, forKey: .user_gender)
//        user_picture = try values.decodeIfPresent(String.self, forKey: .user_picture)
//        user_picture_id = try values.decodeIfPresent(Int.self, forKey: .user_picture_id)
//        user_cover = try values.decodeIfPresent(String.self, forKey: .user_cover)
//        user_cover_id = try values.decodeIfPresent(String.self, forKey: .user_cover_id)
//        user_verified = try values.decodeIfPresent(Int.self, forKey: .user_verified)
//        user_subscribed = try values.decodeIfPresent(Int.self, forKey: .user_subscribed)
//        user_pinned_post = try values.decodeIfPresent(Int.self, forKey: .user_pinned_post)
//        page_admin = try values.decodeIfPresent(Int.self, forKey: .page_admin)
//        page_category = try values.decodeIfPresent(Int.self, forKey: .page_category)
//        page_name = try values.decodeIfPresent(String.self, forKey: .page_name)
//        page_title = try values.decodeIfPresent(String.self, forKey: .page_title)
//        page_picture = try values.decodeIfPresent(String.self, forKey: .page_picture)
//        page_picture_id = try values.decodeIfPresent(String.self, forKey: .page_picture_id)
//        page_cover = try values.decodeIfPresent(String.self, forKey: .page_cover)
//        page_cover_id = try values.decodeIfPresent(String.self, forKey: .page_cover_id)
//        page_cover_position = try values.decodeIfPresent(String.self, forKey: .page_cover_position)
//        page_album_pictures = try values.decodeIfPresent(String.self, forKey: .page_album_pictures)
//        page_album_covers = try values.decodeIfPresent(String.self, forKey: .page_album_covers)
//        page_album_timeline = try values.decodeIfPresent(Int.self, forKey: .page_album_timeline)
//        page_pinned_post = try values.decodeIfPresent(String.self, forKey: .page_pinned_post)
//        page_verified = try values.decodeIfPresent(Int.self, forKey: .page_verified)
//        page_boosted = try values.decodeIfPresent(Int.self, forKey: .page_boosted)
//        page_boosted_by = try values.decodeIfPresent(String.self, forKey: .page_boosted_by)
//        page_company = try values.decodeIfPresent(String.self, forKey: .page_company)
//        page_phone = try values.decodeIfPresent(String.self, forKey: .page_phone)
//        page_website = try values.decodeIfPresent(String.self, forKey: .page_website)
//        page_location = try values.decodeIfPresent(String.self, forKey: .page_location)
//        page_description = try values.decodeIfPresent(String.self, forKey: .page_description)
//        page_action_text = try values.decodeIfPresent(String.self, forKey: .page_action_text)
//        page_action_color = try values.decodeIfPresent(String.self, forKey: .page_action_color)
//        page_action_url = try values.decodeIfPresent(String.self, forKey: .page_action_url)
//        page_social_facebook = try values.decodeIfPresent(String.self, forKey: .page_social_facebook)
//        page_social_twitter = try values.decodeIfPresent(String.self, forKey: .page_social_twitter)
//        page_social_google = try values.decodeIfPresent(String.self, forKey: .page_social_google)
//        page_social_youtube = try values.decodeIfPresent(String.self, forKey: .page_social_youtube)
//        page_social_instagram = try values.decodeIfPresent(String.self, forKey: .page_social_instagram)
//        page_social_linkedin = try values.decodeIfPresent(String.self, forKey: .page_social_linkedin)
//        page_social_vkontakte = try values.decodeIfPresent(String.self, forKey: .page_social_vkontakte)
//        page_likes = try values.decodeIfPresent(Int.self, forKey: .page_likes)
//        page_date = try values.decodeIfPresent(String.self, forKey: .page_date)
//        group_privacy = try values.decodeIfPresent(String.self, forKey: .group_privacy)
//        group_admin = try values.decodeIfPresent(Int.self, forKey: .group_admin)
//        group_category = try values.decodeIfPresent(Int.self, forKey: .group_category)
//        group_name = try values.decodeIfPresent(String.self, forKey: .group_name)
//        group_title = try values.decodeIfPresent(String.self, forKey: .group_title)
//        group_description = try values.decodeIfPresent(String.self, forKey: .group_description)
//        group_picture = try values.decodeIfPresent(String.self, forKey: .group_picture)
//        group_picture_id = try values.decodeIfPresent(Int.self, forKey: .group_picture_id)
//        group_cover = try values.decodeIfPresent(String.self, forKey: .group_cover)
//        group_cover_id = try values.decodeIfPresent(String.self, forKey: .group_cover_id)
//        group_cover_position = try values.decodeIfPresent(String.self, forKey: .group_cover_position)
//        group_album_pictures = try values.decodeIfPresent(Int.self, forKey: .group_album_pictures)
//        group_album_covers = try values.decodeIfPresent(String.self, forKey: .group_album_covers)
//        group_album_timeline = try values.decodeIfPresent(String.self, forKey: .group_album_timeline)
//        group_pinned_post = try values.decodeIfPresent(String.self, forKey: .group_pinned_post)
//        group_members = try values.decodeIfPresent(Int.self, forKey: .group_members)
//        group_date = try values.decodeIfPresent(String.self, forKey: .group_date)
//        event_privacy = try values.decodeIfPresent(String.self, forKey: .event_privacy)
//        event_admin = try values.decodeIfPresent(Int.self, forKey: .event_admin)
//        event_category = try values.decodeIfPresent(Int.self, forKey: .event_category)
//        event_title = try values.decodeIfPresent(String.self, forKey: .event_title)
//        event_location = try values.decodeIfPresent(String.self, forKey: .event_location)
//        event_description = try values.decodeIfPresent(String.self, forKey: .event_description)
//        event_start_date = try values.decodeIfPresent(String.self, forKey: .event_start_date)
//        event_end_date = try values.decodeIfPresent(String.self, forKey: .event_end_date)
//        event_cover = try values.decodeIfPresent(String.self, forKey: .event_cover)
//        event_cover_id = try values.decodeIfPresent(Int.self, forKey: .event_cover_id)
//        event_cover_position = try values.decodeIfPresent(String.self, forKey: .event_cover_position)
//        event_album_covers = try values.decodeIfPresent(Int.self, forKey: .event_album_covers)
//        event_album_timeline = try values.decodeIfPresent(String.self, forKey: .event_album_timeline)
//        event_pinned_post = try values.decodeIfPresent(String.self, forKey: .event_pinned_post)
//        event_invited = try values.decodeIfPresent(Int.self, forKey: .event_invited)
//        event_interested = try values.decodeIfPresent(Int.self, forKey: .event_interested)
//        event_going = try values.decodeIfPresent(Int.self, forKey: .event_going)
//        event_date = try values.decodeIfPresent(String.self, forKey: .event_date)
//        reactions = try values.decodeIfPresent(Reactions.self, forKey: .reactions)
//        reactions_total_count = try values.decodeIfPresent(Int.self, forKey: .reactions_total_count)
//        author_id = try values.decodeIfPresent(Int.self, forKey: .author_id)
//        is_page_admin = try values.decodeIfPresent(Bool.self, forKey: .is_page_admin)
//        is_group_admin = try values.decodeIfPresent(Bool.self, forKey: .is_group_admin)
//        is_event_admin = try values.decodeIfPresent(Bool.self, forKey: .is_event_admin)
//        post_author_picture = try values.decodeIfPresent(String.self, forKey: .post_author_picture)
//        post_author_url = try values.decodeIfPresent(String.self, forKey: .post_author_url)
//        post_author_name = try values.decodeIfPresent(String.self, forKey: .post_author_name)
//        post_author_verified = try values.decodeIfPresent(Int.self, forKey: .post_author_verified)
//        pinned = try values.decodeIfPresent(Bool.self, forKey: .pinned)
//        manage_post = try values.decodeIfPresent(Bool.self, forKey: .manage_post)
//        i_save = try values.decodeIfPresent(Bool.self, forKey: .i_save)
//        i_react = try values.decodeIfPresent(Bool.self, forKey: .i_react)
//        text_plain = try values.decodeIfPresent(String.self, forKey: .text_plain)
//        og_title = try values.decodeIfPresent(String.self, forKey: .og_title)
//        og_description = try values.decodeIfPresent(String.self, forKey: .og_description)
//        photos_num = try values.decodeIfPresent(Int.self, forKey: .photos_num)
//        photos = try values.decodeIfPresent([Photos].self, forKey: .photos)
//        og_image = try values.decodeIfPresent(String.self, forKey: .og_image)
//        post_comments = try values.decodeIfPresent([Post_comments].self, forKey: .post_comments)
//    }
//
//}
/*
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Posts : Codable {
    let post_id : Int?
    let user_id : Int?
    let user_type : String?
    let page_id : Int?
    let in_group : Int?
    let group_id : String?
    let in_event : Int?
    let event_id : Int?
    let in_wall : Int?
    let wall_id : Int?
    let post_type : String?
    let origin_id : Int?
    let time : String?
    let location : String?
    let privacy : String?
    let text : String?
    let feeling_action : String?
    let feeling_value : String?
    let boosted : Int?
    let boosted_by : String?
    let comments_disabled : Int?
    let reaction_like_count : Int?
    let reaction_love_count : Int?
    let reaction_haha_count : Int?
    let reaction_yay_count : Int?
    let reaction_wow_count : Int?
    let reaction_sad_count : Int?
    let reaction_angry_count : Int?
    let comments : Int?
    let shares : Int?
    let ue_name : String?
    let user_name : String?
    let user_firstname : String?
    let user_lastname : String?
    let user_gender : String?
    let user_picture : String?
    let user_picture_id : Int?
    let user_cover : String?
    let user_cover_id : String?
    let user_verified : Int?
    let user_subscribed : Int?
    let user_pinned_post : Int?
    let page_admin : Int?
    let page_category : Int?
    let page_name : String?
    let page_title : String?
    let page_picture : String?
    let page_picture_id : String?
    let page_cover : String?
    let page_cover_id : String?
    let page_cover_position : String?
    let page_album_pictures : String?
    let page_album_covers : String?
    let page_album_timeline : Int?
    let page_pinned_post : String?
    let page_verified : Int?
    let page_boosted : Int?
    let page_boosted_by : String?
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
    let group_privacy : String?
    let group_admin : String?
    let group_category : String?
    let group_name : String?
    let group_title : String?
    let group_description : String?
    let group_picture : String?
    let group_picture_id : String?
    let group_cover : String?
    let group_cover_id : String?
    let group_cover_position : String?
    let group_album_pictures : String?
    let group_album_covers : String?
    let group_album_timeline : String?
    let group_pinned_post : String?
    let group_members : String?
    let group_date : String?
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
    let event_interested : Int?
    let event_going : Int?
    let event_date : String?
    let reactions : Reactions?
    let reactions_total_count : Int?
    let author_id : Int?
    let is_page_admin : Bool?
    let is_group_admin : Bool?
    let is_event_admin : Bool?
    let post_author_picture : String?
    let post_author_url : String?
    let post_author_name : String?
    let post_author_verified : Int?
    let pinned : Bool?
    let manage_post : Bool?
    let i_save : Bool?
    let i_react : Bool?
    let text_plain : String?
    let og_title : String?
    let og_description : String?
    let photos_num : Int?
    let photos : [Photos]?
    let og_image : String?
    let post_comments : [Post_comments]?
 //   let origin : Origin?

    enum CodingKeys: String, CodingKey {

        case post_id = "post_id"
        case user_id = "user_id"
        case user_type = "user_type"
        case page_id = "page_id"
        case in_group = "in_group"
        case group_id = "group_id"
        case in_event = "in_event"
        case event_id = "event_id"
        case in_wall = "in_wall"
        case wall_id = "wall_id"
        case post_type = "post_type"
        case origin_id = "origin_id"
        case time = "time"
        case location = "location"
        case privacy = "privacy"
        case text = "text"
        case feeling_action = "feeling_action"
        case feeling_value = "feeling_value"
        case boosted = "boosted"
        case boosted_by = "boosted_by"
        case comments_disabled = "comments_disabled"
        case reaction_like_count = "reaction_like_count"
        case reaction_love_count = "reaction_love_count"
        case reaction_haha_count = "reaction_haha_count"
        case reaction_yay_count = "reaction_yay_count"
        case reaction_wow_count = "reaction_wow_count"
        case reaction_sad_count = "reaction_sad_count"
        case reaction_angry_count = "reaction_angry_count"
        case comments = "comments"
        case shares = "shares"
        case ue_name = "ue_name"
        case user_name = "user_name"
        case user_firstname = "user_firstname"
        case user_lastname = "user_lastname"
        case user_gender = "user_gender"
        case user_picture = "user_picture"
        case user_picture_id = "user_picture_id"
        case user_cover = "user_cover"
        case user_cover_id = "user_cover_id"
        case user_verified = "user_verified"
        case user_subscribed = "user_subscribed"
        case user_pinned_post = "user_pinned_post"
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
        case group_privacy = "group_privacy"
        case group_admin = "group_admin"
        case group_category = "group_category"
        case group_name = "group_name"
        case group_title = "group_title"
        case group_description = "group_description"
        case group_picture = "group_picture"
        case group_picture_id = "group_picture_id"
        case group_cover = "group_cover"
        case group_cover_id = "group_cover_id"
        case group_cover_position = "group_cover_position"
        case group_album_pictures = "group_album_pictures"
        case group_album_covers = "group_album_covers"
        case group_album_timeline = "group_album_timeline"
        case group_pinned_post = "group_pinned_post"
        case group_members = "group_members"
        case group_date = "group_date"
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
        case reactions = "reactions"
        case reactions_total_count = "reactions_total_count"
        case author_id = "author_id"
        case is_page_admin = "is_page_admin"
        case is_group_admin = "is_group_admin"
        case is_event_admin = "is_event_admin"
        case post_author_picture = "post_author_picture"
        case post_author_url = "post_author_url"
        case post_author_name = "post_author_name"
        case post_author_verified = "post_author_verified"
        case pinned = "pinned"
        case manage_post = "manage_post"
        case i_save = "i_save"
        case i_react = "i_react"
        case text_plain = "text_plain"
        case og_title = "og_title"
        case og_description = "og_description"
        case photos_num = "photos_num"
        case photos = "photos"
        case og_image = "og_image"
        case post_comments = "post_comments"
      //  case origin = "origin"

    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        post_id = try values.decodeIfPresent(Int.self, forKey: .post_id)
        user_id = try values.decodeIfPresent(Int.self, forKey: .user_id)
        user_type = try values.decodeIfPresent(String.self, forKey: .user_type)
        page_id = try values.decodeIfPresent(Int.self, forKey: .page_id)
        in_group = try values.decodeIfPresent(Int.self, forKey: .in_group)
        group_id = try values.decodeIfPresent(String.self, forKey: .group_id)
        in_event = try values.decodeIfPresent(Int.self, forKey: .in_event)
        event_id = try values.decodeIfPresent(Int.self, forKey: .event_id)
        in_wall = try values.decodeIfPresent(Int.self, forKey: .in_wall)
        wall_id = try values.decodeIfPresent(Int.self, forKey: .wall_id)
        post_type = try values.decodeIfPresent(String.self, forKey: .post_type)
        origin_id = try values.decodeIfPresent(Int.self, forKey: .origin_id)
        time = try values.decodeIfPresent(String.self, forKey: .time)
        location = try values.decodeIfPresent(String.self, forKey: .location)
        privacy = try values.decodeIfPresent(String.self, forKey: .privacy)
        text = try values.decodeIfPresent(String.self, forKey: .text)
        feeling_action = try values.decodeIfPresent(String.self, forKey: .feeling_action)
        feeling_value = try values.decodeIfPresent(String.self, forKey: .feeling_value)
        boosted = try values.decodeIfPresent(Int.self, forKey: .boosted)
        boosted_by = try values.decodeIfPresent(String.self, forKey: .boosted_by)
        comments_disabled = try values.decodeIfPresent(Int.self, forKey: .comments_disabled)
        reaction_like_count = try values.decodeIfPresent(Int.self, forKey: .reaction_like_count)
        reaction_love_count = try values.decodeIfPresent(Int.self, forKey: .reaction_love_count)
        reaction_haha_count = try values.decodeIfPresent(Int.self, forKey: .reaction_haha_count)
        reaction_yay_count = try values.decodeIfPresent(Int.self, forKey: .reaction_yay_count)
        reaction_wow_count = try values.decodeIfPresent(Int.self, forKey: .reaction_wow_count)
        reaction_sad_count = try values.decodeIfPresent(Int.self, forKey: .reaction_sad_count)
        reaction_angry_count = try values.decodeIfPresent(Int.self, forKey: .reaction_angry_count)
        comments = try values.decodeIfPresent(Int.self, forKey: .comments)
        shares = try values.decodeIfPresent(Int.self, forKey: .shares)
        ue_name = try values.decodeIfPresent(String.self, forKey: .ue_name)
        user_name = try values.decodeIfPresent(String.self, forKey: .user_name)
        user_firstname = try values.decodeIfPresent(String.self, forKey: .user_firstname)
        user_lastname = try values.decodeIfPresent(String.self, forKey: .user_lastname)
        user_gender = try values.decodeIfPresent(String.self, forKey: .user_gender)
        user_picture = try values.decodeIfPresent(String.self, forKey: .user_picture)
        user_picture_id = try values.decodeIfPresent(Int.self, forKey: .user_picture_id)
        user_cover = try values.decodeIfPresent(String.self, forKey: .user_cover)
        user_cover_id = try values.decodeIfPresent(String.self, forKey: .user_cover_id)
        user_verified = try values.decodeIfPresent(Int.self, forKey: .user_verified)
        user_subscribed = try values.decodeIfPresent(Int.self, forKey: .user_subscribed)
        user_pinned_post = try values.decodeIfPresent(Int.self, forKey: .user_pinned_post)
        page_admin = try values.decodeIfPresent(Int.self, forKey: .page_admin)
        page_category = try values.decodeIfPresent(Int.self, forKey: .page_category)
        page_name = try values.decodeIfPresent(String.self, forKey: .page_name)
        page_title = try values.decodeIfPresent(String.self, forKey: .page_title)
        page_picture = try values.decodeIfPresent(String.self, forKey: .page_picture)
        page_picture_id = try values.decodeIfPresent(String.self, forKey: .page_picture_id)
        page_cover = try values.decodeIfPresent(String.self, forKey: .page_cover)
        page_cover_id = try values.decodeIfPresent(String.self, forKey: .page_cover_id)
        page_cover_position = try values.decodeIfPresent(String.self, forKey: .page_cover_position)
        page_album_pictures = try values.decodeIfPresent(String.self, forKey: .page_album_pictures)
        page_album_covers = try values.decodeIfPresent(String.self, forKey: .page_album_covers)
        page_album_timeline = try values.decodeIfPresent(Int.self, forKey: .page_album_timeline)
        page_pinned_post = try values.decodeIfPresent(String.self, forKey: .page_pinned_post)
        page_verified = try values.decodeIfPresent(Int.self, forKey: .page_verified)
        page_boosted = try values.decodeIfPresent(Int.self, forKey: .page_boosted)
        page_boosted_by = try values.decodeIfPresent(String.self, forKey: .page_boosted_by)
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
        group_privacy = try values.decodeIfPresent(String.self, forKey: .group_privacy)
        group_admin = try values.decodeIfPresent(String.self, forKey: .group_admin)
        group_category = try values.decodeIfPresent(String.self, forKey: .group_category)
        group_name = try values.decodeIfPresent(String.self, forKey: .group_name)
        group_title = try values.decodeIfPresent(String.self, forKey: .group_title)
        group_description = try values.decodeIfPresent(String.self, forKey: .group_description)
        group_picture = try values.decodeIfPresent(String.self, forKey: .group_picture)
        group_picture_id = try values.decodeIfPresent(String.self, forKey: .group_picture_id)
        group_cover = try values.decodeIfPresent(String.self, forKey: .group_cover)
        group_cover_id = try values.decodeIfPresent(String.self, forKey: .group_cover_id)
        group_cover_position = try values.decodeIfPresent(String.self, forKey: .group_cover_position)
        group_album_pictures = try values.decodeIfPresent(String.self, forKey: .group_album_pictures)
        group_album_covers = try values.decodeIfPresent(String.self, forKey: .group_album_covers)
        group_album_timeline = try values.decodeIfPresent(String.self, forKey: .group_album_timeline)
        group_pinned_post = try values.decodeIfPresent(String.self, forKey: .group_pinned_post)
        group_members = try values.decodeIfPresent(String.self, forKey: .group_members)
        group_date = try values.decodeIfPresent(String.self, forKey: .group_date)
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
        reactions = try values.decodeIfPresent(Reactions.self, forKey: .reactions)
        reactions_total_count = try values.decodeIfPresent(Int.self, forKey: .reactions_total_count)
        author_id = try values.decodeIfPresent(Int.self, forKey: .author_id)
        is_page_admin = try values.decodeIfPresent(Bool.self, forKey: .is_page_admin)
        is_group_admin = try values.decodeIfPresent(Bool.self, forKey: .is_group_admin)
        is_event_admin = try values.decodeIfPresent(Bool.self, forKey: .is_event_admin)
        post_author_picture = try values.decodeIfPresent(String.self, forKey: .post_author_picture)
        post_author_url = try values.decodeIfPresent(String.self, forKey: .post_author_url)
        post_author_name = try values.decodeIfPresent(String.self, forKey: .post_author_name)
        post_author_verified = try values.decodeIfPresent(Int.self, forKey: .post_author_verified)
        pinned = try values.decodeIfPresent(Bool.self, forKey: .pinned)
        manage_post = try values.decodeIfPresent(Bool.self, forKey: .manage_post)
        i_save = try values.decodeIfPresent(Bool.self, forKey: .i_save)
        i_react = try values.decodeIfPresent(Bool.self, forKey: .i_react)
        text_plain = try values.decodeIfPresent(String.self, forKey: .text_plain)
        og_title = try values.decodeIfPresent(String.self, forKey: .og_title)
        og_description = try values.decodeIfPresent(String.self, forKey: .og_description)
        photos_num = try values.decodeIfPresent(Int.self, forKey: .photos_num)
        photos = try values.decodeIfPresent([Photos].self, forKey: .photos)
        og_image = try values.decodeIfPresent(String.self, forKey: .og_image)
        post_comments = try values.decodeIfPresent([Post_comments].self, forKey: .post_comments)
       // origin = try values.decodeIfPresent(Origin.self, forKey: .origin)

    }

}
