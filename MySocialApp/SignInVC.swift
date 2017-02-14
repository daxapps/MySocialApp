//
//  SignInVC.swift
//  MySocialApp
//
//  Created by Jason Crawford on 2/13/17.
//  Copyright © 2017 Jason Crawford. All rights reserved.
//

import UIKit
import FBSDKLoginKit
//import FBSDKCoreKit
import Firebase
//import SwiftKeychainWrapper

class SignInVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func facebookBtnTapped(_ sender: Any) {
        
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("Dax: Unable to authenticate with Facebook - \(error)")
            } else if result?.isCancelled == true {
                print("Dax: User cancelled Facebook authentication")
            } else {
                print("Dax: Successfully authenticated with Facebook")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
        }
    }
    
    func firebaseAuth(_ credential: FIRAuthCredential) {
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("Dax: Unable to authenticate with Firebase - \(error)")
            } else {
                print("Dax: Successfully authenticated with Firebase")
//                if let user = user {
//                    let userData = ["provider": credential.provider]
//                    self.completeSignIn(id: user.uid, userData: userData)
//                }
            }
        })
    }
    
    
//    func completeSignIn(id: String, userData: Dictionary<String, String>) {
//        DataService.ds.createFirbaseDBUser(uid: id, userData: userData)
//        //let keychainResult = KeychainWrapper.setString(id, forKey: KEY_UID)
//        let keychainResult = KeychainWrapper.defaultKeychainWrapper.set(id, forKey: KEY_UID)
//        print("Dax: Data saved to keychain \(keychainResult)")
//        performSegue(withIdentifier: "goToFeed", sender: nil)
//    }

    
    
    
    
}

