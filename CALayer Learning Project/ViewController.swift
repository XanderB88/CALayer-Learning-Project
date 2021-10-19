//
//  ViewController.swift
//  CALayer Learning Project
//
//  Created by Alexander on 19.10.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView! {
        didSet {
            profileImage.layer.cornerRadius = profileImage.frame.size.width / 2
            profileImage.layer.borderColor = UIColor.gray.cgColor
            profileImage.layer.borderWidth = 5
        }
    }
    @IBOutlet weak var profileButton: UIButton! {
        didSet {
            profileButton.layer.cornerRadius = 5
            profileButton.layer.shadowOpacity = 0.7
            profileButton.layer.shadowOffset = CGSize(width: -2, height: 5)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

