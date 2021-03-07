//
//  URLConstants.swift
//

import Foundation

enum URLConstants {
    
    case login
    case signUp
    case validatephone
    case logout
    case verifyphone
    case verifyphonecode
    case verifyloginotp
    case forgotpassword
    case confirmotp
    case updatepassword
    case validateregistrationdata
    case feelings
    case searchUser
    case createPost
    case newsFeed
    case getPost
    case deletePost
    case editProfile
    case changePassword
    case deactivateaccount
    case requestphonechange
    case changephone
    case getCategories
    case meetingList
    case updateconfigurations
    case searchMeetings
    case usertoken
    case endMeeting
    case myTimeline
    case journal
    case updateJournal
    case connectUser
    case disconnectUSer
    case userProfile
    case chatInbox
    case friendsPost
    case eventByDate
    case notificationList
    case virtualtour
    case subscribeuser
    case subscriptiondetails
    case subscribedContent
    case donations
    case pendingRequests

    func urlString() -> String {
        
        let urlString : String
        
        switch self {
        case .login:
            urlString = Utilities.baseUrl() + ""
        case .logout:
            urlString = Utilities.baseUrl() + "me/logout"
        case .verifyphone:
            urlString = Utilities.baseUrl() + "me/verify-phone"
        case .verifyphonecode:
            urlString = Utilities.baseUrl() + "me/verify-phone-code"
        case .verifyloginotp:
            urlString = Utilities.baseUrl() + "me/verify-login-otp"
        case .forgotpassword:
            urlString = Utilities.baseUrl() + "users/forgot-password"
        case .confirmotp:
            urlString = Utilities.baseUrl() + "users/confirm-otp"
        case .updatepassword:
            urlString = Utilities.baseUrl() + "users/update-password"
        case .signUp:
            urlString = Utilities.baseUrl() + ""
        case .validatephone:
            urlString = Utilities.baseUrl() + "users/validate-phone-displayname"
        case .validateregistrationdata:
            urlString = Utilities.baseUrl() + "users/validate-registration-data"
        case .feelings:
            urlString = Utilities.baseUrl() + "post/feelings"
        case .searchUser:
            urlString = Utilities.baseUrl() + "users/search-users"
        case .createPost:
            urlString = Utilities.baseUrl() + "me/post"
        case .newsFeed:
            urlString = Utilities.baseUrl() + "post/news-feed"
        case .getPost:
            urlString = Utilities.baseUrl() + "me/post"
        case .deletePost:
            urlString = Utilities.baseUrl() + "me/post"
        case .myTimeline:
            urlString = Utilities.baseUrl() + "post/my-timeline"
        case .editProfile:
            urlString = Utilities.baseUrl() + "me/update-profile"
        case .changePassword:
            urlString = Utilities.baseUrl() + "me/change-password"
        case .deactivateaccount:
            urlString = Utilities.baseUrl() + "me/deactivate-account"
        case .requestphonechange:
            urlString = Utilities.baseUrl() + "me/request-phone-change"
        case .changephone:
            urlString = Utilities.baseUrl() + "me/change-phone"
        case .getCategories:
            urlString = Utilities.baseUrl() + "meetings/category"
        case .meetingList:
            urlString = Utilities.baseUrl() + "meetings"
        case .updateconfigurations:
            urlString = Utilities.baseUrl() + "me/update-configurations"
        case .searchMeetings:
            urlString = Utilities.baseUrl() + "meetings/search"
        case .usertoken:
            urlString = Utilities.baseUrl() + "meetings/user-token"
        case .endMeeting:
            urlString = Utilities.baseUrl() + "meetings/end-meeting"
        case .journal:
            urlString = Utilities.baseUrl() + "me/journal"
        case .updateJournal:
            urlString = Utilities.baseUrl() + "me/journal/update"
        case .connectUser:
            urlString = Utilities.baseUrl() + "me/connect"
        case .disconnectUSer:
            urlString = Utilities.baseUrl() + "me/connect/disconnect"
        case .userProfile:
            urlString = Utilities.baseUrl() + "users"
        case .chatInbox:
            urlString = Utilities.baseUrl() + "me/connect/inbox"
        case .friendsPost:
            urlString = Utilities.baseUrl() + "post/friends"
        case .eventByDate:
            urlString = Utilities.baseUrl() + "post/events-list"
        case .notificationList:
            urlString = Utilities.baseUrl() + "me/notifications"
        case .virtualtour:
            urlString = Utilities.baseUrl() + "me/virtual-tour"
        case .subscribeuser:
            urlString = Utilities.baseUrl() + "me/subscribe-user"
        case .subscriptiondetails:
            urlString = Utilities.baseUrl() + "me/subscription-details"
        case .subscribedContent:
            urlString = Utilities.baseUrl() + "me/subscribed-content"
        case .donations:
            urlString = Utilities.baseUrl() + "me/donations"
        case .pendingRequests:
            urlString = Utilities.baseUrl() + "me/connect/pending-requests"
        }
        
        return urlString
    }
}



