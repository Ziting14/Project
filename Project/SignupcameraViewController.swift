//
//  SignupcameraViewController.swift
//  Project
//
//  Created by MIS@NSYSU on 2020/5/6.
//  Copyright © 2020年 huihuiteam. All rights reserved.
//

import UIKit
import AVFoundation

class SignupcameraViewController: UIViewController {

    @IBOutlet weak var cameraview: UIView!

    var captureSession: AVCaptureSession?
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    var frontCamera = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .font)
    var backCamera = AVCaptureDevice.default(.builtInWideAngleCamera, for: .vedio, position: .back)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if #available(iOS 8, *){
            let captureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .vedio, position: .back)
            do{
                let input = try AVCaptureDevice(device: captureDevice!)
                captureSession = AVCaptureSession()
                captureSession?.addInput(input)
                videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
                videoPreviewLayer?.frame = view.layer.bounds
                cameraview.layer.addSublayer(videoPreviewLayer!)
                captureSession?.startRunning()
            }
            catch{
                print("error")
            }
        }
    }
    
    
    
    
    @IBAction func imagecapture(_ sender: Any) {
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
