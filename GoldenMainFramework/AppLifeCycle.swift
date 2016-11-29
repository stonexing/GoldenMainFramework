//
//  AppLifeCycle.swift
//  GoldenMainFramework
//
//  Created by XINGYAN on 16/11/29.
//  Copyright © 2016年 goldensoft. All rights reserved.
//

import Foundation

@objc public protocol AppLifeCycleProtocol: UIApplicationDelegate {
    
}


public struct AppLifeCycleItem {
    
    public var object: AppLifeCycleProtocol?
    
    init?(dictionary: [String: AnyObject]) {
        if let objectString = dictionary["object"] as? String {
            object = OBJCObjectFactory.create(objectString) as? AppLifeCycleProtocol
        }
        if object == nil {
            return nil
        }
    }
    
}
