//
//  Enums.swift
//  Al-Anon
//
//  Created by Rnf-Yogita on 12/12/19.
//  Copyright © 2019 Rnf-Yogita. All rights reserved.
//

import Foundation

enum Gender: String {
    case Male = "Male"
    case Female = "Female"
    case Others = "Other"
    case NotDisclose = "not_disclosed"
}

enum OtpType : Int
{
    case Login = 0
    case ForgotPass = 1
    case Register = 2
 }

enum Language : String
{
    case English = "en"
    case Spanish = "es"
    case French = "fr"
}

enum LanguageSymbol : String
{
    case en = "English"
    case es = "Spanish"
    case fr = "French"
}
