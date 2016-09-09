//
//  ItemViewController.swift
//  Brain_Power
//
//  Created by Alexis Miller on 4/14/16.
//  Copyright © 2016 Alexis Miller. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController, UITextFieldDelegate,  UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    let myItemManager = ItemsManager()
    var imagePickerController = UIImagePickerController()
    var newItem: BrainPowerItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        if let newItem = newItem {
            navigationItem.title = newItem.name
            photoImageView.image = newItem.photo
        }
        checkValidItem()
        // Do any additional setup after loading the view.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveButton === sender {
            let name = navigationItem.title ?? ""
            let photo = photoImageView.image
            newItem = BrainPowerItem(name: name, photo: photo!)
        }
    }
    
    @IBAction func selectImage(sender: UIButton) {
        nameTextField.resignFirstResponder()
        imagePickerController.delegate = self
        imagePickerController.sourceType = UIImagePickerControllerSourceType.SavedPhotosAlbum;
        imagePickerController.allowsEditing = true
            
        self.presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: AnyObject]) {
        let selectedImage = info["UIImagePickerControllerEditedImage"] as! UIImage
        photoImageView.image = selectedImage
        self.dismissViewControllerAnimated(true, completion: nil)
        checkValidItem()
    }
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        let isPresentingInAddMealMode = presentingViewController is UINavigationController
        
        if isPresentingInAddMealMode {
            dismissViewControllerAnimated(true, completion: nil)
        }
        else {
            navigationController!.popViewControllerAnimated(true)
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        navigationItem.title = nameTextField.text
        nameTextField.text = ""
        checkValidItem()
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        saveButton.enabled = false
    }
    
    func checkValidItem() {
        let text = navigationItem.title
        let picture = photoImageView.image
        saveButton.enabled = (text != "Image name")&&(picture != UIImage(named: "AddPhoto"))
    }
}