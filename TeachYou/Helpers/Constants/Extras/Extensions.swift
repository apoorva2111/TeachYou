//
//  Extensions.swift
//  Al-Anon
//
//  Created by Rnf-Yogita on 02/12/19.
//  Copyright © 2019 Rnf-Yogita. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

extension UIView {
    func roundTwoCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    func roundThreeCorners(corners: UIRectCorner, radius: CGFloat, clipsbounds : Bool = false) {
            let size = CGSize(width: radius, height: radius)
            let bezierPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: size)
            let shapeLayer = CAShapeLayer()
            shapeLayer.frame = self.bounds
            shapeLayer.path = bezierPath.cgPath
            self.layer.mask = shapeLayer
    }
    
    func roundCornerWithShadow(shadowColor:UIColor,radius:CGFloat,borderWidth:CGFloat,borderColor:UIColor,shadowOpacity:Float,shadowRadius:CGFloat,shadowOffsetWidth:CGFloat,shadowOffsetHeight:CGFloat,clipsbounds : Bool = false){
        self.layer.masksToBounds = false
        self.layer.cornerRadius = radius
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOffset = CGSize(width: shadowOffsetWidth, height:shadowOffsetHeight)
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowRadius = shadowRadius
        self.clipsToBounds = clipsbounds
    }
    
    func animateFromBottomToTop(constant : Int){
        UIView.animate(withDuration: 2, delay: 0, options: [.curveEaseIn],
                       animations: {
                        self.center.y = -CGFloat(constant)
                        self.layoutIfNeeded()
        }, completion: nil)
        self.isHidden = false
    }
}

class CustomButton:UIButton{
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureDisableButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureDisableButton()
    }
    
    func configureDisableButton(){
        self.roundCornerWithShadow(shadowColor: UIColor.clear, radius: 4, borderWidth: 1, borderColor: UIColor.clear, shadowOpacity:0, shadowRadius: 0, shadowOffsetWidth: 0, shadowOffsetHeight: 0)
        self.backgroundColor = colorConstant.k_DarkGray
        self.setBackgroundImage(nil, for: .normal)
        self.isEnabled = false
    }
    
    func configureEnableButton(){
        self.roundCornerWithShadow(shadowColor: UIColor.clear, radius: 4, borderWidth: 1, borderColor: UIColor.clear, shadowOpacity:0, shadowRadius: 0, shadowOffsetWidth: 0, shadowOffsetHeight: 0)
        self.backgroundColor = .clear
        self.setBackgroundImage(UIImage(named: "Enable_btn"), for: .normal)
        self.isEnabled = true
    }
    
}


class LanguageButton:UIButton{
    
    var language : Language? = .English
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //configureDisableButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //configureDisableButton()
    }
    
    func configureDisableButton(){
        self.roundCornerWithShadow(shadowColor: UIColor.clear, radius: 6, borderWidth: 1, borderColor: UIColor.white, shadowOpacity:0, shadowRadius: 0, shadowOffsetWidth: 0, shadowOffsetHeight: 0)
        self.backgroundColor = UIColor.clear
        self.setTitleColor(.white, for: .normal)
    }
    
    func configureEnableButton(){
        self.roundCornerWithShadow(shadowColor: UIColor.clear, radius: 0, borderWidth: 1, borderColor: UIColor.white, shadowOpacity:0, shadowRadius: 0, shadowOffsetWidth: 0, shadowOffsetHeight: 0)
        self.backgroundColor = UIColor.white
        self.setTitleColor(.black, for: .normal)
        
    }
    func setLanguage(tag : Int) -> Language{
        switch tag {
        case 1:
            return .English
        case 2:
            return .Spanish
        case 3:
            return .French
        default:
            return .English
        }
    }
}


extension CALayer {
    
    func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
        
        let border = CALayer()
        
        switch edge {
        case UIRectEdge.top:
            border.frame = CGRect(x: 0, y: 0, width: self.frame.height, height: thickness)
            break
        case UIRectEdge.bottom:
            border.frame = CGRect(x: 0, y: (self.frame.height) - thickness, width: UIScreen.main.bounds.width, height: thickness)
            break
        case UIRectEdge.left:
            border.frame = CGRect(x: 0, y: 0, width: thickness, height: self.frame.height)
            break
        case UIRectEdge.right:
            border.frame = CGRect(x: (self.frame.height) - thickness, y: 0, width: thickness, height: self.frame.height)
            break
        default:
            break
        }
        
        border.backgroundColor = color.cgColor;
        
        self.addSublayer(border)
    }
    
}

extension UITextView {
    func adjustUITextViewHeight() {
        self.translatesAutoresizingMaskIntoConstraints = true
        self.sizeToFit()
        self.isScrollEnabled = false
    }
}

extension Date {
    
    func getElapsedInterval() -> String {
        
        let interval = Calendar.current.dateComponents([.year, .month, .day,.hour,.minute,.second], from: self, to: Date())
        
        if let year = interval.year, year > 0 {
            return year == 1 ? "\(year)" + " " + Validation.kYearAgo :
                "\(year)" + " " + Validation.kYearsAgo
        } else if let month = interval.month, month > 0 {
            return month == 1 ? "\(month)" + " " + Validation.kMonthAgo :
                "\(month)" + " " + Validation.kMonthsAgo
        } else if let day = interval.day, day > 0 {
            return day == 1 ? "\(day)" + " " + Validation.kDayAgo :
                "\(day)" + " " + Validation.kDaysAgo
        } else if let hour = interval.hour, hour > 0 {
            return hour == 1 ? "\(hour)" + " " + Validation.kHourAgo :
                "\(hour)" + " " + Validation.kHoursAgo
        } else if let minute = interval.minute, minute > 0 {
            return minute == 1 ? "\(minute)" + " " + Validation.kMinAgo :
                "\(minute)" + " " + Validation.kMinsAgo
        } else if let second = interval.second, second > 0 {
            return second == 1 ? "\(second)" + " " + Validation.kSecAgo :
                "\(second)" + " " + Validation.kSecsAgo
        }
        else {
            return Validation.kMomentAgo
            
        }
        
    }
    
}
extension UIImageView {
    public func imageFromServerURL(urlString: String , completion: @escaping (_ image : UIImage) -> Void) {
        guard urlString.count > 0 else {
            return
        }
        let url = urlString.replacingOccurrences(of: "http://", with: "https://")
        self.image = nil
        self.sd_setImage(with: URL(string: url), placeholderImage: nil)
        completion(image ?? UIImage())
//        URLSession.shared.dataTask(with: NSURL(string: url)! as URL, completionHandler: { (data, response, error) -> Void in
//
//            if error != nil {
//                print(error)
//                return
//            }
//            DispatchQueue.main.async(execute: { () -> Void in
//                let image = UIImage(data: data!)
//                self.image = image
//                completion(image ?? UIImage())
//            })
//
//        }).resume()
    }}

extension String {
public func imageFromServerURL(urlString: String , completion: @escaping (_ image : UIImage) -> Void) {
    guard urlString.count > 0 else {
        return
    }
    URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in
        
        if error != nil {
            print(error)
            return
        }
        DispatchQueue.main.sync(execute: { () -> Void in
            let image = UIImage(data: data!)
            completion(image ?? UIImage())
        })
        
    }).resume()
}}

extension String
{
    func isStringAnInt() -> Bool {

        if let _ = Int(self) {
            return true
        }
        return false
    }
}

public extension CALayer {
    
    public func applyGradient(of colors: UIColor..., atAngle angle: CGFloat) -> CAGradientLayer {
        let gradient = CAGradientLayer()
        gradient.frame = frame
        gradient.colors = colors
        gradient.calculatePoints(for: angle)
        gradient.mask = self
        return gradient
    }
    
}


public extension CAGradientLayer {
    
    /// Sets the start and end points on a gradient layer for a given angle.
    ///
    /// - Important:
    /// *0°* is a horizontal gradient from left to right.
    ///
    /// With a positive input, the rotational direction is clockwise.
    ///
    ///    * An input of *400°* will have the same output as an input of *40°*
    ///
    /// With a negative input, the rotational direction is clockwise.
    ///
    ///    * An input of *-15°* will have the same output as *345°*
    ///
    /// - Parameters:
    ///     - angle: The angle of the gradient.
    ///
    public func calculatePoints(for angle: CGFloat) {
        
        
        var ang = (-angle).truncatingRemainder(dividingBy: 360)
        
        if ang < 0 { ang = 360 + ang }
        
        let n: CGFloat = 0.5
        
        let tanx: (CGFloat) -> CGFloat = { tan($0 * CGFloat.pi / 180) }
        
        switch ang {
            
        case 0...45, 315...360:
            let a = CGPoint(x: 0, y: n * tanx(ang) + n)
            let b = CGPoint(x: 1, y: n * tanx(-ang) + n)
            startPoint = a
            endPoint = b
            
        case 45...135:
            let a = CGPoint(x: n * tanx(ang - 90) + n, y: 1)
            let b = CGPoint(x: n * tanx(-ang - 90) + n, y: 0)
            startPoint = a
            endPoint = b
            
        case 135...225:
            let a = CGPoint(x: 1, y: n * tanx(-ang) + n)
            let b = CGPoint(x: 0, y: n * tanx(ang) + n)
            startPoint = a
            endPoint = b
            
        case 225...315:
            let a = CGPoint(x: n * tanx(-ang - 90) + n, y: 0)
            let b = CGPoint(x: n * tanx(ang - 90) + n, y: 1)
            startPoint = a
            endPoint = b
            
        default:
            let a = CGPoint(x: 0, y: n)
            let b = CGPoint(x: 1, y: n)
            startPoint = a
            endPoint = b
            
        }
    }
    
}

extension TimeInterval {
    var minuteSecondMS: String {
        return String(format:"%d:%02d.%03d", minute, second, millisecond)
    }
    var minute: Int {
        return Int((self/60).truncatingRemainder(dividingBy: 60))
    }
    var second: Int {
        return Int(truncatingRemainder(dividingBy: 60))
    }
    var millisecond: Int {
        return Int((self*1000).truncatingRemainder(dividingBy: 1000))
    }
}

extension Int {
    var msToSeconds: Double {
        return Double(self) / 1000
    }
    var toCents : Int{
        return self * 100
    }
}

extension Date {
    var millisecondsSince1970:Int64 {
        return Int64((self.timeIntervalSince1970 * 1000.0).rounded())
    }

    init(milliseconds:Int64) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
    }
}

extension UIImage {
    func crop(to:CGSize) -> UIImage {
        guard let cgimage = self.cgImage else { return self }
        
        let contextImage: UIImage = UIImage(cgImage: cgimage)
        
        let contextSize: CGSize = contextImage.size
        
        //Set to square
        var posX: CGFloat = 0.0
        var posY: CGFloat = 0.0
        let cropAspect: CGFloat = to.width / to.height
        
        var cropWidth: CGFloat = to.width
        var cropHeight: CGFloat = to.height
        
        if to.width > to.height { //Landscape
            cropWidth = contextSize.width
            cropHeight = contextSize.width / cropAspect
            posY = (contextSize.height - cropHeight) / 2
        } else if to.width < to.height { //Portrait
            cropHeight = contextSize.height
            cropWidth = contextSize.height * cropAspect
            posX = (contextSize.width - cropWidth) / 2
        } else { //Square
            if contextSize.width >= contextSize.height { //Square on landscape (or square)
                cropHeight = contextSize.height
                cropWidth = contextSize.height * cropAspect
                posX = (contextSize.width - cropWidth) / 2
            }else{ //Square on portrait
                cropWidth = contextSize.width
                cropHeight = contextSize.width / cropAspect
                posY = (contextSize.height - cropHeight) / 2
            }
        }
        
        let rect: CGRect = CGRect(x : posX, y : posY, width : cropWidth, height : cropHeight)
        
        // Create bitmap image from context using the rect
        let imageRef: CGImage = contextImage.cgImage!.cropping(to: rect)!
        
        // Create a new image based on the imageRef and rotate back to the original orientation
        let cropped: UIImage = UIImage(cgImage: imageRef, scale: self.scale, orientation: self.imageOrientation)
        
        cropped.draw(in: CGRect(x : 0, y : 0, width : to.width, height : to.height))
        
        return cropped
    }
}

extension Date
{
    func toString( dateFormat format  : String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = .current
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
    func toUTCString( dateFormat format  : String ) -> String
       {
           let dateFormatter = DateFormatter()
           dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
          dateFormatter.dateFormat = format
           return dateFormatter.string(from: self)
       }

    func dayOfWeek() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
        // or use capitalized(with: locale) if you want
    }
    
    func isEqualTo(_ date: Date) -> Bool {
       return self == date
     }

     func isGreaterThan(_ date: Date) -> Bool {
        return self > date
     }

     func isSmallerThan(_ date: Date) -> Bool {
        return self < date
     }
    
    var monthAndYear: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM YYYY"
        return dateFormatter.string(from: self)
    }
    var dateAndMonth: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd"
        return dateFormatter.string(from: self)
    }
    
    var month: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM"
        return dateFormatter.string(from: self)
    }
    var year: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY"
        return dateFormatter.string(from: self)
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension Date {
    static func dates(from fromDate: Date, to toDate: Date) -> [Date] {
        var dates: [Date] = []
        var date = fromDate

        while date <= toDate {
            dates.append(date)
            guard let newDate = Calendar.current.date(byAdding: .day, value: 1, to: date) else { break }
            date = newDate
        }
        return dates
    }
}
extension Date {

    func dateToString()->String {

        let dateFormatter = DateFormatter()

        dateFormatter.timeZone = .current

        dateFormatter.dateFormat = DateFormatterConstant.kdd//DateFormatterConstant.kdateyyy_MM_dd_Thh_mm_SSS_Z

        let dat : String = dateFormatter.string(from: self)

        return dat

    }

}

//2020-04-10T06:30:00.000Z

extension String {

    func stringToDate() -> Date? {

        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"//DateFormatterConstant.kdateyyy_MM_dd_Thh_mm_SSS_Z

        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")

        //dateFormatter.locale = Locale(identifier: TimeZone.current.abbreviation() ?? "UTC")

        let datee = dateFormatter.date(from: self)

        return datee

    }

}
//yyyy-MM-dd'T'HH:mm:ss.SSS'Z'
