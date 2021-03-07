//
//  UserSessionManager.swift
//

import UIKit

class UserSessionManager {
    
    static let shared = UserSessionManager()
    let userDefaults = UserDefaults.standard

    private init() {}
  
    
    // MARK:- Setting and Getting isLogin
    func setIsLogin(value:Bool?){
        userDefaults.set(value, forKey: UserDefaultKey.isLogin)
        userDefaults.synchronize()
    }
    
    func getIsLogin()->Bool?{
        if let userInfo = userDefaults.value(forKey: UserDefaultKey.isLogin){
            return userInfo as? Bool
        }else{
            return false
        }
    }
    
    // MARK:- Setting and Getting avatar
      func setAvatar(value:String?){
          userDefaults.set(value, forKey: UserDefaultKey.avatar)
          userDefaults.synchronize()
      }
      
      func getAvatar()->String?{
          if let userInfo = userDefaults.value(forKey: UserDefaultKey.avatar){
              return userInfo as? String
          }else{
              return ""
          }
      }
    func getImage()->String?{
        if let userInfo = userDefaults.value(forKey: UserDefaultKey.displayImage){
            return userInfo as? String
        }else{
            return ""
        }
    }
    // MARK:- Setting and Getting userId
    func setUserId(value:String?){
        userDefaults.set(value, forKey: UserDefaultKey.userId)
        userDefaults.synchronize()
    }
    
    func getUserId()->String?{
        if let userInfo = userDefaults.value(forKey: UserDefaultKey.userId){
            return userInfo as? String
        }else{
            return ""
        }
    }
      
    
    // MARK:- Setting and Getting Token
    func setToken(value:String?){
        userDefaults.set(value, forKey: UserDefaultKey.token)
        userDefaults.synchronize()
    }
    
    func getToken()->String?{
        if let userInfo = userDefaults.value(forKey: UserDefaultKey.token){
            return userInfo as? String
        }else{
            return ""
        }
    }
    
    // MARK:- Setting and Getting Token
       func setSubscribedUser(value:Bool?){
           userDefaults.set(value, forKey: UserDefaultKey.isSubscribed)
           userDefaults.synchronize()
       }
       
       func getSubscribedUser()->Bool?{
           if let userInfo = userDefaults.value(forKey: UserDefaultKey.isSubscribed){
               return userInfo as? Bool
           }else{
               return false
           }
       }
    
    // MARK:- Setting and Getting Expiration Date
       func setExpirationDate(value:String?){
           userDefaults.set(value, forKey: UserDefaultKey.expirationDate)
           userDefaults.synchronize()
       }
       
       func getExpirationDate()->String?{
           if let userInfo = userDefaults.value(forKey: UserDefaultKey.expirationDate){
               return userInfo as? String
           }else{
               return ""
           }
       }
    
    // MARK:- Setting and Getting Subsription Cancel Reason
          func setSubscriptionReason(value:String?){
              userDefaults.set(value, forKey: UserDefaultKey.reason)
              userDefaults.synchronize()
          }
          
          func getSubscriptionReason()->String?{
              if let userInfo = userDefaults.value(forKey: UserDefaultKey.reason){
                  return userInfo as? String
              }else{
                  return ""
              }
          }
    
    // MARK:- Setting and Getting Receipt
          func setReciept(value:String?){
              userDefaults.set(value, forKey: UserDefaultKey.reason)
              userDefaults.synchronize()
          }
          
          func getReceipt()->String?{
              if let userInfo = userDefaults.value(forKey: UserDefaultKey.reason){
                  return userInfo as? String
              }else{
                  return ""
              }
          }
    
    
    // MARK:- Setting and Getting Email
       func setEmail(value:String?){
           userDefaults.set(value, forKey: UserDefaultKey.email)
           userDefaults.synchronize()
       }
       
       func getEmail()->String?{
           if let userInfo = userDefaults.value(forKey: UserDefaultKey.email){
               return userInfo as? String
           }else{
               return ""
           }
       }
    
    // MARK:- Setting and Getting Displayname
    func setName(value:String?){
        userDefaults.set(value, forKey: UserDefaultKey.displayname)
        userDefaults.synchronize()
    }
    
    func getName()->String?{
        if let userInfo = userDefaults.value(forKey: UserDefaultKey.displayname){
            return userInfo as? String
        }else{
            return ""
        }
    }
    
    // MARK:- Setting and Getting Language
    func setLanguage(value:String?){
        userDefaults.set(value, forKey: UserDefaultKey.language)
        userDefaults.synchronize()
    }
    
    func getLanguage()->String?{
        if let userInfo = userDefaults.value(forKey: UserDefaultKey.language){
            return userInfo as? String
        }else{
            return "en"
        }
    }
    
    
    // MARK:- Setting and Getting DOB
    func setDOB(value:String?){
        userDefaults.set(value, forKey: UserDefaultKey.dob)
        userDefaults.synchronize()
    }
    
    func getDOB()->String?{
        if let userInfo = userDefaults.value(forKey: UserDefaultKey.dob){
            return userInfo as? String
        }else{
            return ""
        }
    }
    
    // MARK:- Setting and Getting Al-Anon Birthday
    func setAlAnonBirthday(value:String?){
        userDefaults.set(value, forKey: UserDefaultKey.alAnonBirthday)
        userDefaults.synchronize()
    }
    
    func getAlAnonBirthday()->String?{
        if let userInfo = userDefaults.value(forKey: UserDefaultKey.alAnonBirthday){
            return userInfo as? String
        }else{
            return ""
        }
    }
    
    // MARK:- Setting and Getting Searchable
    func setNotifications(value:Bool?){
        userDefaults.set(value, forKey: UserDefaultKey.notifications)
        userDefaults.synchronize()
    }
    
    func getNotifications()->Bool?{
        if let userInfo = userDefaults.value(forKey: UserDefaultKey.notifications){
            return userInfo as? Bool
        }else{
            return true
        }
    }
    
    // MARK:- Setting and Getting Phoneno
    func setPhoneNo(value:String?){
        userDefaults.set(value, forKey: UserDefaultKey.phone)
        userDefaults.synchronize()
    }
    
    func getPhoneNo()->String?{
        if let userInfo = userDefaults.value(forKey: UserDefaultKey.phone){
            return userInfo as? String
        }else{
            return ""
        }
    }
    
    // MARK:- Setting and Getting Countrycode
       func setCountryCode(value:String?){
           userDefaults.set(value, forKey: UserDefaultKey.countryCode)
           userDefaults.synchronize()
       }
       
       func getCountryCode()->String?{
           if let userInfo = userDefaults.value(forKey: UserDefaultKey.countryCode){
               return userInfo as? String
           }else{
               return ""
           }
       }
    
    // MARK:- Setting and Getting Visibility
    func setVisibility(value:Bool?){
        userDefaults.set(value, forKey: UserDefaultKey.visibility)
        userDefaults.synchronize()
    }
    
    func getVisibility()->Bool?{
        if let userInfo = userDefaults.value(forKey: UserDefaultKey.visibility){
            return userInfo as? Bool
        }else{
            return true
        }
    }
   
    func removedata()
    {
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
    }
    
}
