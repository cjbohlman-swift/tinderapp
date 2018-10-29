//
//  ProfileViewController.swift
//  tinderapp
//
//  Created by Mely Bohlman on 10/29/18.
//  Copyright © 2018 Chris Bohlman. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var cardImage: UIImageView!
    var newImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardImage.image = newImage
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
