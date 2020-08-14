//
//  SignupcameraViewController.swift
//  Project
//
//  Created by MIS@NSYSU on 2020/5/6.
//  Copyright © 2020年 huihuiteam. All rights reserved.
//

import UIKit
import AVFoundation

@available(iOS 10.0, *)
class SignupcameraViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var cameraview: UIView!
    
    var imagepicker = UIImagePickerController()
    
    var captureSession: AVCaptureSession?
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    var frontCamera = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front)
    var backCamera = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back)
    var capturePhotoOutput: AVCapturePhotoOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagepicker.delegate = self
        
        if #available(iOS 12.1, *){
            let captureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front)
            do{
                let input = try AVCaptureDeviceInput(device: captureDevice!)
                captureSession = AVCaptureSession()
                captureSession?.addInput(input)
                videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
                videoPreviewLayer?.frame = view.layer.bounds
                cameraview.layer.addSublayer(videoPreviewLayer!)
                captureSession?.startRunning()
                
                //                let dataOutput = AVCaptureVideoDataOutput()
                //                dataOutput.videoSettings = [(kCVPixelBufferPixelFormatTypeKey as NSString):NSNumber(value: kCVPixelFormatType_32BGRA)] as [String : Any]
                //
                //                dataOutput.alwaysDiscardsLateVideoFrames = true
                //
                //                if captureSession!.canAddOutput(dataOutput){
                //                    captureSession!.addOutput(dataOutput)
                //                }
                //                captureSession?.commitConfiguration()
                //
                //                let queue = DispatchQueue(label: "bbbbb")
                //                dataOutput.setSampleBufferDelegate(self, queue: queue)
                
                
            }
            catch{
                print("error")
            }
        }
        
        
        capturePhotoOutput = AVCapturePhotoOutput()
        capturePhotoOutput?.isHighResolutionCaptureEnabled = true
        captureSession?.addOutput(capturePhotoOutput!)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
    }
    
    
    @IBAction func imagecapture(_ sender: Any) {
       
        guard let capturePhotoOutput = self.capturePhotoOutput else{ return }
        let photoSettings = AVCapturePhotoSettings()
        photoSettings.isAutoStillImageStabilizationEnabled = true
        photoSettings.isHighResolutionPhotoEnabled = true
        capturePhotoOutput.capturePhoto(with: photoSettings, delegate: self)
        
        
        
        
        
        //        let alertController = UIAlertController(title: "Do you want to use this photo?", message: "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", preferredStyle: .alert)
        //
        //        // 顯示警告視窗
        //        let okAction = UIAlertAction(title: "OK", style: .default){ (_) in
        //            print("Yesssss!")
        //        }
        //        alertController.addAction(okAction)
        //
        //        let xPosition = self.view.frame.origin.x + 80
        //        let imageView = UIImageView(frame: CGRect(x: xPosition, y: 100, width: 100, height: 100))
        //        imageView.image = #imageLiteral(resourceName: "apple")
        //        alertController.view.addSubview(imageView)
        //
        //        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        //        alertController.addAction(cancelAction)
        //        self.present(alertController, animated: true, completion: nil)
        
        
        
        
        
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
                cameraview.layer.addSublayer(videoPreviewLayer!)
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
                cameraview.layer.addSublayer(videoPreviewLayer!)
                captureSession?.startRunning()
            }
            catch{
                print("erreor")
            }
        }
    }
    
    @IBAction func rotateCamera(_ sender: Any) {
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
    
    
    @IBAction func flashButton(_ sender: Any) {
    }
    
}
extension SignupcameraViewController: AVCapturePhotoCaptureDelegate{
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photoSampleBuffer: CMSampleBuffer?, previewPhoto previewPhotoSampleBuffer: CMSampleBuffer?, resolvedSettings: AVCaptureResolvedPhotoSettings, bracketSettings backetSettings: AVCaptureBracketedStillImageSettings?, error: Error?) {
        guard error == nil,
            let photoSampleBuffer = photoSampleBuffer else{
                print("Error")
                return
        }
        guard let imageData = AVCapturePhotoOutput.jpegPhotoDataRepresentation(forJPEGSampleBuffer: photoSampleBuffer, previewPhotoSampleBuffer: previewPhotoSampleBuffer) else {
            return
        }
        
        
        let capturedImage = UIImage.init(data: imageData, scale: 1.0)
        if let image = capturedImage{
            //存照片到相簿
            //UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
            
        }
    }
}
