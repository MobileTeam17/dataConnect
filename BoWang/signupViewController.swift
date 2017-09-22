//
//  signupViewController.swift
//  BoWang
//
//  Created by zhe on 2017/9/21.
//  Copyright © 2017年 Microsoft. All rights reserved.
//

import UIKit

class signupViewController: UIViewController {
    
    
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    @IBOutlet weak var repeatPasswordText: UITextField!
    
    
    @IBAction func signupButton(_ sender: Any)
    {
        
        
        
        let userEmail = emailText.text
        let userPassword = passwordText.text
        let userRepeatPassword = repeatPasswordText.text
        
        
        
        //check empty
        if (userEmail?.isEmpty)! || (userPassword?.isEmpty)! || (userRepeatPassword?.isEmpty)! {
            
            //display an alert message
            
            displayMyAlertMessage(userMessage: "all filed are required")
            
            return
        }
        
        // check exist email
        
        /*        if (userEmail == registedEmail) {
         
         displayMyAlertMessage(userMessage: "email already exist")
         
         return
         }
         */
        
        //check if password match
        
        if (userPassword != userRepeatPassword) {
            
            //display an alert message
            
            displayMyAlertMessage(userMessage: "Passwords do not match")
            
            return
        }
        
        
        //store data
        
        UserDefaults.standard.set(userEmail, forKey: "userRegistEmail")
        UserDefaults.standard.set(userPassword, forKey: "userRegistPassword")
        UserDefaults.standard.synchronize()
        
        
        
        
        
        //display alert message with confimation
        
        let myAlert = UIAlertController(title:"Alert", message: "registration is successful, thank you", preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "ok", style: UIAlertActionStyle.default){
            action in
            self.dismiss(animated: true, completion: nil)
        }
        
        myAlert.addAction(okAction)
        self.present( myAlert, animated: true, completion: nil)
        
        
        
        
        
        
    }
    
    
    
    func displayMyAlertMessage(userMessage: String)  {
        let myAlert = UIAlertController(title:"Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler: nil)
        
        myAlert.addAction(okAction)
        
        self.present(myAlert, animated: true, completion: nil)
    }
    
        
        
        


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
