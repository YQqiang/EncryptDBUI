//
//  PWDViewController.swift
//  EncryptDBUI
//
//  Created by sungrow on 2019/7/17.
//  Copyright © 2019 sungrow. All rights reserved.
//

import Cocoa

class PWDViewController: NSViewController {

    @IBOutlet weak var tableView: NSTableView!
    
    fileprivate lazy var dataSource: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NSNib(nibNamed: NSNib.Name(rawValue: "PWDCell"), bundle: nil)!, forIdentifier: NSUserInterfaceItemIdentifier(rawValue: "PWDCell"))
        updateTableView()
    }
    
    fileprivate func updateTableView() {
        dataSource = PWDManager.allPwd()
        tableView.reloadData()
    }
    
}

extension PWDViewController: NSTableViewDelegate {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "PWDCell"), owner: self) as! PWDCell
        cell.pwdLabel.stringValue = dataSource[row]
        return cell
    }
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 24
    }
}

extension PWDViewController: NSTableViewDataSource {
    
}
