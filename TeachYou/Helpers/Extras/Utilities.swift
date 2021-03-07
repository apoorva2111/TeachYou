//
//  Utilities.swift
//  Al-Anon
//
//  Created by Rnf-Yogita on 02/12/19.
//  Copyright © 2019 Rnf-Yogita. All rights reserved.
//

import Foundation
import UIKit

enum IphoneScreen{
    case iphone5 //"iPhone 5 or 5S or 5C"
    case iphone6 //"iPhone 6/6S/7/8"
    case iphonePlus //"iPhone 6+/6S+/7+/8+"
    case iphoneX //"iPhone X"
    case iphoneXSMax //"iPhone XSMax"
    case unknown
}
class NSAttributedStringHelper {
    static func createBulletedList(fromStringArray strings: [String], font: UIFont? = nil) -> NSAttributedString {

        let fullAttributedString = NSMutableAttributedString()
        let attributesDictionary: [NSAttributedString.Key: Any]

        if font != nil {
            attributesDictionary = [NSAttributedString.Key.font: font!]
        } else {
            attributesDictionary = [NSAttributedString.Key: Any]()
        }

        for index in 0..<strings.count {
            let bulletPoint: String = "\u{2022}"
            var formattedString: String = "\(bulletPoint) \(strings[index])"

            if index < strings.count - 1 {
                formattedString = "\(formattedString)\n"
            }

            let attributedString: NSMutableAttributedString = NSMutableAttributedString(string: formattedString, attributes: attributesDictionary)
            let paragraphStyle = NSAttributedStringHelper.createParagraphAttribute()
   attributedString.addAttributes([NSAttributedString.Key.paragraphStyle: paragraphStyle], range: NSMakeRange(0, attributedString.length))
        fullAttributedString.append(attributedString)
       }

        return fullAttributedString
    }

    private static func createParagraphAttribute() -> NSParagraphStyle {
        let paragraphStyle: NSMutableParagraphStyle = NSParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle
        paragraphStyle.tabStops = [NSTextTab(textAlignment: .left, location: 15, options: NSDictionary() as! [NSTextTab.OptionKey : Any])]
        paragraphStyle.defaultTabInterval = 15
        paragraphStyle.firstLineHeadIndent = 0
        paragraphStyle.headIndent = 11
        return paragraphStyle
    }
}

class Utilities {
    
    static var dobPicker : DatePickerView?
    static var customDialogue : CustomDialogBoxView?
    static var picker : PickerView?
    
    static let activityData = ActivityData()
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name:StoryBoardConstants.kMainStoryBoard,bundle: Bundle.main)
    }
    
    
    static func baseUrl() -> String {
        return (Bundle.main.infoDictionary?["API_BASE_URL"] as? String)?
            .replacingOccurrences(of: "\\", with: "") ?? ""
    }
    
    
    // MARK: Methods related to Progress Indicator
    
    static func hideProgressIndicator() {
        NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
    }
    
    static func showProgressIndicator() {
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(Utilities.activityData, nil)
        
    }
    
    class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
    
    class func changeRootViewController(navigation: UINavigationController?,controller:UIViewController?){
        if let navigationController = navigation {
            navigationController.setViewControllers([controller!], animated: true)
        }
        
    }
    
    class func pushViewController(fromVC:UIViewController, toVC: UIViewController, identifier: String,storyboard: String)
    {
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: identifier)
        fromVC.navigationController?.pushViewController(vc, animated: true)
    }
    
    class func viewConrollerObject(identifier: String,storyboard: String)-> UIViewController{
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: identifier)
        return vc
    }
    
    class func showInformationAlert(title: String, message: String) {
        let alert = AlertBuilder()
            .setTitle(title)
            .setMessage(message)
            .addButton(Validation.kOK)
            .build()
        Utilities.topViewController()?.navigationController?.present(alert, animated: true, completion: nil)
    }
    
    static func showAlertAtTopOfWindowWithMessage(message : String){
        DispatchQueue.main.async {
            let alertcontroller : UIAlertController = UIAlertController(title: AppConstants.kAppName, message: message, preferredStyle: .alert)
            let alertActionOkay = UIAlertAction(title: Validation.kOK, style: .default, handler: {
                action in
                
            })
            
            alertcontroller.addAction(alertActionOkay)
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController?.present(alertcontroller, animated: true, completion: nil)
        }
    }
    
    class func showAlert(title: String, message: String, buttons: [String : (() -> Void)?]) {
        
        let alert = AlertBuilder()
            .setTitle(title)
            .setMessage(message)
            .addButtons(buttons: buttons)
            .build()
        
        Utilities.topViewController()?.navigationController?.present(alert, animated: true, completion: nil)
    }
    
    class func initDOBPicker(delegate:DatePickerViewDelegate,mode:Int = 0, isDOB: Bool?){
        Utilities.topViewController()?.view.endEditing(true)
        dobPicker = DatePickerView.instanceFromNib()
        dobPicker?.delegate = delegate
        (mode == 0) ? ((isDOB == true) ? (dobPicker?.pickerTitle.text = "Select Date") : (dobPicker?.pickerTitle.text = "Select Date")) : (dobPicker?.pickerTitle.text = "Validation.kSelectTimePlaceholder")
        dobPicker?.changeMode(modeType: mode)
        dobPicker?.frame = (Utilities.topViewController()?.view.frame) ?? UIApplication.shared.keyWindow!.bounds
        Utilities.topViewController()?.view.addSubview(dobPicker!)
        dobPicker?.showPicker()
    }
    
    class func initPicker(title:String,currentSelection:Int, delegate : PickerViewDelegate,data:[String]){
        Utilities.topViewController()?.view.endEditing(true)
        picker = PickerView.instanceFromNib()
        picker?.delegate = delegate
        picker?.frame = (Utilities.topViewController()?.view.frame) ?? UIApplication.shared.keyWindow!.bounds
        Utilities.topViewController()?.view.addSubview(picker!)
        picker?.setdata(arr: data, pickerTitle: title,currentSelection:currentSelection )
        picker?.showPicker()
    }
    
    class func getStoryBoard(name:String)-> UIStoryboard{
        let storyboard = UIStoryboard(name: name, bundle:Bundle.main)
        return storyboard
    }
    
    class func showDialogue(text:String,delg:DialogueViewDelegate,vc:UIViewController){
        (vc as? BaseViewC)?.hideNavigationBar()
        customDialogue = CustomDialogBoxView.instanceFromNib()
        customDialogue?.delegate = delg
        customDialogue?.frame = (Utilities.topViewController()?.view.frame) ?? UIApplication.shared.keyWindow!.bounds
        customDialogue?.setData(text: text)
        vc.view.addSubview(customDialogue!)
    }
    
    class func resize(textView: UITextView)-> CGFloat {
        var newFrame = textView.frame
        let width = newFrame.size.width
        let newSize = textView.sizeThatFits(CGSize(width: width,
                                                   height: CGFloat.greatestFiniteMagnitude))
        newFrame.size = CGSize(width: width, height: newSize.height)
        return newFrame.size.height
        
    }
    
    class func setLanguageRootController(){
//        let vc = Utilities.viewConrollerObject(identifier:ViewControllerConstants.kLanguageViewController , storyboard: StoryBoardConstants.kMainStoryBoard) as! LanguageViewController
//        vc.hidesBottomBarWhenPushed = true
//        AppDelegate.getAppDelegate().navigationController.isNavigationBarHidden = true
//        Utilities.changeRootViewController(navigation: AppDelegate.getAppDelegate().navigationController, controller:vc)
    }
    
    class func setGradientBackground(firstColor:UIColor,secondColor:UIColor,view:UIView) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [firstColor.cgColor, secondColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    
    class func changecolor(text : String, stringToColor:String,toColor:UIColor) -> NSMutableAttributedString{
        let main_string = text
        let string_to_color = stringToColor
        
        let range = (main_string as NSString).range(of: string_to_color)
        
        let attribute = NSMutableAttributedString.init(string: main_string)
        attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: toColor , range: range)
        return attribute
        
    }
    
    class func formatDate(fromdateformat: String, fromdate:String, todateformat:String) -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = fromdateformat
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = todateformat
        dateFormatter.locale = Locale.current
        let dateObj: Date? = dateFormatterGet.date(from: fromdate)
        return dateFormatter.string(from: dateObj!)
    }
    
    class func UTCToLocalDateForEvents(date:String) -> String {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = DateFormatterConstant.kdateyyy_MM_dd_Thh_mm_SSS_Z
           dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
           
           guard let dt = dateFormatter.date(from: date) else { return ""}
           dateFormatter.timeZone = TimeZone.current
           dateFormatter.dateFormat = DateFormatterConstant.kMMM_d_yyyy
           let dateStr = (dateFormatter.string(from: dt))
           return dateStr
    }
    
    class func UTCToLocalDateForDateEvents(date:String) -> Date {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = DateFormatterConstant.kdateyyy_MM_dd_Thh_mm_SSS_Z
           dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
           
           guard let dt = dateFormatter.date(from: date) else { return Date()}
           dateFormatter.timeZone = TimeZone.current
           dateFormatter.dateFormat = DateFormatterConstant.kMMM_d_yyyy
//           let dateStr = (dateFormatter.string(from: dt))
           return dt
    }
    
    class func stringToDate(date:String,format:String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        guard let dt = dateFormatter.date(from: date) else { return Date()}
        return dt
    }
    
    class func convertUTCToLocalDateForEvents(date:String,fromFormat:String,toFormat:String) -> (Date,String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = fromFormat
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        guard let dt = dateFormatter.date(from: date) else { return (Date(),"")}
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = toFormat
        let dateStr = (dateFormatter.string(from: dt))
        return  (dateFormatter.date(from: dateStr) ?? Date(),dateStr)
    }
    
    class func dateToString(date:Date,format:String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone.current
        let dt = dateFormatter.string(from: date)
        return dt
    }
    
    class func UTCToLocalDateForEvents(date:String,fromFormat:String,toFormat:String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = fromFormat
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        guard let dt = dateFormatter.date(from: date) else { return ""}
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = toFormat
        let dateStr = (dateFormatter.string(from: dt))
        return dateStr
    }
    
    class func LocalToUTCDateForEvents(date:String,fromFormat:String,toFormat:String) -> String {
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateFormat = fromFormat
        dateFormatter1.timeZone = TimeZone.current
        dateFormatter1.locale = Locale.current
        
        guard let dt = dateFormatter1.date(from: date) else { return ""}
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.dateFormat = toFormat
        let dateStr = (dateFormatter.string(from: dt))
        return dateStr
    }
    
    
    
    class func millisecondsToDate( milliSec: Int64,dateFormat:String) ->String{
        let dateVar = Date.init(timeIntervalSince1970:TimeInterval(milliSec)/1000 )
    let dateFormatter = DateFormatter()
    //dateFormatter.locale = .current
   // dateFormatter.timeZone = .current
    dateFormatter.dateFormat = dateFormat
    return (dateFormatter.string(from: dateVar))
    }
    
    
    class func formatDateToDate(fromdateformat: String, fromdate:String, todateformat:String) -> Date {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = fromdateformat
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = todateformat
        dateFormatter.locale = Locale.current
        let dateObj: Date? = dateFormatter.date(from: fromdate)
        return dateObj ?? Date()
    }

    class func convertStringToDateWithFormat(format: String,dateString:String) -> (String,Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        guard let dt = dateFormatter.date(from: dateString) else { return ("", Date())}
        dateFormatter.timeZone = TimeZone.current
        //dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = format
        let dateStr = (dateFormatter.string(from: dt))
        
        let date = Utilities.getCurrentDate(format: DateFormatterConstant.kyyyy_MM_dd) + " " + dateStr
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateFormat = DateFormatterConstant.kyyyy_MM_dd_HH_mm
        dateFormatter1.timeZone = TimeZone.current
        
        return (dateStr, dateFormatter1.date(from: date) ?? Date())
    }
    
    class func convertStringToDateWithFormatUTC(format: String,dateString:String) -> (String,Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormatterConstant.kyyyy_MM_dd
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        let dateStrInUTC = dateFormatter.string(from: Date()) + " " + dateString
        
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateFormat = DateFormatterConstant.kyyyy_MM_dd_HH_mm
        dateFormatter1.timeZone = TimeZone(abbreviation: "UTC")
        let DateStrInUTC = dateFormatter1.date(from: dateStrInUTC)
        return (dateStrInUTC, DateStrInUTC ?? Date())
    }

    class func getDateForNextDay(format: String,dateString:String) -> (String,Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        guard let dt = dateFormatter.date(from: dateString) else { return ("", Date())}
        dateFormatter.timeZone = TimeZone.current
        //dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = format
        let dateStr = (dateFormatter.string(from: dt))
        //let date = Utilities.getCurrentDate(format: DateFormatterConstant.kyyyy_MM_dd) + " " + dateStr
        let date = Utilities.changeFormat(format: DateFormatterConstant.kyyyy_MM_dd, date: Utilities.calculateNextDayFromCurrentDay().0) + " " + dateStr
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateFormat = DateFormatterConstant.kyyyy_MM_dd_HH_mm
        // dateFormatter1.timeZone = TimeZone.current
        
        return (dateStr, dateFormatter1.date(from: date) ?? Date())
    }
    
    class func getDateForPreviousDay(format: String,dateString:String) -> (String,Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        guard let dt = dateFormatter.date(from: dateString) else { return ("", Date())}
        dateFormatter.timeZone = TimeZone.current
        //dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = format
        let dateStr = (dateFormatter.string(from: dt))
        
        //let date = Utilities.getCurrentDate(format: DateFormatterConstant.kyyyy_MM_dd) + " " + dateStr
        let date = Utilities.changeFormat(format: DateFormatterConstant.kyyyy_MM_dd, date: Utilities.calculatePrevioustDayFromCurrentDay().0) + " " + dateStr
        
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateFormat = DateFormatterConstant.kyyyy_MM_dd_HH_mm
        // dateFormatter1.timeZone = TimeZone.current
        
        return (dateStr, dateFormatter1.date(from: date) ?? Date())
    }
    
    class func changeFormat(format:String,date:Date)->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone.current
        let dateStr = (dateFormatter.string(from: date))
        return dateStr
    }
    
    class func changeFormat(format:String,date:String)->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone.current
        guard let dateD = (dateFormatter.date(from: date)) else { return "" }
        return dateFormatter.string(from: dateD)
    }
    
    class func changeFormatToDAte(format:String,date:String)->Date{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone.current
        let dateD = (dateFormatter.date(from: date))
        return dateD ?? Date()
    }
    
    class func breakDate(str:String)-> String{
        let arr = str.components(separatedBy: "-")
        if(arr.count > 2){
            let str3 = arr[2]
            return str3.components(separatedBy: "T")[0]
        }
        return "0"
    }
    
    class func calculateNextDayFromCurrentDay()->(Date,String){
        let today = Date()
        let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: today)
        return (tomorrow ?? Date(),tomorrow?.dayOfWeek() ?? "")
    }
    
    class func calculatePrevioustDayFromCurrentDay()->(Date,String){
        let today = Date()
        let tomorrow = Calendar.current.date(byAdding: .day, value: -1, to: today)
        return (tomorrow ?? Date(),tomorrow?.dayOfWeek() ?? "")
    }
    
    class func UTCToLocal(date:String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormatterConstant.kdateyyy_MM_dd_Thh_mm_SSS_Z
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        guard let dt = dateFormatter.date(from: date) else { return Date() }
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = DateFormatterConstant.kdateyyy_MM_dd_Thh_mm_SSS_Z
        let dateStr = (dateFormatter.string(from: dt))
        return dateFormatter.date(from: dateStr) ?? Date()
    }
    
    class func getDayDateFromDate(date:Date) -> (String,String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormatterConstant.kdateyyy_MM_dd_Thh_mm_SSS_Z
        dateFormatter.timeZone = TimeZone.current
        
        let dt = dateFormatter.string(from: date)
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = DateFormatterConstant.kdd
        let dateStr = (dateFormatter.date(from: dt))
        
        let dateFormatter1 = DateFormatter()
        dateFormatter1.timeZone = TimeZone.current
        dateFormatter1.dateFormat = DateFormatterConstant.kMMM
        let monthStr = (dateFormatter1.date(from: dt))
        
        return (dateFormatter.string(from: dateStr ?? Date()),dateFormatter1.string(from: monthStr ?? Date()))
    }
    
    class func LocalToUTC() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormatterConstant.kyyyy_MM_dd_HH_mm
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        return dateFormatter.date(from:dateFormatter.string(from: Date())) ?? Date()
    }
    
    
    class func UTCToLocalTime(time:String) -> String {
        if(time == ""){
            return ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormatterConstant.kHHmm
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        guard let dt = dateFormatter.date(from: time) else { return dateFormatter.string(from:Date()) }
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = DateFormatterConstant.kHHmm
        let dateStr = (dateFormatter.string(from: dt))
        return dateFormatter.string(from:(dateFormatter.date(from: dateStr) ?? Date())) 
    }
    
    class func getCurrentDate(format:String)->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone.current
        
        let dateStr = (dateFormatter.string(from: Date()))
        return dateStr
    }
    
    class func getTodaysDate(format:String)->Date{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone.current
        
        let dateStr = (dateFormatter.string(from: Date()))
        return dateFormatter.date(from: dateStr) ?? Date()
    }
    
    
    
    class func calculateImageViewSize(image:UIImage,view:UIImageView) -> CGSize{
        let myImageWidth = image.size.width
        let myImageHeight = image.size.height
        let myViewWidth = view.frame.size.width
        
        let ratio = myViewWidth/myImageWidth
        let scaledHeight = myImageHeight * ratio
        return CGSize(width: myViewWidth, height: scaledHeight)
    }
    
    class func getTimeZone()->String{
        return Calendar.current.timeZone.identifier
    }
    
    class func convertMillisecondToDate(milisecond:Int64){
      let dateVar = Date.init(timeIntervalSinceNow: TimeInterval(milisecond)/1000)
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = DateFormatterConstant.kMMM_dd_HH_mm
      print(dateFormatter.string(from: dateVar))
    }
    
    class func getTimeIntervalBtwTwoTimes(date:String,format:String,addminutes:Int = 0)-> Double{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let date1 = dateFormatter.date(from: date)
        let date2 = NSDate()
        var components1 = NSCalendar.current.dateComponents([.hour, .minute], from: date1!)
        let components2 = NSCalendar.current.dateComponents([.hour, .minute, .day, .month, .year], from: date2 as Date)
        components1.year = components2.year;
        components1.month = components2.month;
        components1.day = components2.day;
        let date3 = NSCalendar.current.date(from: components1)
        print(date3!.timeIntervalSince(date2 as Date)/60)
        return (date3!.timeIntervalSince(date2 as Date)/60)
    }
    
    class func secondsToHoursMinutesSeconds (seconds : Int) -> (Int, Int) {
        let min = seconds * 60
        return (min / 3600, (min % 3600) / 60)
    }
    
//    class func encryptString(text:String,Key:String)->String{
//        let cryptLib = CryptLib()
//        return cryptLib.encryptPlainTextRandomIV(withPlainText: text, key: Key)
//
//    }
//
//    class func decryptString(encryptedText:String,Key:String)->String{
//        let cryptLib = CryptLib()
//        return cryptLib.decryptCipherTextRandomIV(withCipherText: encryptedText, key: Key)
//    }
    
    class func convertBase64ToImage(imageString: String) -> UIImage {
        let imageData = Data(base64Encoded: imageString, options: Data.Base64DecodingOptions.ignoreUnknownCharacters)!
        return UIImage(data: imageData)!
    }
    
    class func getDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        // "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        dateFormatter.dateFormat = DateFormatterConstant.kdateyyy_MM_dd_Thh_mm_SSS_Z
        return dateFormatter.string(from: Date())
    }
    
}


extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
