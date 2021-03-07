//
//  ServiceRequest.swift
//

import Foundation
import UIKit

fileprivate let kContentTypeKey      = "Content-Type"
fileprivate let kContentTypeValue    = "application/json"
fileprivate let kIOS                 = "ios"
fileprivate let kDeviceType          = "deviceType"
fileprivate let kDeviceToken         = "deviceToken"
fileprivate let kAuthorizationToken  = "Authorization"
fileprivate let kLanguage            = "AcceptLanguage"
fileprivate let kTimeZone            = "timezone"

fileprivate let kRequestTimeOut = 30.0
fileprivate let kResourceReadTimeOut = 60.0
var dataTask: URLSessionDataTask?

protocol ServiceRequest {
    
    static var methodPath: URLConstants { get }
    static func executeRequest(requestType: HTTPMethod,
                               parameters: [String: Any]?,
                               headerToken: [String: String]?,
                               completion: @escaping (Data?, HTTPStatusCode) -> Void)
    static func parameterString(dict: [String: Any]) -> String
    static func parameterStringFordelete(dict: [String: Any]) -> String

}

extension ServiceRequest {
    
    static var url: String {
        return methodPath.urlString()
    }
    //getTimeZone
    static var AuthHeader: [String:String] {
        return [kLanguage:"\(UserSessionManager.shared.getLanguage() ?? "")",kDeviceType:kIOS]
    }
    
    static var LoginAuthHeader: [String:String] {
        return [kAuthorizationToken:"\(UserSessionManager.shared.getToken() ?? "")",kLanguage:"\(UserSessionManager.shared.getLanguage() ?? "")",kTimeZone:Utilities.getTimeZone(),kDeviceType:kIOS]
    }
}

extension ServiceRequest {
    
    static func cancelRequest(){
        dataTask?.cancel()
    }
    
    static func executeRequest(requestType: HTTPMethod,
                               parameters: [String: Any]?,
                               headerToken: [String: String]?,
                               completion: @escaping (Data?, HTTPStatusCode) -> Void) {
        
        DispatchQueue.global(qos: .background).async {
            
            var dataTask: URLSessionDataTask?
            
            let sessionConfig = URLSessionConfiguration.default
            sessionConfig.timeoutIntervalForRequest = kRequestTimeOut
            sessionConfig.timeoutIntervalForResource = kResourceReadTimeOut
            let defaultSession = URLSession(configuration: sessionConfig)
            
            let endPoint = URL(string: url)!
            var request = NSMutableURLRequest(url: endPoint)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            if parameters != nil {
                
                if requestType == .get {
                    let urlStr: String =  "\(url)" + "\(parameterString(dict: parameters!))"
                    request = NSMutableURLRequest(url: URL(string: urlStr)!)
                }
                else if requestType == .delete {
                                   let urlStr: String =  "\(url)" + "\(parameterStringFordelete(dict: parameters!))"
                                   request = NSMutableURLRequest(url: URL(string: urlStr)!)
                               }
                else {
                    
                    let jsonData = try? JSONSerialization.data(withJSONObject: parameters!, options: [])
                    request.httpBody = jsonData
                }
            }
            
            request.httpMethod = requestType.rawValue
            if headerToken != nil {

                for key in headerToken!.keys {
                    request.addValue((headerToken![key])!, forHTTPHeaderField: key)
                }
            }
            
            dataTask = defaultSession.dataTask(with: request as URLRequest) { (data, response, error) in
                
                print("\n\nRequest : \(request.url!.absoluteString)")
                print("Response : \(String(describing: String(data: data ?? Data(), encoding: .utf8)!))\n")
                
                DispatchQueue.main.async {
                    let response = response as? HTTPURLResponse
                    completion(data, HTTPStatusCode(rawValue: response?.statusCode ?? HTTPStatusCode.unknown.rawValue) ?? HTTPStatusCode(rawValue: HTTPStatusCode.unknown.rawValue)!)
                }
            }
            
            dataTask!.resume()
        }
    
    }

    static func executeGetRequest(requestType: HTTPMethod,url:String,
                               parameters: [String: Any]?,
                               headerToken: [String: String]?,
                               completion: @escaping (Data?, HTTPStatusCode) -> Void) {
        
        DispatchQueue.global(qos: .background).async {
            
            var dataTask: URLSessionDataTask?
            
            let sessionConfig = URLSessionConfiguration.default
            sessionConfig.timeoutIntervalForRequest = kRequestTimeOut
            sessionConfig.timeoutIntervalForResource = kResourceReadTimeOut
            let defaultSession = URLSession(configuration: sessionConfig)
            
            let endPoint = URL(string: url)!
            var request = NSMutableURLRequest(url: endPoint)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            if parameters != nil {
                
                if requestType == .get {
                    let urlStr: String =  "\(url)" //+ "\(parameterString(dict: parameters!))"
                    request = NSMutableURLRequest(url: URL(string: urlStr)!)
                }
                else if requestType == .delete {
                                   let urlStr: String =  "\(url)" + "\(parameterStringFordelete(dict: parameters!))"
                                   request = NSMutableURLRequest(url: URL(string: urlStr)!)
                               }
                else {
                    
                    let jsonData = try? JSONSerialization.data(withJSONObject: parameters!, options: [])
                    request.httpBody = jsonData
                }
            }
            
            request.httpMethod = requestType.rawValue
            if headerToken != nil {

                for key in headerToken!.keys {
                    request.addValue((headerToken![key])!, forHTTPHeaderField: key)
                }
            }
            
            dataTask = defaultSession.dataTask(with: request as URLRequest) { (data, response, error) in
                
                print("\n\nRequest : \(request.url!.absoluteString)")
                print("Response : \(String(describing: String(data: data ?? Data(), encoding: .utf8)!))\n")
                
                DispatchQueue.main.async {
                    let response = response as? HTTPURLResponse
                    completion(data, HTTPStatusCode(rawValue: response?.statusCode ?? HTTPStatusCode.unknown.rawValue) ?? HTTPStatusCode(rawValue: HTTPStatusCode.unknown.rawValue)!)
                }
            }
            
            dataTask!.resume()
        }
    
    }

    
    static func executeSearchRequest(requestType: HTTPMethod,
                               parameters: [String: Any]?,
                               headerToken: [String: String]?,
                               completion: @escaping (Data?, HTTPStatusCode) -> Void) {
        
        DispatchQueue.global(qos: .background).async {
            
            dataTask?.cancel()
            let sessionConfig = URLSessionConfiguration.default
            sessionConfig.timeoutIntervalForRequest = kRequestTimeOut
            sessionConfig.timeoutIntervalForResource = kResourceReadTimeOut
            let defaultSession = URLSession(configuration: sessionConfig)
            
            let endPoint = URL(string: url)!
            var request = NSMutableURLRequest(url: endPoint)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            if parameters != nil {
                
                if requestType == .get {
                    let urlStr: String =  "\(url)" + "\(parameterString(dict: parameters!))"
                    request = NSMutableURLRequest(url: URL(string: urlStr)!)
                }
                else if requestType == .delete {
                                   let urlStr: String =  "\(url)" + "\(parameterStringFordelete(dict: parameters!))"
                                   request = NSMutableURLRequest(url: URL(string: urlStr)!)
                               }
                else {
                    
                    let jsonData = try? JSONSerialization.data(withJSONObject: parameters!, options: [])
                    request.httpBody = jsonData
                }
            }
            
            request.httpMethod = requestType.rawValue
            if headerToken != nil {

                for key in headerToken!.keys {
                    request.addValue((headerToken![key])!, forHTTPHeaderField: key)
                }
            }
            
            dataTask = defaultSession.dataTask(with: request as URLRequest) { (data, response, error) in
                
                print("\n\nRequest : \(request.url!.absoluteString)")
                print("Response : \(String(describing: String(data: data ?? Data(), encoding: .utf8)!))\n")
                
                DispatchQueue.main.async {
                    let response = response as? HTTPURLResponse
                    completion(data, HTTPStatusCode(rawValue: response?.statusCode ?? HTTPStatusCode.unknown.rawValue) ?? HTTPStatusCode(rawValue: HTTPStatusCode.unknown.rawValue)!)
                }
            }
            
            dataTask!.resume()
        }
    
    }


    static func executeMultipartRequest(requestType: HTTPMethod,
                                        parameters: [String: Any]?,data:[Data]?,mimetype:[String]?,
                                        headerToken: [String: String]?,
                                        completion: @escaping (Data?, HTTPStatusCode) -> Void){
        
        DispatchQueue.global(qos: .background).async {
            
            var dataTask: URLSessionDataTask?
            
            let sessionConfig = URLSessionConfiguration.default
            sessionConfig.timeoutIntervalForRequest = kRequestTimeOut
            sessionConfig.timeoutIntervalForResource = kResourceReadTimeOut
            let defaultSession = URLSession(configuration: sessionConfig)
            
            let endPoint = URL(string: url)!
            var request = NSMutableURLRequest(url: endPoint)
            let boundary = "unique-consistent-string"
            request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
            let mimetype = "image/jpeg"
            if parameters != nil {
                if requestType == .get {
                    let urlStr: String =  "\(url)" + "\(parameterString(dict: parameters!))"
                    request = NSMutableURLRequest(url: URL(string: urlStr)!)
                } else {
                    //let jsonData = try? JSONSerialization.data(withJSONObject: parameters!, options: [])
                    if let dataa = data{
                        request.httpBody = try? createBody(with: parameters, filePathKey: "file", data: dataa, boundary: boundary, filename: "file", mimeType: mimetype)
                    }else{
                        request.httpBody = try? createBody(with: parameters, filePathKey: "file", data: [], boundary: boundary, filename: "file", mimeType: mimetype)
                    }
                }
            }
            
            request.httpMethod = requestType.rawValue
            if headerToken != nil {
                for key in headerToken!.keys {
                    request.addValue((headerToken![key])!, forHTTPHeaderField: key)
                }
            }
            
            dataTask = defaultSession.dataTask(with: request as URLRequest) { (data, response, error) in
                
                print("\n\nRequest : \(request.url!.absoluteString)")
                print("Response : \(String(describing: String(data: data ?? Data(), encoding: .utf8)!))\n")
                
                DispatchQueue.main.async {
                    let response = response as? HTTPURLResponse
                    completion(data, HTTPStatusCode(rawValue: response?.statusCode ?? HTTPStatusCode.unknown.rawValue) ?? HTTPStatusCode(rawValue: HTTPStatusCode.unknown.rawValue)!)
                }
            }
            
            dataTask!.resume()
        }
    }
    
    
    static func executeMultipartRequestForMultipleFiles(requestType: HTTPMethod,
                                                        parameters: [String: Any]?,data:[Data]?,mimetype:[String]?,filename:[String]?,
                                           headerToken: [String: String]?,
                                           completion: @escaping (Data?, HTTPStatusCode) -> Void){
           
           DispatchQueue.global(qos: .background).async {
               
               var dataTask: URLSessionDataTask?
               
               let sessionConfig = URLSessionConfiguration.default
               sessionConfig.timeoutIntervalForRequest = kRequestTimeOut
               sessionConfig.timeoutIntervalForResource = kResourceReadTimeOut
               let defaultSession = URLSession(configuration: sessionConfig)
               
               let endPoint = URL(string: url)!
               var request = NSMutableURLRequest(url: endPoint)
               let boundary = "unique-consistent-string"
               request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
               //let mimetype = "image/jpeg"
               if parameters != nil {
                   if requestType == .get {
                       let urlStr: String =  "\(url)" + "\(parameterString(dict: parameters!))"
                       request = NSMutableURLRequest(url: URL(string: urlStr)!)
                   } else {
                       //let jsonData = try? JSONSerialization.data(withJSONObject: parameters!, options: [])
                       if let dataa = data{
                        request.httpBody = try? createBodywithMultiDoc(with: parameters, filePathKey: "file", data: dataa, boundary: boundary, filename: filename ?? [], mimeType: mimetype ?? [])
                       }else{
                        request.httpBody = try? createBodywithMultiDoc(with: parameters, filePathKey: "file", data: [], boundary: boundary, filename: ["file"], mimeType: mimetype ?? [])
                       }
                   }
               }
               
               request.httpMethod = requestType.rawValue
               if headerToken != nil {
                   for key in headerToken!.keys {
                       request.addValue((headerToken![key])!, forHTTPHeaderField: key)
                   }
               }
               
               dataTask = defaultSession.dataTask(with: request as URLRequest) { (data, response, error) in
                   
                   print("\n\nRequest : \(request.url!.absoluteString)")
                   print("Response : \(String(describing: String(data: data ?? Data(), encoding: .utf8)!))\n")
                   
                   DispatchQueue.main.async {
                       let response = response as? HTTPURLResponse
                       completion(data, HTTPStatusCode(rawValue: response?.statusCode ?? HTTPStatusCode.unknown.rawValue) ?? HTTPStatusCode(rawValue: HTTPStatusCode.unknown.rawValue)!)
                   }
               }
               
               dataTask!.resume()
           }
       }
       
    
    static func executeMultipartRequest(requestType: HTTPMethod,
                                        parameters: [String: Any]?,image:UIImage?,
                                        headerToken: [String: String]?,
                                        completion: @escaping (Data?, HTTPStatusCode) -> Void){
        
        DispatchQueue.global(qos: .background).async {
            
            var dataTask: URLSessionDataTask?
            
            let sessionConfig = URLSessionConfiguration.default
            sessionConfig.timeoutIntervalForRequest = kRequestTimeOut
            sessionConfig.timeoutIntervalForResource = kResourceReadTimeOut
            let defaultSession = URLSession(configuration: sessionConfig)
            
            let endPoint = URL(string: url)!
            var request = NSMutableURLRequest(url: endPoint)
            let boundary = "unique-consistent-string"
            request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
            let mimetype = "image/jpeg"
            if parameters != nil {
                if requestType == .get {
                    let urlStr: String =  "\(url)" + "\(parameterString(dict: parameters!))"
                    request = NSMutableURLRequest(url: URL(string: urlStr)!)
                } else {
                    //let jsonData = try? JSONSerialization.data(withJSONObject: parameters!, options: [])
                    if let img = image{
                        request.httpBody = try? createBody(with: parameters, filePathKey: "file", data: [(img.jpegData(compressionQuality: 0.5)!)], boundary: boundary, filename: "file", mimeType: mimetype)
                    }else{
                        request.httpBody = try? createBody(with: parameters, filePathKey: "file", data: [], boundary: boundary, filename: "file", mimeType: mimetype)
                    }
                }
            }
            
            request.httpMethod = requestType.rawValue
            if headerToken != nil {
                for key in headerToken!.keys {
                    request.addValue((headerToken![key])!, forHTTPHeaderField: key)
                }
            }
            
            dataTask = defaultSession.dataTask(with: request as URLRequest) { (data, response, error) in
                
                print("\n\nRequest : \(request.url!.absoluteString)")
                print("Response : \(String(describing: String(data: data ?? Data(), encoding: .utf8)!))\n")
                
                DispatchQueue.main.async {
                    let response = response as? HTTPURLResponse
                    completion(data, HTTPStatusCode(rawValue: response?.statusCode ?? HTTPStatusCode.unknown.rawValue) ?? HTTPStatusCode(rawValue: HTTPStatusCode.unknown.rawValue)!)
                }
            }
            
            dataTask!.resume()
        }
    }
    
    static func createBody(with parameters: [String: Any]?, filePathKey: String, data: [Data?]?, boundary: String,filename:String,mimeType : String) throws -> Data {
        var body = Data()
        
        if parameters != nil {
            for (key, value) in parameters! {
                body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
                body.append("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n".data(using: String.Encoding.utf8)!)
                body.append("\(value)\r\n".data(using: String.Encoding.utf8)!)
            }
        }
        if let d = data{
            if(d.count > 0){
                for index in 0...d.count - 1{
                    body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
                    body.append("Content-Disposition: form-data; name=\"\(filePathKey)\"; filename=\"\(filename)\"\r\n".data(using: String.Encoding.utf8)!)
                    body.append("Content-Type: \(mimeType)\r\n\r\n".data(using: String.Encoding.utf8)!)
                    body.append(d[index] ?? Data())
                    body.append("\r\n".data(using: String.Encoding.utf8)!)
                }
            }
            
        }
        
        
        body.append("--\(boundary)--\r\n".data(using: String.Encoding.utf8)!)
        return body
    }
    
    static func createBodywithMultiDoc(with parameters: [String: Any]?, filePathKey: String, data: [Data?]?, boundary: String,filename:[String],mimeType : [String]) throws -> Data {
        var body = Data()
        
        if parameters != nil {
            for (key, value) in parameters! {
                body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
                body.append("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n".data(using: String.Encoding.utf8)!)
                body.append("\(value)\r\n".data(using: String.Encoding.utf8)!)
            }
        }
        if let d = data{
            if(d.count > 0){
                for index in 0...d.count - 1{
                    let file = filePathKey.appending(String(index + 1))
                    body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
                    body.append("Content-Disposition: form-data; name=\"\(file)\"; filename=\"\(filename[index])\"\r\n".data(using: String.Encoding.utf8)!)
                    body.append("Content-Type: \(mimeType[index])\r\n\r\n".data(using: String.Encoding.utf8)!)
                    body.append(d[index] ?? Data())
                    body.append("\r\n".data(using: String.Encoding.utf8)!)
                }
            }
            
        }
        
        
        body.append("--\(boundary)--\r\n".data(using: String.Encoding.utf8)!)
        return body
    }
    
    static func parameterString(dict: [String: Any]) -> String {
        
        var parts: [String] = []
        for (key, value) in dict {
            
            if key == "" {
                return "/\(value)"
            }
            
            let part = String(format: "%@=%@",
                              String(describing: key).addingPercentEncoding(withAllowedCharacters:
                                .urlQueryAllowed)!,
                              String(describing: value).addingPercentEncoding(withAllowedCharacters:
                                .urlQueryAllowed)!)
            parts.append(part as String)
        }
        return String(format: "?%@", parts.joined(separator: "&"))
    }
    
    static func parameterGetString(dict: [String: Any]) -> String {
        
        var parts: [String] = []
        for (key, value) in dict {
            
            if key == "" {
                return "/\(value)"
            }
            
            let part = String(format: "%@=%@",
                              String(describing: key).addingPercentEncoding(withAllowedCharacters:
                                .urlQueryAllowed)!,
                              String(describing: value).addingPercentEncoding(withAllowedCharacters:
                                .urlQueryAllowed)!)
            parts.append(part as String)
        }
        return String(format: "?%@", parts.joined(separator: "&"))
    }
    
    static func parameterStringFordelete(dict: [String: Any]) -> String {
           
           var parts: [String] = []
           for (key, value) in dict {
               
               if key == "" {
                   return "/\(value)"
               }
               
               let part = String(format: "%@",
                                 String(describing: value).addingPercentEncoding(withAllowedCharacters:
                                   .urlQueryAllowed)!)
               parts.append(part as String)
           }
           return String(format: "?%@", parts.joined(separator: "&"))
       }
       
    
    static func executeBatchRequest(requestType: HTTPMethod,
                                    parameters: [[String: Any]]?,
                                    headerToken: [String: String]?,
                                    completion: @escaping (Data?, HTTPStatusCode) -> Void) {
        
        DispatchQueue.global(qos: .background).async {
            
            var dataTask: URLSessionDataTask?
            
            let sessionConfig = URLSessionConfiguration.default
            sessionConfig.timeoutIntervalForRequest = kRequestTimeOut
            sessionConfig.timeoutIntervalForResource = kResourceReadTimeOut
            let defaultSession = URLSession(configuration: sessionConfig)
            
            let endPoint = URL(string: url)!
            let request = NSMutableURLRequest(url: endPoint)
            if parameters != nil {
                
                let jsonData = try? JSONSerialization.data(withJSONObject: parameters!, options: [])
                request.httpBody = jsonData
            }
            
            request.httpMethod = requestType.rawValue
            
            if headerToken != nil {
                for key in headerToken!.keys {
                    request.addValue((headerToken![key])!, forHTTPHeaderField: key)
                }
            }
            
            dataTask = defaultSession.dataTask(with: request as URLRequest) { (data, response, error) in
                print("\n\nRequest : \(request.url!.absoluteString)")
                print("Response : \(String(describing: String(data: data ?? Data(), encoding: .utf8)!))\n")
                DispatchQueue.main.async {
                    let response = response as? HTTPURLResponse
                    completion(data, HTTPStatusCode(rawValue: response?.statusCode ?? HTTPStatusCode.unknown.rawValue)!)
                }
            }
            
            dataTask!.resume()
        }
    }
    
}



