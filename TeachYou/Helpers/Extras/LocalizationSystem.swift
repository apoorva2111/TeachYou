//
//  LocalizationSystem.swift

import Foundation
import UIKit

class LocalizationSystem:NSObject {
    
    var bundle: Bundle!
    
    class var sharedInstance: LocalizationSystem {
        struct Singleton {
            static let instance: LocalizationSystem = LocalizationSystem()
        }
        return Singleton.instance
    }
    
    override init() {
        super.init()
        bundle = Bundle.main
    }
    
    func localizedStringForKey(key:String, comment:String) -> String {
        return bundle.localizedString(forKey: key, value: comment, table: nil)
    }
    
    func localizedImagePathForImg(imagename:String, type:String) -> String {
        guard let imagePath =  bundle.path(forResource: imagename, ofType: type) else {
            return ""
        }
        return imagePath
    }
    
    //MARK:- setLanguage
    // Sets the desired language of the ones you have.
    // If this function is not called it will use the default OS language.
    // If the language does not exists y returns the default OS language.
    
    func setLanguage(languageCode:String, completion: @escaping (_ success : Bool) -> Void) {
//        var appleLanguages = UserDefaults.standard.object(forKey: "AppleLanguages") as! [String]
//        appleLanguages.removeAll()
//        appleLanguages.insert(languageCode, at: 0)
//        UserDefaults.standard.set(appleLanguages, forKey: "AppleLanguages")
//        UserDefaults.standard.synchronize() //needs restart
//
//        if let languageDirectoryPath = Bundle.main.path(forResource: languageCode, ofType: "lproj")  {
//            bundle = Bundle.init(path: languageDirectoryPath)
//            completion(true)
//        } else {
//            resetLocalization()
//            completion(true)
//
//        }
        
//        UserDefaults.standard.set(languageCode, forKey: "AppleLanguage")
//        AppDelegate.getAppDelegate().currentLanguage = languageCode
//        Bundle.swizzleLocalization()
        completion(true)
        
    }
    
   
    
    
    //MARK:- resetLocalization
    //Resets the localization system, so it uses the OS default language.
    func resetLocalization() {
        bundle = Bundle.main
    }
    
    //MARK:- getLanguage
    // Just gets the current setted up language.
    func getLanguage() -> String {
        let appleLanguages = UserDefaults.standard.object(forKey: "AppleLanguages") as! [String]
        let prefferedLanguage = appleLanguages[0]
        if prefferedLanguage.contains("-") {
            let array = prefferedLanguage.components(separatedBy: "-")
            return array[0]
        }
        return prefferedLanguage
    }
    
}



extension Bundle {
    static func swizzleLocalization() {
        let orginalSelector = #selector(localizedString(forKey:value:table:))
        guard let orginalMethod = class_getInstanceMethod(self, orginalSelector) else { return }

        let mySelector = #selector(myLocaLizedString(forKey:value:table:))
        guard let myMethod = class_getInstanceMethod(self, mySelector) else { return }

        if class_addMethod(self, orginalSelector, method_getImplementation(myMethod), method_getTypeEncoding(myMethod)) {
            class_replaceMethod(self, mySelector, method_getImplementation(orginalMethod), method_getTypeEncoding(orginalMethod))
        } else {
            method_exchangeImplementations(orginalMethod, myMethod)
        }
    }

    @objc private func myLocaLizedString(forKey key: String,value: String?, table: String?) -> String {//let appDelegate = UIApplication.shared.delegate as? AppDelegate,
        //TODO:hardcoded en to be remove
        guard let bundlePath = Bundle.main.path(forResource: "en", ofType: "lproj"),
            let bundle = Bundle(path: bundlePath) else {
                return Bundle.main.myLocaLizedString(forKey: key, value: value, table: table)
        }
        if let name = table, name == "CameraUI"{
         let values = NSLocalizedString(key, comment: name)

         return values
        }
        
        return bundle.myLocaLizedString(forKey: key, value: value, table: table)
    }
}





