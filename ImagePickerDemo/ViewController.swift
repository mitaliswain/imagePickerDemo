//
//  ViewController.swift
//  ImagePickerDemo
//
//  Created by TheAppGuruz-New-6 on 07/08/14.
//  Copyright (c) 2014 TheAppGuruz-New-6. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIAlertViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIPopoverControllerDelegate
{
    @IBOutlet weak var btnClickMe: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    var picker:UIImagePickerController?=UIImagePickerController()
    var popover:UIPopoverController?=nil
    var imageList :[UIImage] = []
    
    @IBAction func postToFaceBook(sender: AnyObject) {
        var activityItems: [AnyObject]?
        let image = secondImageView.image
        var text : String = "Text"
        
        if (secondImageView.image != nil) {
            activityItems = [ text, image!]
        } else {
            activityItems = ["Hi This is testing"]
        }
        
        let activityController = UIActivityViewController(activityItems:
            activityItems!, applicationActivities: nil)
        self.presentViewController(activityController, animated: true,
            completion: nil)
    }


    override func viewDidLoad()
    {
        super.viewDidLoad()
        picker!.delegate=self   
        
        
        btnClickMe.layer.cornerRadius = btnClickMe.layer.frame.size.width/4
        btnClickMe.clipsToBounds = true
        var tap = UITapGestureRecognizer(target: self, action: Selector("tappedMe"))
        imageView.addGestureRecognizer(tap)
        imageView.userInteractionEnabled = true
        
        //picker!.allowsEditing = false
        //picker!.showsCameraControls = false
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnImagePickerClicked(sender: AnyObject)
    {
        
        /*
        var alert:UIAlertController=UIAlertController(title: "Choose Image", message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)

        var cameraAction = UIAlertAction(title: "Camera", style: UIAlertActionStyle.Default)
        {
            UIAlertAction in
            self.openCamera()
            
        }
      
        var gallaryAction = UIAlertAction(title: "Gallary", style: UIAlertActionStyle.Default)
        {
            UIAlertAction in
            self.openGallary()
        }
        
        var cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel)
        {
            UIAlertAction in
            
        }

        // Add the actions
        alert.addAction(cameraAction)
        alert.addAction(gallaryAction)
        alert.addAction(cancelAction)
        // Present the controller
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone
        {
            self.presentViewController(alert, animated: true, completion: nil)
        }
        else
        {
            popover=UIPopoverController(contentViewController: alert)
            popover!.presentPopoverFromRect(btnClickMe.frame, inView: self.view, permittedArrowDirections: UIPopoverArrowDirection.Any, animated: true)
        }
*/
        self.openCamera()
    }
    
    
    func openCamera()
    {
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera))
        {
            picker!.sourceType = UIImagePickerControllerSourceType.Camera
            picker!.cameraDevice = UIImagePickerControllerCameraDevice.Front
            self.presentViewController(picker!, animated: true, completion: nil)
        }
        else
        {
            openGallary()
        }
    }
    func openGallary()
    {
        picker!.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone
        {
            self.presentViewController(picker!, animated: true, completion: nil)
        }
        else
        {
            popover=UIPopoverController(contentViewController: picker!)
            popover!.presentPopoverFromRect(btnClickMe.frame, inView: self.view, permittedArrowDirections: UIPopoverArrowDirection.Any, animated: true)
        }
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject])
    {
        picker .dismissViewControllerAnimated(true, completion: nil)
        
        /*
        if imageList.count <= 2 {
            imageList.append((info[UIImagePickerControllerOriginalImage] as? UIImage!)!)
        }
   */
        
        if imageView.image == nil {
        imageView.image=info[UIImagePickerControllerOriginalImage] as? UIImage
            
        } else {
         secondImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        }
        
        
    }
    
    //func tappedMe()
    //{
      //  println("Tapped on Image")
        //performSegueWithIdentifier("about", sender: sender)
    //}
    

    
    func imagePickerControllerDidCancel(picker: UIImagePickerController!)
    {
        println("picker cancel.")
    }
    
    
}

