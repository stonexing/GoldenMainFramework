//
//  AppDelegate.swift
//  GoldenMainFramework
//
//  Created by XINGYAN on 16/11/29.
//  Copyright © 2016年 goldensoft. All rights reserved.
//


import UIKit

public class AppDelegate: UIResponder, UIApplicationDelegate {
    
    public var bootstrapViewController: UIViewController {
        return UIViewController()
    }
    public var window: UIWindow?
    
    public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]? = nil) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.makeKeyAndVisible()
        appConfig.loadConfig("config.plist")
        if let lifeCycleItems = appConfig.lifeCycleConfig[LifeCycleKey.didFinishLaunchingWithOptions] {
            for item in lifeCycleItems{
                if let protocol_ = item.object{
                    protocol_.application!(application, didFinishLaunchingWithOptions: launchOptions)
                }
            }
        }
        return true
    }
    
    public func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    public func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        if let lifeCycleItems = appConfig.lifeCycleConfig[LifeCycleKey.didEnterBackground] {
            for item in lifeCycleItems{
                item.object?.applicationDidEnterBackground?(application)
            }
        }
    }
    
    public func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    public func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        if let lifeCycleItems = appConfig.lifeCycleConfig[LifeCycleKey.didBecomeActive] {
            for item in lifeCycleItems{
                item.object?.applicationDidBecomeActive?(application)
            }
        }
    }
    
    public func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        if let lifeCycleItems = appConfig.lifeCycleConfig[LifeCycleKey.willTerminate] {
            for item in lifeCycleItems{
                item.object?.applicationWillTerminate?(application)
            }
        }
    }
    
    public func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        if let lifeCycleItems = appConfig.lifeCycleConfig[LifeCycleKey.didRegisterForRemoteNotificationsWithDeviceToken] {
            for item in lifeCycleItems{
                item.object?.application?(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
            }
        }
    }
    
    public func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Swift.Void) {
        if let lifeCycleItems = appConfig.lifeCycleConfig[LifeCycleKey.didReceiveRemoteNotificationFetchCompletionHandler] {
            for item in lifeCycleItems{
                item.object?.application?(application, didReceiveRemoteNotification: userInfo, fetchCompletionHandler: completionHandler)
            }
        }
    }
    
    public func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        var handled = false
        if let lifeCycleItems = appConfig.lifeCycleConfig[LifeCycleKey.openURL] {
            for item in lifeCycleItems{
                if let protocol_ = item.object {
                    if #available(iOS 9.0, *) {
                        if let res:Bool = protocol_.application!(app, open: url, options: options), res{
                            handled = res
                        }
                    } else {
                        // Fallback on earlier versions
                    }
                    //                    if let res = protocol_.application!(app, openURL: url, options: options) , res{
                    //                        handled = res
                    //                    }
                }
                
            }
        }
        return handled
    }
    
}


