//
//  ViewController.swift
//  EncryptDBUI
//
//  Created by sungrow on 2018/7/16.
//  Copyright © 2018年 sungrow. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    fileprivate var currentFileModel: YQFileModel?

    @IBOutlet weak var dragDropView: YQDragDropView!
    @IBOutlet weak var encryptKeyTF: NSTextField!
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
    
    @IBAction func rePicker(_ sender: NSButton) {
        reloadDefaultData()
    }
    
    @IBAction func savePwd(_ sender: NSButton) {
        let pwd = encryptKeyTF.stringValue
        if pwd.isEmpty {
            return
        }
    }
    
    @IBAction func encrypt(_ sender: NSButton) {
        guard let model = currentFileModel else {
            return
        }
        let isSuccess = FMEncryptHelper.encryptDatabase(model.filePath, encryptKey: encryptKeyTF.stringValue)
        if isSuccess {
            dragDropView.text = model.fileName + " " + "加密成功"
        } else {
            dragDropView.text = model.fileName + " " + "加密失败"
        }
    }
    
    @IBAction func decrypt(_ sender: NSButton) {
        guard let model = currentFileModel else {
            return
        }
        let isSuccess = FMEncryptHelper.unEncryptDatabase(model.filePath, encryptKey: encryptKeyTF.stringValue)
        if isSuccess {
            dragDropView.text = model.fileName + " " + "解密成功"
        } else {
            dragDropView.text = model.fileName + " " + "解密失败"
        }
    }
}

// MARK: - private func
extension ViewController {
    fileprivate func reloadDefaultData() {
        currentFileModel = nil
        dragDropView.text = "拖拽数据库到这里"
        dragDropView.image = NSImage(named: NSImage.Name(rawValue: "addDB"))
    }
}

extension ViewController: YQDragDropViewDelegate {
    func draggingEntered(_ dragDropView: YQDragDropView) {
        if let _ = currentFileModel {
            return
        }
        dragDropView.text = "释放完成拖拽"
    }
    
    func draggingExited(_ dragDropView: YQDragDropView) {
        if let _ = currentFileModel {
            return
        }
        dragDropView.text = "拖拽数据库到这里"
    }
    
    func draggingFileAccept(_ dragDropView: YQDragDropView, files: [String]) {
        if let _ = currentFileModel {
            return
        }
        if files.count > 1 {
            dragDropView.text = "拖拽数据库到这里"
            return
        }
        currentFileModel = YQFileModel(filePath: files.first!)
        dragDropView.text = currentFileModel?.fileName
        dragDropView.image = NSImage(named: NSImage.Name(rawValue: "dbIcon"))
    }
}

