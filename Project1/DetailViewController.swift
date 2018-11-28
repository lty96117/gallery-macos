//
//  DetailViewController.swift
//  Project1
//
//  Created by Tianyu Li on 11/28/18.
//  Copyright © 2018 Tianyu Li. All rights reserved.
//

import Cocoa

class DetailViewController: NSViewController {

    @IBOutlet var imageView: NSImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    func imageSelected(name: String) {
        imageView.image = NSImage(named: name)
    }
    
}
