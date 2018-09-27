//
//  ScanVC.swift
//  QRSample
//
//  Created by Lamar Jay Caaddfiir on 9/26/18.
//  Copyright © 2018 Super QR Sample. All rights reserved.
//

import UIKit
import AVFoundation

class ScanVC: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    //MARK: - Properties
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    private var captureSession = AVCaptureSession()
    private var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.fetchData()
    }
    
    //MARK: - Setup
    private func setupView() {
        super.viewDidLoad()
        let deviceDiscoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInDualCamera], mediaType: AVMediaType.video, position: .back)
        guard let captureDevice = deviceDiscoverySession.devices.first else {
            print("Failed to find camera device")
            return
        }
        do {
            let input = try AVCaptureDeviceInput(device: captureDevice)
            self.captureSession.addInput(input)
            let captureMetadataOutput = AVCaptureMetadataOutput()
            captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            self.captureSession.addOutput(captureMetadataOutput)
            captureMetadataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
        } catch {
            print(error)
            return
        }
        self.videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        self.videoPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
        self.videoPreviewLayer?.frame = view.layer.bounds
        self.view.layer.addSublayer(self.videoPreviewLayer!)
        self.captureSession.startRunning()
        self.view.bringSubviewToFront(self.statusLabel)
        self.view.bringSubviewToFront(self.containerView)
    }
    
    //MARK: - Fetch
    private func fetchData() {
        
    }
    
    //MARK: - Utilities
    private func displayWebVC(withLink link: String) {
        
    }
    
    //MARK: - onTouch
    @IBAction func onTouchShareButton(_ sender: UIButton) {
        
    }
    
    func shareTextButton(text: String) {
        let text = "This is some text that I want to share."
        let textToShare = [ text ]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        activityViewController.excludedActivityTypes = [ .airDrop, .postToFacebook, .mail, .message ]
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    func shareImage(image: UIImage) {
        let imageToShare = [ image ]
        let activityViewController = UIActivityViewController(activityItems: imageToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
        activityViewController.excludedActivityTypes = [ .airDrop, .postToFacebook, .mail, .message ]
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    
    //MARK: - AVCaptureMetadataOutputObjectsDelegate
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if metadataObjects.count < 1 {
            self.containerView.frame = CGRect.zero
            self.statusLabel.text = "No QR code is detected"
            return
        }
        let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        let barCodeObject = videoPreviewLayer?.transformedMetadataObject(for: metadataObj)
        self.containerView.frame = barCodeObject!.bounds
        if let urlString = metadataObj.stringValue {
            self.displayAlertController(withAlertStyle: .alert, withTitle: "", withMesssage: "Show Web Site?", withActions: [UIAlertAction(title: "Yes", style: .default, handler: { action in
                if let url = URL(string: urlString) {
                    if UIApplication.shared.canOpenURL(url) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                }
            }), UIAlertAction(title: "No", style: .cancel, handler: nil)])
            self.statusLabel.text = metadataObj.stringValue
        }
    }
    
}
