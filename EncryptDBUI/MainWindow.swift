//
//  MainWindow.swift
//  EncryptDBUI
//
//  Created by sungrow on 2018/7/16.
//  Copyright © 2018年 sungrow. All rights reserved.
//

import Cocoa

class MainWindow: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
        
        window?.titlebarAppearsTransparent = true
        window?.standardWindowButton(.zoomButton)?.isHidden = true
//        window?.titleVisibility = .hidden
    }
}
