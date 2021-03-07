//
//  ValidationConstants.swift
//  Al-Anon
//
//  Created by Rnf-Yogita on 15/12/19.
//  Copyright © 2019 Rnf-Yogita. All rights reserved.
//

import Foundation

struct Validation {
    
    static let kOK = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Ok", comment: "")
    
    static let kPasswordRequired = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Password_required", comment: "")
    
    static let kFirstnameRequired = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Firstname_required", comment: "")
    
    static let kPasswordInvalid = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Password_invalid", comment: "")
    
    static let kInvalidOTP = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Invalid_OTP", comment: "")
    
    static let kInvalidFirstname = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Invalid_Firstname", comment: "")
    
    static let kLastnameRequired = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Lastname_Required", comment: "")
    
    static let kInvalidLastname = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Invalid_Lastname", comment: "")
    
    static let kDisplaynameRequired = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Displayname_Required", comment: "")
    
    static let kInvalidDisplayname = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Invalid_Displayname", comment: "")
    
    static let kUsernameRequired = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Username_Required", comment: "")
    
    static let kInvalidUsername = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Invalid_Username", comment: "")
    
    static let kGenderRequired = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Gender_Required", comment: "")
    
    static let kLanguageRequired = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Language_Required", comment: "")
    
    static let kDobRequired = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Dob_Required", comment: "")
    
    static let kFieldsRequired = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Fields_Required", comment: "")
    
    static let kPhone_Required = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Phone_Required", comment: "")
    
    static let kPhoneInvalid = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Phone_Invalid", comment: "")
    
    static let kCountrycodeRequired = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Countrycode_Required", comment: "")
    
    static let kCountrycodeInvalid = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Countrycode_Invalid", comment: "")
    
    static let kConfirmPassRequired = LocalizationSystem.sharedInstance.localizedStringForKey(key: "ConfirmPass_Required", comment: "")
    
    static let kConfirmPassInvalid = LocalizationSystem.sharedInstance.localizedStringForKey(key: "ConfirmPass_Invalid", comment: "")
    
    static let kOldPassInvalid = LocalizationSystem.sharedInstance.localizedStringForKey(key: "OldPass_Invalid", comment: "")
    
    static let kOldPassRequired = LocalizationSystem.sharedInstance.localizedStringForKey(key: "OldPass_Required", comment: "")
    
    static let kEmailRequiredd = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Email_Required", comment: "")
    
    static let kEmailInvalid = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Email_Invalid", comment: "")
    
    static let kSelectGender = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Select_Gender", comment: "")
    
    static let kIsMemberText = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Is_Member_Text", comment: "")

    static let kDescriptionRequired = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Empty_Post_description", comment: "")

    static let kErrorSendingMessage = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Error_Sending_Message", comment: "")
    
    static let kPostalcodeRequired = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Postalcode_Required", comment: "")
    
    static let kPostalcodeInvalid = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Postalcode_Invalid", comment: "")
    
    static let kFullnameRequired = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Fullname_Required", comment: "")
    
    static let kInvalidFullname = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Invalid_Fullname", comment: "")
    
    static let kEvent_Added = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Event_Added", comment: "")
    
    static let kEvent_Discarded = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Event_Discarded", comment: "")
    
    static let kEvent_Deleted = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kEvent_Deleted", comment: "")
    
    static let subsriptionVCTitle = LocalizationSystem.sharedInstance.localizedStringForKey(key: "ksubsriptionVCTitle", comment: "")

    static let subscriptionContentRetrievalFail = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kContentRetrievalFail", comment: "")
    
    static let subscriptionProductIdFail = LocalizationSystem.sharedInstance.localizedStringForKey(key: "ksubscriptionProductIdFail", comment: "")

    static let subscriptionPurchaseFail = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kPurchaseDisabled", comment: "")
    
    static let purchaseRestored = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kPurchaseRestored", comment: "")

    static let purchaseBought = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kPurchaseBought", comment: "")
    
    static let kSearchPlaceholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kSearchPlaceholder", comment: "")
    
    static let kShowLessPlaceholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kShowlessPlaceholder", comment: "")
    
    static let kEditPlaceholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kEditPlaceholder", comment: "")
    
    static let kNewJournalPlaceholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kNewJournalPlaceholder", comment: "")
    
    static let kDeletePlaceholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kDeletePlaceholder", comment: "")
    
    static let kUserPostsPlaceholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kUserPostsPlaceholder", comment: "")
    
    static let kPostsPlaceholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kPostsPlaceholder", comment: "")
    
    static let kPostPlaceholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kPostPlaceholder", comment: "")
    
    static let kContributions = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kContributions", comment: "")

     static let kContribution = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kContribution", comment: "")
    
    static let kCustomAmountPlaceholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kCustomAmountPlaceholder", comment: "")
    
    static let kSubmitPlaceholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kSubmitPlaceholder", comment: "")
    
    static let kInvalidAmountPlaceholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kInvalidAmount", comment: "")
    
    static let kCancelPlaceholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kCancelPlaceholder", comment: "")
    
    static let kEnterAmountPlaceholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kEnterAmountPlaceholder", comment: "")
    
    static let kSelectAmountPlaceholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kSelectAmountPlaceholder", comment: "")
    
    static let kApplePayAuthorisationFail = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kApplePayAuthorisationFail", comment: "")
    
    static let kApplePayTransactionFail = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kApplePayTransactionFail", comment: "")
    
    static let kNoChatsPlaceholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kNoChatsPlaceholder", comment: "")
    
    static let kChatsTitlePlaceholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kChatsTitlePlaceholder", comment: "")
    
    static let kFriendsTitlePlaceholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kFriendsTitlePlaceholder", comment: "")
    
    static let kRequestsTitlePlaceholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kRequestsTitlePlaceholder", comment: "")
    
    static let kNotificationsTitlePlaceholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kNotificationsTitlePlaceholder", comment: "")
    
    static let kEditTitlePlaceholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kEditTitlePlaceholder", comment: "")
    
    static let kPostsTitlePlaceholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kPostsTitlePlaceholder", comment: "")
    
    static let kJournalsTitlePlaceholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kJournalsTitlePlaceholder", comment: "")
    
    static let kSettingsTitlePlaceholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kSettingsTitlePlaceholder", comment: "")
    
    static let kLogoutBtnPlaceholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kLogoutBtnPlaceholder", comment: "")
    
    static let kPublicPlaceholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kPublicPlaceholder", comment: "")
    
    static let kPrivatePlaceholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kPrivatePlaceholder", comment: "")
    
    static let kNoUsersPlaceholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kNoUsersPlaceholder", comment: "")
    
    static let kWSOPlaceholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kWSOPlaceholder", comment: "")
    
    static let kCalendarPlaceholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kCalendarPlaceholder", comment: "")
    
    static let kHomeTitlePlaceholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kHomeTitlePlaceholder", comment: "")
    
    static let kMeetingsTitlePlaceholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kMeetingsTitlePlaceholder", comment: "")
    
    static let kStartPlaceholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kStartPlaceholder", comment: "")
    
    static let kJoinPlaceholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kJoinPlaceholder", comment: "")
    
    static let kNoMeetingsPlaceholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kNoMeetingsPlaceholder", comment: "")
    
    static let kSelectDayPlaceholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kSelectDayPlaceholder", comment: "")
    
    static let kUnderDevelopmentPlaceholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kUnderDevelopmentPlaceholder", comment: "")
    
    static let kResendOTPPlaceholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kResendOTPPlaceholder", comment: "")
    
    static let kRetryPlaceholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kRetryPlaceholder", comment: "")
    
    static let kLetterSPlaceholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kLetterSPlaceholder", comment: "")
    
    static let kMalePlaceholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kMalePlaceholder", comment: "")
    
    static let kFemalePlaceholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kFemalePlaceholder", comment: "")
    
    static let kOtherPlaceholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kOtherPlaceholder", comment: "")
    
    static let kNotDisclosePlaceholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kNotDisclosePlaceholder", comment: "")
    
    static let kCreatePostPlaceholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kCreatePostPlaceholder", comment: "")
    
    static let kSearchUserPlaceholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kSearchUserPlaceholder", comment: "")
    
    static let kSendPlaceholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kSendPlaceholder", comment: "")
    
    static let kPasswordVisibilityFatalError = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kPasswordVisibilityFatalError", comment: "")
    
    static let kRequiredFieldPlaceholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kRequiredFieldPlaceholder", comment: "")
    
    static let kSelectTimePlaceholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kSelectTimePlaceholder", comment: "")
    
    static let kDOBPlaceholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kDOBPlaceholder", comment: "")
    
    static let kAlAnonBirthdayPlaceholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kAlAnonBirthdayPlaceholder", comment: "")
    
    static let kCameraNotFound = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kCameraNotFound", comment: "")
    
    static let kMomentAgo = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kMomentAgo", comment: "")

    static let kYearAgo = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kYearAgo", comment: "")

    static let kYearsAgo = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kYearsAgo", comment: "")

    static let kMonthAgo = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kMonthAgo", comment: "")

    static let kMonthsAgo = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kMonthsAgo", comment: "")

    static let kDayAgo = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kDayAgo", comment: "")

    static let kDaysAgo = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kDaysAgo", comment: "")

    static let kHourAgo = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kHourAgo", comment: "")

    static let kHoursAgo = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kHoursAgo", comment: "")

    static let kMinAgo = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kMinAgo", comment: "")

    static let kMinsAgo = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kMinsAgo", comment: "")

    static let kSecAgo = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kSecAgo", comment: "")

    static let kSecsAgo = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kSecsAgo", comment: "")
    
    static let kInvalidKeyLength = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kInvalidKeyLength", comment: "")
    
    static let kDecryptionFailed = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kDecryptionFailed", comment: "")
    
    static let kEncryptionFailed = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kEncryptionFailed", comment: "")
    
    static let kDonationRecieved = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kDonationRecieved", comment: "")
    
    static let kNoEventsFound = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kNoEventsFound", comment: "")
    
    static let kAcceptPlaceholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kAcceptPlaceholder", comment: "")
    
    static let kRejectPlaceholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kRejectPlaceholder", comment: "")
    
    static let kDisconnectPlaceholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kDisconnectPlaceholder", comment: "")
    
    static let kChatPlaceholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kChatPlaceholder", comment: "")
    
    static let kRequestedPlaceholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kRequestedPlaceholder", comment: "")
    
    static let kConnectPlaceholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "kConnectPlaceholder", comment: "")
}
