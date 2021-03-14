
import Foundation
struct ExperiencesModel : Codable{
	let s_no : Int?
	let user_id : Int?
	let user_work_title : String?
	let user_work_place : String?
	let user_work_url : String?
	let user_work_from_date : String?
	let user_work_to_date : String?
	let user_work_present : Int?
	let exp_id : Int?

	enum CodingKeys: String, CodingKey {

		case s_no = "s_no"
		case user_id = "user_id"
		case user_work_title = "user_work_title"
		case user_work_place = "user_work_place"
		case user_work_url = "user_work_url"
		case user_work_from_date = "user_work_from_date"
		case user_work_to_date = "user_work_to_date"
		case user_work_present = "user_work_present"
		case exp_id = "exp_id"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		s_no = try values.decodeIfPresent(Int.self, forKey: .s_no)
		user_id = try values.decodeIfPresent(Int.self, forKey: .user_id)
		user_work_title = try values.decodeIfPresent(String.self, forKey: .user_work_title)
		user_work_place = try values.decodeIfPresent(String.self, forKey: .user_work_place)
		user_work_url = try values.decodeIfPresent(String.self, forKey: .user_work_url)
		user_work_from_date = try values.decodeIfPresent(String.self, forKey: .user_work_from_date)
		user_work_to_date = try values.decodeIfPresent(String.self, forKey: .user_work_to_date)
		user_work_present = try values.decodeIfPresent(Int.self, forKey: .user_work_present)
		exp_id = try values.decodeIfPresent(Int.self, forKey: .exp_id)
	}

}
