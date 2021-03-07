//
//  IAPProducts.swift
//  SchoolSecurityFirst
//
//  Copyright © 2020 . All rights reserved.
//

import Foundation

import StoreKit

public struct PurchaseProducts {
    
    public static let yearlyPlan = "PremiumContent01"
    
    fileprivate static let productIdentifiers: Set<ProductIdentifier> = [PurchaseProducts.yearlyPlan]
    
    public static let store =   IAPServices(productIds: PurchaseProducts.productIdentifiers)
    
    public static var products: [SKProduct] = [SKProduct]()
    
    
}

func resourceNameForProductIdentifier(_ productIdentifier: String) -> String? {
    return productIdentifier.components(separatedBy: ".").last
}
