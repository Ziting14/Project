//
//  QRcodeViewController.swift
//  Project
//
//  Created by MIS@NSYSU on 2020/5/6.
//  Copyright © 2020年 huihuiteam. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase
import FirebaseAuth
import FirebaseFirestore

class QRcodeViewController: UIViewController {
    
    var fireUploadDic: [String:Any]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        let db = Firestore.firestore()
        db.collection("user").document("Kelly").getDocuments{(document, error) in
            if let document = document, document.exists{
                print(document.documentID,document.Data())
             }else{
                print("Document does not exists)
             }
         }
        */

        // Do any additional setup after loading the view.
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
