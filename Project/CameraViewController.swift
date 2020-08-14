//
//  CameraViewController.swift
//  Project
//
//  Created by MIS@NSYSU on 2020/5/6.
//  Copyright © 2020年 huihuiteam. All rights reserved.
//

import UIKit
import AVFoundation

@available(iOS 10.0, *)

class CameraViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    @IBOutlet weak var camera: UIView!
    @IBOutlet weak var front: UIButton!
    @IBOutlet weak var flash: UIButton!
    

    var captureSession: AVCaptureSession?
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    var frontCamera = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front)
    var backCamera = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if #available(iOS 12.1, *){
            let captureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back)
            do{
                let input = try AVCaptureDeviceInput(device: captureDevice!)
                captureSession = AVCaptureSession()
                captureSession?.addInput(input)
                videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
                videoPreviewLayer?.frame = view.layer.bounds
                camera.layer.addSublayer(videoPreviewLayer!)
                captureSession?.startRunning()
            }
            catch{
                print("error")
            }
            
//            let output = AVCaptureMetadataOutput()
//            captureSession?.addOutput(output)
//
//            output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
//
//            output.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
            
            
            
        }
        
       
    }
    
    
    
    func switchToFrontCamera() {
        if frontCamera?.isConnected == true {
            captureSession?.stopRunning()
            let captureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front)
            do{
                let input = try AVCaptureDeviceInput(device:captureDevice!)
                captureSession = AVCaptureSession()
                captureSession?.addInput(input)
                videoPreviewLayer  = AVCaptureVideoPreviewLayer(session:captureSession!)
                videoPreviewLayer?.frame = view.layer.bounds
                camera.layer.addSublayer(videoPreviewLayer!)
                captureSession?.startRunning()
            }
            catch{
                print("erreor")
            }
        }
    }
    
    func switchToBackCamera() {
        if backCamera?.isConnected == true {
            captureSession?.stopRunning()
            let captureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back)
            do{
                let input = try AVCaptureDeviceInput(device:captureDevice!)
                captureSession = AVCaptureSession()
                captureSession?.addInput(input)
                videoPreviewLayer  = AVCaptureVideoPreviewLayer(session:captureSession!)
                videoPreviewLayer?.frame = view.layer.bounds
                camera.layer.addSublayer(videoPreviewLayer!)
                captureSession?.startRunning()
            }
            catch{
                print("erreor")
            }
        }
    }

    @IBAction func change(_ sender: Any) {
        guard let currentCameraInput:AVCaptureInput = captureSession?.inputs.first else{
            return
        }
        
        if let input = currentCameraInput as? AVCaptureDeviceInput{
            if input.device.position == .back{
                switchToFrontCamera()
            }
            if input.device.position == .front{
                switchToBackCamera()
            }
        }
    }
    
    @IBAction func flash(_ sender: Any) {
    }
}
