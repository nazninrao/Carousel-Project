//
//  signInViewController.swift
//  Carousel
//
//  Created by Naznin Richhariya on 10/17/15.
//  Copyright © 2015 wm. All rights reserved.
//

import UIKit

class signInViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var SignInButton: UIButton!
    
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var passwordText: UITextField!
    
    
       override func viewDidLoad() {
        super.viewDidLoad()
        
        func delay(delay:Double, closure:()->()) {
            dispatch_after(
                dispatch_time(
                    DISPATCH_TIME_NOW,
                    Int64(delay * Double(NSEC_PER_SEC))
                ),
                dispatch_get_main_queue(), closure)
        }

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTapEmail(sender: AnyObject) {
        
        scrollView.contentOffset.y = 80
        
        SignInButton.transform = CGAffineTransformMakeTranslation( 0, -3)
        
        
    }
    
    @IBAction func onTapPassword(sender: AnyObject) {
        
        scrollView.contentOffset.y = 80
        SignInButton.transform = CGAffineTransformMakeTranslation( 0, -3)
    }
    
   
    @IBAction func onClickSigninButton(sender: AnyObject) {
        
        if emailText.text!.isEmpty || passwordText.text!.isEmpty
        {
            self.spinner.startAnimating()
            
            delay(2){}

            
            let alertController = UIAlertController(title: "Email Required", message: "Please enter email address and password", preferredStyle: .Alert)
            
            let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                // handle response here.
                
            }
            
            
            presentViewController(alertController, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
              
                self.spinner.stopAnimating()
                alertController.addAction(OKAction)
                

            }
            

            
        }
        
        else if emailText.text != "nnn" || passwordText.text != "aaa"
        {
            
            
                    self.spinner.startAnimating()
            
            delay(2){}
            
            let alertController = UIAlertController(title: "Sign In Failed", message: "Incorrect email or password", preferredStyle: .Alert)
            
            let OKAction = UIAlertAction(title: "OK", style: .Default)
                { (action) in
                // handle response here.
            }

            
            
    
            presentViewController(alertController, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
                self.spinner.stopAnimating()
                alertController.addAction(OKAction)
                
                
            }
            

            
        }
        
        else if emailText.text == "nnn" && passwordText.text == "aaa"
        {
            self.spinner.startAnimating()
            
            delay(2){}
            
            self.spinner.stopAnimating()

                    performSegueWithIdentifier("loginSegue", sender: nil)
            
            
        }
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
