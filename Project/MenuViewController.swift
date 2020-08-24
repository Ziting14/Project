//
//  MenuViewController.swift
//  Project
//
//  Created by MIS@NSYSU on 2020/8/16.
//  Copyright © 2020年 huihuiteam. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage

protocol SlideMenuDelegate {
    func slideMenuItemSelectedAtIndex(_ index: Int32)
}


class MenuViewController: UIViewController {

    @IBOutlet weak var btnCloseMenuOverlay: UIButton!
    @IBOutlet weak var userphoto: UIImageView!
    @IBOutlet weak var username: UILabel!
    
    @IBOutlet weak var btnHome: UIButton!
    @IBOutlet weak var btnQR: UIButton!
    @IBOutlet weak var btncontact: UIButton!
    @IBOutlet weak var btnprofile: UIButton!
    @IBOutlet weak var btnLogout: UIButton!
    
    var btnMenu: UIButton!
    var delegate: SlideMenuDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()


        // Do any additional setup after loading the view.
    }

    @IBAction func btnCloseTapped(_ sender: UIButton) {
        btnMenu.tag = 0
        btnMenu.isHidden = false
        if(self.delegate != nil){
            var index = Int32(sender.tag)
            if(sender == self.btnCloseMenuOverlay){
                index = -1
            }
            delegate?.slideMenuItemSelectedAtIndex(index)
        }
        
        UIView.animate(withDuration: 0.3, animations: {() -> Void in
            self.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            self.view.layoutIfNeeded()
            self.view.backgroundColor = UIColor.clear
        }, completion:{ (finished) -> Void in
            self.view.removeFromSuperview()
            self.removeFromParent()
        })
        
    }
    
    @IBAction func btnHomeTapped(_ sender: Any) {
        btnMenu.isHidden = true
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "home")
        self.present(vc!, animated: false, completion: nil)
    }
    @IBAction func btnQRTapped(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "QRCode")
        self.present(vc!, animated: true, completion: nil)
    }
    @IBAction func btnContactTapped(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Book")
        self.present(vc!, animated: true, completion: nil)
    }
    
    @IBAction func btnProfileTapped(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "home")
        self.present(vc!, animated: true, completion: nil)
        
    }
    @IBAction func btnLogoutTapped(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
        let loginViewController = self.storyboard!.instantiateViewController(withIdentifier: "login")
        UIApplication.shared.keyWindow?.rootViewController = loginViewController
    }
    
}
