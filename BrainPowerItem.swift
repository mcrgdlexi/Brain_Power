//
//  BrainPowerItem.swift
//  Brain_Power
//
//  Created by Alexis Miller on 3/25/16.
//  Copyright © 2016 Alexis Miller. All rights reserved.
//

import Foundation
import UIKit

class BrainPowerItem: NSObject, NSCoding {
    var name: String
    var photo: UIImage
    
    let NameKey = "nameKey"
    let PhotoKey = "photoKey"
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("Items")
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: NameKey)
        aCoder.encodeObject(photo, forKey: PhotoKey)
    }
    
    init(name: String, photo: UIImage) {
        self.name = name
        self.photo = photo
        super.init()
        
    }
    
    required init(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObjectForKey(NameKey) as! String
        photo = aDecoder.decodeObjectForKey(PhotoKey) as! UIImage
    }
}