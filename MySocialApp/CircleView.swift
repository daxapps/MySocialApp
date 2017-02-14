//
//  CircleView.swift
//  MySocialApp
//
//  Created by Jason Crawford on 2/14/17.
//  Copyright © 2017 Jason Crawford. All rights reserved.
//

import UIKit

class CircleView: UIImageView {

    override func layoutSubviews() {
        layer.cornerRadius = self.frame.width / 2
        clipsToBounds = true
    }

}
