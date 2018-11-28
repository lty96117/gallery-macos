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
    var pics = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        // tableView.delegate = self
        // tableView.dataSource = self
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasSuffix(".jpg") || item.hasSuffix(".png") {
                pics.append(item)
            }
        }
        
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return pics.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        guard let vw = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as?
            NSTableCellView else { return nil }
        vw.textField?.stringValue = pics[row]
        
        return vw
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        print("selected Changed -> ", tableView.selectedRow)
        guard tableView.selectedRow != -1 else { return }
        guard let splitVC = parent as? NSSplitViewController else { return }
        
        if let detail = splitVC.children[1] as? DetailViewController {
            detail.imageSelected(name: pics[tableView.selectedRow])
        }
    }
}
