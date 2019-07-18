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
    }
    
    public static func allPwd() -> [String] {
        return (UserDefaults.standard.value(forKey: key) as? [String]) ?? []
    }
}
