//
//  ViewController.swift
//  tinderapp
//
//  Created by Mely Bohlman on 10/29/18.
//  Copyright © 2018 Chris Bohlman. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    
    @IBOutlet weak var cardImage: UIImageView!
    var cardInitialCenter: CGPoint!
    var whereStartedY: CGFloat!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roundImage()
        cardInitialCenter = cardImage.center
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func roundImage() {
        cardImage.layer.cornerRadius = 50
        cardImage.clipsToBounds = true
    }
    
    @IBAction func didPanCard(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        if (sender.state == .began) {
            whereStartedY = sender.location(in: view).y
        }
        else if (sender.state == .changed) {
            if (whereStartedY < 200) {
                //top right
                if (translation.x > 0) {
                    let translationAmount = min(180, translation.x)
                    let rotationAmount = min(45, Double(translation.x)/4) * Double.pi / 180
                    cardImage.transform = CGAffineTransform(translationX: translationAmount, y: 0)
                    cardImage.transform = cardImage.transform.rotated(by: CGFloat(rotationAmount))
                }
                //top left
                else {
                    let translationAmount = max(-180, translation.x)
                    let rotationAmount = max(-45, Double(translation.x)/4) * Double.pi / 180
                    cardImage.transform = CGAffineTransform(translationX: translationAmount, y: 0)
                    cardImage.transform = cardImage.transform.rotated(by: CGFloat(rotationAmount))
                }
            } else {
                //bottom right
                if (translation.x > 0) {
                    let translationAmount = min(180, translation.x)
                    let rotationAmount = max(-45, -Double(translation.x)/4) * Double.pi / 180
                    cardImage.transform = CGAffineTransform(translationX: translationAmount, y: 0)
                    cardImage.transform = cardImage.transform.rotated(by: CGFloat(rotationAmount))
                }
                //bottom left
                else {
                    let translationAmount = max(-180, translation.x)
                    let rotationAmount = min(45, -Double(translation.x)/4) * Double.pi / 180
                    cardImage.transform = CGAffineTransform(translationX: translationAmount, y: 0)
                    cardImage.transform = cardImage.transform.rotated(by: CGFloat(rotationAmount))
                }
            }
            
        }
        else if (sender.state == .ended) {
            if (translation.x > 50) {
                UIView.animate(withDuration:0.1, animations: {
                    if (self.whereStartedY < 200) {
                        self.cardImage.transform = CGAffineTransform(translationX: 180, y: 0)
                        self.cardImage.transform = self.cardImage.transform.rotated(by: CGFloat(45))
                    } else {
                        self.cardImage.transform = CGAffineTransform(translationX: 180, y: 0)
                        self.cardImage.transform = self.cardImage.transform.rotated(by: CGFloat(-45))
                    }
                }) { (Bool) in
                    self.cardImage.isHidden = true
                }
            }
            else if (translation.x < -50) {
                UIView.animate(withDuration:0.1, animations: {
                    if (self.whereStartedY < 200) {
                        self.cardImage.transform = CGAffineTransform(translationX: -180, y: 0)
                        self.cardImage.transform = self.cardImage.transform.rotated(by: CGFloat(-45))
                    } else {
                        self.cardImage.transform = CGAffineTransform(translationX: -180, y: 0)
                        self.cardImage.transform = self.cardImage.transform.rotated(by: CGFloat(45))
                    }
                }) { (Bool) in
                    self.cardImage.isHidden = true
                }
            } else {
                UIView.animate(withDuration:0.1, animations: {
                    // This causes first view to fade in and second view to fade out
                    self.cardImage.transform = CGAffineTransform.identity
                })
            }
        }
    }
    
    
    @IBAction func onTapInfo(_ sender: UITapGestureRecognizer) {
        
        performSegue(withIdentifier: "ProfileSegue", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ProfileViewController
        destinationVC.newImage = self.cardImage.image
    }
    
}

