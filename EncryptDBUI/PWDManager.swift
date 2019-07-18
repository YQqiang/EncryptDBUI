//
//  PWDManager.swift
//  EncryptDBUI
//
//  Created by sungrow on 2019/7/18.
//  Copyright © 2019 sungrow. All rights reserved.
//

import Foundation

class PWDManager {
    public static let key = "PWDKEY"
    
    public static func addPwd(_ pwd: String) {
        var values = (UserDefaults.standard.value(forKey: key) as? [String]) ?? []
        if values.contains(pwd) {
            return
        }
        values.append(pwd)
        UserDefaults.standard .setValue(values, forKey: key)
        UserDefaults.standard.synchronize()
        NotificationCenter.default.post(name: PWDManager.Notification.addPwd, object: pwd)
    }
    
    public static func deletePwd(_ pwd: String) {
        var values = (UserDefaults.standard.value(forKey: key) as? [String]) ?? []
        if !values.contains(pwd) {
            return
        }
        values.removeAll {$0 == pwd}
        UserDefaults.standard .setValue(values, forKey: key)
        UserDefaults.standard.synchronize()
        NotificationCenter.default.post(name: PWDManager.Notification.deletePwd, object: pwd)
    }
    
    public static func allPwd() -> [String] {
        return (UserDefaults.standard.value(forKey: key) as? [String]) ?? []
    }
}

extension PWDManager {
    struct Notification {
        public static let addPwd = NSNotification.Name(rawValue: "addPwd")
        public static let deletePwd = NSNotification.Name(rawValue: "deletePwd")
        public static let selectPwd = NSNotification.Name(rawValue: "selectPwd")
    }
}
