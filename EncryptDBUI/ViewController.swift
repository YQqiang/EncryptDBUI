//
//  ViewController.swift
//  EncryptDBUI
//
//  Created by sungrow on 2018/7/16.
//  Copyright © 2018年 sungrow. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var dragDropView: YQDragDropView!
    override func viewDidLoad() {
        super.viewDidLoad()
        dragDropView.delegate = self
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
}

extension ViewController: YQDragDropViewDelegate {
    func draggingEntered(_ dragDropView: YQDragDropView) {
        dragDropView.text = "释放 完成拖拽"
    }
    
    func draggingExited(_ dragDropView: YQDragDropView) {
        dragDropView.text = "拖拽数据库到这里"
    }
    
    func draggingFileAccept(_ dragDropView: YQDragDropView, files: [String]) {
        files.forEach { (pathStr) in
            let fileModel = YQFileModel(filePath: pathStr)
            print("\(fileModel.fileName)")
        }
    }
}

