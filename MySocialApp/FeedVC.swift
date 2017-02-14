//
//  FeedVC.swift
//  MySocialApp
//
//  Created by Jason Crawford on 2/14/17.
//  Copyright © 2017 Jason Crawford. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper

class FeedVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3 //posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let post = posts[indexPath.row]
//        
//        if let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as? PostCell {
//            
//            if let img = FeedVC.imageCache.object(forKey: post.imageUrl as NSString) {
//                cell.configureCell(post: post, img: img)
//            } else {
//                cell.configureCell(post: post)
//            }
//            return cell
//        } else {
//            return PostCell()
//        }
        return tableView.dequeueReusableCell(withIdentifier: "PostCell") as! PostCell
    }

    @IBAction func signOutTapped(_ sender: Any) {
        
        let keychainResult = KeychainWrapper.standard.removeObject(forKey: KEY_UID)
        print("Dax: ID removed from keychain \(keychainResult)")
        try! FIRAuth.auth()?.signOut()
        performSegue(withIdentifier: "goToSignIn", sender: nil)
        
    }

}
