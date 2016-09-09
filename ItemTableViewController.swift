//
//  ItemTableViewController.swift
//  Brain_Power
//
//  Created by Alexis Miller on 4/14/16.
//  Copyright © 2016 Alexis Miller. All rights reserved.
//

import Foundation
import UIKit

var items = [BrainPowerItem]()

class ItemTableViewController: UITableViewController {
    
    var BrainPowerItems = [BrainPowerItem]()
    
    let myItemManager = ItemsManager()
    let cellIdentifier = "ListTableViewCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorColor = nil
        self.update()
    }
    
    func update() {
        if let savedItems = loadItems() {
            BrainPowerItems += savedItems
            items = BrainPowerItems
        } else {
            loadSampleItems()
        }
    }
    
    @IBAction func Reset(sender: UIBarButtonItem) {
        BrainPowerItems = []
        items = BrainPowerItems
        loadSampleItems()
        saveItems()
        tableView.reloadData()
    }
    
    func loadSampleItems(){
        let photo1 = UIImage(named: "Apple")!
        let item1 = BrainPowerItem(name: "Apple", photo: photo1)
        
        let photo2 = UIImage(named: "Basketball")!
        let item2 = BrainPowerItem(name: "Basketball", photo: photo2)
        
        let photo3 = UIImage(named: "Tree")!
        let item3 = BrainPowerItem(name: "Tree", photo: photo3)
        
        let photo4 = UIImage(named: "Spoon")!
        let item4 = BrainPowerItem(name: "Spoon", photo: photo4)
        BrainPowerItems += [item1, item2, item3, item4]
        items = BrainPowerItems
    }
     
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return BrainPowerItems.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = indexPath.row
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! ListTableViewCell
        let item = BrainPowerItems[row]
        cell.LabelView.text = item.name
        cell.ImageView.image = item.photo
        
        return cell
    }
    
    @IBAction func unwindToItemList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.sourceViewController as? ItemViewController, newItem = sourceViewController.newItem {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                BrainPowerItems[selectedIndexPath.row] = newItem
                items = BrainPowerItems
                tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .None)
            }
            else {
                let newIndexPath = NSIndexPath(forRow: BrainPowerItems.count, inSection: 0)
                BrainPowerItems.append(newItem)
                items = BrainPowerItems
                tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
            }
            saveItems()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowDetail" {
            let ItemDetailViewController = segue.destinationViewController as! ItemViewController
            if let selectedItemCell = sender as? ListTableViewCell {
                let indexPath = tableView.indexPathForCell(selectedItemCell)!
                let selectedItem = BrainPowerItems[indexPath.row]
                ItemDetailViewController.newItem = selectedItem
            }
        }
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            BrainPowerItems.removeAtIndex(indexPath.row)
            items = BrainPowerItems
            saveItems()
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    func saveItems() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(BrainPowerItems, toFile: BrainPowerItem.ArchiveURL.path!)
        if !isSuccessfulSave {
            print("Failed to save meals...")
        }
        items = BrainPowerItems
    }
    
    func loadItems() -> [BrainPowerItem]? {
        return NSKeyedUnarchiver.unarchiveObjectWithFile(BrainPowerItem.ArchiveURL.path!) as? [BrainPowerItem]
    }
}
