//
//  SourceViewController.swift
//  Project1
//
//  Created by Tianyu Li on 11/28/18.
//  Copyright © 2018 Tianyu Li. All rights reserved.
//

import Cocoa

class SourceViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate {

    @IBOutlet var tableView: NSTableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
//        tableView.delegate = self
//        tableView.dataSource = self
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return 100
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        guard let vw = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as?
            NSTableCellView else { return nil }
        vw.textField?.stringValue = "Hello, World!"
        
        return vw
    }



}
