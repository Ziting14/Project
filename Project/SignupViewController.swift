//
//  SignupViewController.swift
//  Project
//
//  Created by MIS@NSYSU on 2020/5/6.
//  Copyright © 2020年 huihuiteam. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore

class SignupViewController: UIViewController {

    @IBOutlet weak var phoneNumberinput: UITextField!
    @IBOutlet weak var emailinput: UITextField!
    @IBOutlet weak var passwordinput: UITextField!
    @IBOutlet weak var singup: UIButton!
    @IBOutlet weak var errormessange: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func isPasswordValid(_ Password : String) -> Bool{
        let Password = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Z](?=.*[0-9].{>8}$")
        return Password.evaluate(with: Password)
    }
    
    
    func validateFields() -> String? {
        //check is empty
        if phoneNumberinput.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || emailinput.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordinput.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        {return "Please input"}
        
        //check is password
        let cleanedPassword = passwordinput.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if isPasswordValid(cleanedPassword) == false{
            //password isn't secure
            return "Your password is not secure.Please"
        }
        
        return nil
    }

    func showerror(_ message:String){
        errormessange.text = message
        errormessange.alpha = 1
    }
    @IBAction func signupbtn(_ sender: Any) {
        let error = validateFields()
  
        let email = emailinput.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let phonenumber = phoneNumberinput.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordinput.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        
        if error != nil {
            showerror(error!)
        }
        else{
            Auth.auth().createUser(withEmail: <#T##String#>, password: <#T##String#>) { (result, err) in
                //check error
                if err != nil{
                    //an error
                    self.showerror("error creating user")
                }
                else{
                    //create successfully
                    let db = Firestore.firestore()
                    
                    db.collection("user").addDocument(data: ["phonenumber":phonenumber, "email": email]){ (error) in
                        if error != nil{
                            self.showerror("error")
                        }
                    }
                }
            }
        }
        
        
    }
}
