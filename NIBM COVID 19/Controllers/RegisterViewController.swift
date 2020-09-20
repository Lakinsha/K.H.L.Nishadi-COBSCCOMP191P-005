//
//  RegisterViewController.swift
//  NIBM COVID 19
//
//  Created by lakinsha on 9/17/20.
//  Copyright © 2020 lakinsha. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class RegisterViewController: UIViewController {

    @IBAction func FirstNameTextField(_ sender:UITextField){}
    @IBAction func LastNameTextFeild(_ sender:UITextField){}
    
    @IBAction func emailTextField(_ sender:UITextField){}
    @IBAction func roleTextField(_ sender:UITextField){}
    @IBAction func passwordTextField(_ sender:UITextField){}
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements() {
    
        // Hide the error label
        errorLabel.alpha = 0
    
        // Style the elements
        Utilities.styleTextField(FirstNameTextField)
        Utilities.styleTextField(LastNameTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(roleTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(signUpButton)
    }
    
    
    func validateFields() -> String? {
        
      
        if FirstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            LastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            roleTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in the all fields."
        }
        
        // Check if the password is secure
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
           
            return "Please make sure your password is at least 8 characters, contains a special character and a number."
        }
        
        return nil
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
     //Validate the fields
            let error = validateFields()

           if err != nil {


                showError(error!)
            }
            else {



//
//                // Create cleaned versions of the data
                let firstName = FirstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                let lastName = LastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                let role = roleTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                
                // Create the user
                Auth.auth().createUser(withEmail: email, password: password) { (result, err) in

//                    // Check for errors
                    if err != nil {

                        // There was an error creating the user
                        self.showError("Error creating user")
                    }
                    else {


                        let db = Firestore.firestore()

                        db.collection("users").addDocument(data: ["firstname":firstName, "lastname":lastName, "uid": result!.user.uid ]) { (error) in

                            if error != nil {
                                // Show error message
                                self.showError("Error saving user data")
                            }
                        }
                        
                         Transition to the home screen
                        self.transitionToHome()
                    }
                    
                }
                
                
                
            
        
        
        func showError(_ message:String) {
            
            errorLabel.text = message
            errorLabel.alpha = 1
        }
        
        func transitionToHome() {
            
            let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
            
            view.window?.rootViewController = homeViewController
            view.window?.makeKeyAndVisible()
            
        }
        
    
