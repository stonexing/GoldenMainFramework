//
//  AppEnvironment.swift
//  GoldenMainFramework
//
//  Created by XINGYAN on 16/11/29.
//  Copyright © 2016年 goldensoft. All rights reserved.
//

import Foundation

public struct AppEnv {
    // App Name
    // App Version
    // App Build
    public static var version: String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
        
    }
    
    public static var fullVersion: String {
        return "\(AppEnv.version) Build \(AppEnv.build)"
    }
    
    public static var build: String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
    }
    
    public static var countryCode: String {
        return (NSLocale.current as NSLocale).object(forKey: .countryCode) as? String ?? "US"
    }
    
    public static var languageCode: String {
        return (NSLocale.current as NSLocale).object(forKey: .languageCode) as? String ?? "en"
    }
    
    public static var appName: String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as! String
    }
    
    
}
