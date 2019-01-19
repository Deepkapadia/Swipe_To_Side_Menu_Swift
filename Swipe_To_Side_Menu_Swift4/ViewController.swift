//
//  ViewController.swift
//  Swipe_To_Side_Menu_Swift4
//
//  Created by DeEp KapaDia on 23/05/18.
//  Copyright © 2018 DeEp KapaDia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ViewConstrain: NSLayoutConstraint!
    
    @IBOutlet weak var BlurView: UIVisualEffectView!
    
    @IBOutlet weak var SideView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Design For BlurView and SideView for perticulor side bas design.....
        
        BlurView.layer.cornerRadius = 15
        SideView.layer.shadowColor = UIColor.orange.cgColor
        SideView.layer.shadowOpacity = 1
        SideView.layer.shadowOffset = CGSize(width: 5, height: 0)

        ViewConstrain.constant = -175
        
    }

    @IBAction func PanPerform_Gesture(_ sender: UIPanGestureRecognizer) {
        
        
        if sender.state == .began || sender.state == .changed{
            
            let translation = sender.translation(in: self.view).x
            
            if translation > 0 {//Swipe Right
                
                if ViewConstrain.constant < 20 {
                    
                    UIView.animate(withDuration: 0.2, animations: {
                        
                        self.ViewConstrain.constant += translation / 10
                        self.view.layoutIfNeeded()
                    })
                    
                }
                
            }else{// Swipe Left
                
                if ViewConstrain.constant > -175 {
                    
                    UIView.animate(withDuration: 0.2, animations: {
                        
                        self.ViewConstrain.constant += translation / 10
                        self.view.layoutIfNeeded()
                    })
                
            }
            }
            
            //End Proccess for Slide to move
        }else if sender.state == .ended{
            
            if ViewConstrain.constant < -100 {
                
                UIView.animate(withDuration: 0.2, animations: {
                    
                    self.ViewConstrain.constant = -175
                    self.view.layoutIfNeeded()
                })
                
            }else{
                
                UIView.animate(withDuration: 0.2, animations: {
                    
                    self.ViewConstrain.constant = 0
                    self.view.layoutIfNeeded()
                })
                
            }
            
        }
        
        
    }
   

}

