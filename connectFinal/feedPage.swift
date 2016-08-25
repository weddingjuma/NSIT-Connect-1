//
//  feedPage.swift
//  connect2
//
//  Created by Swapnil Dhanwal on 12/02/16.
//  Copyright © 2016 SwApp. All rights reserved.
//

import UIKit
import QuartzCore
import NYAlertViewController

class feedPage: UIViewController {
    
    var tap = UITapGestureRecognizer()
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var message: UITextView!
    
    @IBOutlet weak var imageBackground: UILabel!
    
    @IBOutlet weak var imageTop: NSLayoutConstraint!
    
    @IBOutlet weak var pageSpinner: UIActivityIndicatorView!
    
    @IBOutlet weak var messageTop: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageSpinner.center = self.image.center
        pageSpinner.frame = image.frame
        pageSpinner.layer.cornerRadius = 3.0
        pageSpinner.hidesWhenStopped = true
        
        
        message.text = passMessage
        message.textAlignment = .Center
        message.flashScrollIndicators()
        message.scrollsToTop = true
        let imageURL = passImageURL
        
        if imageURL != nil
        {
            
            self.view.addSubview(pageSpinner)
            pageSpinner.startAnimating()
            print(imageURL)
            let url = NSURL(string: imageURL)
            
            
            image.sd_setImageWithURL(url, completed: { (image, error, cache, url1) in
                
                if error == nil
                {
                    self.pageSpinner.stopAnimating()
                    self.image.alpha = 0
                    UIView.animateWithDuration(0.5, animations: { () -> Void in
                        
                        self.image.layer.shadowColor = UIColor.blackColor().CGColor
                        self.image.layer.shadowOffset = CGSizeMake(0, 5)
                        self.image.layer.shadowOpacity = 1.0
                        self.image.layer.masksToBounds = false
                        
                        
                        self.image.alpha = 1
                        self.view.bringSubviewToFront(self.image)
                        self.tap.addTarget(self, action: #selector(feedPage.tapped))
                        self.image.addGestureRecognizer(self.tap)
                        self.image.userInteractionEnabled = true
                        
                    })
                }
                
            })
            
//            let session = NSURLSession.sharedSession()
//            dispatch_async(dispatch_get_main_queue(), { 
//                
//                self.spinner.stopAnimating()
//                self.spinner.hidden = true
//                let task = session.dataTaskWithURL(url!, completionHandler: { (data, response, error) -> Void in
//                    
//                    
//                    
//                    if error == nil
//                    {
//                        
//                        self.image.image = UIImage(data: data!)
//                        self.image.alpha = 0
//                        UIView.animateWithDuration(0.5, animations: { () -> Void in
//                            
//                            self.image.layer.shadowColor = UIColor.blackColor().CGColor
//                            self.image.layer.shadowOffset = CGSizeMake(0, 5)
//                            self.image.layer.shadowOpacity = 1.0
//                            self.image.layer.masksToBounds = false
//
//                            
//                            self.image.alpha = 1
//                            self.view.bringSubviewToFront(self.image)
////                            self.imageBackground.backgroundColor = UIColor.darkGrayColor()
//                            //self.image.layer.borderColor = UIColor.blackColor().CGColor
//                            //self.image.layer.cornerRadius = 10
//                            //self.image.layer.borderWidth = 1.5
//                            //self.image.layer.masksToBounds = true
//                            self.tap.addTarget(self, action: Selector("tapped"))
//                            self.image.addGestureRecognizer(self.tap)
//                            self.image.userInteractionEnabled = true
//                            
//                            
//                            
//                            
//                        })
//                        
//                    }
//                    
//                })
//                
//                task.resume()
//                
//            })
            
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tapped()
    {
        
        if Reachability.isConnectedToNetwork() == false
        {
//            let alert = UIAlertController(title: "Can't download Full Resolution Image", message: "Please connect to the internet", preferredStyle: UIAlertControllerStyle.Alert)
//            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
//            self.presentViewController(alert, animated: true, completion: nil)
            
            let alert = NYAlertViewController()
            alert.title = "Can't Download Full Resolution Image"
            alert.message = "Please connect to the internet"
            alert.buttonColor = UIColor(red: 1/255, green: 179/255, blue: 164/255, alpha: 1)
            alert.addAction(NYAlertAction(title: "OK", style: .Default, handler: { (action) in
                
                self.dismissViewControllerAnimated(true, completion: nil)
                
            }))
            self.presentViewController(alert, animated: true, completion: nil)
            
            return
        }
        
        print("tapped!")
        performSegueWithIdentifier("viewImage", sender: self)
        
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        
        return UIInterfaceOrientationMask.Portrait
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        //didGoToFeedPage = true
        message.flashScrollIndicators()
        
    }
    
    override func viewDidLayoutSubviews() {
        
        message.scrollsToTop = true
        
    }
}
