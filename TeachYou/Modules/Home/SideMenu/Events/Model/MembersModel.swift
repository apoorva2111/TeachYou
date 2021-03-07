/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
import SwiftyJSON

struct MembersModel : Codable {
    let user_id : Int?
    let user_name : String?
    let user_firstname : String?
    let user_lastname : String?
    let user_gender : String?
    let user_picture : String?
    let user_subscribed : Int?
    let user_verified : Int?

    init() {
        self.init(withJSON: JSON())
    }
    
    init(withJSON json : JSON){
        user_id = json["user_id"].intValue
        user_name = json["user_name"].stringValue
        user_firstname = json["user_firstname"].stringValue
        user_lastname = json["user_lastname"].stringValue
        user_gender = json["user_gender"].stringValue
        user_picture = json["user_picture"].stringValue
        user_subscribed = json["user_subscribed"].intValue
        user_verified = json["user_verified"].intValue
        
    }

}

enum MemberType:String{
    case kGoing = "People Who Are Going"
    case kInterested = "People Who Have Interested"
    case kInvited = "People Who Have Invited"
}
