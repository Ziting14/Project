//
//  WatchPhotoViewController.swift
//  Project
//
//  Created by MIS@NSYSU on 2020/7/31.
//  Copyright © 2020年 huihuiteam. All rights reserved.
//

import UIKit

class WatchPhotoViewController: UIViewController {
    
    var thephoto:UIImage?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var retake: UIButton!
    @IBOutlet weak var use: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let availableImage = thephoto{
            imageView.image = availableImage
        }
    }
    
    @IBAction func retakephoto(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
   

}
