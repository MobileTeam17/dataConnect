//
//  LoginViewController.swift
//  BoWang
//
//  Created by zhe on 2017/9/21.
//  Copyright © 2017年 Microsoft. All rights reserved.
//


//test for uploader at github 
import Foundation
import UIKit

protocol ToDoItemDelegate4 {
    func didSaveItem(_ theUser: String, _ bookId: String)
}

class LoginViewController: UIViewController,  UIBarPositioningDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var emailText: UITextField!
    

    
    @IBOutlet weak var passwordText: UITextField!

    
    
    var itemTable2 = (UIApplication.shared.delegate as! AppDelegate).client.table(withName: "book_users")
    
    var itemTable = (UIApplication.shared.delegate as! AppDelegate).client.table(withName: "login")
    var bookIdList = NSMutableArray()
        
    var loginName = ""
    var list = NSMutableArray()
    var list2 = NSMutableArray()
    var dicClient = [String:Any]()
    var dicClient2 = [String:Any]()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }
    


    
    
    @IBAction func loginButton(_ sender: UIButton) {
        viewDidLoad()
        //print("bbbbbbbbbbbbb: ", UserDefaults.standard.array(forKey: "theEmailData"))
        if UserDefaults.standard.array(forKey: "theUserData") != nil{
        list =  UserDefaults.standard.array(forKey: "theUserData") as! NSMutableArray
        }
        if UserDefaults.standard.array(forKey: "theEmailData") != nil{
        list2 = UserDefaults.standard.array(forKey: "theEmailData") as! NSMutableArray
        }
        
        let userEmail = emailText.text
        let userPassword = passwordText.text
        
        
        
        //send 'email' and 'password' to server
        //here just read email and password
        self.dicClient["email"] = userEmail
        self.dicClient["password"] = userPassword
        self.dicClient2["email"] = userEmail
        
        if (UserDefaults.standard.array(forKey: "theEmailData") as! NSMutableArray)
            .contains(dicClient2){
            if (UserDefaults.standard.array(forKey: "theUserData") as! NSMutableArray).contains(dicClient){
                
                UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
                UserDefaults.standard.synchronize()
                
            }
            else{
                displayMyAlertMessage(userMessage: "Wrong Password!")
                
                return
            }
            
            
        }
        else {
            displayMyAlertMessage(userMessage: "不存在email")
            
            return
        }
        
        UserDefaults.standard.set(userEmail, forKey: "userRegistEmail")
        
        performSegue(withIdentifier: "login", sender: nil)
        
        
        
    }
    
 
    
    

    
    func getBookList() {
        
        UserDefaults.standard.set(bookIdList, forKey: "theStoreListOfBook")
        print("bbbbbbbbbbbbb: ", self.bookIdList)
        
    }
    

    
    
    func displayMyAlertMessage(userMessage: String)  {
        let myAlert = UIAlertController(title:"Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler: nil)
        
        myAlert.addAction(okAction)
        
        self.present(myAlert, animated: true, completion: nil)
    }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
