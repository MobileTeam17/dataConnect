//
//  LoginViewController.swift
//  BoWang
//
//  Created by zhe on 2017/9/21.
//  Copyright © 2017年 Microsoft. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailText: UITextField!
    

    
    @IBOutlet weak var passwordText: UITextField!

    
    

    
        
        
    
    @IBAction func loginButton(_ sender: Any) {
        
        
        let userEmail = emailText.text
        let userPassword = passwordText.text
        
        
        
        //send 'email' and 'password' to server
        
        //here just read email and password
        
        let userEmailStored = UserDefaults.standard.string(forKey: "userRegistEmail")
        
        let userPasswordStored = UserDefaults.standard.string(forKey: "userRegistPassword")
        
        
        
        if (userEmailStored == userEmail) {
            if (userPasswordStored == userPassword) {
                
                // login is successful
                
                UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
                UserDefaults.standard.synchronize()
                
                //displayMyAlertMessage(userMessage: "success")
                

                
                
            }
                
            else {
                
                displayMyAlertMessage(userMessage: "Wrong Password!")

                //displayMyAlertMessage(userMessage: "worong password")
                
                return
            }
            
            
        }
            
        else {
            displayMyAlertMessage(userMessage: "不存在email")
            
            return
        }

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
