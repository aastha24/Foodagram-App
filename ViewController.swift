//
//  ViewController.swift
//  Foodagram
//
//  Created by Aastha Anand on 9/29/16.
//  Copyright © 2016 Aastha Anand. All rights reserved.
// App description:-
// This app is a Memory Keeping app, i.e, it allows the user to take a picture of the food they ate last and add its name to it.
// This app is could help the forgetful as well as the users who want to keep a note of what they had in order to calculate the
// calorie content at the end of the day.

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    // MARK: Properties

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field’s user input through delegate callbacks.
        nameTextField.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLabel.text = textField.text
    }
    
    // MARK: UIImagePickerControllerDelegate
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
     //Dismiss the picker if the user canceled
        dismiss(animated: true, completion: nil)
        
    }
    
   func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    if let selectedImage=info[UIImagePickerControllerOriginalImage] as? UIImage {
        photoImageView.image = selectedImage    }
    else { print("Something went wrong")}
    self.dismiss(animated: true, completion: nil)
        
    
    }


    // MARK: Actions
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        //Hide the keyboard
        nameTextField.resignFirstResponder()
        
        //UIImagePickerController is a view controller that lets a user pick media from their photo library
        let imagePickerController = UIImagePickerController()
        
        //Only allow photos to be picked, not taken
        imagePickerController.sourceType = .photoLibrary
        
        //Make sure viewController is notified when the user picks an image
        imagePickerController.delegate=self
        present(imagePickerController,animated: true, completion: nil)
        
        
    }
    
    @IBAction func setDefaultLabelText(sender: UIButton) {
        mealNameLabel.text = "**Food Name**"
        
    }
    

}

