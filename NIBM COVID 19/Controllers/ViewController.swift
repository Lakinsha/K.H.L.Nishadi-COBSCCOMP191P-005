//
//  ViewController.swift
//  NIBM COVID 19
//
//  Created by lakinsha on 9/17/20.
//  Copyright © 2020 lakinsha. All rights reserved.
//

import UIKit
import AVKit
import LocalAuthentication

class ViewController: UIViewController {
    
    var videoPlayer:AVPlayer?
    
    var videoPlayerLayer:AVPlayerLayer?

    @IBAction func SignInButton(_ sender: UIButton) {
    }
    
    @IBAction func SignUpButton(_ sender: UIButton) {
    }
    @IBAction func FaceIdButton(_ sender: Any) {
        
        let context:LAContext = LAContext()
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil){
            context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Message") { (good,errpr) in
                if good {
                    print("Good")
                } else {
                    print("Try Again")
                }
                
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //setUpElements()
    }


}



    
//    override func viewWillAppear(_ animated: Bool) {
        
        // Set up video in the background
//        setUpVideo()
//    }
//
//    func setUpElements() {
//
//        Utilities.styleFilledButton(SignUpButton)
//        Utilities.styleHollowButton(SigninButton)
//
//    }
    
//    func setUpVideo() {
        
        // Get the path to the resource in the bundle
//        let bundlePath = Bundle.main.path(forResource: "loginbg", ofType: "mp4")
//
//        guard bundlePath != nil else {
//            return
//        }
//
        // Create a URL from it
        //let url = URL(fileURLWithPath: bundlePath!)
        
        // Create the video player item
        //let item = AVPlayerItem(url: url)
        
        // Create the player
        //videoPlayer = AVPlayer(playerItem: item)
        
        // Create the layer
        //videoPlayerLayer = AVPlayerLayer(player: videoPlayer!)
        
        // Adjust the size and frame
        //videoPlayerLayer?.frame = CGRect(x: -self.view.frame.size.width*1.5, y: 0, width: self.view.frame.size.width*4, height: self.view.frame.size.height)
        
        //view.layer.insertSublayer(videoPlayerLayer!, at: 0)
        
        // Add it to the view and play it
        //videoPlayer?.playImmediately(atRate: 0.3)
    //}






