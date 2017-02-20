//
//  ImageVC.swift
//  MySocialApp
//
//  Created by Jason Crawford on 2/20/17.
//  Copyright © 2017 Jason Crawford. All rights reserved.
//

import UIKit

class ImageVC: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func cancellBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func photoFromLibrary(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func shootPhoto(_ sender: UIBarButtonItem) {
    }


}
