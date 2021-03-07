//
//  IAPServices.swift
//  IPA
//
//  Copyright © 2020 Yogita. All rights reserved.
//

import Foundation
import StoreKit

public typealias ProductIdentifier = String
public typealias ProductsRequestCompletionHandler = (_ success: Bool, _ products: [SKProduct]?) -> ()

public typealias JSONDictionary = [String:Any]
public typealias JSONArray = [[String:Any]]

protocol IAPServicesDelegate: NSObject {
    func callbackOnProductPurchasedSuccess(with productId:String?,with jsonDict:NSDictionary?, with expiryDate:Date?, with actualAmount:CGFloat, with payAmount:CGFloat)
    func callbackOnProductRestore(with productId:String?)
    func callbackOnProductPurchasedFailure(with errMsg:String?)
    func callbackOnProductPurchasedSuccess(with reciept:String)

}

extension IAPServicesDelegate {
    func callbackOnProductPurchasedSuccess(with productId:String?,with jsonDict:NSDictionary?, with expiryDate:Date?, with actualAmount:CGFloat, with payAmount:CGFloat) {}
    func callbackOnProductRestore(with productId:String?) {}
    func callbackOnProductPurchasedFailure(with errMsg:String?) {}
}

open class IAPServices: NSObject {
    
   weak var delegate:IAPServicesDelegate?
 
   var verifyReceiptURL = "https://sandbox.itunes.apple.com/verifyReceipt"
   //var verifyReceiptURL = "https://buy.itunes.apple.com/verifyReceipt"
    
    static let IAPHelperPurchaseNotification = "IAPHelperPurchaseNotification"
    static let IAPHelperPurchaseFailedNotification = "IAPHelperPurchaseFailedNotification"
    var prodID = "PremiumContent01"
    let productIdentifiers: Set<ProductIdentifier>
    var purchasedProductIdentifiers = Set<ProductIdentifier>()
    var productsRequest: SKProductsRequest?
    var productsRequestCompletionHandler: ProductsRequestCompletionHandler?
    
    public var isBuyingProcessOn: Bool = false
    public var purchasedCurrentIdentifier: String = ""
    
    public init(productIds: Set<ProductIdentifier>) {
        productIdentifiers = productIds
        for productIdentifier in productIds {
            let purchased = UserDefaults.standard.bool(forKey: productIdentifier)
            if purchased {
                purchasedProductIdentifiers.insert(productIdentifier)
                print("Previously purchased: \(productIdentifier)")
            } else {
                print("Not purchased: \(productIdentifier)")
            }
        }
        super.init()
        //SKPaymentQueue.default().add(self)
    }
    
    func setAsTransactionObserver() {
        SKPaymentQueue.default().add(self)
    }
    
    func receiptValidation(callback:@escaping (NSDictionary?,Date?,Error?)->Void)
    {
        let receiptFileURL = Bundle.main.appStoreReceiptURL
        let receiptData = try? Data(contentsOf: receiptFileURL!)
        //let recieptString = receiptData?.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
        if let recieptString = receiptData?.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0)) {
            delegate?.callbackOnProductPurchasedSuccess(with: recieptString)
        
        } else {
            callback(nil, nil, nil)
        }
        
    }
    
    func getExpirationDateFromResponse(_ jsonResponse: NSDictionary) -> Date? {
        
        if let receiptInfo: NSArray = jsonResponse["latest_receipt_info"] as? NSArray {
            
            let lastReceipt = receiptInfo.lastObject as! NSDictionary
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss VV"
            
            if let expiresDate = lastReceipt["expires_date"] as? String {
                return formatter.date(from: expiresDate)
            }
            
            return nil
        }
        else {
            return nil
        }
    }
}

extension IAPServices {
    
    public func requestProducts(completionHandler: @escaping ProductsRequestCompletionHandler) {
        productsRequest?.cancel()
        productsRequestCompletionHandler = completionHandler
        
        productsRequest = SKProductsRequest(productIdentifiers: productIdentifiers)
        productsRequest!.delegate = self
        productsRequest!.start()
    }
    
    public func buyProduct(_ product: SKProduct) {
        print("Buying \(product.productIdentifier)...")
        self.isBuyingProcessOn = true
        self.purchasedCurrentIdentifier = ""
        let payment = SKPayment(product: product)
        SKPaymentQueue.default().add(payment)
    }
    
    public func isProductPurchased(_ productIdentifier: ProductIdentifier) -> Bool {
        return purchasedProductIdentifiers.contains(productIdentifier)
    }
    
    public class func canMakePayments() -> Bool {
        return SKPaymentQueue.canMakePayments()
    }
    
    
    public func restorePurchases() {
        SKPaymentQueue.default().restoreCompletedTransactions()
    }
    
}

// MARK: - SKProductsRequestDelegate

extension IAPServices: SKProductsRequestDelegate {
    
    public func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        let products = response.products
        print("Loaded list of products...")
        if (PurchaseProducts.products.count > 0) {
            PurchaseProducts.products.removeAll()
        }
        PurchaseProducts.products.append(contentsOf: products)
        for p in products {
            print("Found product: \(p.productIdentifier) \(p.localizedTitle) \(p.price.floatValue)")
        }
        productsRequestCompletionHandler?(true, products)
        clearRequestAndHandler()
    }
    
    public func request(_ request: SKRequest, didFailWithError error: Error) {
        print("Failed to load list of products.")
        print("Error: \(error.localizedDescription)")
        productsRequestCompletionHandler?(false, nil)
        clearRequestAndHandler()
    }
    
    private func clearRequestAndHandler() {
        productsRequest = nil
        productsRequestCompletionHandler = nil
    }
}

// MARK: - SKPaymentTransactionObserver

extension IAPServices: SKPaymentTransactionObserver {
    public func paymentQueue(_ queue: SKPaymentQueue, restoreCompletedTransactionsFailedWithError error: Error) {
        
    }
    //
    
    public func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
//            let ob = transaction.payment.productIdentifier
            
            switch (transaction.transactionState) {
            case .purchased:
                SKPaymentQueue.default().finishTransaction(transaction)
                complete(transaction: transaction)
                print("i am purchased")
                break
            case .failed:
                SKPaymentQueue.default().finishTransaction(transaction)
                fail(transaction: transaction)
                print("i am failed")
                break
            case .restored:
                SKPaymentQueue.default().finishTransaction(transaction)
                restore(transaction: transaction)
                print("i am in restore")
                break
            case .deferred:
                print("i am deferred")
                break
            case .purchasing:
                print("i am purchasing")
                break
            @unknown default:
                break
            }
        }
    }
    
    private func complete(transaction: SKPaymentTransaction) {
        print("complete...")
//        AppPurchaseScreen()
        SKPaymentQueue.default().finishTransaction(transaction)
        //if let delegate = self.delegate {
            self.receiptValidation { (jsonDict, expirationDate, error) in
              /*
                var productPrice: CGFloat = 0
                if PurchaseProducts.products.count > 0 {
                    for prod in PurchaseProducts.products {
                        if prod.productIdentifier == transaction.payment.productIdentifier {
                            productPrice = CGFloat(prod.price.doubleValue)
                            break
                        }
                    }
                }
                if self.isBuyingProcessOn == false {
                    self.purchasedCurrentIdentifier = ""
                    if let productIdentifier = UserDefaults.standard.value(forKey: UserDefaultKey.kAlAnon_InApp_Purchased_Premium_Content) as? String, productIdentifier.count > 0 {
                        self.purchasedProductIdentifiers.remove(productIdentifier)
                        UserDefaults.standard.set(nil, forKey: productIdentifier)
                        UserDefaults.standard.set(nil, forKey: UserDefaultKey.kAlAnon_InApp_Purchased_Premium_Content)
                        UserDefaults.standard.synchronize()
                    }
                    self.purchasedProductIdentifiers.insert(transaction.payment.productIdentifier)
                    UserDefaults.standard.set(true, forKey: transaction.payment.productIdentifier)
                    UserDefaults.standard.set(transaction.payment.productIdentifier, forKey: UserDefaultKey.kAlAnon_InApp_Purchased_Premium_Content)
                    UserDefaults.standard.synchronize()
                } else {
                    self.purchasedCurrentIdentifier = transaction.payment.productIdentifier
                }
                
                delegate.callbackOnProductPurchasedSuccess(with: transaction.payment.productIdentifier, with: jsonDict, with: expirationDate, with: productPrice, with: 0)
                
            }*/
        }
       // deliverPurchaseNotificationFor(identifier: transaction.payment.productIdentifier)
    }
    
    private func restore(transaction: SKPaymentTransaction) {
        guard let productIdentifier = transaction.original?.payment.productIdentifier else { return }
        
        print("restore... \(productIdentifier)")
        SKPaymentQueue.default().finishTransaction(transaction)

        if let delegate = self.delegate {
            
            self.isBuyingProcessOn = false
            self.purchasedCurrentIdentifier = ""
            
            if let olderProductIdentifier = UserDefaults.standard.value(forKey: UserDefaultKey.kAlAnon_InApp_Purchased_Premium_Content) as? String, olderProductIdentifier.count > 0 {
                self.purchasedProductIdentifiers.remove(olderProductIdentifier)
                UserDefaults.standard.set(nil, forKey: olderProductIdentifier)
                UserDefaults.standard.set(nil, forKey: UserDefaultKey.kAlAnon_InApp_Purchased_Premium_Content)
                UserDefaults.standard.synchronize()
            }
            self.purchasedProductIdentifiers.insert(productIdentifier)
            UserDefaults.standard.set(true, forKey: productIdentifier)
            UserDefaults.standard.set(productIdentifier, forKey: UserDefaultKey.kAlAnon_InApp_Purchased_Premium_Content)
            UserDefaults.standard.synchronize()
            delegate.callbackOnProductRestore(with: productIdentifier)
            
        }
        
    }
    
    private func fail(transaction: SKPaymentTransaction) {
        print("fail...")
        if let transactionError = transaction.error as NSError? {
            if transactionError.code != SKError.paymentCancelled.rawValue {
                //transaction.transactionReceipt
                print("Transaction Error: \(transaction.error?.localizedDescription)")
            }    }
        SKPaymentQueue.default().finishTransaction(transaction)
        //NotificationCenter.default.post(name: NSNotification.Name(rawValue: IAPServices.IAPHelperPurchaseFailedNotification), object: nil)
        if let delegate = self.delegate {
            self.isBuyingProcessOn = false
            self.purchasedCurrentIdentifier = ""
            delegate.callbackOnProductPurchasedFailure(with: transaction.error?.localizedDescription)
        }
    }
    
//    private func deliverPurchaseNotificationFor(identifier: String?) {
//        guard let identifier = identifier else { return }
//
//        purchasedProductIdentifiers.insert(identifier)
//        UserDefaults.standard.set(true, forKey: identifier)
//        UserDefaults.standard.synchronize()
//        NotificationCenter.default.post(name: NSNotification.Name(rawValue: IAPServices.IAPHelperPurchaseNotification), object: identifier)
//    }
    func AppPurchaseScreen() {
//        if let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SubscribeVC") as? SubscribeVC {
//           let appDelegate = UIApplication.shared.delegate as! AppDelegate
//            if let window = appDelegate.window , let rootViewController = window.rootViewController {
//                var currentController = rootViewController
//                while let presentedController = currentController.presentedViewController {
//                    currentController = presentedController
//                }
//                currentController.dismiss(animated: true, completion: nil)
//
//            }
//        }
    }
}

extension SKProduct {
    var localizedPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = priceLocale
        return formatter.string(from: price)!
    }
}
