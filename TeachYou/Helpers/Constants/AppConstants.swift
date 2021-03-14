//
//  WebServiceConstants.swift
//

import Foundation
import  UIKit

struct AppConstants {
    static let googleApiKey = ""
    static let kAppName = "TeachYou"
    static let BASE_URL = "https://teachyou.in/androidApi.php"
    static let BASE_UPDATE_URL = "https://teachyou.in/content/uploads/"
    static let BASE_TOPIC_UPLOAD_URL = "http://teachyou.in/content/uploads/quotes"
    static let BASE_TRENDING_UPLOAD_URL = "http://teachyou.in/content/uploads/trending"
    static let BASE_PAGE_UPDATE_URL = "http://teachyou.in/contents/uploads"
    
    static let SCREEN_WIDTH     =   UIScreen.main.bounds.width
    static let SCREEN_HEIGHT    =   UIScreen.main.bounds.height
}

struct Zoom{
    static let kSDKAppKey  = "Hfp0NG4PqJgeKplhO26guQnpaF3OBDo2GJET"
    static let kSDKAppSecret = "loayYuaXYjGxnYgTJcSX7y3ubb4gQFXpzXhW"
    static let kSDKDomain = "zoom.us"
}
//Apoorva
struct BoolValue {
    static var isFromEditPost = false
}
struct ProfileAboutString {
    static var edu_ActionType = ""
    static var exp_ActionType = ""
    static var edu_Present = 0
    static var exp_Present = 0
    static var isFromProfile = false
    static var isFirstTimeBottomConstraint = false


}
struct ImageString {
    static var image = "Image"
    static let video = "Video"
}
//Apoorva

struct UserDefaultKey {
    static let displayImage = "displayImage"
    static let isLogin = "isLogin"
    static let token = "token"
    static let isSubscribed = "isSubscribed"
    static let language = "language"
    static let email = "email"
    static let displayname = "displayname"
    static let avatar = "avatar"
    static let dob = "dob"
    static let alAnonBirthday = "alAnonBirthday"
    static let notifications = "notifications"
    static let visibility = "visibility"
    static let phone = "phone"
    static let countryCode = "countryCode"
    static let userId = "userId"
    static let expirationDate = "expirationDate"
    static let reason = "reason"
    static let reciept = "reciept"

    public static let kAlAnon_InApp_Purchased_Premium_Content = "AlAnon_InApp_Purchased_Premium_Content"

}

struct Messages{
    static let kForgotPassDialog = LocalizationSystem.sharedInstance.localizedStringForKey(key: "ForgotPass_Dialog", comment: "")
    static let kYes = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Yes", comment: "")
    static let kNo = LocalizationSystem.sharedInstance.localizedStringForKey(key: "No", comment: "")
    static let kLogout = LocalizationSystem.sharedInstance.localizedStringForKey(key: "logoutMsg", comment: "")
    
    static let kSelect_Gender = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Select_Gender", comment: "")
    static let kSelect_Language = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Select_language", comment: "")
    static let kSelect_visibility = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Select_visibility", comment: "")
    static let kSelect_Profile_Visibility = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Select_Profile_Visibility", comment: "")

    static let kUpload_Image = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Upload_Image", comment: "")
    static let kCancel = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Cancel", comment: "")
    static let kTake_Picture = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Take_Picture", comment: "")
    static let kChoose_Existing = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Choose_Existing", comment: "")
    static let kPostPlaceholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "postPlaceholder", comment: "")
    static let kFeelingTitle = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Feeling_Title", comment: "")
    static let kIsFeeling = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Is_feeling", comment: "")
    static let kDeletePost = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Delete_post", comment: "")
     static let kDeleteJournal = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Delete_Journal", comment: "")
    static let kDeleteAccount = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Delete_account", comment: "")
    static let kChangePassword = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Change_Password", comment: "")
    static let kInvalid_Date_Entry = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Invalid_Date_Entry", comment: "")
    static let kYour_Old_Phone_Number_Is = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Your_Old_Phone_Number_Is", comment: "")
    static let kJournalTitlePlaceholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "journalTitlePlaceholder", comment: "")
    static let kJournalTitleInvalid = LocalizationSystem.sharedInstance.localizedStringForKey(key: "journalTitleInvalid", comment: "")
    static let kJournalDescriptionPlaceholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "journalDescriptionPlaceholder", comment: "")
    static let kJournalDescriptionInvalid = LocalizationSystem.sharedInstance.localizedStringForKey(key: "journalDescriptionInvalid", comment: "")
    static let kSelect_Attachment = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Select_Attachment", comment: "")
    static let kAddDescription = LocalizationSystem.sharedInstance.localizedStringForKey(key: "add_description", comment: "")
    static let kDisconnect =  LocalizationSystem.sharedInstance.localizedStringForKey(key: "Disconnect_Message", comment: "")
    static let kReject =  LocalizationSystem.sharedInstance.localizedStringForKey(key: "Reject_Message", comment: "")
    static let kfriend_Request_Message = LocalizationSystem.sharedInstance.localizedStringForKey(key: "friend_Request_Message", comment: "")
    static let ksubscription_exp = LocalizationSystem.sharedInstance.localizedStringForKey(key: "subscription_exp", comment: "")
    static let kDeviceWithNoCamera = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kDeviceWithNoCamera", comment: "")
}

struct DateFormatterConstant{
    static let kdateyyy_MM_dd_Thh_mm_SSS_Z = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
    static let kdatedd_mm_yyyy = "dd/MM/yyyy"
    static let kyyyy_MM_dd_HH_mm_ss = "yyyy-MM-dd HH:mm:ss"
    static let kyyyy_MM_dd_HH_mm = "yyyy-MM-dd HH:mm"
    static let kMMM_d_yyyy = "MMM d, yyyy"
    static let kHHmm = "HH:mm"
    static let kMM_dd_yyyy = "MM/dd/yyyy"
    static let kyyyy_MM_dd = "yyyy-MM-dd"
    static let kdd = "dd"
    static let kMMM = "MMM"
    static let kmm = "MM"
    static let kyyyy = "YYYY"
    static let kMMM_dd_HH_mm = "MMM dd, HH:mm"
    static let kHMMM_dd_yyyy_H_mm_aaa = "MMM dd, yyyy - HH:mm aaa"
    static let kyyyy_MM_dd_HH_mm_Z = "yyyy-MM-dd HH:mm.SSS'Z'"
    static let kdateyyyy_mm_dd = "yyyy/MM/dd"


}

struct NotificationName{
    static let kNotificationReloadPosts = "ReloadPosts"
    static let kNotificationReloadJournals = "ReloadJournals"
    static let kNotificationReloadMeetings = "ReloadMeetings"
    static let kBackground = "Background"
    static let kForeground = "Foreground"
    static let kRefreshConnectStatus = "RefreshConnectStatus"
    static let kNotificationReloadNotifications = "ReloadNotifications"
}


struct MeetingConstant{
    static let kMeetingBufferTime = 15
    static let kMeetingStartBufferTime = 15

}

struct VCTitleConstants {
    static let subscription = ""
}


enum ProfileHeadings: String {
    case discussion       = "Discussion"
    case about            = "About"
    case articles         = "Articles"
    case events           = "Events"
    case friends          = "Friends"
    case photos           = "Photos"
    case videos           = "Videos"
    
    var value: String{
        return self.rawValue
    }
    
}

enum ProfileHeadingsImages: String {
    case discussion       = "user"
    case about            = "search"
    case articles         = "book"
    case events           = "calendar"
    case friends          = "friend"
    case photos           = "photo"
    case videos           = "video"
    
    var value: String{
        return self.rawValue
    }
    
}
