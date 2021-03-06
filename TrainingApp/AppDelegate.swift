//
//  AppDelegate.swift
//  TrainingApp
//
//  Created by Victor Barros on 2016-02-08.
//  Copyright © 2016 Kinvey. All rights reserved.
//

import UIKit
import Kinvey

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        //TODO: LAB: Intialize Kinvey
        Kinvey.sharedClient.initialize(appKey: "kid_Wy7NMiwaTx", appSecret: "18e581bc9c7046a5b1b20ae838105126")
        Kinvey.sharedClient.micApiVersion = "v2"
        Kinvey.sharedClient.logNetworkEnabled = true
        return true
    }
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        if User.login(redirectURI: NSURL(string: "training://")!, micURL: url) {
            return true
        }
        return false
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        // Additional registration goes here (if needed)
    }
    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject]) {
//        KCSPush.sharedPush().application(application, didReceiveRemoteNotification: userInfo)
        // Additional push notification handling code should be performed here
    }
    func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {
//        KCSPush.sharedPush().application(application, didFailToRegisterForRemoteNotificationsWithError: error)
    }
    func applicationDidBecomeActive(application: UIApplication) {
//        KCSPush.sharedPush().registerForRemoteNotifications()
        //Additional become active actions
    }
    func applicationWillTerminate(application: UIApplication) {
//        KCSPush.sharedPush().onUnloadHelper()
        // Additional termination actions
    }
}

