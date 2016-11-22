//
//  AppDelegate.swift
//  grpcSwift
//
//  Created by 张鹏 on 16/11/21.
//  Copyright © 2016年 大白菜. All rights reserved.
//

import UIKit
import GRPCClient
import grpcSwiftModel

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        
        GRPCCall.useInsecureConnections(forHost: "155.94.146.125:8383")
//        GRPCCall.setUserAgentPrefix("grpcSwift", forHost: "155.94.146.125:8383")
        
       let g = Greeter(host: "155.94.146.125:8383")
        
        
        let request = HelloRequest()
        request.name = "111"
        
        g.sayHello(with: request) { (reply, err) in
            
            print(reply?.message, err?.localizedDescription)
        }
        
        g.sayHello(with: request) { (reply, err) in
            
            print(reply?.message, err?.localizedDescription)
        }
        
        let r = g.rpcToSayHello(with: request) { (reply, err) in
            
            print(reply?.message, err?.localizedDescription)
        }
        
        r.start()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) { }

    func applicationDidEnterBackground(_ application: UIApplication) { }

    func applicationWillEnterForeground(_ application: UIApplication) {

    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

