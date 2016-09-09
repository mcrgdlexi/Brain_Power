//
//  ItemsManager.swift
//  Brain_Power
//
//  Created by Alexis Miller on 3/25/16.
//  Copyright © 2016 Alexis Miller. All rights reserved.
//

import Foundation

class ItemsManager {
    var items = [BrainPowerItem]()
    
    lazy private var archivePath: String = {
        let fileManager = NSFileManager.defaultManager()
        
        let documentsDirectoryURLs = fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask) 
        
        let archiveURL = documentsDirectoryURLs.first!.URLByAppendingPathComponent("BrainPowerItem", isDirectory: true)
        
        return archiveURL.path!
    }()
    
    func save() {
        NSKeyedArchiver.archiveRootObject(items, toFile: archivePath)
    }
}