//
//  ViewController.swift
//  social_network
//
//  Created by TunaYANGIR on 15.12.2016.
//  Copyright © 2016 TunaYANGIR. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase

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
        facebookLogin.logIn(withReadPermissions: ["email"], from: self){ (result, error) in
            if error != nil{
                print("Facebook ile kimlik doğrulaması yapılamadı.-\(error)")
            }else if result?.isCancelled == true {
                print("Kullanıcı kimlik doğrulamayı iptal etti.")
            }else{
                print("Facebook ile giriş başarılı ile gerçekleşti")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
        
        }
    }
    func firebaseAuth(_ credential: FIRAuthCredential) {
        FIRAuth.auth()?.signIn(with: credential, completion: {(user,error) in
            if error != nil {
                print("Firebase ile kimlik doğrulaması yapılamadı.-\(error)")
            } else{
                print("Firebase ile giriş başarı ile gerçekleşti")
            }
        
        })
    }

}

